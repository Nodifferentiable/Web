import hashlib

from django.shortcuts import render

# Create your views here.

from django.http import HttpResponse, HttpResponseRedirect
from django.template import loader
from django.shortcuts import render

from index import models
from index.models import Book, UserInfo, PubName


def test_html(request):
  # 加载
  t = loader.get_template('test.html')

  # 传参
  html = t.render({"name": "846446456dg", "age": 55, "gender": "男"})

  # 返回响应
  return HttpResponse(html)


# def search_name(request):
#   return render(request, 'index/search_title.html')


def search_title(request):
  if not request.GET.get('title', ''):
    errors = ['输入的书名是无效']
    print('error')
  title = Book.objects.filter(title=request.GET['title'])
  print(title)
  return render(request, 'index/search_title.html', locals())


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
  pachong = models.AirData.objects.all()
  return some_view(request, pachong, 'html/test3.html')


def book_message(request):
  all_book = Book.objects.all().order_by('-price')

  return render(request, 'index/books_message.html', locals())


def some_view(request, content, path):
  pachong_objects = content
  pachong = [
    {field.name: getattr(obj, field.name) for field in obj._meta.fields}
    for obj in pachong_objects
  ]
  return render(request, path, {'pachong': pachong})


def year_test(request, year):
  print(year)
  book = Book.objects.raw("select *from index_book")
  for i in book:
    print(i)
  print('OKKK')
  return HttpResponse(year)


# 用户的登录逻辑处理
def login_view(request):
  print('111111111111111111111111111')
  # 处理GET请求
  if request.method == 'GET':
    print(1)
    # 1, 首先检查session，判断用户是否第一次登录，如果不是，则直接重定向到首页
    if 'username' in request.session:  # request.session 类字典对象
      return HttpResponseRedirect('/index/login_test')
    # 2, 然后检查cookie，是否保存了用户登录信息
    if 'username' in request.COOKIES:
      # 若存在则赋值回session，并重定向到首页
      request.session['username'] = request.COOKIES['username']
      return HttpResponseRedirect('/index/login_test')
    # 不存在则重定向登录页，让用户登录
    return render(request, 'Login.html')
  # 处理POST请求
  elif request.method == 'POST':
    print("===============================")
    print("===============================")
    print("===============================")

    username = request.POST.get('username')
    password = request.POST.get('password')
    m = hashlib.md5()
    m.update(password.encode())
    password_m = m.hexdigest()

    print(password_m)
    # 判断输入是否其中一项为空或者格式不正确
    if not username or not password:
      error = '你输入的用户名或者密码错误 !'
      return render(request, 'Login.html', locals())
    # 若输入没有问题则进入数据比对阶段，看看已经注册的用户中是否存在该用户
    users = UserInfo.objects.filter(username=username, password=password_m)
    # 由于使用了filter, 所以返回值user是一个数组，但是也要考虑其为空的状态，即没有查到该用户
    if not users:
      error = '用户不存在或用户密码输入错误!!'
      return render(request, 'login.html', locals())
    # 返回值是个数组，并且用户名具备唯一索引，当前用户是该数组中第一个元素
    users = users[0]
    request.session['username'] = username
    response = HttpResponseRedirect('/index/allbook')
    # 检查post 提交的所有键中是否存在 isSaved 键
    if 'isSaved' in request.POST.keys():
      # 若存在则说明用户选择了记住用户名功能，执行以下语句设置cookie的过期时间
      response.set_cookie('username', username, 60 * 60 * 24 * 7)
    return response


def add_book(request):
  if request.method == 'GET':
    return render(request, 'index/add_book.html')
  elif request.method == 'POST':
    # 添加书籍
    title = request.POST.get('title')
    if not title:
      return HttpResponse('请给出一个正确的title')
    pub = request.POST.get('pub')
    price = float(request.POST.get('price', '999.99'))
    if not price:
      return HttpResponse('请输入价格')
    try:
      retail_price = float(request.POST.get('retail_price'))
      if not retail_price:
        return HttpResponse('请输入市场价')
    except Exception as e:
      print(e)
    # 判断title是不是已经存在了
    old_book = Book.objects.filter(title=title)
    if old_book:
      return HttpResponse('你输入的书籍系统已经存在 !')
    try:
      pub1 = PubName.objects.get(pubname=str(pub))
      Book.objects.create(title=title, price=price, retail_price=retail_price, pub=pub1)
    except Exception as e:
      print('Add ErrorReason is %s' % (e))
    return HttpResponseRedirect('/index/book_message')
  return HttpResponse('请使用正确Http请求方法 !')


