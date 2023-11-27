import json


from rest_framework.views import APIView

from apps.comment.CommentSerializer import CommentSerializer
from apps.comment.models import Comment

from apps.common.ResponseMessage import ResponseMessage
from news.settings import PAGE_SIZE


class CommentAPIView(APIView):
    def post(self, request):
        data = request.data
        page = data.get('pageNum')
        current_page = (page - 1) * PAGE_SIZE
        end_data = page * PAGE_SIZE
        title = data.get('title')
        if request.role_type == "ROLE_ADMIN":
            
            if title is not None and title != "":
                list = Comment.objects.filter(content__contains=title)[current_page: end_data]
            else:
                list = Comment.objects.all()[current_page: end_data]
        else:
            if title is not None and title != "":
                list = Comment.objects.filter(content__contains=title)[current_page: end_data]
            else:
                list = Comment.objects.filter(create_user_id=request.id, content__contains=title)[current_page: end_data]
        # 创建 CategorySerializer 实例，并将查询结果序列化为 JSON 格式
        serializer = CommentSerializer(list, many=True)
        result_list = {
            'total': Comment.objects.count(),
            'list': serializer.data
        }

        return ResponseMessage.success(result_list)
class CommentSaveAPIView(APIView):

    def post(self, request):
        data = request.data
        id = data.get('id')
        if id:
            # 如果存在对象 ID，则是编辑操作
            try:
                data['update_user_id'] = request.id
                instance = Comment.objects.get(id=id)
                serializer = CommentSerializer(instance, data=data, partial=True)
                if serializer.is_valid():
                    serializer.save()
                    return ResponseMessage.success(None)

            except Comment.DoesNotExist:
                return ResponseMessage.failed()
        else:
            # 不存在对象 ID，则是新增操作
            data['create_user_id'] = request.id
            data['status'] = 0
            serializer = CommentSerializer(data=data)
            if serializer.is_valid():
                serializer.save()
                return ResponseMessage.success(None)
            else:
                return ResponseMessage.failed()


class CommentDeleteAPIView(APIView):

    def post(self, request):
        data = json.loads(request.body)
        try:
            for id in data:
                category = Comment.objects.get(id=id)
                category.delete()
        except Comment.DoesNotExist:
            return ResponseMessage.other("没有找到需要删除的数据")
        return ResponseMessage.success(None)

class CommentListAPIView(APIView):
    def get(self, request):
        goods_id = request.GET.get('goods_id')
        print(goods_id)
        list = Comment.objects.filter(goods_id=goods_id)
        # 创建 CategorySerializer 实例，并将查询结果序列化为 JSON 格式
        serializer = CommentSerializer(list, many=True)
        return ResponseMessage.success(serializer.data)
