ALTER SESSION SET "_oracle_script"=TRUE;
CREATE USER VICENTE_VILLARREAL_EXAMEN IDENTIFIED BY VICENTE_VILLARREAL_EXAMEN;
GRANT CONNECT, RESOURCE, DBA TO VICENTE_VILLARREAL_EXAMEN;



--APARTADO 1--

--insertar 2 directores--

INSERT INTO DIRECTOR VALUES ('Ramon','España');
INSERT INTO DIRECTOR VALUES ('Manolo','España');

--inserta 4 peliculas dirigidas por los directores anteriores--
_
INSERT INTO PELICULA VALUES (10, 'Resacon', 'Atresmedia', 'Española',TO_DATE('01/01/2000','DD/MM/YYYY'), 'Ramon');
INSERT INTO PELICULA VALUES (11, 'Zombieland', 'Worldcine', 'Francesa',TO_DATE('02/02/2001','DD/MM/YYYY'), 'Manolo');
INSERT INTO PELICULA VALUES (12, 'Xmen', 'Atresmedia', 'Española',TO_DATE('03/03/2002','DD/MM/YYYY'), 'Ramon');
INSERT INTO PELICULA VALUES (13, 'Pinocho', 'Worldcine', 'Francesa',TO_DATE('04/04/2003','DD/MM/YYYY'), 'Manolo');

--Inserta 2 ejemplares de cada pelicula--

INSERT INTO EJEMPLAR VALUES (10, 2, 'estrenada');
INSERT INTO EJEMPLAR VALUES (10, 3, 'rodaje');
----------------------------------------
INSERT INTO EJEMPLAR VALUES (11, 3, 'rodaje');
INSERT INTO EJEMPLAR VALUES (11, 4, 'produccion');
----------------------------------------
INSERT INTO EJEMPLAR VALUES (12, 5, 'rodaje');
INSERT INTO EJEMPLAR VALUES (12, 6, 'produccion');
----------------------------------------
INSERT INTO EJEMPLAR VALUES (13, 7, 'produccion');
INSERT INTO EJEMPLAR VALUES (13, 8, 'produccion');

--SELECT* FROM ejemplar;--

--Inserta como minimo 6 actores--

INSERT INTO ACTORES VALUES ('Antonio', 'España','H');
INSERT INTO ACTORES VALUES ('Raquel', 'España','M');
INSERT INTO ACTORES VALUES ('Fede', 'Francia','H');
INSERT INTO ACTORES VALUES ('Kike', 'España','H');
INSERT INTO ACTORES VALUES ('Rosa', 'España','M');
INSERT INTO ACTORES VALUES ('Lidia', 'España','M');

--Cada película debe tener al menos el actor/atriz protagonista asociado.--

INSERT INTO ACTUA VALUES ('Antonio',10, 'S');
INSERT INTO ACTUA VALUES ('Raquel',11, 'S');
INSERT INTO ACTUA VALUES ('Fede',12, 'S');
INSERT INTO ACTUA VALUES ('Lidia',13, 'S');
--- Todos los ejemplares deben tener al menos 1 alquiler.--
--Insertamos los socios de los alquileres--

INSERT INTO SOCIO VALUES ('2145789K', 'Ricardo', 'Calle Blanca', '589632147', '2145789K');
INSERT INTO SOCIO VALUES ('4445789K', 'Rosa', 'Calle Azul', '999632147', '4445789K');
--------
INSERT INTO SOCIO VALUES ('5545789K', 'Manuel', 'Calle Roja', '889632147', '5545789K');
INSERT INTO SOCIO VALUES ('7745789K', 'Lidia', 'Calle Rosa', '689632147', '7745789K');
------
INSERT INTO SOCIO VALUES ('8545789K', 'Jaime', 'Calle Blanca', '339632147', '8545789K');
INSERT INTO SOCIO VALUES ('6645789K', 'Juan', 'Calle Rosa', '589632147', '6645789K');
----------
INSERT INTO SOCIO VALUES ('7745789P', 'Manuela', 'Calle Marron', '189632147', '7745789P');
INSERT INTO SOCIO VALUES ('5545789P', 'Vicente', 'Calle Multicolor', '289632147', '5545789P');
------------
---SELECT * FROM socio;

--Insertamos los alquileres--

