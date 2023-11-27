from apps.common.ResponseMessage import ResponseMessage
from utils.jwt_auth import get_payload

class TokenInterceptorMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        # 放行白名单
        whitelist_path = ['/sysUser/login', '/sysUser/register', '/goods/uPage', '/goods/uDetail']
        # 放行的请求列表
        # print(request.path)
        # 存在的路径直接放行
        if request.path in whitelist_path:
            response = self.get_response(request)
        else:
            # 获取请求头部中的 Authorization
            token = request.META.get('HTTP_TOKEN')
            if token is not None:
                user_info = get_payload(token)
                # print(user_info.get("status"))
                if user_info.get("status") == True:
                # 在这里进行 Token 处理，例如验证、解码等
                # 在此示例中，只是将 Token 存储在 request 中，你可以根据需要进行进一步操作
                    request.token = token
                    request.id = user_info.get("data").get("id")
                    request.username = user_info.get("data").get("username")
                    request.role_type = user_info.get("data").get("role_type")
                else:
                    return ResponseMessage.jump(301,"访问接口未授权，请重新登录")
            else:
                return ResponseMessage.jump(301,"访问接口未授权，请重新登录")
            response = self.get_response(request)
        # 在请求处理之后的操作
        return response
