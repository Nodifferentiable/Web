import matplotlib.pyplot as plt

# 提供的数据
from matplotlib.font_manager import FontProperties


def drew_step_count(data):
    # data = [
    #     (2717, 'python爬虫开发工程师', '深圳', '十分融易', '20k-25k', '本科', '有竞争力的薪资 、绩效奖金 、灵活的工作制度'),
    #     (2718, 'Python服务端实习生', '深圳', '滴墨书摘', '3k-4k', '应届 / 本科', '可转正'),
    #     (2719, 'python高级开发工程师', '深圳', '深圳铸泰科技', '15k-30k', '本科', '欢迎有职业梦想的你加盟')
    # ]

    # 提取薪资数据并统一表示方式
    salaries = []
    for item in data:
        salary_str = item[4]
        if '-' in salary_str:
            # 处理范围表示，取范围的均值
            salary_range = salary_str.split('-')
            salary = (int(salary_range[0].replace('k', '')) + int(salary_range[1].replace('k', ''))) / 2
        else:
            # 处理单一数值表示
            salary = int(salary_str.replace('k', ''))
        salaries.append(salary)

    # 计算阶梯图的步数
    steps = list(range(len(salaries)))

    # 指定中文字体
    font_path = 'C:/Windows/Fonts/msyh.ttc'
    font_set = FontProperties(fname=font_path)

    # 创建阶梯图
    plt.step(salaries, steps, where='mid', label='薪资分布')

    # 添加标题和标签
    plt.title(u'SimHei', fontproperties=font_set)
    plt.xlabel(u'SimHei', fontproperties=font_set)
    plt.ylabel(u'SimHei', fontproperties=font_set)
    plt.title('薪资分布情况')
    plt.xlabel('薪资（k）')
    plt.ylabel('职位编号')

    # 显示图例
    plt.legend(prop=font_set)

    # 保存图片
    plt.savefig('./static/step.png')

    # 显示图形
    plt.show()
