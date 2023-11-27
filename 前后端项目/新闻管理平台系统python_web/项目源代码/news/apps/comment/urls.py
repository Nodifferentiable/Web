
from django.contrib import admin
from django.urls import path, include

from apps.comment.views import CommentAPIView, CommentSaveAPIView, CommentDeleteAPIView, CommentListAPIView

urlpatterns = [

    path("findPage", CommentAPIView.as_view()),
    path("save", CommentSaveAPIView.as_view()),
    path("delBatch", CommentDeleteAPIView.as_view()),
    path("list", CommentListAPIView.as_view()),

]