-- Ejecutado por ANDRE_DEV

-- ============================================
-- GRANTS: Permisos para el usuario LUIS
-- ============================================
GRANT SELECT, REFERENCES ON provider TO LUIS;
GRANT SELECT, REFERENCES ON user_table TO LUIS;
GRANT SELECT, REFERENCES ON transactions TO LUIS;
GRANT SELECT, REFERENCES ON transaction_detail TO LUIS;
GRANT SELECT, REFERENCES ON client TO LUIS;
COMMIT;