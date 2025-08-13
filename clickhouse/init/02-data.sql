INSERT INTO commerce.dim_products (product_id, sku, product_name, category, price, currency, created_at) VALUES
  (1, 'SKU-001', 'Aster Nova X201 Smartphone', 'gadgets', toDecimal64(699.00, 2), 'EUR', '2024-01-01 08:01:00'),
  (2, 'SKU-002', 'Orion Pulse X202 Wireless Earbuds', 'accessories', toDecimal64(89.99,  2), 'EUR', '2024-01-01 08:02:00'),
  (3, 'SKU-003', 'Vertex Spectra X203 Laptop', 'computers', toDecimal64(1199.00,  2), 'EUR', '2024-01-01 08:03:00');

INSERT INTO commerce.dim_customers (customer_id, external_id, name, email, segment, created_at) VALUES
  (101, 'EXT-101', 'DataNova SA', 'datanova.sa101@example.com', 'enterprise', '2024-01-01 09:41:00'),
  (102, 'EXT-102', 'BlueOcean GmbH', 'blueocean.gmbh102@example.com', 'midmarket', '2024-01-01 09:42:00'),
  (103, 'EXT-103', 'Javier Vargas', 'javier.vargas103@example.com', 'smb', '2024-01-01 09:43:00');

INSERT INTO commerce.fact_sales (event_id, ts, customer_id, product_id, qty, unit_price, external_id, customer_name, segment, sku, product_name, category) VALUES
  (toUUID('11111111-1111-1111-1111-111111111111'), '2025-02-12 12:01:00', 101, 1, 3, toDecimal64(699.00, 2), 'EXT-101', 'DataNova SA', 'enterprise', 'SKU-001', 'Aster Nova X201 Smartphone', 'gadgets'),
  (toUUID('22222222-2222-2222-2222-222222222222'), '2025-07-16 04:07:00', 102, 2, 1, toDecimal64(89.99, 2), 'EXT-102', 'BlueOcean GmbH', 'midmarket', 'SKU-002', 'Orion Pulse X202 Wireless Earbuds', 'accessories'),
  (toUUID('33333333-3333-3333-3333-333333333333'), '2025-05-29 09:01:00', 103, 3, 5, toDecimal64(1199.00, 2), 'EXT-103', 'Javier Vargas', 'smb', 'SKU-003', 'Vertex Spectra X203 Laptop', 'computers');

INSERT INTO commerce.fact_inventory (date, product_id, warehouse_id, stock_units, object) VALUES
  ('2024-01-01', 1, 'WH-ES-MAD', 120, '{"batch":"A1"}'),
  ('2024-01-01', 2, 'WH-ES-BCN', 80, '{"batch":"B2"}'),
  ('2024-01-01', 3, 'WH-ES-MAD', 200, '{"batch":"C3"}');