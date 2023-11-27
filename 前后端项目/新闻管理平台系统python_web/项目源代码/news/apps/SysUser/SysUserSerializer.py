from rest_framework import serializers


from apps.SysUser.models import SysUser




class SysUserSerializer(serializers.ModelSerializer):

 #   create_time = serializers.DateTimeField("%Y-%m-%d %H:%M:%S")
  #  update_time = serializers.DateTimeField("%Y-%m-%d %H:%M:%S")

    # 添加自定义字段
    menuList = serializers.SerializerMethodField()
    class Meta:
        model = SysUser
        fields = "__all__"

    def get_menuList(self, obj):
        # 在这里计算或获取额外的数据，并返回
        # return "Some extra data for {}".format(obj.username)
        return []

