-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2024-09-25 22:25:25 CST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE cama (
    id_cama                    INTEGER NOT NULL,
    fecha_asignacion           DATE,
    paciente_cama_cod_traslado VARCHAR2(10 BYTE) NOT NULL,
    planta_planta_id           NUMBER NOT NULL
);

ALTER TABLE cama ADD CONSTRAINT cama_pk PRIMARY KEY ( id_cama );

CREATE TABLE correo_electronico (
    cod_correo        INTEGER NOT NULL,
    correo            VARCHAR2(25 BYTE),
    medico_cod_medico VARCHAR2(10 BYTE) NOT NULL
);

ALTER TABLE correo_electronico ADD CONSTRAINT correo_electronico_pk PRIMARY KEY ( cod_correo );

CREATE TABLE departamento (
    cod_departamento VARCHAR2(10 BYTE) NOT NULL,
    nombre_depto     VARCHAR2(25 BYTE)
);

ALTER TABLE departamento ADD CONSTRAINT departamento_pk PRIMARY KEY ( cod_departamento );

CREATE TABLE diagnostico (
    cod_diagnostico INTEGER NOT NULL,
    descripcion     VARCHAR2(25 BYTE)
);

ALTER TABLE diagnostico ADD CONSTRAINT diagnostico_pk PRIMARY KEY ( cod_diagnostico );

CREATE TABLE med_diagnostico (
    id_informe_medico           VARCHAR2(10 BYTE) NOT NULL,
    fecha_diagnostico           DATE,
    diagnostico_cod_diagnostico INTEGER NOT NULL,
    medico_cod_medico           VARCHAR2(10 BYTE) NOT NULL
);

ALTER TABLE med_diagnostico ADD CONSTRAINT med_diagnostico_pk PRIMARY KEY ( id_informe_medico );

CREATE TABLE medico (
    cod_medico              VARCHAR2(10 BYTE) NOT NULL,
    nombre1                 VARCHAR2(25 BYTE),
    nombre2                 VARCHAR2(25 BYTE),
    nombre3                 VARCHAR2(25 BYTE),
    apellido1               VARCHAR2(25 BYTE),
    apellido2               VARCHAR2(25 BYTE),
    direccion               VARCHAR2(50 BYTE),
    municipio_cod_municipio VARCHAR2(10 BYTE) NOT NULL
);

ALTER TABLE medico ADD CONSTRAINT medico_pk PRIMARY KEY ( cod_medico );

CREATE TABLE medico_paciente (
    cod_visita            INTEGER NOT NULL,
    fecha_visita          DATE,
    hora_visita           DATE,
    paciente_cod_paciente VARCHAR2(10 BYTE) NOT NULL,
    medico_cod_medico     VARCHAR2(10 BYTE) NOT NULL
);

ALTER TABLE medico_paciente ADD CONSTRAINT medico_paciente_pk PRIMARY KEY ( cod_visita );

CREATE TABLE municipio (
    cod_municipio                 VARCHAR2(10 BYTE) NOT NULL,
    nombre_municipio              VARCHAR2(25 BYTE),
    departamento_cod_departamento VARCHAR2(10 BYTE) NOT NULL
);

ALTER TABLE municipio ADD CONSTRAINT municipio_pk PRIMARY KEY ( cod_municipio );

CREATE TABLE pac_diagnostico (
    cod_informe_paciente        VARCHAR2(10 BYTE) NOT NULL,
    fecha_diagnostico           DATE,
    paciente_cod_paciente       VARCHAR2(10 BYTE) NOT NULL,
    diagnostico_cod_diagnostico INTEGER NOT NULL
);

ALTER TABLE pac_diagnostico ADD CONSTRAINT pac_diagnostico_pk PRIMARY KEY ( cod_informe_paciente );

CREATE TABLE paciente (
    cod_paciente            VARCHAR2(10 BYTE) NOT NULL,
    no_seguridad_social     VARCHAR2(20 BYTE) NOT NULL,
    nombre1                 VARCHAR2(25 BYTE),
    nombre2                 VARCHAR2(25),
    nombre3                 VARCHAR2(25 BYTE),
    apellido1               VARCHAR2(25 BYTE),
    apellido2               VARCHAR2(25 BYTE),
    fecha_nac               DATE,
    municipio_cod_municipio VARCHAR2(10 BYTE) NOT NULL
);

ALTER TABLE paciente ADD CONSTRAINT paciente_pk PRIMARY KEY ( cod_paciente );

CREATE TABLE paciente_cama (
    cod_traslado          VARCHAR2(10 BYTE) NOT NULL,
    motivo_traslado       VARCHAR2(30 BYTE),
    paciente_cod_paciente VARCHAR2(10 BYTE) NOT NULL
);

