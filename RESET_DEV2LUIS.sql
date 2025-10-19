-- ===================================================
-- 11_dev2_reset_all.sql
-- Limpieza total del esquema LUIS
-- ===================================================

-- 1️⃣ Desactivar restricciones referenciales
BEGIN
    FOR c IN (SELECT constraint_name, table_name 
              FROM user_constraints 
              WHERE constraint_type IN ('R', 'C', 'U', 'P')) LOOP
        BEGIN
            EXECUTE IMMEDIATE 'ALTER TABLE ' || c.table_name ||
                              ' DISABLE CONSTRAINT ' || c.constraint_name;
        EXCEPTION WHEN OTHERS THEN NULL;
        END;
    END LOOP;
END;
/
COMMIT;

-- 2️⃣ Eliminar todas las tablas del esquema
DECLARE
BEGIN
    FOR t IN (SELECT table_name FROM user_tables) LOOP
        BEGIN
            EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS PURGE';
        EXCEPTION WHEN OTHERS THEN NULL;
        END;
    END LOOP;
END;
/
COMMIT;

-- 3️⃣ Eliminar todos los índices
DECLARE
BEGIN
    FOR i IN (SELECT index_name FROM user_indexes) LOOP
        BEGIN
            EXECUTE IMMEDIATE 'DROP INDEX ' || i.index_name;
        EXCEPTION WHEN OTHERS THEN NULL;
        END;
    END LOOP;
END;
/
COMMIT;

-- 4️⃣ Verificar limpieza
PROMPT ==== Tablas restantes (debe salir vacío) ====
SELECT table_name FROM user_tables;

PROMPT ==== Constraints restantes (debe salir vacío) ====
SELECT constraint_name, constraint_type, table_name FROM user_constraints;

PROMPT ==== Índices restantes (debe salir vacío) ====
SELECT index_name FROM user_indexes;
