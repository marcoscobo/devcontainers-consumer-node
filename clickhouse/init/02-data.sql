INSERT INTO commerce.dim_products
(product_id, sku, product_name, category, price, currency, created_at) VALUES
(1, 'SKU-001', 'Widget A', 'gadgets', toDecimal64(19.99, 2), 'EUR', toDateTime64('2025-08-01 09:00:00', 6, 'UTC')),
(2, 'SKU-002', 'Widget B', 'gadgets', toDecimal64(29.50,  2), 'EUR', toDateTime64('2025-08-01 09:05:00', 6, 'UTC')),
(3, 'SKU-003', 'Gizmo C',  'accessories', toDecimal64(9.90,  2), 'EUR', toDateTime64('2025-08-01 09:10:00', 6, 'UTC'));

INSERT INTO commerce.dim_customers
(customer_id, external_id, name, email, segment, created_at) VALUES
(101, 'EXT-101', 'Acme Corp',   'ops@acme.test',   'enterprise', toDateTime64('2025-08-01 08:00:00', 6, 'UTC')),
(102, 'EXT-102', 'Beta SA',     'it@beta.test',    'midmarket',  toDateTime64('2025-08-01 08:10:00', 6, 'UTC')),
(103, 'EXT-103', 'Charlie SL',  'cto@charlie.test','smb',        toDateTime64('2025-08-01 08:20:00', 6, 'UTC'));

INSERT INTO commerce.fact_sales
(event_id, ts, customer_id, product_id, qty, unit_price,
 external_id, customer_name, segment, sku, product_name, category) VALUES
(toUUID('11111111-1111-1111-1111-111111111111'),
 toDateTime64('2025-08-01 10:00:00', 6, 'UTC'), 101, 1, 3, toDecimal64(19.99, 2),
 'EXT-101', 'Acme Corp', 'enterprise', 'SKU-001', 'Widget A', 'gadgets'),
(toUUID('22222222-2222-2222-2222-222222222222'),
 toDateTime64('2025-08-01 10:05:00', 6, 'UTC'), 102, 2, 1, toDecimal64(29.50, 2),
 'EXT-102', 'Beta SA', 'midmarket', 'SKU-002', 'Widget B', 'gadgets'),
(toUUID('33333333-3333-3333-3333-333333333333'),
 toDateTime64('2025-08-01 10:10:00', 6, 'UTC'), 103, 3, 5, toDecimal64(9.90, 2),
 'EXT-103', 'Charlie SL', 'smb', 'SKU-003', 'Gizmo C', 'accessories');

INSERT INTO commerce.fact_inventory
(date, product_id, warehouse_id, stock_units, object) VALUES
(toDate('2025-08-01'), 1, 'WH-ES-MAD', 120, '{"batch":"A1"}'),
(toDate('2025-08-01'), 2, 'WH-ES-BCN',  80, '{"batch":"B2"}'),
(toDate('2025-08-01'), 3, 'WH-ES-MAD', 200, '{"batch":"C3"}');