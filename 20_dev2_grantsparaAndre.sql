-- Ejecutado por LUIS

-- ============================================
-- SINÓNIMOS: Acceso directo a las tablas de ANDRE_DEV
-- Este comando debe ser ejecutado por LUIS para crear los sinónimos en su esquema.
-- ============================================
CREATE OR REPLACE SYNONYM department FOR ANDRE_DEV.department;
CREATE OR REPLACE SYNONYM province FOR ANDRE_DEV.province;
CREATE OR REPLACE SYNONYM district FOR ANDRE_DEV.district;
CREATE OR REPLACE SYNONYM provider FOR ANDRE_DEV.provider;
CREATE OR REPLACE SYNONYM client FOR ANDRE_DEV.client;
CREATE OR REPLACE SYNONYM client_user FOR ANDRE_DEV.client_user;
CREATE OR REPLACE SYNONYM rol FOR ANDRE_DEV.rol;
CREATE OR REPLACE SYNONYM user_table FOR ANDRE_DEV.user_table;
CREATE OR REPLACE SYNONYM transactions FOR ANDRE_DEV.transactions;
CREATE OR REPLACE SYNONYM transaction_detail FOR ANDRE_DEV.transaction_detail;
COMMIT;
