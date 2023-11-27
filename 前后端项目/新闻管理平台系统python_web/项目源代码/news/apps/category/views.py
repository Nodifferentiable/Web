import json

from django.shortcuts import render
from rest_framework.views import APIView

from apps.category.CategorySerializer import CategorySerializer
from apps.category.models import Category
from apps.category.models import Category
from apps.common.ResponseMessage import ResponseMessage
from news.settings import PAGE_SIZE





class CategoryAPIView(APIView):
    """
     地址 API 视图，用于列出地址

     读取分页的地址列表。

     :param title: 标题
     :param page: 分页
     """

    def post(self, request):
        # title = request.GET.get("title")
        """
            获取分页的地址列表.
            :param title: 地址标题
            :param page: 用于分页的页码
            :return: 分页地址列表
        """
        data = request.data
        page = data.get('pageNum')

        current_page = (page - 1) * PAGE_SIZE
        end_data = page * PAGE_SIZE

        title = data.get('title')
        if request.role_type == "ROLE_ADMIN":
            
            if title is not None and title != "":
                list = Category.objects.filter(title__contains=title)[current_page: end_data]
            else:
                list = Category.objects.all()[current_page: end_data]
        else:
            if title is not None and title != "":
                list = Category.objects.filter(title__contains=title)[current_page: end_data]
            else:
                list = Category.objects.filter(create_user_id=request.id, title__contains=title)[current_page: end_data]

        # .order_by('-field_name') 降序排列
        # 创建 CategorySerializer 实例，并将查询结果序列化为 JSON 格式
        serializer = CategorySerializer(list, many=True)
        result_list = {
            'total': Category.objects.count(),
            'list': serializer.data
        }
        return ResponseMessage.success(result_list)


class CategorySaveAPIView(APIView):
    """
       地址保存 API 视图，用于添加或编辑地址。
    """

    def post(self, request):
        """
          添加或编辑地址。
          :param id: 要编辑的地址的 ID（可选）。
          :return: 成功或失败响应。
        """
        data = request.data

        id = data.get('id')

        if id:
            # 如果存在对象 ID，则是编辑操作
            try:
                instance = Category.objects.get(id=id)
                data['update_user_id'] = request.id
                serializer = CategorySerializer(instance, data=data, partial=True)
                if serializer.is_valid():
                    serializer.save()
                    return ResponseMessage.success(None)

            except Category.DoesNotExist:
                return ResponseMessage.failed()
        else:
            # 不存在对象 ID，则是新增操作
            data['create_user_id'] = request.id
            data['status'] = 0
            serializer = CategorySerializer(data=data)

            if serializer.is_valid():
                serializer.save()
                return ResponseMessage.success(None)

            else:
                return ResponseMessage.failed()


class CategoryDeleteAPIView(APIView):
    """
       Category Delete API View for deleting an category.
    """

    def post(self, request):
        """
               按 ID 删除地址。

               :param id: 要删除地址的 ID。
               :return: 成功或失败响应。
        """
        # 用于将接收到的 JSON 格式的请求体数据解析为 Python 字典（或其他合适的数据结构）
        data = json.loads(request.body)
        try:
            for id in data:
                category = Category.objects.get(id=id)
                category.delete()
        except Category.DoesNotExist:
            return ResponseMessage.other("没有找到需要删除的数据")
        return ResponseMessage.success(None)


class CategoryListAPIView(APIView):

    def get(self, request):
        list = Category.objects.all()

        # 创建 CategorySerializer 实例，并将查询结果序列化为 JSON 格式
        serializer = CategorySerializer(list, many=True)
        return ResponseMessage.success(serializer.data)
