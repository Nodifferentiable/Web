from django.db import models


# Create your models here.

# 新建出版社表
class PubName(models.Model):
    pubname = models.CharField('名称', max_length=255, unique=True)


# 创建book表
class Book(models.Model):
    # unique 不唯一
    title = models.CharField(max_length=30, unique=True, verbose_name='书名')
    public = models.CharField(max_length=50, verbose_name='出版社')
    price = models.DecimalField(max_digits=7, decimal_places=2, verbose_name='定价')
    retail_price = models.DecimalField(max_digits=7, decimal_places=2, verbose_name='零售价', default="30")

    pub = models.ForeignKey(to=PubName, on_delete=models.CASCADE, null=True)  # 创建Foreign外键关联pub,以pub_id关联
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

#新建一对一关用户信息表拓展表,添加完成后执行数据库迁移同步操作
class ExtendUserinfo(models.Model):
    user=models.OneToOneField(to=UserInfo,on_delete=models.CASCADE)
    signature=models.CharField(max_length=255,verbose_name='用户签名',help_text='自建签名')
    nickname=models.CharField(max_length=255,verbose_name='昵称',help_text='自建昵称')

class AirData(models.Model):
    province = models.CharField(max_length=255, blank=True, null=True)
    city = models.CharField(max_length=255, blank=True, null=True)
    point = models.CharField(max_length=255, blank=True, null=True)
    aqi = models.IntegerField(blank=True, null=True)
    quality = models.CharField(max_length=255, blank=True, null=True)
    pm25 = models.FloatField(blank=True, null=True)
    pm10 = models.FloatField(blank=True, null=True)
    co = models.FloatField(blank=True, null=True)
    no2 = models.FloatField(blank=True, null=True)
    so2 = models.FloatField(blank=True, null=True)
    o3 = models.FloatField(blank=True, null=True)
    update_time = models.DateTimeField(blank=True, null=True)
    update_slot = models.CharField(max_length=255, blank=True, null=True)
    id = models.IntegerField(primary_key=True)
    city_flag = models.BooleanField()

    class Meta:
        managed = False
        db_table = 'air_data'
        unique_together = (('province', 'city', 'point', 'update_time'),)
        verbose_name_plural = '空气质量数据'


