-- Ejecutado por ANDRE_DEV

-- Relaciones
ALTER TABLE province ADD CONSTRAINT fk_province_department
FOREIGN KEY (department_id) REFERENCES department(id);

ALTER TABLE district ADD CONSTRAINT fk_district_province
FOREIGN KEY (province_id) REFERENCES province(id);

-- Relaciones proveedor
ALTER TABLE provider ADD CONSTRAINT fk_provider_district
FOREIGN KEY (district_id) REFERENCES district(id);

-- Relaciones cliente  usuario
ALTER TABLE client_user ADD CONSTRAINT fk_clientuser_client
FOREIGN KEY (client_id) REFERENCES client(id);

ALTER TABLE user_table ADD CONSTRAINT fk_user_rol
FOREIGN KEY (rol_id) REFERENCES rol(id);

-- Relaciones transaccionales
ALTER TABLE transactions ADD CONSTRAINT fk_transaction_client
FOREIGN KEY (client_id) REFERENCES client(id);

ALTER TABLE transactions ADD CONSTRAINT fk_transaction_client_user
FOREIGN KEY (client_user_id) REFERENCES client_user(id);

ALTER TABLE transactions ADD CONSTRAINT fk_transaction_user
FOREIGN KEY (user_id) REFERENCES user_table(id);

ALTER TABLE transaction_detail ADD CONSTRAINT fk_detail_transaction
FOREIGN KEY (transaction_id) REFERENCES transactions(id);
COMMIT;