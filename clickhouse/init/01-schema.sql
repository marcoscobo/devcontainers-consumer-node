CREATE DATABASE IF NOT EXISTS commerce;

CREATE TABLE IF NOT EXISTS commerce.dim_products (
    product_id UInt32,
    sku String,
    product_name String,
    category LowCardinality(String),
    price Decimal(12,2),
    currency LowCardinality(String),
    created_at DateTime64(6, 'UTC')
)
ENGINE = MergeTree
ORDER BY product_id;

CREATE TABLE IF NOT EXISTS commerce.dim_customers (
    customer_id UInt32,
    external_id String,
    name String,
    email String,
    segment LowCardinality(String),
    created_at DateTime64(6, 'UTC')
)
ENGINE = MergeTree
ORDER BY customer_id;

CREATE TABLE IF NOT EXISTS commerce.fact_sales (
    event_id UUID,
    ts DateTime64(6, 'UTC'),
    customer_id UInt32,
    product_id UInt32,
    qty Int32,
    unit_price Decimal(12,2),
    external_id String,
    customer_name String,
    segment LowCardinality(String),
    sku String,
    product_name String,
    category LowCardinality(String)
)
ENGINE = MergeTree
PARTITION BY toYYYYMM(ts)
ORDER BY (ts, event_id);

CREATE TABLE IF NOT EXISTS commerce.fact_inventory (
    date Date,
    product_id UInt32,
    warehouse_id LowCardinality(String),
    stock_units Int32,
    object String
)
ENGINE = MergeTree
PARTITION BY toYYYYMM(date)
ORDER BY (date, product_id, warehouse_id);