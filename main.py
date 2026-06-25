import pandas as pd
import sqlite3

conn = sqlite3.connect("ecommerce_analytics1.db")

files = {
    "customers": "Data/olist_customers_dataset.csv",
    "orders": "Data/olist_orders_dataset.csv",
    "order_items": "Data/olist_order_items_dataset.csv",
    "products": "Data/olist_products_dataset.csv",
    "payments": "Data/olist_order_payments_dataset.csv",
    "reviews": "Data/olist_order_reviews_dataset.csv",
    "sellers": "Data/olist_sellers_dataset.csv",
    "category_translation": "Data/product_category_name_translation.csv"
}

for table, file in files.items():
    print(f"Importing {table}...")
    df = pd.read_csv(file)
    df.to_sql(table, conn, if_exists="replace", index=False)

conn.close()
print("All tables imported successfully!")