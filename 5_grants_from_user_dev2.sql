-- Ejecutado por LUIS

-- ============================================
-- GRANTS: Permisos para que ANDRE_DEV pueda referenciar/consultar y acceder a mis tablas.
-- ============================================
GRANT SELECT, REFERENCES ON product TO ANDRE_DEV;
GRANT SELECT, REFERENCES ON inventory_movement TO ANDRE_DEV;
GRANT SELECT, REFERENCES ON report TO ANDRE_DEV;
GRANT SELECT, REFERENCES ON report_detail TO ANDRE_DEV;
COMMIT;