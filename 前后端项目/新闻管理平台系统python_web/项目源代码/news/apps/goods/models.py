# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
import json

from django.db import models


class Goods(models.Model):
    title = models.CharField(max_length=500, blank=True, null=True)
    content = models.TextField(blank=True, null=True)
    category_id = models.IntegerField(blank=True, null=True)
    create_user_id = models.IntegerField(blank=True, null=True)
    views = models.IntegerField(blank=True, null=True)
    create_time = models.DateTimeField(blank=True, null=True)
    update_time = models.DateTimeField(blank=True, null=True)
    status = models.IntegerField(blank=True, null=True)
    update_user_id = models.IntegerField(blank=True, null=True)
    username = models.CharField(max_length=255, blank=True, null=True)
    category_title = models.CharField(max_length=255, blank=True, null=True)

    # 在这里我们自己手动序列化
    def __str__(self):
        result = {}
        result['title'] = self.title
        # result['create_time'] = self.create_time
        # result['update_time'] = self.update_time
        result['status'] = self.status
        result['create_user_id'] = self.create_user_id
        result['update_user_id'] = self.update_user_id
        result['content'] = self.content
        result['category_id'] = self.category_id
        result['views'] = self.views
        result['status'] = self.status
        result['username'] = self.username
        result['category_title'] = self.category_title
        return json.dumps(result, ensure_ascii=False)

    class Meta:
        managed = False
        db_table = 'goods'
        ordering = ['-id']


from django.db.models.signals import pre_save
from apps.common.signals import pre_save_timestamp_handler

# 注册通用信号处理程序
pre_save.connect(pre_save_timestamp_handler, sender=Goods)
