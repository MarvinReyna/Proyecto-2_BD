-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2024-09-25 21:34:30 CST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE amarre (
    id_amarre                  VARCHAR2(10 BYTE) NOT NULL,
    numero_amarre              VARCHAR2(10 BYTE),
    lectura_contador_agua      VARCHAR2(25 BYTE),
    lectura_contador_luz       VARCHAR2(25 BYTE),
    mant_contratado            VARCHAR2(25 BYTE),
    fecha_asignacion           DATE,
    embarcacion_id_embarcacion INTEGER NOT NULL,
    zona_id_zona               INTEGER NOT NULL,
    socio_id_socio             VARCHAR2(10 BYTE) NOT NULL
);

CREATE UNIQUE INDEX amarre__idx ON
    amarre (
        embarcacion_id_embarcacion
    ASC );

ALTER TABLE amarre ADD CONSTRAINT amarre_pk PRIMARY KEY ( id_amarre );

CREATE TABLE correo_electronico (
    cod_correo           VARCHAR2(10 BYTE) NOT NULL,
    correo               VARCHAR2(25 BYTE),
    socio_id_socio       VARCHAR2(10 BYTE) NOT NULL,
    empleado_id_empleado VARCHAR2(10 BYTE) NOT NULL
);

ALTER TABLE correo_electronico ADD CONSTRAINT correo_electronico_pk PRIMARY KEY ( cod_correo );

CREATE TABLE departamento (
    cod_departamento VARCHAR2(10 BYTE) NOT NULL,
    nombre_depto     VARCHAR2(25 BYTE)
);

ALTER TABLE departamento ADD CONSTRAINT departamento_pk PRIMARY KEY ( cod_departamento );

CREATE TABLE embarcacion (
    id_embarcacion INTEGER NOT NULL,
    matricula      VARCHAR2(10 BYTE),
    nombre_emb     VARCHAR2(25 BYTE),
    tipo           VARCHAR2(25 BYTE),
    dimension      VARCHAR2(30 BYTE),
    socio_id_socio VARCHAR2(10 BYTE) NOT NULL
);

ALTER TABLE embarcacion ADD CONSTRAINT embarcacion_pk PRIMARY KEY ( id_embarcacion );

CREATE TABLE empl_zona (
    id_asignacion        VARCHAR2(10 BYTE) NOT NULL,
    no_barco_encargado   VARCHAR2(10 BYTE),
    empleado_id_empleado VARCHAR2(10 BYTE) NOT NULL,
    zona_id_zona         INTEGER NOT NULL
);

ALTER TABLE empl_zona ADD CONSTRAINT empl_zona_pk PRIMARY KEY ( id_asignacion );

CREATE TABLE empleado (
    id_empleado             VARCHAR2(10 BYTE) NOT NULL,
    dpi_empleado            VARCHAR2(15 BYTE) NOT NULL,
    nombre1                 VARCHAR2(25 BYTE) NOT NULL,
    nombre2                 VARCHAR2(25 BYTE),
    nombre3                 VARCHAR2(25 BYTE),
    apellido1               VARCHAR2(25 BYTE),
    apellido2               VARCHAR2(25 BYTE),
    direccion               VARCHAR2(50 BYTE),
    municipio_cod_municipio VARCHAR2(10 BYTE) NOT NULL
);

ALTER TABLE empleado ADD CONSTRAINT empleado_pk PRIMARY KEY ( id_empleado );

CREATE TABLE municipio (
    cod_municipio                 VARCHAR2(10 BYTE) NOT NULL,
    nombre_municipio              VARCHAR2(25 BYTE),
    departamento_cod_departamento VARCHAR2(10 BYTE) NOT NULL
);

ALTER TABLE municipio ADD CONSTRAINT municipio_pk PRIMARY KEY ( cod_municipio );

