import csv
import time
from DrissionPage import ChromiumPage
from dao import air_quality_dao


def getProvince(provinceName):
    provinceMap = [{'index': 1, 'province': '北京市'}, {'index': 2, 'province': '天津市'}, {'index': 3, 'province': '上海市'},
                   {'index': 4, 'province': '重庆市'}, {'index': 5, 'province': '河北省'}, {'index': 6, 'province': '山西省'},
                   {'index': 7, 'province': '内蒙古自治区'}, {'index': 8, 'province': '辽宁省'}, {'index': 9, 'province': '吉林省'},
                   {'index': 10, 'province': '黑龙江省'}, {'index': 11, 'province': '江苏省'}, {'index': 12, 'province': '浙江省'},
                   {'index': 13, 'province': '安徽省'}, {'index': 14, 'province': '福建省'}, {'index': 15, 'province': '江西省'},
                   {'index': 16, 'province': '山东省'}, {'index': 17, 'province': '河南省'}, {'index': 18, 'province': '湖北省'},
                   {'index': 19, 'province': '湖南省'}, {'index': 20, 'province': '广东省'}, {'index': 21, 'province': '广西壮族自治区'},
                   {'index': 22, 'province': '海南省'}, {'index': 23, 'province': '四川省'}, {'index': 24, 'province': '贵州省'},
                   {'index': 25, 'province': '云南省'}, {'index': 26, 'province': '西藏自治区'}, {'index': 27, 'province': '陕西省'},
                   {'index': 28, 'province': '甘肃省'}, {'index': 29, 'province': '青海省'}, {'index': 30, 'province': '宁夏回族自治区'},
                   {'index': 31, 'province': '新疆维吾尔自治区'}]
    for i in provinceMap:
        if str(i['province']) == provinceName:
            return i['index']
    return


