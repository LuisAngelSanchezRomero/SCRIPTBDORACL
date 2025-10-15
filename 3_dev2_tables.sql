-- =================================================================
-- CREACIÓN DE TABLAS (LUIS_DEV - DEV2)
-- Tablas: product, inventory_movement, transactions_detail, report_detail, provider
-- =================================================================

-- 1. Tabla: product
CREATE TABLE product (
    product_code VARCHAR2(50) NOT NULL,
    name VARCHAR2(100) NOT NULL,
    price NUMBER(8, 2) NOT NULL,
    stock NUMBER(10) DEFAULT 0,
    CONSTRAINT pk_product PRIMARY KEY (product_code)
);

-- 2. Tabla: inventory_movement
CREATE TABLE inventory_movement (
    id NUMBER(10) NOT NULL,
    product_code VARCHAR2(50) NOT NULL,
    movement_date DATE DEFAULT SYSDATE,
    movement_type VARCHAR2(10) NOT NULL, -- 'IN' o 'OUT'
    quantity NUMBER(10) NOT NULL,
    CONSTRAINT pk_inventory_movement PRIMARY KEY (id)
);

-- 3. Tabla: transactions_detail
CREATE TABLE transaction_detail (
    id NUMBER(10) NOT NULL,
    transaction_id NUMBER(10) NOT NULL, -- FK a ANDRE_DEV.transactions
    product_code VARCHAR2(50) NOT NULL,
    amount NUMBER(10) NOT NULL,
    unitary_price NUMBER(8, 2) NOT NULL,
    CONSTRAINT pk_transaction_detail PRIMARY KEY (id)
);

-- 4. Tabla: report_detail
CREATE TABLE report_detail (
    id NUMBER(10) NOT NULL,
    report_id NUMBER(10) NOT NULL, -- FK a ANDRE_DEV.report
    transaction_id NUMBER(10) NOT NULL, -- FK a ANDRE_DEV.transactions
    subtotal_trans NUMBER(12, 2) NOT NULL,
    CONSTRAINT pk_report_detail PRIMARY KEY (id)
);

-- 5. Tabla: provider
CREATE TABLE provider (
    id NUMBER(10) NOT NULL,
    district_id NUMBER(10) NOT NULL, -- FK a ANDRE_DEV.district
    name VARCHAR2(100) NOT NULL,
    contact_phone VARCHAR2(20),
    CONSTRAINT pk_provider PRIMARY KEY (id)
);

-- 6. Secuencias para las tablas de LUIS_DEV
CREATE SEQUENCE sq_inventory_movement_id START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE sq_transaction_detail_id START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE sq_report_detail_id START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE sq_provider_id START WITH 1 INCREMENT BY 1;