ALTER TABLE paciente_cama ADD CONSTRAINT paciente_cama_pk PRIMARY KEY ( cod_traslado );

CREATE TABLE planta (
    id_planta     INTEGER,
    nombre_planta VARCHAR2(25 BYTE),
    cantidad_cama VARCHAR2(10 BYTE),
    planta_id     NUMBER NOT NULL
);

ALTER TABLE planta ADD CONSTRAINT planta_pk PRIMARY KEY ( planta_id );

CREATE TABLE tarjeta_visita (
    id_tarjeta1           INTEGER NOT NULL,
    hora_inicio_visita    DATE,
    hora_final_visita     DATE,
    paciente_cod_paciente VARCHAR2(10 BYTE) NOT NULL
);

ALTER TABLE tarjeta_visita ADD CONSTRAINT tarjeta_visita_pk PRIMARY KEY ( id_tarjeta1 );

CREATE TABLE telefono (
    id_telefono       INTEGER NOT NULL,
    no_de_telefono    VARCHAR2(15 BYTE),
    medico_cod_medico VARCHAR2(10 BYTE) NOT NULL
);

ALTER TABLE telefono ADD CONSTRAINT telefono_pk PRIMARY KEY ( id_telefono );

ALTER TABLE cama
    ADD CONSTRAINT cama_paciente_cama_fk FOREIGN KEY ( paciente_cama_cod_traslado )
        REFERENCES paciente_cama ( cod_traslado );

ALTER TABLE cama
    ADD CONSTRAINT cama_planta_fk FOREIGN KEY ( planta_planta_id )
        REFERENCES planta ( planta_id );

ALTER TABLE correo_electronico
    ADD CONSTRAINT correo_electronico_medico_fk FOREIGN KEY ( medico_cod_medico )
        REFERENCES medico ( cod_medico );

ALTER TABLE med_diagnostico
    ADD CONSTRAINT med_diagnostico_diagnostico_fk FOREIGN KEY ( diagnostico_cod_diagnostico )
        REFERENCES diagnostico ( cod_diagnostico );

ALTER TABLE med_diagnostico
    ADD CONSTRAINT med_diagnostico_medico_fk FOREIGN KEY ( medico_cod_medico )
        REFERENCES medico ( cod_medico );

ALTER TABLE medico
    ADD CONSTRAINT medico_municipio_fk FOREIGN KEY ( municipio_cod_municipio )
        REFERENCES municipio ( cod_municipio );

ALTER TABLE medico_paciente
    ADD CONSTRAINT medico_paciente_medico_fk FOREIGN KEY ( medico_cod_medico )
        REFERENCES medico ( cod_medico );

ALTER TABLE medico_paciente
    ADD CONSTRAINT medico_paciente_paciente_fk FOREIGN KEY ( paciente_cod_paciente )
        REFERENCES paciente ( cod_paciente );

ALTER TABLE municipio
    ADD CONSTRAINT municipio_departamento_fk FOREIGN KEY ( departamento_cod_departamento )
        REFERENCES departamento ( cod_departamento );

ALTER TABLE pac_diagnostico
    ADD CONSTRAINT pac_diagnostico_diagnostico_fk FOREIGN KEY ( diagnostico_cod_diagnostico )
        REFERENCES diagnostico ( cod_diagnostico );

ALTER TABLE pac_diagnostico
    ADD CONSTRAINT pac_diagnostico_paciente_fk FOREIGN KEY ( paciente_cod_paciente )
        REFERENCES paciente ( cod_paciente );

ALTER TABLE paciente_cama
    ADD CONSTRAINT paciente_cama_paciente_fk FOREIGN KEY ( paciente_cod_paciente )
        REFERENCES paciente ( cod_paciente );

ALTER TABLE paciente
    ADD CONSTRAINT paciente_municipio_fk FOREIGN KEY ( municipio_cod_municipio )
        REFERENCES municipio ( cod_municipio );

ALTER TABLE tarjeta_visita
    ADD CONSTRAINT tarjeta_visita_paciente_fk FOREIGN KEY ( paciente_cod_paciente )
        REFERENCES paciente ( cod_paciente );

ALTER TABLE telefono
    ADD CONSTRAINT telefono_medico_fk FOREIGN KEY ( medico_cod_medico )
        REFERENCES medico ( cod_medico );

CREATE SEQUENCE planta_planta_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER planta_planta_id_trg BEFORE
    INSERT ON planta
    FOR EACH ROW
    WHEN ( new.planta_id IS NULL )
BEGIN
    :new.planta_id := planta_planta_id_seq.nextval;
END;
/



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            14
-- CREATE INDEX                             0
-- ALTER TABLE                             29
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           1
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
-- CREATE SEQUENCE                          1
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