CREATE TABLE socio (
    id_socio                VARCHAR2(10 BYTE) NOT NULL,
    nombre1                 VARCHAR2(25 BYTE),
    nombre2                 VARCHAR2(25 BYTE),
    nombre3                 VARCHAR2(25 BYTE),
    apellido1               VARCHAR2(25 BYTE),
    apellido2               VARCHAR2(25 BYTE),
    direccion               VARCHAR2(50 BYTE),
    dpi_socio               VARCHAR2(15 BYTE),
    fecha_ingreso           DATE,
    municipio_cod_municipio VARCHAR2(10 BYTE) NOT NULL
);

ALTER TABLE socio ADD CONSTRAINT socio_pk PRIMARY KEY ( id_socio );

CREATE TABLE telefono (
    id_telefono          VARCHAR2(15 BYTE) NOT NULL,
    no_de_telefono       VARCHAR2(15 BYTE),
    socio_id_socio       VARCHAR2(10 BYTE) NOT NULL,
    empleado_id_empleado VARCHAR2(10 BYTE) NOT NULL
);

ALTER TABLE telefono ADD CONSTRAINT telefono_pk PRIMARY KEY ( id_telefono );

CREATE TABLE zona (
    id_zona      INTEGER NOT NULL,
    nombre_zona  VARCHAR2(25 BYTE),
    tipo_barco   VARCHAR2(25 BYTE),
    numero_barco VARCHAR2(10 BYTE),
    profundidad  VARCHAR2(25 BYTE),
    ancho_amarre VARCHAR2(25 BYTE)
);

ALTER TABLE zona ADD CONSTRAINT zona_pk PRIMARY KEY ( id_zona );

ALTER TABLE amarre
    ADD CONSTRAINT amarre_embarcacion_fk FOREIGN KEY ( embarcacion_id_embarcacion )
        REFERENCES embarcacion ( id_embarcacion );

ALTER TABLE amarre
    ADD CONSTRAINT amarre_socio_fk FOREIGN KEY ( socio_id_socio )
        REFERENCES socio ( id_socio );

ALTER TABLE amarre
    ADD CONSTRAINT amarre_zona_fk FOREIGN KEY ( zona_id_zona )
        REFERENCES zona ( id_zona );

ALTER TABLE correo_electronico
    ADD CONSTRAINT correo_electronico_empleado_fk FOREIGN KEY ( empleado_id_empleado )
        REFERENCES empleado ( id_empleado );

ALTER TABLE correo_electronico
    ADD CONSTRAINT correo_electronico_socio_fk FOREIGN KEY ( socio_id_socio )
        REFERENCES socio ( id_socio );

ALTER TABLE embarcacion
    ADD CONSTRAINT embarcacion_socio_fk FOREIGN KEY ( socio_id_socio )
        REFERENCES socio ( id_socio );

ALTER TABLE empl_zona
    ADD CONSTRAINT empl_zona_empleado_fk FOREIGN KEY ( empleado_id_empleado )
        REFERENCES empleado ( id_empleado );

ALTER TABLE empl_zona
    ADD CONSTRAINT empl_zona_zona_fk FOREIGN KEY ( zona_id_zona )
        REFERENCES zona ( id_zona );

ALTER TABLE empleado
    ADD CONSTRAINT empleado_municipio_fk FOREIGN KEY ( municipio_cod_municipio )
        REFERENCES municipio ( cod_municipio );

ALTER TABLE municipio
    ADD CONSTRAINT municipio_departamento_fk FOREIGN KEY ( departamento_cod_departamento )
        REFERENCES departamento ( cod_departamento );

ALTER TABLE socio
    ADD CONSTRAINT socio_municipio_fk FOREIGN KEY ( municipio_cod_municipio )
        REFERENCES municipio ( cod_municipio );

ALTER TABLE telefono
    ADD CONSTRAINT telefono_empleado_fk FOREIGN KEY ( empleado_id_empleado )
        REFERENCES empleado ( id_empleado );

ALTER TABLE telefono
    ADD CONSTRAINT telefono_socio_fk FOREIGN KEY ( socio_id_socio )
        REFERENCES socio ( id_socio );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            10
-- CREATE INDEX                             1
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
