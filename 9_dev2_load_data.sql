-- =================================================================
-- INSERCIÓN DE DATOS PARA LUIS_DEV (DEV2)
-- Se requiere que ANDRE_DEV.transactions y ANDRE_DEV.report tengan datos.
-- =================================================================

-- 1. Insertar productos
INSERT INTO product (product_code, name, price, stock) VALUES ('PROD001', 'Laptop Gamer X1', 1250.00, 50);
INSERT INTO product (product_code, name, price, stock) VALUES ('PROD002', 'Mouse Optico Z', 15.50, 200);
INSERT INTO product (product_code, name, price, stock) VALUES ('PROD003', 'Teclado Mecanico', 80.75, 100);
INSERT INTO product (product_code, name, price, stock) VALUES ('PROD004', 'Monitor Curvo 27', 420.00, 30);
INSERT INTO product (product_code, name, price, stock) VALUES ('PROD005', 'Webcam HD', 50.00, 150);

-- 2. Insertar proveedores
-- Asumiendo que los ids de distritos en ANDRE_DEV son 1, 2, 3
INSERT INTO provider (id, district_id, name, contact_phone) VALUES (sq_provider_id.NEXTVAL, 1, 'Tech Supplies S.A.C.', '911223344');
INSERT INTO provider (id, district_id, name, contact_phone) VALUES (sq_provider_id.NEXTVAL, 2, 'Global Hardware', '955667788');

-- 3. Insertar detalle de transacciones (La tabla transaction_detail no usa unitary_price en el insert ya que lo congela el trigger)
-- El trigger trg_set_unitary_price se encargará de rellenar unitary_price

-- Detalle para transaccion 1 (ID 1 de ANDRE_DEV.transactions)
INSERT INTO transaction_detail (id, transaction_id, product_code, amount, unitary_price) VALUES (sq_transaction_detail_id.NEXTVAL, 1, 'PROD001', 1, 1250.00);
-- Detalle para transaccion 2
INSERT INTO transaction_detail (id, transaction_id, product_code, amount, unitary_price) VALUES (sq_transaction_detail_id.NEXTVAL, 2, 'PROD002', 5, 15.50);
INSERT INTO transaction_detail (id, transaction_id, product_code, amount, unitary_price) VALUES (sq_transaction_detail_id.NEXTVAL, 2, 'PROD003', 3, 80.75); -- 5 * 15.50 + 3 * 80.75 = 77.50 + 242.25 = 319.75
-- Detalle para transaccion 3
INSERT INTO transaction_detail (id, transaction_id, product_code, amount, unitary_price) VALUES (sq_transaction_detail_id.NEXTVAL, 3, 'PROD004', 1, 420.00);

-- 4. Insertar detalle de reportes
-- Se asume que los report_id y transaction_id de ANDRE_DEV son secuenciales desde 1.
INSERT INTO report_detail (id, report_id, transaction_id, subtotal_trans) VALUES (sq_report_detail_id.NEXTVAL, 1, 1, 1250.00);
INSERT INTO report_detail (id, report_id, transaction_id, subtotal_trans) VALUES (sq_report_detail_id.NEXTVAL, 2, 2, 319.75);
INSERT INTO report_detail (id, report_id, transaction_id, subtotal_trans) VALUES (sq_report_detail_id.NEXTVAL, 3, 3, 420.00);
INSERT INTO report_detail (id, report_id, transaction_id, subtotal_trans) VALUES (sq_report_detail_id.NEXTVAL, 4, 4, 0.00); -- Transacciones sin detalle
INSERT INTO report_detail (id, report_id, transaction_id, subtotal_trans) VALUES (sq_report_detail_id.NEXTVAL, 5, 5, 0.00);
INSERT INTO report_detail (id, report_id, transaction_id, subtotal_trans) VALUES (sq_report_detail_id.NEXTVAL, 6, 6, 0.00);
INSERT INTO report_detail (id, report_id, transaction_id, subtotal_trans) VALUES (sq_report_detail_id.NEXTVAL, 7, 7, 0.00);
INSERT INTO report_detail (id, report_id, transaction_id, subtotal_trans) VALUES (sq_report_detail_id.NEXTVAL, 8, 8, 0.00);
INSERT INTO report_detail (id, report_id, transaction_id, subtotal_trans) VALUES (sq_report_detail_id.NEXTVAL, 9, 9, 0.00);
INSERT INTO report_detail (id, report_id, transaction_id, subtotal_trans) VALUES (sq_report_detail_id.NEXTVAL, 10, 10, 0.00);

COMMIT;