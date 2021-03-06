CREATE TABLE PROFESOR
(dni VARCHAR2 (10),
direccion VARCHAR2 (20),
apellidos VARCHAR2 (20),
nombre VARCHAR2 (20) UNIQUE,
titulacion VARCHAR2 (20),
sueldo NUMBER (4),


CONSTRAINT PROFESOR_PK PRIMARY KEY (dni),
CONSTRAINT CH_PROFESOR CHECK (sueldo >0)
);

CREATE TABLE CURSOS
(nombre VARCHAR2 (10) UNIQUE,
cod_curso VARCHAR2 (10),
num_maximo_alumnos NUMBER(4),
fecha_inicio DATE,
fecha_finalizacion DATE,
num_horas_curso NUMBER (4) NOT NULL,
dni VARCHAR2 (10),

CONSTRAINT CURSOS_PK PRIMARY KEY (cod_curso),
CONSTRAINT CURSOS_FK FOREIGN KEY (dni) REFERENCES PROFESOR (dni),
CONSTRAINT CH_CURSOS CHECK (fecha_inicio < fecha_finalizacion)

);

CREATE TABLE ALUMNOS
(dni VARCHAR2 (10),
direccion VARCHAR2 (20),
apellidos VARCHAR2 (20),
nombre VARCHAR2 (20),
fecha_nacimiento DATE,
sexo VARCHAR2 (2),
cod_curso VARCHAR2 (10) NOT NULL,

CONSTRAINT ALUMNOS_PK PRIMARY KEY (dni),
CONSTRAINT ALUMNOS_FK FOREIGN KEY (cod_curso) REFERENCES CURSOS (cod_curso),
CONSTRAINT ALUMNOS_01 CHECK (regexp_like(sexo, '[M|H]{1}'))
);