-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2024-09-25 20:46:15 CST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE correo_jug (
    cod_correo          VARCHAR2(10 BYTE) NOT NULL,
    correo_jugador      VARCHAR2(25 BYTE),
    jugador_cod_jugador INTEGER NOT NULL
);

ALTER TABLE correo_jug ADD CONSTRAINT correo_jug_pk PRIMARY KEY ( cod_correo );

CREATE TABLE correo_pres (
    cod_correo_presi          VARCHAR2(10 BYTE) NOT NULL,
    correo_presidente         VARCHAR2(25 BYTE),
    presidente_dpi_presidente INTEGER NOT NULL
);

ALTER TABLE correo_pres ADD CONSTRAINT correo_pres_pk PRIMARY KEY ( cod_correo_presi );

CREATE TABLE departamento (
    cod_departamento VARCHAR2(10 BYTE) NOT NULL,
    nombre_depto     VARCHAR2(25 BYTE)
);

ALTER TABLE departamento ADD CONSTRAINT departamento_pk PRIMARY KEY ( cod_departamento );

CREATE TABLE equipo (
    cod_equipo                    INTEGER NOT NULL,
    nombre_equipo                 VARCHAR2(25 BYTE),
    nombre_estadio                VARCHAR2(25 BYTE),
    capacidad                     VARCHAR2(10 BYTE),
    anio_fundacion                VARCHAR2(25 BYTE),
    departamento_cod_departamento VARCHAR2(10 BYTE) NOT NULL
);

ALTER TABLE equipo ADD CONSTRAINT equipo_pk PRIMARY KEY ( cod_equipo );

CREATE TABLE equipo_partido (
    id_jornada          VARCHAR2(10 BYTE) NOT NULL,
    equipo_local        VARCHAR2(25 BYTE),
    equipo_visitante    VARCHAR2(25 BYTE),
    equipo_cod_equipo   INTEGER NOT NULL,
    partido_cod_partido INTEGER NOT NULL
);

ALTER TABLE equipo_partido ADD CONSTRAINT equipo_partido_pk PRIMARY KEY ( id_jornada );

CREATE TABLE gol (
    cod_gol             VARCHAR2(10 BYTE) NOT NULL,
    min_gol             DATE,
    descripcion_gol     VARCHAR2(100 BYTE),
    jugador_cod_jugador INTEGER NOT NULL,
    partido_cod_partido INTEGER NOT NULL
);

ALTER TABLE gol ADD CONSTRAINT gol_pk PRIMARY KEY ( cod_gol );

CREATE TABLE jugador (
    cod_jugador             INTEGER NOT NULL,
    nombre1                 VARCHAR2(25 BYTE),
    nombre2                 VARCHAR2(25 BYTE),
    nombre3                 VARCHAR2(25 BYTE),
    apellido1               VARCHAR2(25 BYTE),
    apellido2               VARCHAR2(25 BYTE),
    fecha_nac               DATE,
    posicion                VARCHAR2(25 BYTE),
    municipio_cod_municipio VARCHAR2(10 BYTE) NOT NULL,
    equipo_cod_equipo       INTEGER NOT NULL
);

ALTER TABLE jugador ADD CONSTRAINT jugador_pk PRIMARY KEY ( cod_jugador );

CREATE TABLE municipio (
    cod_municipio                 VARCHAR2(10 BYTE) NOT NULL,
    nombre_municipio              VARCHAR2(25 BYTE),
    departamento_cod_departamento VARCHAR2(10 BYTE) NOT NULL
);

ALTER TABLE municipio ADD CONSTRAINT municipio_pk PRIMARY KEY ( cod_municipio );

CREATE TABLE partido (
    cod_partido     INTEGER NOT NULL,
    fecha_partido   DATE,
    cant_gol_local  VARCHAR2(10 BYTE),
    cant_gol_visita VARCHAR2(10 BYTE)
);

ALTER TABLE partido ADD CONSTRAINT partido_pk PRIMARY KEY ( cod_partido );

CREATE TABLE presidente (
    dpi_presidente                INTEGER NOT NULL,
    nombre1                       VARCHAR2(25 BYTE),
    nombre2                       VARCHAR2(25 BYTE),
    nombre3                       VARCHAR2(25 BYTE),
    apellido1                     VARCHAR2(25 BYTE),
    apellido2                     VARCHAR2(25 BYTE),
    fecha_nac                     DATE,
    anio_inicio                   VARCHAR2(25 BYTE),
    departamento_cod_departamento VARCHAR2(10 BYTE) NOT NULL,
    municipio_cod_municipio       VARCHAR2(10 BYTE) NOT NULL,
    equipo_cod_equipo             INTEGER NOT NULL
);

CREATE UNIQUE INDEX presidente__idx ON
    presidente (
        equipo_cod_equipo
    ASC );

ALTER TABLE presidente ADD CONSTRAINT presidente_pk PRIMARY KEY ( dpi_presidente );

ALTER TABLE correo_jug
    ADD CONSTRAINT correo_jug_jugador_fk FOREIGN KEY ( jugador_cod_jugador )
        REFERENCES jugador ( cod_jugador );

ALTER TABLE correo_pres
    ADD CONSTRAINT correo_pres_presidente_fk FOREIGN KEY ( presidente_dpi_presidente )
        REFERENCES presidente ( dpi_presidente );

ALTER TABLE equipo
    ADD CONSTRAINT equipo_departamento_fk FOREIGN KEY ( departamento_cod_departamento )
        REFERENCES departamento ( cod_departamento );

ALTER TABLE equipo_partido
    ADD CONSTRAINT equipo_partido_equipo_fk FOREIGN KEY ( equipo_cod_equipo )
        REFERENCES equipo ( cod_equipo );

ALTER TABLE equipo_partido
    ADD CONSTRAINT equipo_partido_partido_fk FOREIGN KEY ( partido_cod_partido )
        REFERENCES partido ( cod_partido );

ALTER TABLE gol
    ADD CONSTRAINT gol_jugador_fk FOREIGN KEY ( jugador_cod_jugador )
        REFERENCES jugador ( cod_jugador );

ALTER TABLE gol
    ADD CONSTRAINT gol_partido_fk FOREIGN KEY ( partido_cod_partido )
        REFERENCES partido ( cod_partido );

ALTER TABLE jugador
    ADD CONSTRAINT jugador_equipo_fk FOREIGN KEY ( equipo_cod_equipo )
        REFERENCES equipo ( cod_equipo );

ALTER TABLE jugador
    ADD CONSTRAINT jugador_municipio_fk FOREIGN KEY ( municipio_cod_municipio )
        REFERENCES municipio ( cod_municipio );

ALTER TABLE municipio
    ADD CONSTRAINT municipio_departamento_fk FOREIGN KEY ( departamento_cod_departamento )
        REFERENCES departamento ( cod_departamento );

ALTER TABLE presidente
    ADD CONSTRAINT presidente_departamento_fk FOREIGN KEY ( departamento_cod_departamento )
        REFERENCES departamento ( cod_departamento );

ALTER TABLE presidente
    ADD CONSTRAINT presidente_equipo_fk FOREIGN KEY ( equipo_cod_equipo )
        REFERENCES equipo ( cod_equipo );

ALTER TABLE presidente
    ADD CONSTRAINT presidente_municipio_fk FOREIGN KEY ( municipio_cod_municipio )
        REFERENCES municipio ( cod_municipio );



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
