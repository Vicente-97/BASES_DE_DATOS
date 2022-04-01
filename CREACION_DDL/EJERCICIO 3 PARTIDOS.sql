CREATE TABLE EQUIPOS
(CodEquipo VARCHAR2 (4),
Nombre VARCHAR2 (30) NOT NULL,
Localidad VARCHAR2 (15),

CONSTRAINT PK_EQUIPOS PRIMARY KEY (CodEquipo)
);

ALTER TABLE EQUIPOS ADD Goles_Marcados NUMBER(3);

CREATE TABLE JUGADORES
(CodJugador VARCHAR2 (4),
Nombre VARCHAR2 (30) NOT NULL,
Fecha_Nacimiento DATE,
Demarcacion VARCHAR2 (10),
CodEquipo VARCHAR2 (4),

CONSTRAINT PK_JUGADORES PRIMARY KEY (CodJugador),
CONSTRAINT FK_JUGADORES FOREIGN KEY (CodEquipo) REFERENCES EQUIPOS (CodEquipo)

);
ALTER TABLE JUGADORES ADD CONSTRAINT ck_equipo CHECK (Demarcacion IN ('Portero','Defensa','Medio','Delantero'));

CREATE TABLE PARTIDOS
(CodPartido VARCHAR2 (4),
CodEquipoLocal VARCHAR2 (4),
CodEquipoVisitante VARCHAR2 (4),
Fecha DATE,
Competicion VARCHAR2 (4),
Jornada VARCHAR2 (20),

CONSTRAINT PK_PARTIDOS PRIMARY KEY (CodPartido),
CONSTRAINT FK1_PARTIDOS FOREIGN KEY (CodEquipoVisitante) REFERENCES EQUIPOS(CodEquipo),
CONSTRAINT FK2_PARTIDOS FOREIGN KEY (CodEquipoLocal) REFERENCES EQUIPOS(CodEquipo),
CONSTRAINT CHK_FECHA CHECK ((EXTRACT(MONTH FROM Fecha)!=7) OR (EXTRACT(MONTH FROM Fecha)!=8)),
CONSTRAINT CHK_Competicion CHECK (Competicion IN ('COPA','LIGA'))
);

CREATE TABLE INCIDENCIAS
(NumIncidencia VARCHAR2 (6),
CodPartido VARCHAR2 (4),
CodJugador VARCHAR2 (4),
Minuto NUMBER (2),
Tipo VARCHAR2 (20),

CONSTRAINT PK_INCIDENCIAS PRIMARY KEY (NumIncidencia),
CONSTRAINT FK_INCIDENCIAS FOREIGN KEY (CodPartido) REFERENCES PARTIDOS(CodPartido),
CONSTRAINT FK1_INCIDENCIAS FOREIGN KEY (CodJugador) REFERENCES JUGADORES(CodJugador),
CONSTRAINT CHK_TIPO CHECK (Minuto >0 AND Minuto<=99)
);

ALTER TABLE JUGADORES ADD CONSTRAINT nombre_Jugador CHECK(Nombre= initcap(nombre));
ALTER TABLE EQUIPOS ADD CONSTRAINT ck3_equipo CHECK (regexp_like(CodEquipo,'^[0-9]{1}'));
ALTER TABLE INCIDENCIAS MODIFY Tipo NOT NULL;