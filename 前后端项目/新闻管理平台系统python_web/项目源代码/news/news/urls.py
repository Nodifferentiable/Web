"""news URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include


from apps.goods.views import UploadAPIView, WangeditorUploadsAPIView

urlpatterns = [
    path('admin/', admin.site.urls),
    path("category/", include("apps.category.urls")),
    path("comment/", include("apps.comment.urls")),
    path("goods/", include("apps.goods.urls")),
    path("sysUser/", include("apps.SysUser.urls")),
    path("uploads", UploadAPIView.as_view()),
    path("wangeditorUploads", WangeditorUploadsAPIView.as_view()),



]
