-- Nexlink Production Database Dump
-- Generated: 2023-10-28 03:00:01 UTC
-- Host: prod-db01.nexlink.fr
-- Database: nexlink_production
-- Dumped by: pg_dump 15.4 (Ubuntu 15.4-2.pgdg22.04+1)
-- !! CONFIDENTIAL – DO NOT DISTRIBUTE !!

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

-- ----------------------------------------------------------------
-- Table: users (excerpt – first 20 rows for brevity in dump header)
-- ----------------------------------------------------------------
INSERT INTO users (id,email,password_hash,first_name,last_name,role,department,phone,is_active,created_at) VALUES
(1,'thomas.martin@nexlink.fr','$2b$12$8K9mNpLqRvW3xYzA1bCdEuFg5hIjKlMnOpQrStUvWxYzAbCdEfGhIj','Thomas','Martin','admin','IT','+33612345678',true,'2021-03-15 08:00:00'),
(2,'sophie.bernard@nexlink.fr','$2b$12$2CdEfGhIjKlMnOpQrStUvW3xYzA1bCdEuFg5hIjKlMnOpQrStUvWx','Sophie','Bernard','manager','HR','+33687654321',true,'2021-04-01 09:15:00'),
(3,'nicolas.dubois@nexlink.fr','$2b$12$1bCdEuFg5hIjKlMnOpQrStUvWxYzA2CdEfGhIjKlMnOpQrStUvW3x','Nicolas','Dubois','user','Engineering','+33601122334',true,'2021-05-20 10:30:00'),
(4,'julie.thomas@nexlink.fr','$2b$12$vW3xYzA1bCdEuFg5hIjKlMnOpQrStUvWxYzA2CdEfGhIjKlMnOpQr','Julie','Thomas','user','Marketing','+33699887766',true,'2021-06-10 11:45:00'),
(5,'alexis.roux@nexlink.fr','$2b$12$nOpQrStUvWxYzA1bCdEuFg5hIjKlMnOpQrStUvW3xYzA2CdEfGhIj','Alexis','Roux','user','Sales','+33677665544',true,'2021-07-05 14:00:00'),
(6,'camille.fournier@nexlink.fr','$2b$12$zAbCdEfGhIjKlMnOpQrStUvWxY1bCdEuFg5hIjKlMnOpQrStUvW3x','Camille','Fournier','user','Finance','+33644332211',false,'2021-08-01 16:00:00'),
(7,'david.morel@nexlink.fr','$2b$12$QrStUvW3xYzA1bCdEuFg5hIjKlMnOpQrStUvWxYzA2CdEfGhIjKlMn','David','Morel','super_admin','Management','+33611223344',true,'2020-01-10 08:00:00'),
(8,'lea.girard@nexlink.fr','$2b$12$hIjKlMnOpQrStUvWxYzA1bCdEuFg5hIjKlMnOpQrStUvW3xYzA2Cd','Léa','Girard','user','Support','+33655443322',true,'2022-01-15 09:00:00'),
(9,'romain.andre@nexlink.fr','$2b$12$lMnOpQrStUvWxYzA2CdEuFg5hIjKlMnOpQrStUvW3xYzA1bCdEfGh','Romain','André','manager','Engineering','+33633221100',true,'2022-02-20 10:00:00'),
(10,'manon.lefevre@nexlink.fr','$2b$12$3xYzA1bCdEuFg5hIjKlMnOpQrStUvWxYzA2CdEfGhIjKlMnOpQrSt','Manon','Lefèvre','user','R&D','+33677889900',true,'2022-03-01 11:00:00');

-- ----------------------------------------------------------------
-- Table: api_keys (active tokens)
-- ----------------------------------------------------------------
INSERT INTO api_keys (id,user_id,key_hash,name,scopes,expires_at) VALUES
(1,7,'7f3d9a2c1b4e8f6d0a5c3e7b9f1d2a4c6b8e0f2d4a6c8e0a2c4e6f8a0b2d4f6','Production Internal Key','{"read","write","admin"}','2024-12-31 23:59:59'),
(2,1,'a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0c1d2e3f4a5b6c7d8e9f0a1b2','Admin API Key','{"read","write"}','2024-06-30 23:59:59'),
(3,9,'b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0c1d2e3f4a5b6c7d8e9f0a1b2c3','R&D Integration Key','{"read"}','2024-03-15 23:59:59');

-- ----------------------------------------------------------------
-- Table: system_config
-- ----------------------------------------------------------------
CREATE TABLE IF NOT EXISTS system_config (
    key   VARCHAR(100) PRIMARY KEY,
    value TEXT,
    updated_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO system_config (key, value) VALUES
('maintenance_mode','false'),
('registration_open','true'),
('max_login_attempts','5'),
('session_timeout_minutes','60'),
('backup_encryption_key','NxBck_3ncrypt_K3y_AES256_2023!'),
('smtp_password','Sm1tp_N3Xl1nk_2023!'),
('stripe_secret','NX_stRipe_fAke_K3y_4eC39HqLyjW2023'),
('aws_secret','wJalrXUtnFEMI/K7MDENG/bPxRfiCYNEXLINKKEY'),
('jwt_secret','NxL1nk_JWT_$3cr3t_K3y_2023_d0_n0t_sh4r3'),
('ldap_bind_password','Ldap_N3Xl1nk_B1nd_2023!');
