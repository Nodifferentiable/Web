from pyecharts import options as opts
from pyecharts.charts import Pie


def drew_donut_type_count(data):
    # data = (
    #     (131, '实习后端研发工程师(python/go)', '北京', '北京智点时空科技有限公司', '4k-5k', '应届 / 本科', '五险一金,弹性工作,周末双休', ''),
    #     (132, '小鹿编程-少儿编程主讲（python）', '北京', '作业帮', '15k-25k', '本科', '每年都能调薪，三餐免费，发展前景好', '在线教育'),
    #     (125, 'python开发工程师', '北京', '某知名互联网公司', '30k-45k', '本科', '团队强有发展前景', '软件服务｜咨询')
    # )

    # 提取最后一列（岗位），以 | 分割并去除空格，统计岗位数量 注意：是中文 |
    positions = [job[7].strip().split('｜') for job in data if job[7].strip()]
    positions_flat = [pos.strip() for sublist in positions for pos in sublist]
    position_count = {}
    for position in positions_flat:
        if position in position_count:
            position_count[position] += 1
        else:
            position_count[position] = 1

    # 将占比低于1%的岗位归类为“其他”
    threshold_percentage = 1
    total_jobs = sum(position_count.values())
    other_count = 0
    for position, count in list(position_count.items()):
        percentage = (count / total_jobs) * 100
        if percentage < threshold_percentage:
            other_count += count
            del position_count[position]

    position_count["其他"] = other_count

    # 生成环形图所需数据
    labels = list(position_count.keys())
    counts = list(position_count.values())

    # 创建 Pie 图
    pie = (
        Pie()
            .add("", [list(z) for z in zip(labels, counts)], radius=["30%", "75%"])
            .set_global_opts(title_opts=opts.TitleOpts(title="岗位占比"))
            .set_series_opts(label_opts=opts.LabelOpts(formatter="{b}: {d}%"))
    )

    pie.width = '2000px'
    pie.height = '500px'

    # 渲染图表到 HTML 文件（可选）
    pie.render("./static/donut.html")