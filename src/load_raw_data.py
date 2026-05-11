import os
from pathlib import Path

import pandas as pd
from dotenv import load_dotenv
from sqlalchemy import create_engine, text


load_dotenv()

DB_HOST = os.getenv("DB_HOST")
DB_PORT = os.getenv("DB_PORT")
DB_NAME = os.getenv("DB_NAME")
DB_USER = os.getenv("DB_USER")
DB_PASSWORD = os.getenv("DB_PASSWORD")
DB_SCHEMA_RAW = os.getenv("DB_SCHEMA_RAW", "raw")

DATA_PATH = Path("data/raw")

engine = create_engine(
    f"postgresql+psycopg2://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}"
)

files_to_tables = {
    "olist_customers_dataset.csv": "olist_customers",
    "olist_geolocation_dataset.csv": "olist_geolocation",
    "olist_orders_dataset.csv": "olist_orders",
    "olist_order_items_dataset.csv": "olist_order_items",
    "olist_order_payments_dataset.csv": "olist_order_payments",
    "olist_order_reviews_dataset.csv": "olist_order_reviews",
    "olist_products_dataset.csv": "olist_products",
    "olist_sellers_dataset.csv": "olist_sellers",
    "product_category_name_translation.csv": "product_category_name_translation",
}


def truncate_raw_tables() -> None:
    tables = ", ".join(
        f"{DB_SCHEMA_RAW}.{table_name}"
        for table_name in files_to_tables.values()
    )

    with engine.begin() as conn:
        conn.execute(text(f"TRUNCATE TABLE {tables};"))

    print("Tabelas raw limpas com sucesso.")


def load_csv_to_postgres(file_name: str, table_name: str) -> None:
    file_path = DATA_PATH / file_name

    if not file_path.exists():
        raise FileNotFoundError(f"Arquivo não encontrado: {file_path}")

    print(f"Carregando {file_name} → {DB_SCHEMA_RAW}.{table_name}")

    df = pd.read_csv(file_path)

    df.to_sql(
        name=table_name,
        con=engine,
        schema=DB_SCHEMA_RAW,
        if_exists="append",
        index=False,
        method="multi",
        chunksize=5000,
    )

    print(f"Concluído: {table_name} | Linhas carregadas: {len(df)}")


def main() -> None:
    truncate_raw_tables()

    for file_name, table_name in files_to_tables.items():
        load_csv_to_postgres(file_name, table_name)

    print("Carga finalizada com sucesso.")


if __name__ == "__main__":
    main()