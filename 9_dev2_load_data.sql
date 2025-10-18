-- Ejecutado por LUIS

-- ===================================
-- INSERTS: INVENTORY_MOVEMENT
-- ===================================
INSERT INTO inventory_movement (movement_type, amount) VALUES ('Entrada', 50.00);
INSERT INTO inventory_movement (movement_type, amount) VALUES ('Entrada', 30.00);
INSERT INTO inventory_movement (movement_type, amount) VALUES ('Salida', 10.00);
INSERT INTO inventory_movement (movement_type, amount) VALUES ('Entrada', 20.00);
INSERT INTO inventory_movement (movement_type, amount) VALUES ('Salida', 5.00);
COMMIT;

-- ===================================
-- INSERTS: PRODUCT
-- (provider_id ajustados a 1 y 2, los únicos existentes en ANDRE_DEV.provider)
-- ===================================
INSERT INTO product (product_code, provider_id, name, description, unit, price, stock, status) VALUES ('PROD-001', 1, 'Castaña Amazónica', 'Fruto seco natural de Madre de Dios', 'kg', 25.50, 100, 'activo');
INSERT INTO product (product_code, provider_id, name, description, unit, price, stock, status) VALUES ('PROD-002', 2, 'Plátano Isla', 'Plátano fresco cultivado en la selva peruana', 'kg', 3.80, 200, 'activo');
INSERT INTO product (product_code, provider_id, name, description, unit, price, stock, status) VALUES ('PROD-003', 1, 'Camu Camu', 'Fruta con alto contenido de vitamina C', 'kg', 15.00, 150, 'activo');
INSERT INTO product (product_code, provider_id, name, description, unit, price, stock, status) VALUES ('PROD-004', 2, 'Ungurahui', 'Fruto exótico amazónico', 'kg', 12.00, 80, 'activo');
INSERT INTO product (product_code, provider_id, name, description, unit, price, stock, status) VALUES ('PROD-005', 1, 'Aceite de Castaña', 'Aceite natural prensado en frío', 'lt', 40.00, 60, 'activo');
INSERT INTO product (product_code, provider_id, name, description, unit, price, stock, status) VALUES ('PROD-006', 2, 'Yuca Fresca', 'Tubérculo amazónico para consumo directo', 'kg', 2.50, 300, 'activo');
INSERT INTO product (product_code, provider_id, name, description, unit, price, stock, status) VALUES ('PROD-007', 1, 'Aguaje', 'Fruto amazónico con alto contenido de vitamina A', 'kg', 8.50, 120, 'activo');
INSERT INTO product (product_code, provider_id, name, description, unit, price, stock, status) VALUES ('PROD-008', 2, 'Guaraná en Polvo', 'Polvo natural energizante', 'kg', 55.00, 40, 'activo');
INSERT INTO product (product_code, provider_id, name, description, unit, price, stock, status) VALUES ('PROD-009', 1, 'Mango Kent', 'Mango dulce de exportación', 'kg', 6.80, 250, 'activo');
INSERT INTO product (product_code, provider_id, name, description, unit, price, stock, status) VALUES ('PROD-010', 2, 'Cacao en Grano', 'Cacao fino de aroma amazónico', 'kg', 22.00, 90, 'activo');
COMMIT;

-- ===================================
-- INSERTS: REPORT
-- (user_table_id ajustados a los existentes 1, 2, 3 en ANDRE_DEV.user_table)
-- ===================================
INSERT INTO report (user_table_id) VALUES (1); -- Carlos (Admin)
INSERT INTO report (user_table_id) VALUES (2); -- Lucía (Manager)
INSERT INTO report (user_table_id) VALUES (3); -- Juancho (Analista)
INSERT INTO report (user_table_id) VALUES (2); 
INSERT INTO report (user_table_id) VALUES (1);
COMMIT;

-- ===================================
-- INSERTS: REPORT_DETAIL
-- (transaction_id ajustados a 1 y 2, los únicos existentes en ANDRE_DEV.transactions)
-- ===================================
INSERT INTO report_detail (transaction_id, subtotal_trans, report_id) VALUES (1, 54.80, 1);
INSERT INTO report_detail (transaction_id, subtotal_trans, report_id) VALUES (2, 72.80, 2);
INSERT INTO report_detail (transaction_id, subtotal_trans, report_id) VALUES (1, 10.00, 3);
INSERT INTO report_detail (transaction_id, subtotal_trans, report_id) VALUES (2, 25.00, 4);
INSERT INTO report_detail (transaction_id, subtotal_trans, report_id) VALUES (1, 15.00, 5);
COMMIT;

-- ===================================
-- VALIDACIÓN CRUZADA
-- ===================================
SELECT
 t.id AS transaction_id,
 c.names || ' ' || c.last_names AS client_name,
 u.names || ' ' || u.last_names AS employee,
 p.product_code,
 p.name AS product_name, 
 td.amount,
 td.unitary_price,
 td.subtotal,
 t.total AS transaction_total,
 TO_CHAR(t.transaction_date, 'YYYY-MM-DD HH24:MI:SS') AS transaction_date
FROM ANDRE_DEV.transactions t
JOIN ANDRE_DEV.client c ON t.client_id = c.id
LEFT JOIN ANDRE_DEV.client_user cu ON t.client_user_id = cu.id
LEFT JOIN ANDRE_DEV.user_table u ON t.user_id = u.id
JOIN ANDRE_DEV.transaction_detail td ON t.id = td.transaction_id
JOIN LUIS.product p ON td.product_code = p.product_code -- JOIN a tabla de LUIS
ORDER BY t.id, p.product_code;
