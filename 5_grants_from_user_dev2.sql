-- Ejecutado por LUIS

-- ============================================
-- GRANTS: Permisos para que ANDRE_DEV pueda referenciar/consultar y acceder a mis tablas.
-- ============================================

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON product TO ANDRE_DEV;
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON inventory_movement TO ANDRE_DEV;
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON report TO ANDRE_DEV;
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON report_detail TO ANDRE_DEV;
COMMIT;
