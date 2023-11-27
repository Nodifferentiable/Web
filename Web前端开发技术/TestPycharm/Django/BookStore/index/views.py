from django.shortcuts import render

# Create your views here.

from django.http import HttpResponse
from django.template import loader
from django.shortcuts import render

def test_html(request):
    #加载
    t = loader.get_template('test.html')

    #传参
    html=t.render({"name":"846446456dg"})

    #返回响应
    return HttpResponse(html)
