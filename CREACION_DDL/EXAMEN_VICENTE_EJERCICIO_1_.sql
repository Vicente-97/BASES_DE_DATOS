--ALTER SESSION SET "_oracle_script"=TRUE;
--CREATE USER VILLARREAL_HINOJO_VICENTE_1 IDENTIFIED BY VILLARREAL_HINOJO_VICENTE_1;
--GRANT CONNECT, RESOURCE, DBA TO VILLARREAL_HINOJO_VICENTE_1;

CREATE TABLE CABALLOS
(CodCaballo VARCHAR2 (4),
Nombre VARCHAR2 (20) NOT NULL,
Peso NUMBER (3),
Fecha_Nacimiento DATE,
Propietario VARCHAR2 (25),
Nacionalidad VARCHAR2 (20),

CONSTRAINT PK_CABALLOS PRIMARY KEY (CodCaballo),
CONSTRAINT CH_CABALLOS CHECK (Peso>=240 AND Peso<=300),
--CONSTRAINT CH1_CABALLOS CHECK ((EXTRACT (YEAR FROM Fecha_Nacimiento > '2000'))),
CONSTRAINT CH2_CABALLOS CHECK (Nacionalidad=UPPER(NACIONALIDAD))
);

CREATE TABLE CARRERAS 
(CodCarrera VARCHAR2 (4),
Fecha_y_Hora DATE,
Importe_Premio NUMBER (6),
ApuestaLimite NUMBER(5,2),

CONSTRAINT PK_CARRERAS PRIMARY KEY (CodCarrera),
CONSTRAINT CH1_CARRERAS CHECK (ApuestaLimite<20000)
--CONSTRAINT CH2_CARRERAS CHECK (EXTRACT(MONTH FROM Fecha_y_Hora NOT IN '3','8'))
);




CREATE TABLE PARTICIPACIONES 
(CodCaballo VARCHAR2 (4),
CodCarrera VARCHAR2 (4),
Dorsal NUMBER (2) NOT NULL,
Jockey VARCHAR2 (10) NOT NULL,
PosicionFinal NUMBER (2),

CONSTRAINT PK_PARTICIPANTES PRIMARY KEY (CodCaballo, CodCarrera),
CONSTRAINT FK_PARTICIPANTES FOREIGN KEY (CodCaballo) REFERENCES CABALLOS (CodCaballo),
CONSTRAINT FK1_PARTICIPANTES FOREIGN KEY (CodCarrera) REFERENCES CARRERAS (CodCarrera),
CONSTRAINT CH_PARTICIPANTES CHECK (PosicionFinal>0)
);

CREATE TABLE CLIENTES 
(DNI VARCHAR2 (10),
Nombre VARCHAR2 (20),
Nacionalidad VARCHAR2 (20),

CONSTRAINT PK_CLIENTES PRIMARY KEY (DNI),
CONSTRAINT CH_CLIENTES CHECK (regexp_LIKE ('[0-9]''{8}','[A-Z]''{1}')),
CONSTRAINT CH1_CLIENTES CHECK (Nacionalidad=UPPER(NACIONALIDAD))
);

CREATE TABLE APUESTAS 
(DNICliente VARCHAR2 (10),
CodCaballo VARCHAR2 (4),
CodCarrera VARCHAR2 (4),
Importe NUMBER (6) DEFAULT 300 NOT NULL,
Tantoporuno NUMBER (4,2)

CONSTRAINT CH_APUESTAS CHECK (Tantoporuno>1),
CONSTRAINT PK_APUESTAS PRIMARY KEY (DNICliente, CodCaballo, CodCarrera),
CONSTRAINT FK_APUESTAS FOREIGN KEY (DNICliente) REFERENCES CLIENTES (DNI) ON DELETE CASCADE,
CONSTRAINT FK1_APUESTAS FOREIGN KEY (CodCaballo) REFERENCES CABALLOS (CodCaballo) ON DELETE CASCADE,
CONSTRAINT FK2_APUESTAS FOREIGN KEY (CodCarrera) REFERENCES CARRERAS (CodCarrera) ON DELETE CASCADE
);



ALTER TABLE PARTICIPACIONES ADD CONSTRAINT CH3_PARTICIPACIONES CHECK (Jockey=INITCAP(Jockey));
ALTER TABLE CABALLOS ADD CONSTRAINT CH3_CABALLOS CHECK (Nacionalidad IN ('Española','Británica','Arabe'));
ALTER TABLE CABALLOS DROP COLUMN Propietario;
ALTER TABLE CARRERAS ADD CONSTRAINT Ch4_Carreras CHECK (Importe_Premio >=1000);
ALTER TABLE CLIENTES ADD Codigo VARCHAR2(20) UNIQUE;
ALTER TABLE APUESTAS ADD Premio NUMBER(20);
ALTER TABLE CARRERAS DISABLE CONSTRAINT Ch4_Carreras;
ALTER TABLE CARRERAS DROP CONSTRAINT Ch4_Carreras;

--2, BORRADO DE TABLAS--.
DROP TABLE APUESTAS CASCADE CONSTRAINT;
DROP TABLE CLIENTES CASCADE CONSTRAINT;
DROP TABLE PARTICIPACIONES CASCADE CONSTRAINT;
DROP TABLE CARRERAS CASCADE CONSTRAINT;
DROP TABLE CABALLOS CASCADE CONSTRAINT;




