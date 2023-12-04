import matplotlib.pyplot as plt

# 示例数据
from matplotlib.font_manager import FontProperties

def drew_funnel_count(data):
    from pyecharts import options as opts
    from pyecharts.charts import Funnel

    # 示例数据
    # data = [
    #     (2717, 'python爬虫开发工程师', '深圳', '十分融易', '20k', '本科', '有竞争力的薪资 、绩效奖金 、灵活的工作制度'),
    #     (2718, 'Python服务端实习生', '深圳', '滴墨书摘', '3k-4k', '应届 / 本科', '可转正'),
    #     (2719, 'python高级开发工程师', '深圳', '深圳铸泰科技', '15k-30k', '本科', '欢迎有职业梦想的你加盟')
    # ]

    # 提取经验数据
    experiences = []
    for item in data:
        experience = item[8].split('/')[0].strip()
        experiences.append(experience)

    # 统计各个经验阶段的数量
    experience_counts = {}
    for exp in experiences:
        if exp in experience_counts:
            experience_counts[exp] += 1
        else:
            experience_counts[exp] = 1

    # 将经验和数量转换为列表，用于绘图
    labels = list(experience_counts.keys())
    counts = list(experience_counts.values())

    # 创建漏斗图
    funnel_chart = (
        Funnel()
            .add(
            series_name="工作经验",
            data_pair=list(zip(labels, counts)),
            gap=2,
            label_opts=opts.LabelOpts(position="inside"),
        )
            .set_global_opts(title_opts=opts.TitleOpts(title="工作经验漏斗图"))
    )

    # 显示漏斗图
    funnel_chart.render("./static/funnel.html")

