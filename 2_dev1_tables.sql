-- Ejecutado por ANDRE_DEV

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
            'CLIENT_USER', 'CLIENT', 'TRANSACTION_DETAIL', 'TRANSACTIONS',
            'DISTRICT', 'PROVINCE', 'DEPARTMENT', 'PROVIDER', 'USER_TABLE', 'ROL'
        )
    ) LOOP
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS PURGE';
        DBMS_OUTPUT.PUT_LINE('Tabla ' || t.table_name || ' eliminada correctamente');
    END LOOP;
END;
/
COMMIT;

-- ===================================
-- MASTER TABLE: DEPARTMENT
-- ===================================
CREATE TABLE department (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR2(50) NOT NULL UNIQUE
);
COMMIT;

-- ===================================
-- MASTER TABLE: PROVINCE
-- ===================================
CREATE TABLE province (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    department_id NUMBER NOT NULL,
    name VARCHAR2(50) NOT NULL
);
COMMIT;

-- ===================================
-- MASTER TABLE: DISTRICT
-- ===================================
CREATE TABLE district (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    province_id NUMBER NOT NULL,
    name VARCHAR2(50) NOT NULL
);
COMMIT;

-- ===================================
-- MASTER TABLE: PROVIDER
-- ===================================
CREATE TABLE provider (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    district_id NUMBER NOT NULL,
    name VARCHAR2(150) NOT NULL CHECK (NOT REGEXP_LIKE(name, '[0-9]')),
    business_type VARCHAR2(10) CHECK (business_type IN ('SAC', 'SRL', 'EIRL', 'SA')),
    ruc CHAR(11) NOT NULL CHECK (REGEXP_LIKE(ruc, '^[0-9]+$')),
    email VARCHAR2(255) CHECK (email IS NULL OR REGEXP_LIKE(email, '^[^@]+@[^@]+\.[^@]+$')),
    cellphone CHAR(9) CHECK (
        cellphone IS NULL OR (
            cellphone LIKE '9%' AND REGEXP_LIKE(cellphone, '^[0-9]+$')
        )
    ),
    address VARCHAR2(255),
    status NUMBER(1) DEFAULT 1 CHECK (status IN (0, 1)),
    register_date TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL
);
CREATE UNIQUE INDEX uq_provider_ruc ON provider (ruc);
CREATE UNIQUE INDEX uq_provider_email ON provider (email);
CREATE UNIQUE INDEX uq_provider_cellphone ON provider (cellphone);
COMMIT;

-- ===================================
-- MASTER TABLE: CLIENT
-- ===================================
CREATE TABLE client (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    names VARCHAR2(200) NOT NULL CHECK (NOT REGEXP_LIKE(names, '[0-9]')),
    last_names VARCHAR2(200) CHECK (last_names IS NULL OR NOT REGEXP_LIKE(last_names, '[0-9]')),
    cellphone CHAR(9) NOT NULL CHECK (REGEXP_LIKE(cellphone, '^9[0-9]{8}$')),
    email VARCHAR2(200) CHECK (email IS NULL OR REGEXP_LIKE(email, '.+@.+\..+')),
    birth_date DATE NOT NULL,
    doc_type CHAR(3) NOT NULL CHECK (doc_type IN ('DNI', 'CEX')),
    doc_number VARCHAR2(20) NOT NULL,
    status NUMBER(1) DEFAULT 1 CHECK (status IN (0, 1)),
    register_date TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL,
    CONSTRAINT chk_doc_logic CHECK (
        (doc_type = 'DNI' AND LENGTH(doc_number) = 8 AND REGEXP_LIKE(doc_number, '^[0-9]+$'))
        OR
        (doc_type = 'CEX' AND LENGTH(doc_number) <= 20)
    )
);
CREATE UNIQUE INDEX uq_client_cellphone ON client (cellphone);
CREATE UNIQUE INDEX uq_client_doc ON client (doc_type, doc_number);
CREATE UNIQUE INDEX uq_client_email ON client (email);
COMMIT;

-- ===================================
-- NEW TABLE: CLIENT_USER
-- ===================================
CREATE TABLE client_user (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    client_id NUMBER NOT NULL,
    email VARCHAR2(200) UNIQUE NOT NULL,
    password VARCHAR2(220) NOT NULL,
    register_date TIMESTAMP DEFAULT SYSTIMESTAMP,
    status NUMBER(1) DEFAULT 1 CHECK (status IN (0,1))
);
COMMIT;

-- ===================================
-- MASTER TABLE: ROL
-- ===================================
CREATE TABLE rol (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    rol VARCHAR2(15) NOT NULL,
    description VARCHAR2(500),
    status NUMBER(1) DEFAULT 1 CHECK (status IN (0, 1)),
    creation_date TIMESTAMP DEFAULT SYSTIMESTAMP
);
COMMIT;

-- ===================================
-- MASTER TABLE: USER (interno de empresa)
-- ===================================
CREATE TABLE user_table (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    rol_id NUMBER NOT NULL,
    names VARCHAR2(100) NOT NULL,
    last_names VARCHAR2(100) NOT NULL,
    email VARCHAR2(200) UNIQUE NOT NULL,
    password VARCHAR2(200) NOT NULL,
    cellphone CHAR(9),
    doc_type CHAR(3),
    doc_number VARCHAR2(20),
     CONSTRAINT chk_user_doc_logic CHECK (
        (doc_type = 'DNI' AND LENGTH(doc_number) = 8 AND REGEXP_LIKE(doc_number, '^[0-9]+$'))
        OR
        (doc_type = 'CEX' AND LENGTH(doc_number) <= 20)
    ),
    status NUMBER(1) DEFAULT 1 CHECK (status IN (0,1)),
    register_date TIMESTAMP DEFAULT SYSTIMESTAMP
);
COMMIT;

-- =================================== 
-- TRANSACTIONAL TABLE: TRANSACTIONS 
-- =================================== 
CREATE TABLE transactions ( 
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    client_id NUMBER NOT NULL,
    client_user_id NUMBER, 
    user_id NUMBER,
    total NUMBER(10,2) DEFAULT 0 CHECK (total >= 0),
    transaction_date TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL, 
    status VARCHAR2(10) DEFAULT 'Activo' CHECK (status IN ('Activo', 'Inactivo')) 
); 
COMMIT;
       
-- ======================================= 
-- TRANSACTIONAL TABLE: TRANSACTION_DETAIL 
-- =======================================
CREATE TABLE transaction_detail ( 
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    transaction_id NUMBER NOT NULL, 
    product_code VARCHAR2(50) NOT NULL,
    amount NUMBER(10,2) NOT NULL CHECK (amount > 0), 
    unitary_price NUMBER(10,2) CHECK (unitary_price >= 0), 
    subtotal NUMBER(12,2) GENERATED ALWAYS AS (amount * unitary_price) VIRTUAL 
);
COMMIT;