

-- Limpieza
DELETE FROM report_detail;
DELETE FROM report;
DELETE FROM product;
DELETE FROM inventory_movement;
COMMIT;

-- ===== INVENTORY_MOVEMENT (10 Registros) =====
INSERT INTO inventory_movement (movement_type, amount) VALUES ('Entrada', 50.00);
INSERT INTO inventory_movement (movement_type, amount) VALUES ('Entrada', 30.00);
INSERT INTO inventory_movement (movement_type, amount) VALUES ('Salida', 10.00);
INSERT INTO inventory_movement (movement_type, amount) VALUES ('Entrada', 20.00);
INSERT INTO inventory_movement (movement_type, amount) VALUES ('Salida', 5.00);
INSERT INTO inventory_movement (movement_type, amount) VALUES ('Entrada', 60.00);
INSERT INTO inventory_movement (movement_type, amount) VALUES ('Salida', 15.00);
INSERT INTO inventory_movement (movement_type, amount) VALUES ('Entrada', 25.00);
INSERT INTO inventory_movement (movement_type, amount) VALUES ('Salida', 8.00);
INSERT INTO inventory_movement (movement_type, amount) VALUES ('Entrada', 100.00);
COMMIT;

-- ===== PRODUCT (10 Registros) =====
-- provider_id: Referencia a ANDRE_DEV.provider(id). Se usan los IDs 1 y 2 que existen.
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

-- ===== REPORT (12 Registros) =====
-- user_table_id: Referencia a ANDRE_DEV.user_table(id). Se usan los IDs 1, 2, 3.
INSERT INTO report (user_table_id) VALUES (1); 
INSERT INTO report (user_table_id) VALUES (2); 
INSERT INTO report (user_table_id) VALUES (3); 
INSERT INTO report (user_table_id) VALUES (1);
INSERT INTO report (user_table_id) VALUES (2);
INSERT INTO report (user_table_id) VALUES (3);
INSERT INTO report (user_table_id) VALUES (1);
INSERT INTO report (user_table_id) VALUES (2);
INSERT INTO report (user_table_id) VALUES (3);
INSERT INTO report (user_table_id) VALUES (1);
INSERT INTO report (user_table_id) VALUES (2);
INSERT INTO report (user_table_id) VALUES (3);
COMMIT;

-- ===== REPORT_DETAIL (15 Registros) =====
-- transaction_id: Referencia a ANDRE_DEV.transactions(id). Se usan los IDs 1 y 2.
-- report_id: Referencia a report(id) de LUIS (1 a 12).
INSERT INTO report_detail (transaction_id, subtotal_trans, report_id) VALUES (1, 250.00, 1);
INSERT INTO report_detail (transaction_id, subtotal_trans, report_id) VALUES (2, 300.50, 2);
INSERT INTO report_detail (transaction_id, subtotal_trans, report_id) VALUES (1, 150.75, 3);
INSERT INTO report_detail (transaction_id, subtotal_trans, report_id) VALUES (2, 420.00, 4);
INSERT INTO report_detail (transaction_id, subtotal_trans, report_id) VALUES (1, 99.99, 5);
INSERT INTO report_detail (transaction_id, subtotal_trans, report_id) VALUES (2, 560.10, 6);
INSERT INTO report_detail (transaction_id, subtotal_trans, report_id) VALUES (1, 710.00, 7);
INSERT INTO report_detail (transaction_id, subtotal_trans, report_id) VALUES (2, 330.00, 8);
INSERT INTO report_detail (transaction_id, subtotal_trans, report_id) VALUES (1, 890.25, 9);
INSERT INTO report_detail (transaction_id, subtotal_trans, report_id) VALUES (2, 1000.00, 10);
INSERT INTO report_detail (transaction_id, subtotal_trans, report_id) VALUES (1, 450.00, 11);
INSERT INTO report_detail (transaction_id, subtotal_trans, report_id) VALUES (2, 620.00, 12);
INSERT INTO report_detail (transaction_id, subtotal_trans, report_id) VALUES (1, 780.00, 1); 
INSERT INTO report_detail (transaction_id, subtotal_trans, report_id) VALUES (2, 910.00, 2); 
INSERT INTO report_detail (transaction_id, subtotal_trans, report_id) VALUES (1, 550.00, 3); 
COMMIT;
