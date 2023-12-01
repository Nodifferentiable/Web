import pymysql
import pandas as pd
from drew_map import drew_city_count
from drew_rose import drew_degree_count
from drew_word_cloud import drew_word_clod
from drew_step import drew_step_count
from drew_funnel import drew_funnel_count
from drew_boxplot import drew_boxplot_city_salary
from drew_bar import drew_bar_position_count
from drew_donut import drew_donut_type_count


def get_data():
    """
    从数据库中获取数据
    :return:
    """
    conn = pymysql.connect(
        host='127.0.0.1',  # 主机名
        port=3306,  # 端口号，MySQL默认为3306
        user='root',  # 用户名
        password='wenhao88',  # 密码
        database='jobs',  # 数据库名称
    )
    try:
        with conn.cursor() as cursor:
            sql = 'select * from job_handled_info'
            cursor.execute(sql)
            result = cursor.fetchall()
            print(result)
            print('---------获取数据成功---------')
            df = pd.DataFrame(result, columns=['ID', '职位', '城市', '公司', '薪资范围', '学历', '福利', '岗位类型','经验'])
            return df
    except pymysql.MySQLError as err:
        conn.rollback()
        print(type(err), err)
    finally:
        conn.close()
    pass


def get_map(data):
    base_count = {}
    for i in data.values:
        base = i[2] + '市'
        if base in base_count:
            base_count[base] += 1
        else:
            base_count[base] = 1
    print(base_count)
    drew_city_count(base_count)


def get_rose(data):
    # 提取学历列的数据
    education_column = data['学历']

    # 使用 value_counts 方法计算每个学历的个数
    education_counts = education_column.value_counts()

    # 动态获取学历种类
    education_types = set()
    for index in education_counts.index:
        degrees = index.split('/')
        for degree in degrees:
            education_types.add(degree.strip())

    # 构建字典,学位:数量
    education_dict = {degree: 0 for degree in education_types}

    # 更新字典
    for index, value in education_counts.items():
        degrees = index.split('/')
        for degree in degrees:
            education_dict[degree.strip()] += value

    # 打印结果
    drew_degree_count(list(education_dict.items()))
    print(list(education_dict.items()))


def get_word_cloud(data):
    welfare_column = data['福利']
    values = ','.join(welfare_column.values)
    drew_word_clod(values)
    print(values)


def get_step(data):
    drew_step_count(list(data.values))


def get_funnel(data):
    drew_funnel_count(list(data.values))


def get_boxplot(data):
    drew_boxplot_city_salary(list(data.values))


def get_bar(data):
    drew_bar_position_count(list(data.values))


def get_donut(data):
    drew_donut_type_count(list(data.values))


if __name__ == '__main__':
    data = get_data()
    # get_map(data)
    # get_rose(data)
    get_word_cloud(data)
    # get_step(data)
    # get_funnel(data)
    # get_boxplot(data)
    # get_bar(data)
    # get_donut(data)
