"""
绘制地图
"""
from pyecharts.charts import Map
from pyecharts import options as opts
from pyecharts.render import make_snapshot


# from snapshot_selenium import snapshot


def drew_city_count(base_count):
    # 示例市级数据
    # base_count = {
    #     "北京市": 100,
    #     "上海市": 200,
    #     "广州市": 150,
    #     "深圳市": 150,
    #     "杭州市": 180,
    #     # 其他城市及其数据...
    # }
    # print('base_count.["深圳市")', base_count["深圳市"], type(base_count["深圳市"]))
    base_count["广东省"] = int(base_count["深圳市"]) + int(base_count["广州市"])
    base_count["浙江省"] = base_count["杭州市"]
    base_count["四川省"] = base_count["成都市"]
    base_count["江苏省"] = base_count["南京市"] + base_count["苏州市"]
    base_count["湖北省"] = base_count["武汉市"]
    base_count["陕西省"] = base_count["西安市"]
    base_count["福建省"] = base_count["厦门市"]
    base_count["湖南省"] = base_count["长沙市"]

    # 准备城市名称和对应的数据值
    city_names = list(base_count.keys())
    data = [(city, value) for city, value in base_count.items()]

    # 获取数据中的最大值，用于设置视觉映射的最大值
    max_value = max(base_count.values())

    # 创建地图图表
    map_chart = (
        Map()
            .add("City Data", data, "china")
            .set_global_opts(
            title_opts=opts.TitleOpts(title="中国城市数据分布"),
            visualmap_opts=opts.VisualMapOpts(max_=max_value),  # 设置最大值
        )
            .set_series_opts(label_opts=opts.LabelOpts(is_show=False))  # 不显示城市名称标签，避免拥挤
        #     .add("City Data", data, "广东")
        #     .set_global_opts(
        #     title_opts=opts.TitleOpts(title="广东省城市数据分布"),
        #     visualmap_opts=opts.VisualMapOpts(max_=max_value),  # 设置最大值
        # )
        #     .set_series_opts(label_opts=opts.LabelOpts(is_show=False))  # 不显示城市名称标签，避免拥挤
    )

    # 生成 HTML 文件并在浏览器中打开
    map_chart.render("./static/map.html")
    # make_snapshot(snapshot, map_chart.render("china_city_map.html"), "china_city_map.png")


# drew_city_count([])
