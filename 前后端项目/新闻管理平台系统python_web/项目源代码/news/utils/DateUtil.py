from datetime import datetime, timedelta

from datetime import datetime, timedelta

# def main():
#     last_seven_days = get_last_seven_days()
#
#     # 打印最近七天的日期
#     formatter = "%Y-%m-%d"
#     for date in last_seven_days:
#         formatted_date = date.strftime(formatter)
#         print(formatted_date)

def get_date():
    last_seven_days = get_last_seven_days()
    date_list = []

    # 打印最近七天的日期
    formatter = "%Y-%m-%d"
    for date in last_seven_days:
        formatted_date = date.strftime(formatter)
        # print(formatted_date)
        date_list.append(formatted_date)

    return date_list

def get_last_seven_days():
    today = datetime.now().date()
    last_seven_days = []

    for i in range(6, -1, -1):
        date = today - timedelta(days=i)
        last_seven_days.append(date)

    return last_seven_days

# if __name__ == "__main__":
#     main()