INSERT INTO ALQUILA VALUES ('2145789K', 10, 2, TO_DATE('10/01/2000','DD/MM/YYYY'), TO_DATE('10/02/2000','DD/MM/YYYY'));
INSERT INTO ALQUILA VALUES ('4445789K', 10, 3, TO_DATE('11/01/2000','DD/MM/YYYY'), TO_DATE('11/02/2000','DD/MM/YYYY'));
-----
INSERT INTO ALQUILA VALUES ('5545789K', 11, 3, TO_DATE('20/01/2000','DD/MM/YYYY'), TO_DATE('20/02/2000','DD/MM/YYYY'));
INSERT INTO ALQUILA VALUES ('7745789K', 11, 4, TO_DATE('15/02/2000','DD/MM/YYYY'), TO_DATE('15/03/2000','DD/MM/YYYY'));
---
INSERT INTO ALQUILA VALUES ('8545789K', 12, 5, TO_DATE('10/04/2000','DD/MM/YYYY'), TO_DATE('10/05/2000','DD/MM/YYYY'));
INSERT INTO ALQUILA VALUES ('6645789K', 12, 6, TO_DATE('19/01/2000','DD/MM/YYYY'), TO_DATE('19/02/2000','DD/MM/YYYY'));
------
INSERT INTO ALQUILA VALUES ('7745789P', 13, 7, TO_DATE('10/01/2000','DD/MM/YYYY'), TO_DATE('10/02/2000','DD/MM/YYYY'));
INSERT INTO ALQUILA VALUES ('5545789P', 13, 8, TO_DATE('05/01/2000','DD/MM/YYYY'), TO_DATE('27/02/2000','DD/MM/YYYY'));


---APARTADO 2---

--SELECT *  FROM DIRECTOR WHERE NACIONALIDAD ='España';

UPDATE DIRECTOR SET NACIONALIDAD ='SPAIN' WHERE NACIONALIDAD ='España';

--SELECT * FROM DIRECTOR;

---Apartado 3---

--SELECT * FROM socio;

UPDATE SOCIO SET AVALADOR ='2145789K';
UPDATE SOCIO SET AVALADOR = NULL WHERE DNI='2145789K';

-- Apartado 4---

--SELECT * FROM SOCIO WHERE TELEFONO LIKE '5%';

--DELETE FROM SOCIO WHERE DNI ='2145789K';
--DELETE FROM SOCIO WHERE DNI ='6645789K';

--No puedo borrar dichos socios por que tienen asociada una restriccion tipo Foreign key de la tabla ALQUILA y otra Foreign key de la tabla SOCIO--
--Dicha clave es FK1_DNI Y FK_SOCIO--

--Apartado 5--


--ALTER TABLE ALQUILA DROP CONSTRAINT FK1_DNI;
--ALTER TABLE ALQUILA ADD CONSTRAINT FK1_DNI FOREIGN KEY(DNI) REFERENCES SOCIO(DNI) ON DELETE CASCADE;
--ALTER TABLE SOCIO DROP CONSTRAINT FK_SOCIO;
--ALTER TABLE SOCIO ADD CONSTRAINT FK_SOCIO FOREIGN KEY(AVALADOR) REFERENCES SOCIO(DNI) ON DELETE CASCADE;


--Para solucionar dicho problema Borraria las constraint y las volveria a crear con un ON DELETE CASCADE--
--Podria haberse evitado habiendole puesto el ON DELETE CASCADE AL FINAL DE LAS SENTENCIAS DDL-

--Apartado 6--

--SELECT * FROM PELICULA;

--DELETE FROM PELICULA WHERE TITULO='Resacon';

--No se puede eliminar dichas peliculas por que tienen restricciones asociadas de tipo FK_EJEMPLAR.
--Para solucionarlo podriamos borrar dicha constraint y volverla a crear con ON DELETE CASCADE--
--Podría haberse evitado este problema al añadir ON DELETE CASCADE en la creacion de dichas tablas.

--Apartado 7 ---

CREATE TABLE DIRECTORES_BACKUP
(
NOMBRE_BACKUP VARCHAR2(40),
NACIONALIDAD_BACKUP VARCHAR2(40) ,
CONSTRAINT PK_DIRECTOR_BACKUP PRIMARY KEY(NOMBRE_BACKUP)
);


