from pyecharts import options as opts
from pyecharts.charts import Bar


def drew_bar_position_count(data):
    # 示例数据
    # data = [
    #     (2717, 'python爬虫开发工程师', '深圳', '十分融易', '20k', '本科', '有竞争力的薪资 、绩效奖金 、灵活的工作制度'),
    #     (2718, 'Python服务端实习生', '深圳', '滴墨书摘', '3k-4k', '应届 / 本科', '可转正'),
    #     (2719, 'python高级开发工程师', '北京', '深圳铸泰科技', '15k-30k', '本科', '欢迎有职业梦想的你加盟')
    # ]

    # 提取职位数据
    positions = [item[1] for item in data]
    position_counts = {}

    # 统计职位数量
    for position in positions:
        if position in position_counts:
            position_counts[position] += 1
        else:
            position_counts[position] = 1

    # 使用sorted函数对字典进行排序，key参数指定排序依据为字典的值
    position_counts = sorted(position_counts.items(), key=lambda x: x[1], reverse=True)

    # 取出前15个元素
    position_counts = dict(position_counts[:15])

    # 职位名称和对应的数量转换为列表，用于绘图
    position_names = list(position_counts.keys())
    counts = list(position_counts.values())

    # 创建条形图
    bar = (
        Bar()
            .add_xaxis(position_names)
            .add_yaxis("职位数量", counts)
            .set_global_opts(
            title_opts=opts.TitleOpts(title="职位数量条形图"),
            xaxis_opts=opts.AxisOpts(axislabel_opts=opts.LabelOpts(rotate=60, interval=0, font_size=8)),
        )
        # .set_global_opts(datazoom_opts=opts.DataZoomOpts(range_start=0, range_end=100))
    )

    # 调整图表宽度
    bar.width = '2000px'
    bar.height = '800px'

    # 显示条形图
    bar.render("./static/bar.html")
