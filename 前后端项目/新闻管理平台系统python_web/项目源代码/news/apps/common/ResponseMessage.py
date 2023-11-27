import json

from django.http import HttpResponse, JsonResponse


class ResponseMessage():
    @staticmethod
    def success(data):
        result = {"code": 200, "data": data,"msg":"操作成功"}
        # return JsonResponse(result, safe=False)
        # return HttpResponse(json.dumps(result), content_type="application/json",)

        return JsonResponse(result, safe=False)


    @staticmethod
    def failed():
        result = {"code": 500, "data": None,"msg":"操作失败"}
        # return HttpResponse(json.dumps(result), content_type="application/json")
        return JsonResponse(result, safe=False)

    @staticmethod
    def other(data):
        result = {"code": 500, "data": data,"msg":data}
        return JsonResponse(result, safe=False)

    """用来控制页面来进行跳转"""
    @staticmethod
    def jump(code,data):
        result = {"code": code, "data": None,"msg":data}
        return JsonResponse(result, safe=False)
