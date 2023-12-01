import pymysql


def setData(province, city, update_time, point, aqi, pm25, pm10, co, no2, o3,
            so2, quality, update_slot,city_flag):
    # 连接 MySQL 数据库
    conn = pymysql.connect(
        host='127.0.0.1',  # 主机名
        port=3306,  # 端口号，MySQL默认为3306
        user='root',  # 用户名
        password='password',  # 密码
        database='ry-air',  # 数据库名称
    )
    try:
        with conn.cursor() as cursor:
            sql = 'INSERT INTO air_data(province, city, point, aqi, quality, pm25, pm10, co, no2, so2, o3, update_time, update_slot, city_flag) VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)'
            values = (province, city, point, aqi, quality, pm25, pm10, co, no2, so2, o3, update_time, update_slot, city_flag)
            cursor.execute(sql, values)
            conn.commit()
            result = cursor.fetchall()
            print(result)
    except pymysql.MySQLError as err:
        conn.rollback()
        print(type(err), err)
    finally:
        conn.close()
