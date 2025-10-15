-- =================================================================
-- CREACIÓN DE TABLAS (ANDRE_DEV - DEV1)
-- Tablas: user_table, rol, client, transactions, report, departament, province, district
-- =================================================================

-- 1. Tabla: rol
CREATE TABLE rol (
    id NUMBER(10) NOT NULL,
    name VARCHAR2(100) NOT NULL,
    CONSTRAINT pk_rol PRIMARY KEY (id),
    CONSTRAINT uk_rol_name UNIQUE (name)
);

-- 2. Tabla: user_table (Reemplaza a MANAGER)
CREATE TABLE user_table (
    id NUMBER(10) NOT NULL,
    rol_id NUMBER(10) NOT NULL,
    username VARCHAR2(50) NOT NULL,
    password VARCHAR2(255) NOT NULL,
    first_name VARCHAR2(100),
    last_name VARCHAR2(100),
    email VARCHAR2(100),
    CONSTRAINT pk_user_table PRIMARY KEY (id),
    CONSTRAINT uk_user_table_username UNIQUE (username)
);

-- 3. Tabla: client
CREATE TABLE client (
    id NUMBER(10) NOT NULL,
    user_id NUMBER(10) NOT NULL,
    address VARCHAR2(255),
    phone VARCHAR2(20),
    CONSTRAINT pk_client PRIMARY KEY (id)
);

-- 4. Tabla: departament (Para la ubicación)
CREATE TABLE departament (
    id NUMBER(10) NOT NULL,
    name VARCHAR2(100) NOT NULL,
    CONSTRAINT pk_departament PRIMARY KEY (id)
);

-- 5. Tabla: province
CREATE TABLE province (
    id NUMBER(10) NOT NULL,
    departament_id NUMBER(10) NOT NULL,
    name VARCHAR2(100) NOT NULL,
    CONSTRAINT pk_province PRIMARY KEY (id)
);

-- 6. Tabla: district
CREATE TABLE district (
    id NUMBER(10) NOT NULL,
    province_id NUMBER(10) NOT NULL,
    name VARCHAR2(100) NOT NULL,
    CONSTRAINT pk_district PRIMARY KEY (id)
);

-- 7. Tabla: report
CREATE TABLE report (
    id NUMBER(10) NOT NULL,
    manager_id NUMBER(10) NOT NULL, -- FK a user_table.id
    report_date DATE DEFAULT SYSDATE,
    total_amount NUMBER(12, 2) DEFAULT 0.00,
    CONSTRAINT pk_report PRIMARY KEY (id)
);

-- 8. Tabla: transactions
CREATE TABLE transactions (
    id NUMBER(10) NOT NULL,
    client_id NUMBER(10) NOT NULL,
    transaction_date DATE DEFAULT SYSDATE,
    total NUMBER(12, 2) DEFAULT 0.00,
    CONSTRAINT pk_transactions PRIMARY KEY (id)
);

-- 9. Secuencias para las tablas de ANDRE_DEV
CREATE SEQUENCE sq_rol_id START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE sq_user_table_id START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE sq_client_id START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE sq_departament_id START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE sq_province_id START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE sq_district_id START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE sq_report_id START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE sq_transactions_id START WITH 1 INCREMENT BY 1;