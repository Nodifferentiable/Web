from rest_framework import serializers

from apps.goods.models import Goods


class GoodsSerializer(serializers.ModelSerializer):

 #   create_time = serializers.DateTimeField("%Y-%m-%d %H:%M:%S")
  #  update_time = serializers.DateTimeField("%Y-%m-%d %H:%M:%S")

    class Meta:
        model = Goods
        fields = "__all__"
