from django.urls import path

from apps.category.views import CategoryAPIView, CategorySaveAPIView, CategoryDeleteAPIView, CategoryListAPIView

urlpatterns = [
    path("findPage", CategoryAPIView.as_view()),
    path("save", CategorySaveAPIView.as_view()),
    path("delBatch", CategoryDeleteAPIView.as_view()),
    path("list", CategoryListAPIView.as_view()),
    #     path("<str:sku_id>", GoodsDetailAPIView.as_view()),
#
]