INSERT INTO DIRECTORES_BACKUP SELECT * FROM DIRECTOR;

--Posteriormente comprobamos los datos introducidos --

SELECT * FROM DIRECTORES_BACKUP;

--Apartado 8 --

ALTER TABLE DIRECTORES_BACKUP ADD VALORACION VARCHAR2(50);

--Vamos a añadir un nuevo director con nacionalidad española ya que los que tengo tienen la nacionalidad SPAIN y no Española como tal--

INSERT INTO DIRECTORES_BACKUP VALUES ('Juan','Española', NULL);

--Ahora posteriormente modificamos y añadimos lo que pide el enunciado --

SELECT * FROM DIRECTORES_BACKUP WHERE NACIONALIDAD_BACKUP = 'Española';

UPDATE DIRECTORES_BACKUP SET VALORACION='Muy buena trayectoria profesional' WHERE NACIONALIDAD_BACKUP = 'Española';

-- AHORA COMPROBAMOS--

--SELECT * FROM DIRECTORES_BACKUP WHERE VALORACION = 'Muy buena trayectoria profesional';


--Apartado 9--


--Apartado 10--

--Creamos la secuencia--

--SELECT * FROM PELICULA;

CREATE SEQUENCE ID_PELICULA
START WITH 14
INCREMENT BY 1
MAXVALUE 9999
  nocycle;

--La ponemos para que empiece por 14 pues 13 es nuestro ultimo valor de id --
 
INSERT INTO PELICULA VALUES (ID_PELICULA.nextval, 'Prueba', 'Atresmedia', 'Rumana',TO_DATE('05/01/2008','DD/MM/YYYY'), 'Ramon');
INSERT INTO PELICULA VALUES (ID_PELICULA.nextval, 'Prueba_2', 'Telecinco', 'Arabe',TO_DATE('09/08/2007','DD/MM/YYYY'), 'Ramon');

--Una vez insertada comprobamos --

--SELECT *FROM PELICULA;

--APARTADO 11---

--AUTO_INCREMENT--

--Apartado 12--

--1--

--No podria ya que si no ha ejecutado un COMMIT, los datos no estan guardados y posteriormente el compañero de equipo
-- solo verá la tabla creada pero sin los datos, pues el último COMMIT realizado es el de la creacion de tablas que viene por defecto.


--2--

--La instruccion para volver a esa tabla seria un ROLLBACK siempre y cuando no se haya ejecutado  un COMMIT o se haya ejecutado una sentencia DDL-


--3--

--Para que los datos queden persistidos necesitas realizar una instruccion de tipo COMMIT que guarada el progreso en la base de datos, aunque si posteriormente ejecutas
--Cualquier sentencia DDL tendrías que saber que tiene incorporado un AUTO-COMMIT--


--4--


--Realizarias un ROLLBACK y te llevaría automaticamente al ultimo COMMIT  ejecutado.

--5--


--El SAVEPOINT es un punto de guardado en el cual podemos volver ael con la sentencia ROLLBACK TO SAVEPOINT___.
--Es de gran utilidad por ejemplo para establecer puntos de control en nuestro scrip, pero hemos de saber que si realizamos un COMMIT automaticamente despues del SAVEPOINT
-- Cuando realizemos un ROLLBACK, este nos llevará al ultimo COMMIT y no al Savepoint.


--EJEMPLO:--

--CREATE TABLE DIBUJOS
-- (ID VARCHAR2 (20),
-- NUMERO NUMBER (5);

-- CONSTRAINT PK_DIBUJOS PRIMARY KEY (ID)
--);

-- INSERT INTO DIBUJOS VALUES ('Doraemon' 20);
-- INSERT INTO DIBUJOS VALUES ('Novita' 25);
-- INSERT INTO DIBUJOS VALUES ('Gigante' 28);

--SAVEPOINT DIBUJOS_1--

--UPDATE DIBUJOS SET='Suneo' WHERE ID='Doraemon';
--UPDATE DIBUJOS SET='Vicente' WHERE ID='Novita';


--Hemos creado una tabla y posteriormente hemos añadido unos valores, y hemos realizado un
--SAVEPOINT, despues hemos realizado un UPDATE y si poteriormente después del SAVEPOINT Los datos actualizados estan mal,
--Podría volver a mi punto de control mediante SAVEPOINT DIBUJOS_1;





