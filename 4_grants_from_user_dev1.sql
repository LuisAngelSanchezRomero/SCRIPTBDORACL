-- =================================================================
-- GRANTS DESDE ANDRE_DEV (DEV1) hacia LUIS_DEV (DEV2)
-- =================================================================

-- Permisos para que LUIS_DEV pueda referenciar las tablas de ANDRE_DEV
GRANT SELECT, REFERENCES ON transactions TO LUIS_DEV;
GRANT SELECT, REFERENCES ON report TO LUIS_DEV;
GRANT SELECT, REFERENCES ON district TO LUIS_DEV;

-- Permisos necesarios para la correcta inserción de datos (Si es que LUIS_DEV necesita hacer inserts en estas tablas)
-- GRANT SELECT ON rol TO LUIS_DEV;
-- GRANT SELECT ON user_table TO LUIS_DEV;
-- GRANT SELECT ON client TO LUIS_DEV;
-- GRANT SELECT ON departament TO LUIS_DEV;
-- GRANT SELECT ON province TO LUIS_DEV;