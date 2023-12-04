# 子路由

from django.contrib import admin
from django.urls import path

from index import views

# 子路由
urlpatterns = [
    # #后台管理的路由
    # path('admin/', admin.site.urls),

    # 对应视图函数
    path('test/', views.test_html),
    path('endfor/', views.teendfor_html),
    path('test2/', views.ceshi_html),
    path('blog/', views.pachongtext)

]
