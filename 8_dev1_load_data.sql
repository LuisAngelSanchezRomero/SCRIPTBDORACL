-- Ejecutado por ANDRE_DEV

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
INSERT INTO rol (rol, description) VALUES ('ANALISTA', 'Análisis de ventas y monitoreo');
COMMIT;

-- ===== USER_TABLE (Empleados internos) =====
INSERT INTO user_table (rol_id, names, last_names, email, password, cellphone, doc_type, doc_number)
VALUES (1, 'Carlos', 'Ramírez', 'carlos.ramirez@empresa.com', 'admin123', '987654321', 'DNI', '45678912'); -- ID 1

INSERT INTO user_table (rol_id, names, last_names, email, password, cellphone, doc_type, doc_number)
VALUES (2, 'Lucía', 'Fernández', 'lucia.fernandez@empresa.com', 'manager2025', '912345678', 'DNI', '78965412'); -- ID 2

INSERT INTO user_table (rol_id, names, last_names, email, password, cellphone, doc_type, doc_number)
VALUES (3, 'Juancho', 'Sapankary', 'j.sapankary@empresa.com', 'ventas2024', '911222333', 'DNI', '78965413'); -- ID 3
COMMIT;

-- ===== PROVIDER =====
INSERT INTO provider (district_id, name, business_type, ruc, email, cellphone, address)
VALUES (1, 'Distribuidora Andina', 'SAC', '20145678912', 'contacto@andina.com', '999888777', 'Av. Arequipa 1200 - Miraflores'); -- ID 1

INSERT INTO provider (district_id, name, business_type, ruc, email, cellphone, address)
VALUES (3, 'TechPro', 'SRL', '20458963214', 'ventas@techpro.com', '988776655', 'Av. Ejército 500 - Cayma'); -- ID 2
COMMIT;

-- ===== CLIENT =====
INSERT INTO client (names, last_names, cellphone, email, birth_date, doc_type, doc_number)
VALUES ('Andrés', 'Hermoza', '999111222', 'andres@gmail.com', DATE '1998-05-14', 'DNI', '72345678'); -- ID 1

INSERT INTO client (names, last_names, cellphone, email, birth_date, doc_type, doc_number)
VALUES ('María', 'López', '988333444', 'maria.lopez@hotmail.com', DATE '1992-10-01', 'DNI', '65478912'); -- ID 2
COMMIT;

-- ===== CLIENT_USER =====
INSERT INTO client_user (client_id, email, password)
VALUES (1, 'andres_user@gmail.com', 'andrespass'); -- ID 1

INSERT INTO client_user (client_id, email, password)
VALUES (2, 'maria_user@gmail.com', 'mariapass'); -- ID 2
COMMIT;

-- ===================================
-- TRANSACCIONES (CABECERA)
-- ===================================
INSERT INTO transactions (client_id, client_user_id, user_id)
VALUES (1, 1, 2); -- ID 1

INSERT INTO transactions (client_id, client_user_id, user_id)
VALUES (2, 2, 2); -- ID 2
COMMIT;

-- ===================================
-- DETALLE DE TRANSACCIONES
-- ===================================
INSERT INTO transaction_detail (transaction_id, product_code, amount, unitary_price)
VALUES (1, 'PROD-001', 2, 25.50);

INSERT INTO transaction_detail (transaction_id, product_code, amount, unitary_price)
VALUES (1, 'PROD-002', 1, 3.80);

INSERT INTO transaction_detail (transaction_id, product_code, amount, unitary_price)
VALUES (2, 'PROD-010', 3, 22.00);

INSERT INTO transaction_detail (transaction_id, product_code, amount, unitary_price)
VALUES (2, 'PROD-009', 1, 6.80);
COMMIT;


-- ===================================
-- VALIDACIÓN 
-- ===================================

SELECT 
    t.id AS transaction_id,
    t.transaction_date,
    t.status AS transaction_status,

    -- CLIENTE
    c.names || ' ' || c.last_names AS client_full_name,
    c.doc_type,
    c.doc_number,
    c.email AS client_email,
    cu.email AS client_user_email,

    -- USUARIO INTERNO (empleado que registró la venta)
    u.names || ' ' || u.last_names AS employee_full_name,
    r.rol AS employee_rol,
    u.email AS employee_email,

    -- DETALLE DE PRODUCTOS
    d.product_code,
    d.amount,
    d.unitary_price,
    d.subtotal,
    t.total -- CORREGIDO: Usar t.total
FROM transactions t
    JOIN client c ON t.client_id = c.id
    LEFT JOIN client_user cu ON t.client_user_id = cu.id
    LEFT JOIN user_table u ON t.user_id = u.id
    LEFT JOIN rol r ON u.rol_id = r.id
    JOIN transaction_detail d ON t.id = d.transaction_id
ORDER BY 
    t.id, 
    d.id;