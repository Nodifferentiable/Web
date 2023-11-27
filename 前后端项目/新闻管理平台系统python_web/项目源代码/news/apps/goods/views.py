import json
import logging
import os
import uuid

from django.http import JsonResponse
from rest_framework.views import APIView

from apps.goods.GoodsSerializer import GoodsSerializer
from apps.goods.models import Goods
from apps.common.ResponseMessage import ResponseMessage
from news.settings import PAGE_SIZE, UPLOAD_PATH, HTTP_PICTURE


class GoodsAPIView(APIView):

    def post(self, request):
        data = request.data
        page = data.get('pageNum')
        logging.error("输出日志信息")
        current_page = (page - 1) * PAGE_SIZE
        end_data = page * PAGE_SIZE
        title = data.get('title')
        if title != None:
            list = Goods.objects.filter(title__contains=title)[current_page: end_data]
        else:
            list = Goods.objects.all()[current_page: end_data]
        # 创建 CategorySerializer 实例，并将查询结果序列化为 JSON 格式
        serializer = GoodsSerializer(list, many=True)
        result_list = {
            'total': Goods.objects.count(),
            'list': serializer.data
        }
        return ResponseMessage.success(result_list)


class GoodsSaveAPIView(APIView):

    def post(self, request):
        data = request.data
        id = data.get('id')
        # token 通过请求调用
        # token = request.META.get('HTTP_TOKEN')
        # user_info = jwt_auth.get_payload(token)
        # print(token)
        if id:
            # 如果存在对象 ID，则是编辑操作
            try:
                data['update_user_id'] = request.id
                instance = Goods.objects.get(id=id)
                serializer = GoodsSerializer(instance, data=data, partial=True)
                if serializer.is_valid():
                    serializer.save()
                    return ResponseMessage.success(None)

            except Goods.DoesNotExist:
                return ResponseMessage.failed()
        else:
            # 不存在对象 ID，则是新增操作
            data['create_user_id'] = request.id
            data['status'] = 0  # 获取用户认证令牌信息
            data['views'] = 0  # 浏览量默认为0
            # 获取名为"Token"的请求头部字段的值
            serializer = GoodsSerializer(data=data)
            if serializer.is_valid():
                serializer.save()
                return ResponseMessage.success(None)
            else:
                return ResponseMessage.failed()


class GoodsDeleteAPIView(APIView):

    def post(self, request):
        data = json.loads(request.body)
        try:
            for id in data:
                category = Goods.objects.get(id=id)
                category.delete()
        except Goods.DoesNotExist:
            return ResponseMessage.other("没有找到需要删除的数据")
        return ResponseMessage.success(None)


class GoodsUPageAPIView(APIView):
    def post(self, request):
        data = request.data
        page = data.get('pageNum')
        title = data.get('title')
        # 页面展示 12条或8条数据好看
        current_page = (page - 1) * 12
        end_data = page * 12

        list = Goods.objects.all()[current_page: end_data]
        if title != None:
            list = Goods.objects.filter(title__contains=title)[current_page: end_data]
        # 创建 CategorySerializer 实例，并将查询结果序列化为 JSON 格式
        serializer = GoodsSerializer(list, many=True)
        result_list = {
            'total': Goods.objects.count(),
            'list': serializer.data
        }
        return ResponseMessage.success(result_list)


class GoodsUDetailAPIView(APIView):
    def get(self, request):
        id = request.GET.get('id')
        #浏览量+1
        goods = Goods.objects.get(id=id)
        Goods.objects.filter(id=id).update(views=int(goods.views+1))
        goods = Goods.objects.get(id=id)
        # 提取对象的属性并存储在字典中
        data = {
            'title': goods.title,
            'status': goods.status,
            'create_user_id': goods.create_user_id,
            'update_user_id': goods.update_user_id,
            'content': goods.content,
            'category_id': goods.category_id,
            'views': goods.views,
            'username': goods.username,
            'category_title': goods.category_title,
            'create_time': goods.create_time.strftime("%Y-%m-%d %H:%M:%S"),
            'id': goods.id,
        }
        # 将字典转换为JSON格式的字符串
        json_data = json.dumps(data)
        return ResponseMessage.success(data)


class UploadAPIView(APIView):
    def post(self, request):
        if request.method == "POST":
            # 获取上传的文件对象
            file = request.FILES.get('file')
            # 将文件存储在 upload 目录下
            new_folder = UPLOAD_PATH
            if not os.path.exists(new_folder):
                os.makedirs(new_folder)
            # 文件上传 没有这个文件路径就创建出来
            # 文件上传 没有这个文件路径就创建出来 默认路径
            # 获取后缀名
            file_name = file.name.split(".")
            current_name = str(uuid.uuid4()) + "." + file_name[len(file_name) - 1]
            with open(f"{UPLOAD_PATH}{current_name}", 'wb') as f:
                for chunk in file.chunks():
                    f.write(chunk)

                    # map.put("url", "http://" + serverIp + ":" + serverPort + "/views?fileName=" + fileName);
                    # map.put("alt", file.getOriginalFilename());
            obj = {
                "url": HTTP_PICTURE + current_name,
                "alt": current_name
            }
            return ResponseMessage.success(obj)


class WangeditorUploadsAPIView(APIView):
    def post(self, request):
        if request.method == "POST":
            # 获取上传的文件对象
            file = request.FILES.get('file')
            # 将文件存储在 upload 目录下
            new_folder = UPLOAD_PATH
            if not os.path.exists(new_folder):
                os.makedirs(new_folder)
            file_name = file.name.split(".")
            current_name = str(uuid.uuid4()) + "." + file_name[len(file_name) - 1]
            with open(f"{UPLOAD_PATH}{current_name}", 'wb') as f:
                for chunk in file.chunks():
                    f.write(chunk)
                obj = {
                    "errno": 0,
                    "data": {
                        "url": HTTP_PICTURE + current_name,
                        "href": HTTP_PICTURE + current_name,
                        "alt": current_name,
                    },
                }
            return JsonResponse(obj)

class GoodsBannerAPIView(APIView):
    def get(self, request):
        list = Goods.objects.all()[0: 5]
        serializer = GoodsSerializer(list, many=True)
        return ResponseMessage.success(serializer.data)



