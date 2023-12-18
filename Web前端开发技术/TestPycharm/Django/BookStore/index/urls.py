# 子路由

from django.contrib import admin
from django.urls import path, re_path

from index import views

# 子路由
urlpatterns = [
    # #后台管理的路由
    # path('admin/', admin.site.urls),

    # 对应视图函数
    path('test/', views.test_html),
    path('endfor/', views.teendfor_html),
    path('test2/', views.ceshi_html),
    path('allbook/', views.pachongtext),
    path('search_name/', views.search_title),
    path('book_message/', views.book_message),
    path('login_test/', views.login_view,name='login_test'),
    path('add_book/', views.add_book, name='add_book'),
    path('update_book/', views.update_book, name='update_book'),

    #re
    re_path('test3/(?P<year>\d{4})/',views.year_test),

]
