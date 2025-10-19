-- Ejecutado por ANDRE_DEV

-- ============================================
-- GRANTS: Permisos para el usuario LUIS
-- ============================================
-- Tablas de Ubicación
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON department TO LUIS;
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON province TO LUIS;
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON district TO LUIS;

-- Tablas Maestras
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON provider TO LUIS;
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON client TO LUIS;
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON client_user TO LUIS;
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON rol TO LUIS;
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON user_table TO LUIS;

-- Tablas Transaccionales
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON transactions TO LUIS;
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON transaction_detail TO LUIS;
COMMIT;

-- ============================================
-- SINÓNIMOS: Acceso directo desde el esquema LUIS a ANDRE_DEV
-- ============================================

-- Tablas de Ubicación
CREATE OR REPLACE SYNONYM LUIS.department FOR ANDRE_DEV.department;
CREATE OR REPLACE SYNONYM LUIS.province FOR ANDRE_DEV.province;
CREATE OR REPLACE SYNONYM LUIS.district FOR ANDRE_DEV.district;

-- Tablas Maestras
CREATE OR REPLACE SYNONYM LUIS.provider FOR ANDRE_DEV.provider;
CREATE OR REPLACE SYNONYM LUIS.client FOR ANDRE_DEV.client;
CREATE OR REPLACE SYNONYM LUIS.client_user FOR ANDRE_DEV.client_user;
CREATE OR REPLACE SYNONYM LUIS.rol FOR ANDRE_DEV.rol;
CREATE OR REPLACE SYNONYM LUIS.user_table FOR ANDRE_DEV.user_table;

-- Tablas Transaccionales
CREATE OR REPLACE SYNONYM LUIS.transactions FOR ANDRE_DEV.transactions;
CREATE OR REPLACE SYNONYM LUIS.transaction_detail FOR ANDRE_DEV.transaction_detail;
COMMIT;
