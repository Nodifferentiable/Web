
from django.contrib import admin
from django.urls import path, include

from apps.goods.views import GoodsAPIView, GoodsSaveAPIView, GoodsDeleteAPIView, GoodsUPageAPIView, \
    GoodsUDetailAPIView, GoodsBannerAPIView

urlpatterns = [

    path("findPage", GoodsAPIView.as_view()),
    path("save", GoodsSaveAPIView.as_view()),
    path("delBatch", GoodsDeleteAPIView.as_view()),
    path("uPage", GoodsUPageAPIView.as_view()),
    path("uDetail", GoodsUDetailAPIView.as_view()),
    # 轮播图数据
    path("banner", GoodsBannerAPIView.as_view()),


]