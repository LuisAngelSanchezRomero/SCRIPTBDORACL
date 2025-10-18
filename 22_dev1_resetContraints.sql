-- Ejecutado por ANDRE_DEV

-- ============================================
-- REVOCAR CAMBIOS Y ELIMINAR CONSTRAINTS (Para rollback)
-- ============================================

-- 1. Revertir la modificación NOT NULL (si aplica)
ALTER TABLE transaction_detail MODIFY unitary_price NUMBER(10,2) NULL;

-- 2. Eliminar las Foreign Keys internas y cruzadas
-- Uso de PL/SQL para manejar errores si alguna restricción no se creó
DECLARE
    procedure drop_constraint (p_table_name VARCHAR2, p_constraint_name VARCHAR2) IS
    BEGIN
        EXECUTE IMMEDIATE 'ALTER TABLE ' || p_table_name || ' DROP CONSTRAINT ' || p_constraint_name;
        DBMS_OUTPUT.PUT_LINE('Constraint ' || p_constraint_name || ' eliminada.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -2443 THEN
                -- ORA-02443: Cannot drop constraint - nonexistent constraint
                NULL;
            ELSE
                RAISE;
            END IF;
    END;
BEGIN
    drop_constraint('province', 'fk_province_department');
    drop_constraint('district', 'fk_district_province');
    drop_constraint('provider', 'fk_provider_district');
    drop_constraint('user_table', 'fk_user_rol');
    drop_constraint('client_user', 'fk_clientuser_client');
    drop_constraint('transactions', 'fk_transaction_client');
    drop_constraint('transactions', 'fk_transaction_clientuser');
    drop_constraint('transactions', 'fk_transaction_user');
    drop_constraint('transaction_detail', 'fk_tdetail_transaction');
    drop_constraint('transaction_detail', 'fk_tdetail_product');
END;
/
COMMIT;
