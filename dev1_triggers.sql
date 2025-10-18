------------------------------------------------------------
-- TRIGGER COMPUESTO: Actualiza TOTAL en TRANSACTIONS
--     sin error ORA-04091 (usa compound trigger)
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
                SELECT NVL(SUM(amount * unitary_price), 0)
                INTO v_total
                FROM transaction_detail
                WHERE transaction_id = v_tx_id;

                UPDATE transactions
                SET total = v_total
                WHERE id = v_tx_id;
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    NULL;
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
    v_price LUIS_DEV.product.price%TYPE;
BEGIN
    -- Buscar el precio actual del producto en el esquema de LUIS_DEV
    SELECT price
    INTO v_price
    FROM LUIS_DEV.product
    WHERE product_code = :NEW.product_code;

    -- Asignar el precio encontrado (se congela en el detalle)
    :NEW.unitary_price := v_price;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001, 'El producto no existe en LUIS_DEV.PRODUCT');
END;
/
SHOW ERRORS;

