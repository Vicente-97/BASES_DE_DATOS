CREATE TABLE FAMILIA
(nombre VARCHAR2 (20),
caracteristicas VARCHAR2 (20),

CONSTRAINT PK_FAMILIA PRIMARY KEY (nombre)
);


CREATE TABLE GENERO 
(nombre VARCHAR2 (20),
caracteristicas VARCHAR2 (20),
nombre_familia VARCHAR2 (20),


CONSTRAINT PK_GENERO PRIMARY KEY (nombre),
CONSTRAINT FK_GENERO FOREIGN KEY (nombre_familia) REFERENCES FAMILIA (nombre)
);

CREATE TABLE ESPECIE 
(nombre VARCHAR2 (20),
caracteristicas VARCHAR2 (20),
nombre_genero VARCHAR2 (20) NOT NULL,

CONSTRAINT PK_ESPECIE PRIMARY KEY (nombre),
CONSTRAINT FK_ESPECIE FOREIGN KEY (nombre_genero) REFERENCES GENERO (nombre)
);

CREATE TABLE ZONA
(nombre VARCHAR2 (20),
localidad VARCHAR2 (20),
extension VARCHAR2 (20),
protegida VARCHAR2 (20),

CONSTRAINT PK_ZONA PRIMARY KEY (nombre),
CONSTRAINT CH_ZONA CHECK (protegida IN ('SI','NO'))
);

CREATE TABLE PERSONA
(dni VARCHAR2 (9),
nombre VARCHAR2 (20),
direccion VARCHAR2 (20),
telefono NUMBER (10),
usuario VARCHAR2 (20) UNIQUE,

CONSTRAINT PK_PERSONA PRIMARY KEY (dni)
);

CREATE TABLE COLECCION
(dni VARCHAR2 (9),
precio NUMBER (20),
fecha_inicio DATE,
nº_ejemplares NUMBER (20),

CONSTRAINT PK_COLECCION PRIMARY KEY (dni),
CONSTRAINT FK_COLECCION FOREIGN KEY (dni) REFERENCES PERSONA (dni),
CONSTRAINT CH_COLECCION CHECK (nº_ejemplares BETWEEN 1 AND 150)
);


CREATE TABLE EJEMPLAR_MARIPOSA
(fecha_captura DATE,
hora_captura NUMBER(20),
nombre_especie VARCHAR2 (20),
nombre_zona VARCHAR2 (20),
dni VARCHAR2 (9),
dni_ejemplar VARCHAR2 (9),
precio_ejemplar NUMBER (20),
nombre_comun VARCHAR2 (20),
fecha_coleccion DATE,

CONSTRAINT PK_EJEMPLAR_MARIPOSA PRIMARY KEY (fecha_captura, hora_captura, nombre_especie, nombre_zona, dni, dni_ejemplar),
CONSTRAINT FK_EJEMPLAR_MARIPOSA FOREIGN KEY (nombre_especie) REFERENCES ESPECIE (nombre),
CONSTRAINT FK1_EJEMPLAR_MARIPOSA FOREIGN KEY (nombre_zona) REFERENCES ZONA (nombre),
CONSTRAINT FK2_EJEMPLAR_MARIPOSA FOREIGN KEY (dni) REFERENCES PERSONA (dni),
CONSTRAINT FK3_EJEMPLAR_MARIPOSA FOREIGN KEY (dni_ejemplar) REFERENCES COLECCION (dni),
CONSTRAINT CH_EJEMPLAR_MARIPOSA CHECK (precio_ejemplar>0)
);

ALTER TABLE PERSONA ADD apellido VARCHAR2 (20);
ALTER TABLE ZONA ADD CONSTRAINT  CH1_ZONA CHECK (extension BETWEEN 100 AND 1500);
ALTER TABLE EJEMPLAR_MARIPOSA DISABLE CONSTRAINT CH_EJEMPLAR_MARIPOSA;
CREATE INDEX BUSQUEDA_NOMBRE_APELLIDOS ON PERSONA (nombre,apellido);
CREATE INDEX BUSQUEDA_EJEMPLARES_MARIPOSA_FECHA_CAPTURA ON EJEMPLAR_MARIPOSA (fecha_captura);




--CREACION DE USUARIOS---

CREATE USER usuario IDENTIFIED BY usuario;
CREATE ROLE rol_usuario;
GRANT SELECT ON PERSONA  TO rol_usuario;
GRANT SELECT ON EJEMPLAR_MARIPOSA  TO rol_usuario;
GRANT SELECT ON COLECCION TO rol_usuario;
GRANT rol_usuario TO usuario;


---CREACION DE ROLES---

CREATE USER empleado IDENTIFIED BY password;
--le damos permiso a empleado para una tabla de una en una 
GRANT SELECT,INSERT,UPDATE ON EJEMPLAR_MARIPOSA TO empleado;
GRANT SELECT,INSERT,UPDATE ON COLECCION TO empleado;
GRANT SELECT,INSERT,UPDATE ON ZONA TO empleado;

--Administrador: usuario que tendrá todos los privilegios.
CREATE USER administrador IDENTIFIED BY password;
GRANT ALL PRIVILEGES TO administrador;


--Usuarios: deben consultar la información relacionada con personas,
--ejemplares de mariposas y colecciones.
CREATE USER usuario IDENTIFIED BY password;

GRANT SELECT ON EJEMPLAR_MARIPOSA TO usuario;
GRANT SELECT ON COLECCION TO usuario;

--ELIMINAR ROLES
REVOKE SELECT,INSERT,UPDATE ON EJEMPLAR_MARIPOSA FROM empleado;
REVOKE SELECT,INSERT,UPDATE ON COLECCION FROM empleado;
 REVOKE SELECT,INSERT,UPDATE ON ZONA FROM empleado;
 
REVOKE ALL PRIVILEGES FROM administrador;
REVOKE SELECT ON EJEMPLAR_MARIPOSA FROM usuario;
REVOKE SELECT ON COLECCION FROM usuario;

--Borrar indices
DROP INDEX BUSQUEDA_NOMBRE_APELLIDOS;
DROP INDEX BUSQUEDA_EJEMPLARES_MARIPOSA_FECHA_CAPTURA;

--Borrado de tablas--
DROP TABLE COLECCION CASCADE CONSTRAINT;

DROP TABLE ESPECIE CASCADE CONSTRAINT;

DROP TABLE FAMILIA CASCADE CONSTRAINT;

DROP TABLE PERSONA CASCADE CONSTRAINT;

DROP TABLE ZONA CASCADE CONSTRAINT;

DROP TABLE EJEMPLAR_MARIPOSA CASCADE CONSTRAINT;

DROP TABLE GENERO CASCADE CONSTRAINT;












