# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class SysUser(models.Model):
    username = models.CharField(max_length=50, blank=True, null=True)
    password = models.CharField(max_length=100, blank=True, null=True)
    motto = models.CharField(max_length=200, blank=True, null=True)
    email = models.CharField(max_length=50, blank=True, null=True)
    mobile = models.CharField(max_length=20, blank=True, null=True)
    address = models.CharField(max_length=255, blank=True, null=True)
    role_type = models.CharField(max_length=50, blank=True, null=True)
    create_time = models.DateTimeField(blank=True, null=True)
    update_time = models.DateTimeField(blank=True, null=True)
    status = models.IntegerField(blank=True, null=True)
    create_user_id = models.IntegerField(blank=True, null=True)
    update_user_id = models.IntegerField(blank=True, null=True)
    age_group = models.CharField(max_length=2, blank=True, null=True)
    gender = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'sys_user'
        ordering = ['-id']

from django.db.models.signals import pre_save
from apps.common.signals import pre_save_timestamp_handler

# 注册通用信号处理程序
pre_save.connect(pre_save_timestamp_handler, sender=SysUser)
