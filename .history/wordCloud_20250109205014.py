import mysql.connector
from mysql.connector import Error

try:
    # 建立数据库连接
    connection = mysql.connector.connect(
        host='localhost',       # 数据库主机地址
        port="543",
        database='science_fiction',# 数据库名称
        user='root',   # 数据库用户名
        password='abc123'# 数据库密码
    )

    if connection.is_connected():
        cursor = connection.cursor(dictionary=True)  # 使用字典游标
        sql_query = "SELECT Book_Introduce FROM book"  # 替换为实际需要的字段和表名
        cursor.execute(sql_query)
        
        # 获取所有行
        records = cursor.fetchall()
        
        # 打印记录数量
        print(f"Total number of rows in table: {cursor.rowcount}")
        
        # 处理每一行数据
        summaries = [record['summary'] for record in records if 'summary' in record and record['summary']]
        print(summaries)
        # 现在summaries列表包含了所有的非空小说简介文本
        
except Error as e:
    print("Error while connecting to MySQL", e)
finally:
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("MySQL connection is closed")