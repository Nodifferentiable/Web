from pyecharts import options as opts
from pyecharts.charts import WordCloud
import jieba


import matplotlib.pyplot as plt
from wordcloud import WordCloud


def drew_word_clod(data):
    # 创建 WordCloud 对象
    wordcloud = WordCloud(width=800, height=400, background_color='white', font_path ="C:/Windows/Fonts/msyh.ttc").generate(data)

    # 绘制词云图
    plt.figure(figsize=(10, 5))
    plt.imshow(wordcloud, interpolation='bilinear')
    plt.axis('off')  # 关闭坐标轴
    plt.savefig('static/wordcloud.png')
    plt.show()
