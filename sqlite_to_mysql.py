import sqlite3
import pandas as pd
from sqlalchemy import create_engine

# SQLite connection
sqlite_conn = sqlite3.connect("ecommerce_analytics1.db")

# MySQL connection
engine = create_engine(
    "mysql+pymysql://root:@localhost:3309/ecommerce_analytics1"
)

tables = [
    "customers",
    "orders",
    "order_items",
    "products",
    "payments",
    "reviews",
    "sellers",
    "category_translation"
]

for table in tables:
    print(f"Importing {table}...")
    
    df = pd.read_sql(f"SELECT * FROM {table}", sqlite_conn)
    
    df.to_sql(
        table,
        con=engine,
        if_exists="replace",
        index=False,
        chunksize=5000
    )

    print(f"✓ {table} imported")

sqlite_conn.close()

print("\nAll tables imported successfully!")