-- ====================================================
-- 9_dev2_load_data.sql
-- Carga de datos del esquema LUIS dependientes de ANDRE_DEV
-- ====================================================

-- Limpieza
DELETE FROM report_detail;
DELETE FROM report;
DELETE FROM product;
DELETE FROM inventory_movement;
COMMIT;

-- ===== INVENTORY_MOVEMENT =====
INSERT INTO inventory_movement (movement_type, amount) VALUES ('Entrada', 50);
INSERT INTO inventory_movement (movement_type, amount) VALUES ('Entrada', 30);
INSERT INTO inventory_movement (movement_type, amount) VALUES ('Salida', 10);
INSERT INTO inventory_movement (movement_type, amount) VALUES ('Entrada', 20);
INSERT INTO inventory_movement (movement_type, amount) VALUES ('Salida', 5);
COMMIT;

-- ===== PRODUCT =====
INSERT INTO product (product_code, provider_id, name, description, unit, price, stock, status)
VALUES ('PROD-001', 1, 'Castaña Amazónica', 'Fruto seco natural', 'kg', 25.5, 100, 'activo');

INSERT INTO product (product_code, provider_id, name, description, unit, price, stock, status)
VALUES ('PROD-002', 2, 'Plátano Isla', 'Fruta fresca', 'kg', 3.8, 200, 'activo');
COMMIT;

-- ===== REPORT =====
INSERT INTO report (user_table_id) VALUES (1);
INSERT INTO report (user_table_id) VALUES (2);
INSERT INTO report (user_table_id) VALUES (3);
INSERT INTO report (user_table_id) VALUES (1);
COMMIT;

-- ===== REPORT_DETAIL =====
INSERT INTO report_detail (transaction_id, subtotal_trans, report_id) VALUES (1, 54.80, 1);
INSERT INTO report_detail (transaction_id, subtotal_trans, report_id) VALUES (2, 72.80, 2);
INSERT INTO report_detail (transaction_id, subtotal_trans, report_id) VALUES (1, 15.00, 3);
INSERT INTO report_detail (transaction_id, subtotal_trans, report_id) VALUES (2, 25.00, 4);
COMMIT;