-- Ejecutado por ANDRE_DEV

-- province → department
ALTER TABLE province
  ADD CONSTRAINT fk_province_department
  FOREIGN KEY (department_id)
  REFERENCES department(id);

-- district → province
ALTER TABLE district
  ADD CONSTRAINT fk_district_province
  FOREIGN KEY (province_id)
  REFERENCES province(id);

-- provider → district
ALTER TABLE provider
  ADD CONSTRAINT fk_provider_district
  FOREIGN KEY (district_id)
  REFERENCES district(id);

-- user_table → rol
ALTER TABLE user_table
  ADD CONSTRAINT fk_user_rol
  FOREIGN KEY (rol_id)
  REFERENCES rol(id);

-- client_user → client
ALTER TABLE client_user
  ADD CONSTRAINT fk_clientuser_client
  FOREIGN KEY (client_id)
  REFERENCES client(id);

-- transactions
ALTER TABLE transactions
  ADD CONSTRAINT fk_transaction_client
  FOREIGN KEY (client_id)
  REFERENCES client(id);

ALTER TABLE transactions
  ADD CONSTRAINT fk_transaction_clientuser
  FOREIGN KEY (client_user_id)
  REFERENCES client_user(id);

ALTER TABLE transactions
  ADD CONSTRAINT fk_transaction_user
  FOREIGN KEY (user_id)
  REFERENCES user_table(id);

-- transaction_detail → transactions
ALTER TABLE transaction_detail
  ADD CONSTRAINT fk_tdetail_transaction
  FOREIGN KEY (transaction_id)
  REFERENCES transactions(id);

COMMIT;