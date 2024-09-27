-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2024-09-25 19:56:39 CST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE clase_vuelo (
    cod_clase    VARCHAR2(10 BYTE) NOT NULL,
    nombre_clase VARCHAR2(50 BYTE)
);

ALTER TABLE clase_vuelo ADD CONSTRAINT clase_vuelo_pk PRIMARY KEY ( cod_clase );

CREATE TABLE correo_electronico (
    cod_correo          VARCHAR2(10 BYTE) NOT NULL,
    correo              VARCHAR2(50 BYTE),
    turista_cod_turista INTEGER NOT NULL
);

ALTER TABLE correo_electronico ADD CONSTRAINT correo_electronico_pk PRIMARY KEY ( cod_correo );

CREATE TABLE hotel (
    cod_hotel    VARCHAR2(10 BYTE) NOT NULL,
    nombre_hotel VARCHAR2(100 BYTE),
    direccion    VARCHAR2(100 BYTE),
    ciudad       VARCHAR2(30 BYTE),
    numero_plaza INTEGER
);

ALTER TABLE hotel ADD CONSTRAINT hotel_pk PRIMARY KEY ( cod_hotel );

CREATE TABLE regimen_h (
    cod_regimen    VARCHAR2(10 BYTE) NOT NULL,
    nombre_regimen VARCHAR2(10)
);

ALTER TABLE regimen_h ADD CONSTRAINT regimen_hospedaje_pk PRIMARY KEY ( cod_regimen );

CREATE TABLE sucursal (
    cod_sucursal VARCHAR2(10 BYTE) NOT NULL,
    direccion    VARCHAR2(75 BYTE) NOT NULL
);

ALTER TABLE sucursal ADD CONSTRAINT sucursal_pk PRIMARY KEY ( cod_sucursal );

CREATE TABLE telefono (
    id_telefono           VARCHAR2(20 BYTE) NOT NULL,
    no_de_telefono        VARCHAR2(20 BYTE),
    sucursal_cod_sucursal VARCHAR2(10 BYTE) NOT NULL,
    hotel_cod_hotel       VARCHAR2(10 BYTE) NOT NULL,
    turista_cod_turista   INTEGER NOT NULL
);

ALTER TABLE telefono ADD CONSTRAINT telefono_pk PRIMARY KEY ( id_telefono );

CREATE TABLE turista (
    cod_turista     INTEGER NOT NULL,
    nombre1         VARCHAR2(50 BYTE),
    nombre2         VARCHAR2(50 BYTE),
    nombre3         VARCHAR2(50 BYTE),
    apellido1       VARCHAR2(50 BYTE),
    apellido2       VARCHAR2(50 BYTE),
    direccion       VARCHAR2(100 BYTE),
    pais_residencia VARCHAR2(25 BYTE)
);

ALTER TABLE turista ADD CONSTRAINT turista_pk PRIMARY KEY ( cod_turista );

CREATE TABLE turista_hotel (
    cod_hospedaje         VARCHAR2(10 BYTE) NOT NULL,
    fecha_llegada         DATE,
    fecha_partida         DATE,
    hotel_cod_hotel       VARCHAR2(10 BYTE) NOT NULL,
    turista_cod_turista   INTEGER NOT NULL,
    regimen_h_cod_regimen VARCHAR2(10 BYTE) NOT NULL
);

ALTER TABLE turista_hotel ADD CONSTRAINT turista_hotel_pk PRIMARY KEY ( cod_hospedaje );

CREATE TABLE turista_sucursal (
    cod_contra            VARCHAR2(10 BYTE) NOT NULL,
    fecha_contratacion    DATE,
    sucursal_cod_sucursal VARCHAR2(10 BYTE) NOT NULL,
    turista_cod_turista   INTEGER NOT NULL
);

ALTER TABLE turista_sucursal ADD CONSTRAINT turista_sucursal_pk PRIMARY KEY ( cod_contra );

CREATE TABLE turista_vuelo (
    cod_reserva           VARCHAR2(10 BYTE) NOT NULL,
    fecha_reservacion     DATE,
    turista_cod_turista   INTEGER NOT NULL,
    vuelo_numero_vuelo    INTEGER NOT NULL,
    clase_vuelo_cod_clase VARCHAR2(10 BYTE) NOT NULL
);

ALTER TABLE turista_vuelo ADD CONSTRAINT turista_vuelo_pk PRIMARY KEY ( cod_reserva );

CREATE TABLE vuelo (
    numero_vuelo  INTEGER NOT NULL,
    fecha_hora    DATE,
    origen        VARCHAR2(100 BYTE),
    destino       VARCHAR2(100 BYTE),
    plaza_total   INTEGER,
    plaza_turista INTEGER
);

ALTER TABLE vuelo ADD CONSTRAINT vuelo_pk PRIMARY KEY ( numero_vuelo );

ALTER TABLE correo_electronico
    ADD CONSTRAINT correo_electronico_turista_fk FOREIGN KEY ( turista_cod_turista )
        REFERENCES turista ( cod_turista );

ALTER TABLE telefono
    ADD CONSTRAINT telefono_hotel_fk FOREIGN KEY ( hotel_cod_hotel )
        REFERENCES hotel ( cod_hotel );

ALTER TABLE telefono
    ADD CONSTRAINT telefono_sucursal_fk FOREIGN KEY ( sucursal_cod_sucursal )
        REFERENCES sucursal ( cod_sucursal );

ALTER TABLE telefono
    ADD CONSTRAINT telefono_turista_fk FOREIGN KEY ( turista_cod_turista )
        REFERENCES turista ( cod_turista );

ALTER TABLE turista_hotel
    ADD CONSTRAINT turista_hotel_hotel_fk FOREIGN KEY ( hotel_cod_hotel )
        REFERENCES hotel ( cod_hotel );

ALTER TABLE turista_hotel
    ADD CONSTRAINT turista_hotel_regimen_h_fk FOREIGN KEY ( regimen_h_cod_regimen )
        REFERENCES regimen_h ( cod_regimen );

ALTER TABLE turista_hotel
    ADD CONSTRAINT turista_hotel_turista_fk FOREIGN KEY ( turista_cod_turista )
        REFERENCES turista ( cod_turista );

ALTER TABLE turista_sucursal
    ADD CONSTRAINT turista_sucursal_sucursal_fk FOREIGN KEY ( sucursal_cod_sucursal )
        REFERENCES sucursal ( cod_sucursal );

ALTER TABLE turista_sucursal
    ADD CONSTRAINT turista_sucursal_turista_fk FOREIGN KEY ( turista_cod_turista )
        REFERENCES turista ( cod_turista );

ALTER TABLE turista_vuelo
    ADD CONSTRAINT turista_vuelo_clase_vuelo_fk FOREIGN KEY ( clase_vuelo_cod_clase )
        REFERENCES clase_vuelo ( cod_clase );

ALTER TABLE turista_vuelo
    ADD CONSTRAINT turista_vuelo_turista_fk FOREIGN KEY ( turista_cod_turista )
        REFERENCES turista ( cod_turista );

ALTER TABLE turista_vuelo
    ADD CONSTRAINT turista_vuelo_vuelo_fk FOREIGN KEY ( vuelo_numero_vuelo )
        REFERENCES vuelo ( numero_vuelo );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            11
-- CREATE INDEX                             0
-- ALTER TABLE                             23
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
