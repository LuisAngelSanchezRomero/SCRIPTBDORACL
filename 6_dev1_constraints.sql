-- =================================================================
-- CONSTRAINTS (FOREIGN KEYS) PARA ANDRE_DEV (DEV1)
-- =================================================================

-- user_table a rol
ALTER TABLE user_table
ADD CONSTRAINT fk_user_table_rol FOREIGN KEY (rol_id)
REFERENCES rol (id);

-- client a user_table
ALTER TABLE client
ADD CONSTRAINT fk_client_user FOREIGN KEY (user_id)
REFERENCES user_table (id);

-- report a user_table (ACTUALIZADO: antes manager, ahora user_table)
ALTER TABLE report
ADD CONSTRAINT fk_report_user FOREIGN KEY (manager_id) -- manager_id es el nombre de columna en report
REFERENCES user_table (id);

-- transactions a client
ALTER TABLE transactions
ADD CONSTRAINT fk_transactions_client FOREIGN KEY (client_id)
REFERENCES client (id);

-- province a departament
ALTER TABLE province
ADD CONSTRAINT fk_province_departament FOREIGN KEY (departament_id)
REFERENCES departament (id);

-- district a province
ALTER TABLE district
ADD CONSTRAINT fk_district_province FOREIGN KEY (province_id)
REFERENCES province (id);