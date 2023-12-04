from pyecharts import options as opts
from pyecharts.charts import Boxplot


def drew_boxplot_city_salary(data):
    # 示例数据
    # data = [
    #     (2717, 'python爬虫开发工程师', '深圳', '十分融易', '20k', '本科', '有竞争力的薪资 、绩效奖金 、灵活的工作制度'),
    #     (2718, 'Python服务端实习生', '深圳', '滴墨书摘', '3k-4k', '应届 / 本科', '可转正'),
    #     (2719, 'python高级开发工程师', '北京', '深圳铸泰科技', '15k-30k', '本科', '欢迎有职业梦想的你加盟')
    # ]

    # 提取城市和薪资数据
    cities = list(set(item[2] for item in data))
    cities = ["北京","上海","深圳","广州","杭州","成都"]
    salary_data = {city: [] for city in cities}

    for item in data:
        city = item[2]
        if city in cities:
            salary = int(item[4].lower().replace('k', '').replace(' ', '').split('-')[-1])
            salary_data[city].append(salary)

    # 创建箱型图
    boxplot = (
        Boxplot()
            .add_xaxis(cities)
            .add_yaxis("薪资", [salary_data[city] for city in cities])
            .set_global_opts(title_opts=opts.TitleOpts(title="城市和薪资箱型图"))
    )

    # 显示箱型图
    boxplot.render("./static/boxplot.html")
