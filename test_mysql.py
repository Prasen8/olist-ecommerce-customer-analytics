import pymysql

conn = pymysql.connect(
    host="localhost",
    user="root",
    password="",
    port=3309
)

cursor = conn.cursor()
cursor.execute("CREATE DATABASE IF NOT EXISTS ecommerce_analytics1")
conn.commit()

print("Database created!")
conn.close()