from rest_framework import serializers


from apps.SysUser.models import SysUser


class SysDefaultUserSerializer(serializers.ModelSerializer):

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
        return  [
            {
                "id": 1,
                "title": "信息管理",
                "path": "信息管理",
                "description": "信息管理",
                "page_path": "信息管理",
                "pid": None,
                "sort_num": 6,
                "children": [
                    {
                        "id": 14,
                        "title": "评论管理",
                        "path": "/commentManage",
                        "description": "/commentManage",
                        "page_path": None,
                        "pid": 12,
                        "sort_num": None,
                        "children": None,
                        "is_menu": None
                    },
                ],
                "is_menu": None
            },

        ]