from django.contrib import admin

# Register your models here.

from django.contrib import admin #Django自动在admin.py文件中导入
from index.models import Book, Author,UserInfo #这个需要我们自己导入相应的模型类（数据表）

#后台设置注册
admin.site.register([Book,Author,UserInfo])