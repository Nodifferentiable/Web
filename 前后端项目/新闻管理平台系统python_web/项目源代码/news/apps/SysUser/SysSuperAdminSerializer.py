from rest_framework import serializers


from apps.SysUser.models import SysUser




class SysSuperAdminSerializer(serializers.ModelSerializer):

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
                "title": "用户管理",
                "path": "用户管理",
                "description": "用户管理",
                "page_path": None,
                "pid": None,
                "sort_num": 8,
                "children": [
                    {
                        "id": 2,
                        "title": "用户管理",
                        "path": "sysUserManage",
                        "description": "用户管理",
                        "page_path": "sysUserManage",
                        "pid": 23,
                        "sort_num": 888,
                        "children": None,
                        "is_menu": None
                    },
                ],
                "is_menu": None
            },
            {
                "id": 4,
                "title": "新闻管理",
                "path": "新闻管理",
                "description": "新闻管理",
                "page_path": "新闻管理",
                "pid": None,
                "sort_num": 7,
                "children": [
                    {
                        "id": 5,
                        "title": "新闻管理",
                        "path": "/goodsManage",
                        "description": "新闻管理",
                        "page_path": "/goodsManage",
                        "pid": 13,
                        "sort_num": 99,
                        "children": None,
                        "is_menu": None
                    }
                ],
                "is_menu": None
            },
            {
                "id": 6,
                "title": "信息管理",
                "path": "信息管理",
                "description": "信息管理",
                "page_path": "信息管理",
                "pid": None,
                "sort_num": 6,
                "children": [
                    {
                        "id": 7,
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
            {
                "id": 8,
                "title": "分类管理",
                "path": "分类管理",
                "description": "分类管理",
                "page_path": "分类管理",
                "pid": None,
                "sort_num": 5,
                "children": [
                    {
                        "id": 9,
                        "title": "栏目管理",
                        "path": "/categoryManage",
                        "description": "栏目管理",
                        "page_path": "/categoryManage",
                        "pid": 11,
                        "sort_num": 3,
                        "children": None,
                        "is_menu": None
                    }
                ],
                "is_menu": None
            },
        ]