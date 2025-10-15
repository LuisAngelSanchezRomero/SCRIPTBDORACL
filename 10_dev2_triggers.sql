-- =============================================================
-- TRIGGERS PARA LUIS_DEV (DEV2)
-- =============================================================

------------------------------------------------------------
-- TRIGGER COMPUESTO: Actualiza TOTAL en ANDRE_DEV.TRANSACTIONS
--     (usa compound trigger para evitar ORA-04091)
------------------------------------------------------------
CREATE OR REPLACE TRIGGER trg_update_transaction_total
FOR INSERT OR UPDATE OR DELETE ON transaction_detail
COMPOUND TRIGGER

    -- Lista de transacciones afectadas
    TYPE t_transaction_ids IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    g_transaction_ids t_transaction_ids;
    g_index PLS_INTEGER := 0;

    ------------------------------------------------------------
    --  BLOQUE POR CADA FILA AFECTADA
    ------------------------------------------------------------
    BEFORE EACH ROW IS
    BEGIN
        g_index := g_index + 1;
        -- Obtiene transaction_id de NEW para INSERT/UPDATE, y OLD para DELETE
        g_transaction_ids(g_index) := NVL(:NEW.transaction_id, :OLD.transaction_id);
    END BEFORE EACH ROW;

    ------------------------------------------------------------
    --  BLOQUE DESPUÉS DE TODAS LAS FILAS
    ------------------------------------------------------------
    AFTER STATEMENT IS
    BEGIN
        FOR i IN 1 .. g_transaction_ids.COUNT LOOP
            DECLARE
                v_total NUMBER(12,2);
                v_tx_id NUMBER := g_transaction_ids(i);
            BEGIN
                -- Recalcular el total sumando (amount * unitary_price)
                SELECT NVL(SUM(amount * unitary_price), 0)
                INTO v_total
                FROM transaction_detail
                WHERE transaction_id = v_tx_id;

                -- Actualizar la tabla TRANSACTIONS en el esquema de ANDRE_DEV
                UPDATE ANDRE_DEV.transactions
                SET total = v_total
                WHERE id = v_tx_id;
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    NULL; -- Manejar si el transaction_id ya no existe (aunque no debería)
            END;
        END LOOP;
    END AFTER STATEMENT;

END trg_update_transaction_total;
/
SHOW ERRORS;

------------------------------------------------------------
-- Trigger: asignar el precio unitario del producto
--     (congela el precio actual en el momento del insert)
------------------------------------------------------------
CREATE OR REPLACE TRIGGER trg_set_unitary_price
BEFORE INSERT ON transaction_detail
FOR EACH ROW
DECLARE
    -- La tabla product pertenece a LUIS_DEV, por lo que no es necesario el prefijo
    v_price product.price%TYPE;
BEGIN
    -- Buscar el precio actual del producto en la tabla local (LUIS_DEV.product)
    SELECT price
    INTO v_price
    FROM product
    WHERE product_code = :NEW.product_code;

    -- Asignar el precio encontrado (se congela en el detalle)
    :NEW.unitary_price := v_price;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001, 'El producto con código ' || :NEW.product_code || ' no existe en LUIS_DEV.PRODUCT');
END;
/
SHOW ERRORS;