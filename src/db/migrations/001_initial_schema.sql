-- Nexlink – Initial schema
-- Migration: 001_initial_schema
-- Author: d.martin@nexlink.fr
-- Date: 2023-01-15

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE users (
    id           SERIAL PRIMARY KEY,
    uuid         UUID DEFAULT uuid_generate_v4() UNIQUE,
    email        VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    first_name   VARCHAR(100),
    last_name    VARCHAR(100),
    phone        VARCHAR(20),
    role         VARCHAR(50) DEFAULT 'user' CHECK (role IN ('user','manager','admin','super_admin')),
    department   VARCHAR(100),
    employee_id  VARCHAR(50),
    is_active    BOOLEAN DEFAULT TRUE,
    email_verified BOOLEAN DEFAULT FALSE,
    two_factor_enabled BOOLEAN DEFAULT FALSE,
    two_factor_secret VARCHAR(100),
    last_login   TIMESTAMP,
    last_ip      VARCHAR(45),
    created_at   TIMESTAMP DEFAULT NOW(),
    updated_at   TIMESTAMP DEFAULT NOW()
);

CREATE TABLE clients (
    id           SERIAL PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL,
    siren        VARCHAR(20),
    siret        VARCHAR(20),
    vat_number   VARCHAR(30),
    address      TEXT,
    city         VARCHAR(100),
    zip_code     VARCHAR(20),
    country      VARCHAR(100) DEFAULT 'France',
    contact_email VARCHAR(255),
    contact_phone VARCHAR(20),
    contract_type VARCHAR(50),
    contract_start DATE,
    contract_end  DATE,
    monthly_fee   DECIMAL(10,2),
    created_at   TIMESTAMP DEFAULT NOW()
);

CREATE TABLE contracts (
    id          SERIAL PRIMARY KEY,
    client_id   INT REFERENCES clients(id),
    user_id     INT REFERENCES users(id),
    contract_ref VARCHAR(50) UNIQUE,
    type         VARCHAR(50),
    status       VARCHAR(50) DEFAULT 'active',
    start_date   DATE,
    end_date     DATE,
    value        DECIMAL(12,2),
    pdf_path     VARCHAR(500),
    signed_at    TIMESTAMP,
    created_at   TIMESTAMP DEFAULT NOW()
);

CREATE TABLE api_keys (
    id          SERIAL PRIMARY KEY,
    user_id     INT REFERENCES users(id),
    key_hash    VARCHAR(255) NOT NULL,
    name        VARCHAR(100),
    scopes      TEXT[],
    expires_at  TIMESTAMP,
    last_used_at TIMESTAMP,
    created_at  TIMESTAMP DEFAULT NOW()
);

CREATE TABLE audit_logs (
    id          SERIAL PRIMARY KEY,
    user_id     INT,
    action      VARCHAR(100),
    resource    VARCHAR(100),
    resource_id INT,
    ip_address  VARCHAR(45),
    user_agent  TEXT,
    payload     JSONB,
    created_at  TIMESTAMP DEFAULT NOW()
);
