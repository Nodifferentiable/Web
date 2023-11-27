from django.db import models


# Create your models here.


# 创建book表
class Book(models.Model):
    # unique 不唯一
    title = models.CharField(max_length=30, unique=True, verbose_name='书名')
    public = models.CharField(max_length=50, verbose_name='出版社')
    price = models.DecimalField(max_digits=7, decimal_places=2, verbose_name='定价')
    retail_price = models.DecimalField(max_digits=7, decimal_places=2, verbose_name='零售价', default="30")

    # 魔法方法
    def __str__(self):
        return "title:%s pub:%s price:%s" % (self.title, self.public, self.price)


# 创建作者表
class Author(models.Model):
    name = models.CharField(max_length=30, verbose_name='姓名')
    email = models.EmailField(verbose_name='邮箱')

    def __str__(self):
        return '作者：%s' % self.name


# 创建用户信息表
class UserInfo(models.Model):
    username = models.CharField(max_length=24, verbose_name='用户注册')
    password = models.CharField(max_length=24, verbose_name='密码')

    # 定义chocies参数的对应关系，以元组（或者列表）的形式进行表述：
    choices = (
        ('male', '男性'),
        ('female', '女性'),
    )
    gender = models.CharField(max_length=10,choices = choices,default='male')