def getData(provinceName):
    provinceId = getProvince(provinceName)

    lines = 0
    href_arr = []
    city_name_cn_arr = []
    page = ChromiumPage()
    page.get('http://www.tianqihoubao.com/aqi/')

    # data = page.eles("xpath://div[@class='desc']/dl")[1].eles("xpath://dt/b").raw_text
    # res = []
    # res.append({'index': '1', 'province': '北京市'})
    # res.append({'index': '2', 'province': '天津市'})
    # res.append({'index': '3', 'province': '天津市'})
    # res.append({'index': '4', 'province': '天津市'})
    # index = 5
    # data = page.eles("xpath://div[@class='citychk']/dl/dt/b")
    # for i in data:
    #     if i.raw_text == '热门城市':
    #         continue
    #     res.append({'index': index, 'province': i.raw_text + '省'})
    #     index += 1
    # print(res)

    # 你需要查看下你的省份是第几个dl 河南省是第14个
    city_path = "xpath://div[@class='citychk']/dl[" + str(int(provinceId) - 3) + "]/dd/a"
    city_eles = page.eles(city_path)

    for city_ele in city_eles:
        city_name_cn = city_ele.raw_text
        href = city_ele.link
        city_name_en = city_ele.link.replace('http://www.tianqihoubao.com/aqi/', '').split('.')[0]
        print(city_name_cn, city_name_en, href)
        href_arr.append(href)
        city_name_cn_arr.append(city_name_cn)
    i = 0
    for link in href_arr:
        city = city_name_cn_arr[i]
        # '郑州 '
        city = city.strip().replace(' ', '')
        i = i + 1
        page.get(link)

        # '数据更新时间: 2023-09-11 14:00 (每小时实时更新)   全国空气质量排名'
        time_desc_str = page.ele("xpath://div[@class='desc']").raw_text
        print(time_desc_str)
        time_desc = time_desc_str.replace('数据更新时间: ', '').replace(' (每小时实时更新)   全国空气质量排名', '')
        print(city, time_desc)

        # 总数据
        # city,time,place,AQI,PM2_5,PM10,CO,NO2,O3,SO2
        # 济南市,2014-8-29 12:00,济南市（总）,87,63,122,1,42,146,98
        zong_city = city
        zong_time = time_desc
        zong_place = city + '市'
        zong_AQI = page.ele(
            "xpath://div[@id='today-quality']/div[@class='block-1 clearfix']/div[1]/div[@class='num']").raw_text
        # zong_AQI=page.ele("xpath://div[@class='phrase aqi-lv2']/div[@class='num']").raw_text

        zong_PM2_5_str = page.ele("xpath://div[@class='txt01']/ul/li[1]").raw_text
        zong_PM10_str = page.ele("xpath://div[@class='txt01']/ul/li[4]").raw_text
        zong_CO_str = page.ele("xpath://div[@class='txt01']/ul/li[2]").raw_text
        zong_NO2_str = page.ele("xpath://div[@class='txt01']/ul/li[6]").raw_text
        zong_O3_str = page.ele("xpath://div[@class='txt01']/ul/li[5]").raw_text
        zong_SO2_str = page.ele("xpath://div[@class='txt01']/ul/li[3]").raw_text

        # 对这些字符串进行处理'PM2.5：36'
        zong_PM2_5 = zong_PM2_5_str.replace('PM2.5：', '')
        # 'PM10 ：67μg/m3'
        zong_PM10 = zong_PM10_str.replace('PM10 ：', '').replace('μg/m3', '')
        # '一氧化碳：0.7'
        zong_CO = zong_CO_str.replace('一氧化碳：', '')
        # '二氧化氮：14μg/m3'
        zong_NO2 = zong_NO2_str.replace('二氧化氮：', '').replace('μg/m3', '')
        # '臭氧：132'
        zong_O3 = zong_O3_str.replace('臭氧：', '')
        # '二氧化硫：6μg/m3'
        zong_SO2 = zong_SO2_str.replace('二氧化硫：', '').replace('μg/m3', '')
        # 入CSV city,time,place,AQI,PM2_5,PM10,CO,NO2,O3,SO2

        now_time = time.strftime("%H:%M:%S", time.localtime())  # 现在的时间
        print("现在是北京时间：{}".format(now_time))
        # 判断时间
        sw_xw_desc = ''
        if "00:00:00" < now_time < "06:00:00":
            sw_xw_desc = '凌晨'
        if "07:00:00" < now_time < "12:00:00":
            sw_xw_desc = '上午'
        if "12:00:00" < now_time < "18:00:00":
            sw_xw_desc = '下午'
        if "18:00:00" < now_time < "24:00:00":
            sw_xw_desc = '晚上'
        # city,time,place,AQI,PM2_5,PM10,CO,NO2,O3,SO2,空气质量,time_slot
        kqzl = ''
        zong_AQI_num = int(zong_AQI)
        if zong_AQI_num >= 0 and zong_AQI_num <= 50:
            kqzl = '优级'
        if zong_AQI_num >= 51 and zong_AQI_num <= 100:
            kqzl = '良好'
        if zong_AQI_num >= 101 and zong_AQI_num <= 150:
            kqzl = '轻度污染'
        if zong_AQI_num >= 151 and zong_AQI_num <= 200:
            kqzl = '中度污染'
        if zong_AQI_num >= 201 and zong_AQI_num <= 300:
            kqzl = '重度污染'
        if zong_AQI_num > 30:
            kqzl = '严重污染'
        print(city, time_desc, zong_place, zong_AQI, zong_PM2_5, zong_PM10, zong_CO, zong_NO2, zong_O3, zong_SO2, kqzl,
              sw_xw_desc)
        # aqi_file = open("t_pm25.csv", mode="a+", newline='', encoding="utf-8")
        # aqi_writer = csv.writer(aqi_file)
        # aqi_writer.writerow(
        #     [city, time_desc, zong_place, zong_AQI, zong_PM2_5, zong_PM10, zong_CO, zong_NO2, zong_O3, zong_SO2, kqzl,
        #      sw_xw_desc])
        # aqi_file.close()
        air_quality_dao.setData(provinceName, city + '市', time_desc, zong_place, zong_AQI, zong_PM2_5, zong_PM10, zong_CO,
                                zong_NO2, zong_O3, zong_SO2, kqzl, sw_xw_desc,1)
        lines = lines + 1

        tr_eles = page.eles('xpath://div[@class="txt01"]')[1].eles('xpath://table/tbody/tr[position()>1]')
        for tr_ele in tr_eles:
            txt_arr = tr_ele.raw_text.split('\t')
            # '烟厂	54	良	57	32	0.7	15	4	141'
            # 监测点	AQI指数	空气质量状况	PM10	PM2.5	Co	No2	So2	O3
            # city,time_desc,zong_place,zong_AQI,zong_PM2_5,zong_PM10,zong_CO,zong_NO2,zong_O3,zong_SO2

            aqi2 = int(txt_arr[1])
            if aqi2 >= 0 and aqi2 <= 50:
                kqzl = '优级'
            if aqi2 >= 51 and aqi2 <= 100:
                kqzl = '良好'
            if aqi2 >= 101 and aqi2 <= 150:
                kqzl = '轻度污染'
            if aqi2 >= 151 and aqi2 <= 200:
                kqzl = '中度污染'
            if aqi2 >= 201 and aqi2 <= 300:
                kqzl = '重度污染'
            if aqi2 > 30:
                kqzl = '严重污染'

            print(city, time_desc, txt_arr[0], txt_arr[1], txt_arr[4], txt_arr[3], txt_arr[5], txt_arr[6], txt_arr[7],
                  txt_arr[8], kqzl, sw_xw_desc)
            # aqi_file = open("t_pm25.csv", mode="a+", newline='', encoding="utf-8")
            # aqi_writer = csv.writer(aqi_file)
            # aqi_writer.writerow(
            #     [city, time_desc, txt_arr[0], txt_arr[1], txt_arr[4], txt_arr[3], txt_arr[5], txt_arr[6], txt_arr[7],
            #      txt_arr[8], kqzl, sw_xw_desc])
            # aqi_file.close()
            air_quality_dao.setData(provinceName, city + '市', time_desc, txt_arr[0], txt_arr[1], txt_arr[4], txt_arr[3], txt_arr[5],
                                    txt_arr[6], txt_arr[7],
                                    txt_arr[8], kqzl, sw_xw_desc,0)
            lines = lines + 1

    return


