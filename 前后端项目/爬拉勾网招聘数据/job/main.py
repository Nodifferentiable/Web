"""
爬取拉勾网招聘信息脚本
"""
import pymysql
from DrissionPage import ChromiumPage

page = ChromiumPage()


def get_city():
    """
    获取城市列表
    :return:  城市列表
    """
    path = 'https://www.lagou.com/wn/jobs?pn=1&kd=Python&city=%E5%85%A8%E5%9B%BD'
    page.get(path)
    # 获取职位名称【地区】
    city_path = "xpath://div[@class='option__2xJt5']"
    city_list = page.eles(city_path)
    city_array = []
    for city in city_list:
        city_array.append(city.raw_text)
    return city_array


def get_last_page(city):
    """
    获取最大页数
    :param city: 城市
    :return: 最后一页
    """
    path = 'https://www.lagou.com/wn/jobs?pn=1&kd=Python&city=' + city
    page.get(path)
    last_page_path = "xpath://ul[@class='lg-pagination']/li/a[@rel='nofollow']"
    page_number = page.eles(last_page_path)
    last_page = int(page_number[-1].raw_text)
    return last_page


def saveData(merged_list, table_name):
    """
    保存数据
    :param merged_list: 数据列表
    :param table_name: 表名--原始数据表，处理后的数据表
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
            sql = 'INSERT INTO ' + table_name + ' (position,base,company,salary,seniority,welfare,type,experience) VALUES(%s,%s,%s,%s,%s,%s,%s,%s)'
            cursor.executemany(sql, merged_list)
            conn.commit()
            result = cursor.fetchall()
            print('---------数据插入成功---------')
    except pymysql.MySQLError as err:
        conn.rollback()
        print(type(err), err)
    finally:
        conn.close()
    pass


def handleData(data_list):
    """
    去除数据多余空格，判空处理，去掉【福利】两端 “”
    :param data_list:
    :return:
    """
    data_list = list(map(lambda x: x.strip() if x.strip() else "", data_list))
    data_list = [elem.replace('”', '').replace('“', '') for elem in data_list]
    return data_list


def crawling_data():
    """
    爬取数据
    """
    citys = get_city()
    print(citys)

    # 原始数据
    position_original = []
    base_original = []
    company_original = []
    salary_original = []
    seniority_original = []
    experience_original = []
    welfare_original = []
    type_original = []

    for city in citys:
        last_page = 5
        # last_page = 1
        for i in range(1, last_page + 1):
            print('-------------------正在爬取 ' + city + ' 的第 ' + str(i) + ' 页的数据---------------------')
            path = 'https://www.lagou.com/wn/jobs?pn=' + str(i) + '&kd=Python&city=' + city
            page.get(path)
            # 获取职位名称【地区】
            position_path = "xpath://a[@id='openWinPostion']"
            position_list = page.eles(position_path)
            for position in position_list:
                result = position.raw_text.split("[")
                position_original.append(result[0])
                base_original.append(city)
                print("工作岗位：", result[0])
                print("工作地点：", city)

            # 获取公司名称
            company_path = "xpath://div[@class='company-name__2-SjF']/a"
            company_list = page.eles(company_path)
            for company in company_list:
                company_original.append(company.raw_text)
                print("公司名：" + company.raw_text)

            # 获取薪资范围
            salary_path = "xpath://span[@class='money__3Lkgq']"
            salary_list = page.eles(salary_path)
            for salary in salary_list:
                salary_original.append(salary.raw_text)
                print("薪资范畴：" + salary.raw_text)

            # 获取任职资格
            seniority_path = "xpath://div[@class='p-bom__JlNur']"
            seniority_list = page.eles(seniority_path)
            for seniority in seniority_list:
                experience_original.append(seniority.raw_text.split("/", 1)[0].split('经验')[1])
                seniority_original.append(seniority.raw_text.split("/", 1)[1])
                print("经验：" + seniority.raw_text.split("/", 1)[0].split('经验')[1])
                print("资历：" + seniority.raw_text.split("/", 1)[1])

            # 获取薪资范围
            welfare_path = "xpath://div[@class='il__3lk85']"
            welfare_list = page.eles(welfare_path)
            for welfare in welfare_list:
                welfare_original.append(welfare.raw_text)
                print("福利：" + welfare.raw_text)

            # 获取岗位类型
            type_path = "xpath://div[@class='ir___QwEG']"
            type_list = page.eles(type_path)
            for t in type_list:
                type_original.append(t.raw_text)
                print("岗位类型：" + t.raw_text)

        merged_list = list(zip(position_original, base_original, company_original, salary_original, seniority_original,
                               welfare_original, type_original,experience_original))

        # 保存原始数据
        saveData(merged_list, "job_original_info")

        # 处理数据
        position_original = handleData(position_original)
        base_original = handleData(base_original)
        company_original = handleData(company_original)
        salary_original = handleData(salary_original)
        seniority_original = handleData(seniority_original)
        welfare_original = handleData(welfare_original)
        type_original = handleData(type_original)
        experience_original = handleData(experience_original)


        merged_list = list(zip(position_original, base_original, company_original, salary_original, seniority_original,
                               welfare_original, type_original,experience_original))
        # 保存处理过的数据
        saveData(merged_list, "job_handled_info")


if __name__ == '__main__':
    crawling_data()
    print("=========================执行完毕=======================")
