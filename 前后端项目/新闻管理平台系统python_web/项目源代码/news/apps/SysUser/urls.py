
from django.urls import path, include

from apps.SysUser.views import SysUserAPIView, SysUserDeleteAPIView, SysUserSaveAPIView, LoginView, \
    RegisterAPIView, EchartsAPIView

urlpatterns = [

    path("findPage", SysUserAPIView.as_view()),
    path("save", SysUserSaveAPIView.as_view()),
    path("delBatch", SysUserDeleteAPIView.as_view()),
    path("register", RegisterAPIView.as_view()),
    path("login", LoginView.as_view()),
    path("echarts", EchartsAPIView.as_view()),

]