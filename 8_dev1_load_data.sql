-- ====================================================
-- Datos base del esquema ANDRE_DEV
-- ====================================================

-- Limpieza
DELETE FROM transaction_detail;
DELETE FROM transactions;
DELETE FROM client_user;
DELETE FROM client;
DELETE FROM provider;
DELETE FROM user_table;
DELETE FROM rol;
DELETE FROM district;
DELETE FROM province;
DELETE FROM department;
COMMIT;

-- ===================================
-- INSERTAR DATOS EN TABLAS MAESTRAS
-- ===================================

-- ===== DEPARTMENT =====
INSERT INTO department (name) VALUES ('Lima');
INSERT INTO department (name) VALUES ('Arequipa');
COMMIT;

-- ===== PROVINCE =====
INSERT INTO province (department_id, name) VALUES (1, 'Lima');
INSERT INTO province (department_id, name) VALUES (1, 'Huaral');
INSERT INTO province (department_id, name) VALUES (2, 'Arequipa');
COMMIT;

-- ===== DISTRICT =====
INSERT INTO district (province_id, name) VALUES (1, 'Miraflores');
INSERT INTO district (province_id, name) VALUES (1, 'San Isidro');
INSERT INTO district (province_id, name) VALUES (3, 'Cayma');
COMMIT;

-- ===== ROL =====
INSERT INTO rol (rol, description) VALUES ('ADMIN', 'Control total del sistema');
INSERT INTO rol (rol, description) VALUES ('MANAGER', 'Encargado de registrar ventas y gestionar usuarios');
INSERT INTO rol (rol, description) VALUES ('ANALISTA', 'Análisis de ventas y monitorizacion');
COMMIT;

-- ===== USER_TABLE (Empleados internos) =====
INSERT INTO user_table (rol_id, names, last_names, email, password, cellphone, doc_type, doc_number)
VALUES (1, 'Carlos', 'Ramírez', 'carlos.ramirez@empresa.com', 'admin123', '987654321', 'DNI', '45678912');

INSERT INTO user_table (rol_id, names, last_names, email, password, cellphone, doc_type, doc_number)
VALUES (2, 'Lucía', 'Fernández', 'lucia.fernandez@empresa.com', 'manager2025', '912345678', 'DNI', '78965412');

INSERT INTO user_table (rol_id, names, last_names, email, password, cellphone, doc_type, doc_number)
VALUES (3, 'Juancho', 'Sapankary', 'j.sapankary@empresa.com', 'ventas2024', '911222333', 'DNI', '78965413');
COMMIT;

-- ===== PROVIDER =====
INSERT INTO provider (district_id, name, business_type, ruc, email, cellphone, address)
VALUES (1, 'Distribuidora Andina', 'SAC', '20145678912', 'contacto@andina.com', '999888777', 'Av. Arequipa 1200 - Miraflores');

INSERT INTO provider (district_id, name, business_type, ruc, email, cellphone, address)
VALUES (3, 'TechPro', 'SRL', '20458963214', 'ventas@techpro.com', '988776655', 'Av. Ejército 500 - Cayma');
COMMIT;

-- ===== CLIENT =====
INSERT INTO client (names, last_names, cellphone, email, birth_date, doc_type, doc_number)
VALUES ('Andrés', 'Hermoza', '999111222', 'andres@gmail.com', DATE '1998-05-14', 'DNI', '72345678');

INSERT INTO client (names, last_names, cellphone, email, birth_date, doc_type, doc_number)
VALUES ('María', 'López', '988333444', 'maria.lopez@hotmail.com', DATE '1992-10-01', 'DNI', '65478912');
COMMIT;

-- ===== CLIENT_USER =====
INSERT INTO client_user (client_id, email, password)
VALUES (1, 'andres_user@gmail.com', 'andrespass');

INSERT INTO client_user (client_id, email, password)
VALUES (2, 'maria_user@gmail.com', 'mariapass');
COMMIT;

-- ===================================
-- INSERTAR DATOS EN TRANSACCIONES
-- ===================================

-- ===== TRANSACTIONS =====
INSERT INTO transactions (client_id, client_user_id, user_id, total, status)
VALUES (1, 1, 2, 54.80, 'Activo');

INSERT INTO transactions (client_id, client_user_id, user_id, total, status)
VALUES (2, 2, 2, 72.80, 'Activo');
COMMIT;

-- ===== TRANSACTION_DETAIL =====
INSERT INTO transaction_detail (transaction_id, product_code, amount, unitary_price)
VALUES (1, 'PROD-001', 2, 25.50);

INSERT INTO transaction_detail (transaction_id, product_code, amount, unitary_price)
VALUES (1, 'PROD-002', 1, 3.80);

INSERT INTO transaction_detail (transaction_id, product_code, amount, unitary_price)
VALUES (2, 'PROD-010', 3, 22.00);

INSERT INTO transaction_detail (transaction_id, product_code, amount, unitary_price)
VALUES (2, 'PROD-009', 1, 6.80);
COMMIT;

-- ===== GRANTS PARA LUIS =====
GRANT SELECT, REFERENCES ON provider TO LUIS;
GRANT SELECT, REFERENCES ON user_table TO LUIS;
GRANT SELECT, REFERENCES ON transactions TO LUIS;
COMMIT;
