# pip install pyjwt
import datetime

import jwt
from rest_framework.authentication import BaseAuthentication

from news.settings import SECRET_KEY
from apps.common.ResponseMessage import ResponseMessage


# 直接使用django中的key当做盐
# SECRET_KEY

# 创建一个token
def create_token(payload, timeout=60*24*30):
    headers = {
        'alg': "HS256",
        'typ': "jwt"
    }

    payload["exp"] = datetime.datetime.utcnow() + datetime.timedelta(minutes=timeout)  # 定义超时时间

    result = jwt.encode(headers=headers, payload=payload, key=SECRET_KEY, algorithm="HS256")
    return result


'''
解析token信息
'''


def get_payload(token):
    result = {"status": False, "data": None, "error": None}

    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=["HS256"])
        result["status"] = True
        result["data"] = payload
    except jwt.exceptions.DecodeError:
        print("token认证失败了")
        result["error"] = "token认证失败了"
        result["status"] = False

    except jwt.exceptions.ExpiredSignatureError:
        print("token已经失效了")
        result["error"] = "token已经失效了"
        result["status"] = False

    except jwt.exceptions.InvalidTokenError:
        print("无效的、非法的token")
        result["error"] = "无效的、非法的token"
        result["status"] = False

    return result


# 用户在url中进行token的参数配置
class JwtQueryParamAuthentication(BaseAuthentication):
    def authenticate(self, request):
        # 从url中拿到token
        token = request.GET.get("token")
        result_payload = get_payload(token)
        print(result_payload)
        # 必须这样写
        return (result_payload, token)


class JwtHeaderAuthentication(BaseAuthentication):
    def authenticate(self, request):
        # token = request.META
        # print(token)
        token = request.META.get("HTTP_TOKEN")
        print(token)
        result_payload = get_payload(token)
        print(result_payload)
        return (result_payload, token)

        # 从url中拿到token
        # token = request.GET.get("token")
        # result_payload  =get_payload(token)
        # print(result_payload)
        # 必须这样写
