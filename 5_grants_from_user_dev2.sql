-- =================================================================
-- GRANTS DESDE LUIS_DEV (DEV2) hacia ANDRE_DEV (DEV1)
-- =================================================================

-- ANDRE_DEV necesita ver el detalle de reportes y productos
GRANT SELECT ON product TO ANDRE_DEV;
GRANT SELECT ON report_detail TO ANDRE_DEV;