-- =================================================================
-- INSERCIÓN DE DATOS PARA ANDRE_DEV (DEV1)
-- =================================================================

-- 1. Insertar roles
INSERT INTO rol (id, name) VALUES (sq_rol_id.NEXTVAL, 'Administrador');
INSERT INTO rol (id, name) VALUES (sq_rol_id.NEXTVAL, 'Vendedor');
INSERT INTO rol (id, name) VALUES (sq_rol_id.NEXTVAL, 'Cliente');

-- 2. Insertar usuarios (manager_id se mapea a user_table.id)
-- Asumiendo id 1 para un manager
INSERT INTO user_table (id, rol_id, username, password, first_name, last_name, email)
VALUES (sq_user_table_id.NEXTVAL, 1, 'manager_admin', 'pass123', 'Juan', 'Perez', 'juan.p@mail.com');
-- Asumiendo id 2 para otro manager
INSERT INTO user_table (id, rol_id, username, password, first_name, last_name, email)
VALUES (sq_user_table_id.NEXTVAL, 1, 'manager_op', 'pass123', 'Ana', 'Gomez', 'ana.g@mail.com');
-- Clientes
INSERT INTO user_table (id, rol_id, username, password) VALUES (sq_user_table_id.NEXTVAL, 3, 'client1', 'pass123');
INSERT INTO user_table (id, rol_id, username, password) VALUES (sq_user_table_id.NEXTVAL, 3, 'client2', 'pass123');

-- 3. Insertar clientes
INSERT INTO client (id, user_id, address, phone) VALUES (sq_client_id.NEXTVAL, 3, 'Calle Falsa 123', '987654321');
INSERT INTO client (id, user_id, address, phone) VALUES (sq_client_id.NEXTVAL, 4, 'Av Siempreviva 742', '999888777');

-- 4. Insertar reportes
-- Se asume que los manager_id del script anterior eran 11 y 12. Usaremos los nuevos id generados (1 y 2)
INSERT INTO report (id, manager_id) VALUES (sq_report_id.NEXTVAL, 1);
INSERT INTO report (id, manager_id) VALUES (sq_report_id.NEXTVAL, 2);
INSERT INTO report (id, manager_id) VALUES (sq_report_id.NEXTVAL, 1);
INSERT INTO report (id, manager_id) VALUES (sq_report_id.NEXTVAL, 2);
INSERT INTO report (id, manager_id) VALUES (sq_report_id.NEXTVAL, 1);
INSERT INTO report (id, manager_id) VALUES (sq_report_id.NEXTVAL, 2);
INSERT INTO report (id, manager_id) VALUES (sq_report_id.NEXTVAL, 1);
INSERT INTO report (id, manager_id) VALUES (sq_report_id.NEXTVAL, 2);
INSERT INTO report (id, manager_id) VALUES (sq_report_id.NEXTVAL, 1);
INSERT INTO report (id, manager_id) VALUES (sq_report_id.NEXTVAL, 2);

-- 5. Insertar transacciones
INSERT INTO transactions (id, client_id) VALUES (sq_transactions_id.NEXTVAL, 1);
INSERT INTO transactions (id, client_id) VALUES (sq_transactions_id.NEXTVAL, 2);
INSERT INTO transactions (id, client_id) VALUES (sq_transactions_id.NEXTVAL, 1);
INSERT INTO transactions (id, client_id) VALUES (sq_transactions_id.NEXTVAL, 2);
INSERT INTO transactions (id, client_id) VALUES (sq_transactions_id.NEXTVAL, 1);
INSERT INTO transactions (id, client_id) VALUES (sq_transactions_id.NEXTVAL, 2);
INSERT INTO transactions (id, client_id) VALUES (sq_transactions_id.NEXTVAL, 1);
INSERT INTO transactions (id, client_id) VALUES (sq_transactions_id.NEXTVAL, 2);
INSERT INTO transactions (id, client_id) VALUES (sq_transactions_id.NEXTVAL, 1);
INSERT INTO transactions (id, client_id) VALUES (sq_transactions_id.NEXTVAL, 2);

-- 6. Insertar ubicaciones (Departamentos, Provincias, Distritos)
INSERT INTO departament (id, name) VALUES (sq_departament_id.NEXTVAL, 'Lima');
INSERT INTO province (id, departament_id, name) VALUES (sq_province_id.NEXTVAL, 1, 'Lima');
INSERT INTO district (id, province_id, name) VALUES (sq_district_id.NEXTVAL, 1, 'Miraflores');
INSERT INTO district (id, province_id, name) VALUES (sq_district_id.NEXTVAL, 1, 'San Isidro');
INSERT INTO departament (id, name) VALUES (sq_departament_id.NEXTVAL, 'Arequipa');
INSERT INTO province (id, departament_id, name) VALUES (sq_province_id.NEXTVAL, 2, 'Arequipa');
INSERT INTO district (id, province_id, name) VALUES (sq_district_id.NEXTVAL, 2, 'Cercado');


COMMIT;