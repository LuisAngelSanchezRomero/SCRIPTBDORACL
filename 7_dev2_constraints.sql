-- Ejecutado por LUIS

-- ===================================
-- DEFINICIÓN DE RESTRICCIONES (LUIS)
-- ===================================

-- product -> ANDRE_DEV.provider
-- Se asume que ANDRE_DEV.provider tiene una columna 'id' como Primary Key.
ALTER TABLE product
ADD CONSTRAINT fk_product_provider
FOREIGN KEY (provider_id)
REFERENCES ANDRE_DEV.provider(id);

-- report -> ANDRE_DEV.user_table
ALTER TABLE report
ADD CONSTRAINT fk_report_user_table
FOREIGN KEY (user_table_id)
REFERENCES ANDRE_DEV.user_table(id);

-- report_detail -> ANDRE_DEV.transactions
ALTER TABLE report_detail
ADD CONSTRAINT fk_rdetail_transaction
FOREIGN KEY (transaction_id)
REFERENCES ANDRE_DEV.transactions(id);

-- report_detail -> report (Interna)
ALTER TABLE report_detail
ADD CONSTRAINT fk_rdetail_report
FOREIGN KEY (report_id)
REFERENCES report(id);

COMMIT;
