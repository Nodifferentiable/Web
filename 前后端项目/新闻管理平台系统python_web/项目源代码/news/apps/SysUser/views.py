import json


from rest_framework.generics import GenericAPIView
from rest_framework.views import APIView

from apps.SysUser.SysDefaultUserSerializer import SysDefaultUserSerializer
from apps.SysUser.SysUserSerializer import SysUserSerializer
from apps.SysUser.SysSuperAdminSerializer import SysSuperAdminSerializer
from apps.SysUser.models import SysUser
from apps.comment.models import Comment

from apps.common.ResponseMessage import ResponseMessage

from apps.goods.models import Goods
from utils.DateUtil import get_date
from utils.jwt_auth import create_token
from news.settings import PAGE_SIZE


class SysUserAPIView(APIView):
    def post(self, request):
        data = request.data
        page = data.get('pageNum')

        current_page = (page - 1) * PAGE_SIZE
        end_data = page * PAGE_SIZE

        title = data.get('username')
        if request.role_type == "ROLE_ADMIN":
            
            if title is not None and title != "":
                list = SysUser.objects.filter(username__contains=title)[current_page: end_data]
            else:
                list = SysUser.objects.all()[current_page: end_data]
        else:
            if title is not None and title != "":
                list = SysUser.objects.filter(username__contains=title)[current_page: end_data]
            else:
                list = SysUser.objects.filter(create_user_id=request.id, username__contains=title)[
                       current_page: end_data]
        # 创建 CategorySerializer 实例，并将查询结果序列化为 JSON 格式
        serializer = SysUserSerializer(list, many=True)
        result_list = {
            'total': SysUser.objects.count(),
            'list': serializer.data
        }
        return ResponseMessage.success(result_list)


class SysUserSaveAPIView(APIView):
    def post(self, request):
        data = request.data
        id = data.get('id')
        if id:
            # 如果存在对象 ID，则是编辑操作
            try:
                data['update_user_id'] = request.id
                instance = SysUser.objects.get(id=id)
                serializer = SysUserSerializer(instance, data=data, partial=True)
                if serializer.is_valid():
                    serializer.save()
                    return ResponseMessage.success(None)
            except SysUser.DoesNotExist:
                return ResponseMessage.failed()
        else:
            # 不存在对象 ID，则是新增操作
            data['create_user_id'] = request.id
            data['status'] = 0
            serializer = SysUserSerializer(data=data)

            if serializer.is_valid():
                serializer.save()
                return ResponseMessage.success(None)
            else:
                return ResponseMessage.failed()

class SysUserDeleteAPIView(APIView):
    def post(self, request):
        data = json.loads(request.body)
        try:
            for id in data:
                category = SysUser.objects.get(id=id)
                category.delete()
        except SysUser.DoesNotExist:
            return ResponseMessage.other("没有找到需要删除的数据")
        return ResponseMessage.success(None)


class RegisterAPIView(APIView):

    def post(self, request):
        username = request.data.get("username")
        # 检测用户名是否重复
        userinfo = SysUser.objects.filter(username=username).first()
        
        if userinfo is not None:
            return ResponseMessage.other("用户名重复")
        data = request.data
        data['role_type']="ROLE_ADMIN"
        #反序列化呀，把json变成一个对象[这是关键的一句话]
        user_data_serializer = SysUserSerializer(data=request.data)
        # 验证不通过抛出异常
        user_data_serializer.is_valid(raise_exception=True)
        user_data = user_data_serializer.save()
        # 序列化一下，把json返回给前端对象
        user_ser = SysUserSerializer(instance=user_data)
        return ResponseMessage.success(user_ser.data)

    def get(self, request):
        email = request.GET.get("email")
        try:
            user_data = SysUser.objects.get(email=email)
            user_ser = SysUserSerializer(user_data)
            return ResponseMessage.success(user_ser.data)
        except Exception as e:
            print(e)
            return ResponseMessage.other("用户信息获取失败")

"""用户登录"""
class LoginView(GenericAPIView):
    def post(self, request):
        return_data = {}
        request_data = request.data
        username = request_data.get("username")
        password = request_data.get("password")
        try:
            # 查询到多条数据会报错
            # user_data = SysUser.objects.get(username=username)
            user_data = SysUser.objects.filter(username=username).first()
        except Exception:
            return ResponseMessage.other("用户名或者是密码错误1")
        if not user_data:
            return ResponseMessage.other("用户名或者是密码错误1")
        else:
            user_ser = SysUserSerializer(instance=user_data, many=False)
            # 用户输入的密码
            user_password = request_data.get("password")
            # md5_user_password = get_md5(user_password)
            # print(md5_user_password)
            # 数据库的密码
            db_user_password = user_ser.data.get("password")
            # if md5_user_password != db_user_password:
            if password != db_user_password:
                return ResponseMessage.other("用户名或者是密码错误2")
            else:
                user_info = SysUser.objects.get(username=username, password=password)
                token_info = {
                    "id": user_info.id,
                    "username": username,
                    "role_type": user_info.role_type
                }
                token_data = create_token(token_info)
                return_data["token"] = token_data
                if user_info.role_type == "ROLE_ADMIN":
                    info = SysSuperAdminSerializer(instance=user_info, many=False)
                elif user_info.role_type == "ROLE_USER":
                    info = SysDefaultUserSerializer(instance=user_info, many=False)
                else:
                    info = SysDefaultUserSerializer(instance=user_info, many=False)
                data = info.data
                data["token"] = token_data
                return ResponseMessage.success(data)
class EchartsAPIView(APIView):
    def get(self, request):
        # 获取最近7天的数据
        list = get_date()
        # 饼图数据
        statistic = []
        # 条形图数据
        x = []
        y = []
        for str in list:
            statistic.append({
                "name":str,
                "value":Comment.objects.filter(create_time__date=str).count()
            })
            x.append(str)
            y.append(Goods.objects.filter(create_time__date=str).count())
        data = {
            "statistic": statistic,
            "x": x,
            "y": y,
            "panel": {
                # 发布情况
                "goodsCount": Goods.objects.count(),
                # 评论情况
                "commentCount": Comment.objects.count()
            }
        }
        return ResponseMessage.success(data)
