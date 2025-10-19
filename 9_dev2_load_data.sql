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
-- ===================================
INSERT INTO report (user_table_id) VALUES (1); -- Carlos (Admin)
INSERT INTO report (user_table_id) VALUES (2); -- Lucía (Manager)
INSERT INTO report (user_table_id) VALUES (3); -- Juancho (Analista)
INSERT INTO report (user_table_id) VALUES (2); 
INSERT INTO report (user_table_id) VALUES (1);
COMMIT;

-- ===================================
-- INSERTS: REPORT_DETAIL
-- ===================================
INSERT INTO report_detail (transaction_id, subtotal_trans, report_id) VALUES (1, 54.80, 1);
INSERT INTO report_detail (transaction_id, subtotal_trans, report_id) VALUES (2, 72.80, 2);
INSERT INTO report_detail (transaction_id, subtotal_trans, report_id) VALUES (1, 10.00, 3);
INSERT INTO report_detail (transaction_id, subtotal_trans, report_id) VALUES (2, 25.00, 4);
INSERT INTO report_detail (transaction_id, subtotal_trans, report_id) VALUES (1, 15.00, 5);
COMMIT;