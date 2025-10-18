-- Ejecutado por LUIS

-- ===================================
-- RELACIONES INTERNAS (LUIS)
-- ===================================
ALTER TABLE report 
ADD CONSTRAINT fk_report_user_table 
FOREIGN KEY (user_table_id) 
REFERENCES ANDRE_DEV.user_table (id); 

ALTER TABLE report_detail 
ADD CONSTRAINT fk_report_detail_report 
FOREIGN KEY (report_id) 
REFERENCES report (id);

-- ===================================
-- FKs Cruzados con ANDRE_DEV
-- ===================================
ALTER TABLE product 
ADD CONSTRAINT fk_product_provider 
FOREIGN KEY (provider_id) 
REFERENCES ANDRE_DEV.provider(id);

-- FK de report_detail a transactions (en ANDRE_DEV)
ALTER TABLE report_detail 
ADD CONSTRAINT fk_rdetail_transaction 
FOREIGN KEY (transaction_id) 
REFERENCES ANDRE_DEV.transactions(id);

COMMIT;