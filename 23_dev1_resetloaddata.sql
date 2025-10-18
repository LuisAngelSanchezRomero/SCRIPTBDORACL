-- Ejecutado por ANDRE_DEV

-- ===================================
-- ELIMINAR DATOS DE PRUEBA EN ORDEN INVERSO
-- ===================================

DELETE FROM transaction_detail;
DELETE FROM transactions;
DELETE FROM client_user;
DELETE FROM client;
DELETE FROM provider;
DELETE FROM user_table;
DELETE FROM rol;
DELETE FROM district;
DELETE FROM province;
DELETE FROM department;

COMMIT;
