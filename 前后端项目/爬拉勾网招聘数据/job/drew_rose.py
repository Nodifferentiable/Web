from pyecharts.charts import Pie
from pyecharts import options as opts

def drew_degree_count(data):

    # data = [("A", 25), ("B", 15), ("C", 35), ("D", 20), ("E", 5)]

    # 创建玫瑰图
    rose_chart = (
        Pie()
        .add(
            "",
            data,
            radius=["30%", "75%"],  # 设置内外圆半径，用于形成玫瑰图
            center=["50%", "50%"],  # 设置图表中心位置
            rosetype="radius",  # 设置为半径模式
            label_opts=opts.LabelOpts(is_show=True, position="inside"),  # 显示标签，并设置标签位置为内部
        )
        .set_global_opts(title_opts=opts.TitleOpts(title="玫瑰图示例"))
    )

    # 生成 HTML 文件
    rose_chart.render("./static/rose.html")
