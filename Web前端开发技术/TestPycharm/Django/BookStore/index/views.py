from django.shortcuts import render

# Create your views here.

from django.http import HttpResponse
from django.template import loader
from django.shortcuts import render

from index import models

def test_html(request):
    # 加载
    t = loader.get_template('test.html')

    # 传参
    html = t.render({"name": "846446456dg", "age": 55, "gender": "男"})

    # 返回响应
    return HttpResponse(html)


def teendfor_html(request):
    # 加载
    t = loader.get_template('testfor.html')

    # 传参
    html = t.render({"dic": [1, 2, 23, 123, 123, 21, 321, 321, 321, 3, 1]})

    # 返回响应
    return HttpResponse(html)

def ceshi_html(request):
    # 加载
    t = loader.get_template('ceshi.html')

    # 传参
    html = t.render({"name": "846446456dg", "age": 55, "gender": "男"})

    # 返回响应
    return HttpResponse(html)

def pachongtext(request):

    pachong=models.AirData.objects.all()
    return some_view(request,pachong,'html/test3.html')

def some_view(request,content,path):
    pachong_objects = content
    pachong = [
        {field.name: getattr(obj, field.name) for field in obj._meta.fields}
        for obj in pachong_objects
    ]
    return render(request, path, {'pachong': pachong})

