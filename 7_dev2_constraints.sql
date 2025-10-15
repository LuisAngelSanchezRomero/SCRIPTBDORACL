-- =================================================================
-- CONSTRAINTS (FOREIGN KEYS) PARA LUIS_DEV (DEV2)
-- =================================================================

-- inventory_movement a product
ALTER TABLE inventory_movement ADD CONSTRAINT fk_inventory_product FOREIGN KEY (product_code) REFERENCES product (product_code);

-- transaction_detail a ANDRE_DEV.transactions
-- (Se necesita que ANDRE_DEV haya otorgado SELECT, REFERENCES en transactions)
ALTER TABLE transaction_detail ADD CONSTRAINT fk_tdetail_transaction FOREIGN KEY (transaction_id) REFERENCES ANDRE_DEV.transactions (id);

-- transaction_detail a product
ALTER TABLE transaction_detail ADD CONSTRAINT fk_tdetail_product FOREIGN KEY (product_code) REFERENCES product (product_code);

-- report_detail a ANDRE_DEV.report
-- (Se necesita que ANDRE_DEV haya otorgado SELECT, REFERENCES en report)
ALTER TABLE report_detail ADD CONSTRAINT fk_rdetail_report FOREIGN KEY (report_id) REFERENCES ANDRE_DEV.report (id);

-- report_detail a ANDRE_DEV.transactions
-- (Se necesita que ANDRE_DEV haya otorgado SELECT, REFERENCES en transactions)
ALTER TABLE report_detail ADD CONSTRAINT fk_rdetail_transaction FOREIGN KEY (transaction_id) REFERENCES ANDRE_DEV.transactions (id);

-- provider a ANDRE_DEV.district
-- (Se necesita que ANDRE_DEV haya otorgado SELECT, REFERENCES en district)
ALTER TABLE provider ADD CONSTRAINT fk_provider_district FOREIGN KEY (district_id) REFERENCES ANDRE_DEV.district (id);