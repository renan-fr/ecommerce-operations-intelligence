-- ============================================================
-- CRIAÇÃO DAS TABELAS BRUTAS - BASE OLIST
-- Banco: ecommerce_operations
-- Schema: raw
-- Objetivo: armazenar os dados originais dos arquivos CSV
-- ============================================================

DROP TABLE IF EXISTS raw.olist_order_reviews;
DROP TABLE IF EXISTS raw.olist_order_payments;
DROP TABLE IF EXISTS raw.olist_order_items;
DROP TABLE IF EXISTS raw.olist_orders;
DROP TABLE IF EXISTS raw.olist_products;
DROP TABLE IF EXISTS raw.olist_sellers;
DROP TABLE IF EXISTS raw.olist_customers;
DROP TABLE IF EXISTS raw.olist_geolocation;
DROP TABLE IF EXISTS raw.product_category_name_translation;

-- ============================================================
-- CLIENTES
-- Arquivo: olist_customers_dataset.csv
-- ============================================================

CREATE TABLE raw.olist_customers (
    customer_id TEXT,
    customer_unique_id TEXT,
    customer_zip_code_prefix INTEGER,
    customer_city TEXT,
    customer_state TEXT
);

-- ============================================================
-- GEOLOCALIZAÇÃO
-- Arquivo: olist_geolocation_dataset.csv
-- ============================================================

CREATE TABLE raw.olist_geolocation (
    geolocation_zip_code_prefix INTEGER,
    geolocation_lat NUMERIC,
    geolocation_lng NUMERIC,
    geolocation_city TEXT,
    geolocation_state TEXT
);

-- ============================================================
-- PEDIDOS
-- Arquivo: olist_orders_dataset.csv
-- ============================================================

CREATE TABLE raw.olist_orders (
    order_id TEXT,
    customer_id TEXT,
    order_status TEXT,
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP
);

-- ============================================================
-- ITENS DOS PEDIDOS
-- Arquivo: olist_order_items_dataset.csv
-- ============================================================

CREATE TABLE raw.olist_order_items (
    order_id TEXT,
    order_item_id INTEGER,
    product_id TEXT,
    seller_id TEXT,
    shipping_limit_date TIMESTAMP,
    price NUMERIC,
    freight_value NUMERIC
);

-- ============================================================
-- PAGAMENTOS
-- Arquivo: olist_order_payments_dataset.csv
-- ============================================================

CREATE TABLE raw.olist_order_payments (
    order_id TEXT,
    payment_sequential INTEGER,
    payment_type TEXT,
    payment_installments INTEGER,
    payment_value NUMERIC
);

-- ============================================================
-- AVALIAÇÕES
-- Arquivo: olist_order_reviews_dataset.csv
-- ============================================================

CREATE TABLE raw.olist_order_reviews (
    review_id TEXT,
    order_id TEXT,
    review_score INTEGER,
    review_comment_title TEXT,
    review_comment_message TEXT,
    review_creation_date TIMESTAMP,
    review_answer_timestamp TIMESTAMP
);

-- ============================================================
-- PRODUTOS
-- Arquivo: olist_products_dataset.csv
-- ============================================================

CREATE TABLE raw.olist_products (
    product_id TEXT,
    product_category_name TEXT,
    product_name_lenght INTEGER,
    product_description_lenght INTEGER,
    product_photos_qty INTEGER,
    product_weight_g INTEGER,
    product_length_cm INTEGER,
    product_height_cm INTEGER,
    product_width_cm INTEGER
);

-- ============================================================
-- VENDEDORES
-- Arquivo: olist_sellers_dataset.csv
-- ============================================================

CREATE TABLE raw.olist_sellers (
    seller_id TEXT,
    seller_zip_code_prefix INTEGER,
    seller_city TEXT,
    seller_state TEXT
);

-- ============================================================
-- TRADUÇÃO DAS CATEGORIAS
-- Arquivo: product_category_name_translation.csv
-- ============================================================

CREATE TABLE raw.product_category_name_translation (
    product_category_name TEXT,
    product_category_name_english TEXT
);