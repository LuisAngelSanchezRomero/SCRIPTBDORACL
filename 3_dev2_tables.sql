-- Ejecutado por LUIS

-- ===================================
-- DESACTIVAR RESTRICCIONES Y ELIMINAR TABLAS EXISTENTES
-- ===================================
BEGIN
    FOR c IN (SELECT constraint_name, table_name FROM user_constraints WHERE constraint_type = 'R') LOOP
        BEGIN
            EXECUTE IMMEDIATE 'ALTER TABLE ' || c.table_name || ' DISABLE CONSTRAINT ' || c.constraint_name;
        EXCEPTION
            WHEN OTHERS THEN NULL;
        END;
    END LOOP;
END;
/
COMMIT;

DECLARE
    table_exists NUMBER;
BEGIN
    FOR t IN (
        SELECT table_name FROM user_tables
        WHERE table_name IN (
            'INVENTORY_MOVEMENT', 'PRODUCT', 'REPORT', 'REPORT_DETAIL'
        )
    ) LOOP
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS PURGE';
        DBMS_OUTPUT.PUT_LINE('Tabla ' || t.table_name || ' eliminada correctamente');
    END LOOP;
END;
/
COMMIT;

-- ===================================
-- TRANSACTIONAL inventory_movement
-- ===================================
CREATE TABLE inventory_movement (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    movement_type VARCHAR2(10) NOT NULL CHECK (movement_type IN ('Entrada', 'Salida')),
    amount NUMBER(10,2) NOT NULL CHECK (amount >= 0),
    movement_date TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL
);

-- ===================================
-- MASTER TABLE: product
-- ===================================
CREATE TABLE product (
    product_code VARCHAR2(50) PRIMARY KEY,
    provider_id NUMBER(10) NOT NULL,
    name NVARCHAR2(100) NOT NULL,
    description NVARCHAR2(200),
    unit NVARCHAR2(10) NOT NULL,
    price NUMBER(10,2) NOT NULL CHECK (price >= 0),
    stock NUMBER(10) NOT NULL CHECK (stock >= 0),
    status NVARCHAR2(10) DEFAULT 'activo' NOT NULL CHECK (status IN ('activo', 'inactivo')),
    created_date DATE DEFAULT SYSDATE NOT NULL
);

-- ===================================
-- TRANSACTIONAL report
-- ===================================
CREATE TABLE report (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_table_id NUMBER(10) NOT NULL,
    report_date TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL
);

-- ===================================
-- TRANSACTIONAL report_detail
-- ===================================
CREATE TABLE report_detail (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    transaction_id NUMBER(10) NOT NULL,
    report_id NUMBER(10) NOT NULL,
    subtotal_trans NUMBER(10,2) NOT NULL CHECK (subtotal_trans >= 0)
);

COMMIT;
