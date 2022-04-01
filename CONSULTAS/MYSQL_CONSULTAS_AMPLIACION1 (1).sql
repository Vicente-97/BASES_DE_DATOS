
#Procedemos a la creación de nuestras tablas#

CREATE TABLE DEPART 
(DEPT_NO INT (3),
DNOMBRE VARCHAR(20),
LOC VARCHAR (20),

CONSTRAINT PK_DEPART PRIMARY KEY (DEPT_NO)
);



CREATE TABLE EMPLE 
(EMP_NO INT (5),
APELLIDO VARCHAR(20),
OFICIO VARCHAR (20),
DIR INT (5),
FECHA_ALT DATE ,
SALARIO INT (10),
COMISION INT (10),
DEPT_NO INT (3),

CONSTRAINT PK_EMPLE PRIMARY KEY (EMP_NO),
CONSTRAINT FK_EMPLE FOREIGN KEY (DEPT_NO) REFERENCES DEPART (DEPT_NO)
);

##Procedemos a la inserción de nuestros datos ##

##Inserción de datos en la tabla DEPART##

INSERT INTO DEPART VALUES (10, 'CONTABILIDAD','SEVILLA');
INSERT INTO DEPART VALUES (20, 'INVESTIGACIÓN','MADRID');
INSERT INTO DEPART VALUES (30, 'VENTAS','BARCELONA');
INSERT INTO DEPART VALUES (40, 'PRODUCCIÓN','BILBAO');

##Inserción de datos en la tabla EMPLE##

INSERT INTO EMPLE (EMP_NO, APELLIDO, OFICIO, DIR, FECHA_ALT, SALARIO, DEPT_NO) 
VALUES (7369,'SÁNCHEZ', 'EMPLEADO', 7902, '1980/12/17', 104000, 20);
##SELECT * FROM EMPLE e ;
INSERT INTO EMPLE  
VALUES (7499,'ARROYO', 'VENDEDOR', 7698, '1980/02/20', 208000, 39000, 30);
INSERT INTO EMPLE  
VALUES (7521,'SALA', 'VENDEDOR', 7698, '1981/02/22', 162500, 162500, 30);
INSERT INTO EMPLE (EMP_NO, APELLIDO, OFICIO, DIR, FECHA_ALT, SALARIO, DEPT_NO) 
VALUES (7566,'JIMÉNEZ', 'DIRECTOR', 7839, '1981/04/02', 386750, 20);
INSERT INTO EMPLE  
VALUES (7654,'MARTÍN', 'VENDEDOR', 7698, '1981/09/29', 162500, 182000, 30);
INSERT INTO EMPLE (EMP_NO, APELLIDO, OFICIO, DIR, FECHA_ALT, SALARIO, DEPT_NO) 
VALUES (7698,'NEGRO', 'DIRECTOR', 7839, '1981/05/01', 370500, 30);
INSERT INTO EMPLE (EMP_NO, APELLIDO, OFICIO, DIR, FECHA_ALT, SALARIO, DEPT_NO) 
VALUES (7788,'GIL', 'ANALISTA', 7566, '1981/11/09', 390000, 20);
INSERT INTO EMPLE (EMP_NO, APELLIDO, OFICIO, FECHA_ALT, SALARIO, DEPT_NO) 
VALUES (7839,'REY', 'PRESIDENTE', '1981/11/17', 650000, 10);
INSERT INTO EMPLE  
VALUES (7844,'TOVAR', 'VENDEDOR', 7698, '1980/09/08', 195000, 0, 30);
INSERT INTO EMPLE (EMP_NO, APELLIDO, OFICIO, DIR, FECHA_ALT, SALARIO, DEPT_NO) 
VALUES (7876,'ALONSO', 'EMPLEADO', 7788, '1981/09/23', 143000, 20);
INSERT INTO EMPLE (EMP_NO, APELLIDO, OFICIO, DIR, FECHA_ALT, SALARIO, DEPT_NO) 
VALUES (7900,'JIMENO', 'EMPLEADO', 7698, '1981/12/03', 1235000, 30);
INSERT INTO EMPLE (EMP_NO, APELLIDO, OFICIO, DIR, FECHA_ALT, SALARIO, DEPT_NO) 
VALUES (7902,'FERNÁNDEZ', 'ANALISTA', 7566, '1981/12/03', 390000, 20);
INSERT INTO EMPLE (EMP_NO, APELLIDO, OFICIO, DIR, FECHA_ALT, SALARIO, DEPT_NO) 
VALUES (7934,'MUÑOZ', 'EMPLEADO', 7782, '1982/01/23', 169000, 10);

##SELECT * FROM DEPART d;
##SELECT * FROM EMPLE e;


##1 Mostrar el apellido, oficio y número de departamento de cada empleado

SELECT  APELLIDO , OFICIO, DEPT_NO 
FROM EMPLE e;


##2 Mostrar el número, nombre y localización de cada departamento

SELECT  DEPT_NO, DNOMBRE, LOC 
FROM DEPART d;

##3 Mostrar todos los datos de todos los empleados.

SELECT  * FROM EMPLE e ;

## 4 Datos de los empleados ordenados por apellidos

SELECT  * FROM EMPLE e 
ORDER BY APELLIDO ;


## 5 Datos de los empleados ordenados por número de departamento
##descendentemente.


SELECT *
FROM EMPLE e 
ORDER BY DEPT_NO DESC;


# 6 Datos de los empleados ordenados por número de departamento
#descendentemente y dentro de cada departamento ordenados por apellido
#ascendentemente

SELECT *
FROM EMPLE e 
ORDER BY DEPT_NO DESC, APELLIDO;

##  8 Mostrar los datos de los empleados cuyo salario sea mayor que 2000000.

SELECT *
FROM EMPLE e 
WHERE SALARIO >2000000;

## 9 Mostrar los datos de los empleados cuyo oficio sea ʻANALISTAʼ.

SELECT *
FROM EMPLE e 
WHERE OFICIO ='ANALISTA';

## 10 Seleccionar el apellido y oficio de los empleados del departamento número
# 20.

SELECT APELLIDO, OFICIO 
FROM EMPLE e 
WHERE DEPT_NO =20;

##11 Mostrar todos los datos de los empleados ordenados por apellido.

SELECT *
FROM EMPLE e
ORDER BY APELLIDO;

## 12 Seleccionar los empleados cuyo oficio sea ʻVENDEDORʼ. Mostrar los datos
# ordenados por apellido.

SELECT *
FROM EMPLE e 
WHERE OFICIO = 'VENDEDOR'
ORDER BY APELLIDO ;

# 13 Mostrar los empleados cuyo departamento sea 10 y cuyo oficio sea
#ʻANALISTAʼ. Ordenar el resultado por apellido.

SELECT *
FROM EMPLE e 
WHERE DEPT_NO =10 AND OFICIO LIKE 'ANALISTA'
ORDER BY APELLIDO ;

#14  Mostrar los empleados que tengan un salario mayor que 200000 o que
#pertenezcan al departamento número 20.

SELECT *
FROM EMPLE e 
WHERE SALARIO >200000
OR DEPT_NO =20;


# 15 Ordenar los empleados por oficio, y dentro de oficio por nombre.

SELECT *
FROM EMPLE e 
ORDER BY OFICIO, APELLIDO;



# 16 Seleccionar de la tabla EMPLE los empleados cuyo apellido empiece por
#ʻAʼ.

SELECT *
FROM EMPLE e 
WHERE APELLIDO LIKE 'A%';

#17  Seleccionar de la tabla EMPLE los empleados cuyo apellido termine por ʻZʼ.

SELECT  *
FROM EMPLE e 
WHERE APELLIDO LIKE '%Z';

#18 Seleccionar de la tabla EMPLE aquellas filas cuyo APELLIDO empiece por
# ʻAʼ y el OFICIO tenga una ʻEʼ en cualquier posición.


SELECT *
FROM EMPLE e 
WHERE APELLIDO LIKE 'A%'
AND OFICIO  LIKE '%E%';

#19 Seleccionar los empleados cuyo salario esté entre 100000 y 200000. Utilizar
# el operador BETWEEN
SELECT *
FROM EMPLE e 
WHERE SALARIO BETWEEN 100000 AND 200000;


# 20 Obtener los empleados cuyo oficio sea ʻVENDEDORʼ y tengan una comisión
#superior a 100000.

SELECT *
FROM EMPLE e 
WHERE OFICIO LIKE 'VENDEDOR'
AND COMISION >100000;

#21 Seleccionar los datos de los empleados ordenados por número de
#departamento, y dentro de cada departamento ordenados por apellido.

SELECT *
FROM EMPLE e 
ORDER BY DEPT_NO , APELLIDO ; 

#22 Número y apellidos de los empleados cuyo apellido termine por ʻZʼ y tengan
# un salario superior a 300000.

SELECT EMP_NO , APELLIDO 
FROM EMPLE e 
WHERE APELLIDO LIKE '%Z'
AND SALARIO >300000;

#23 Datos de los departamentos cuya localización empiece por ʻBʼ.

SELECT *
FROM DEPART d 
WHERE LOC LIKE 'B%';

#24 Datos de los empleados cuyo oficio sea ʻEMPLEADOʼ, tengan un salario
#superior a 100000 y pertenezcan al departamento número 10

SELECT *
FROM EMPLE e 
WHERE (OFICIO LIKE 'EMPLEADO'
AND SALARIO >100000
AND DEPT_NO =10);

# 25 Mostrar los apellidos de los empleados que no tengan comisión.

SELECT APELLIDO 
FROM EMPLE e 
WHERE COMISION IS NULL ;

#26 Mostrar los apellidos de los empleados que no tengan comisión y cuyo
# apellido empiece por ʻJʼ.


SELECT APELLIDO 
FROM EMPLE e 
WHERE COMISION IS NULL 
AND APELLIDO LIKE 'J%';

#27 Mostrar los apellidos de los empleados cuyo oficio sea ʻVENDEDORʼ,
# ʻANALISTAʼ o ʻEMPLEADOʼ.

SELECT APELLIDO 
FROM EMPLE e 
WHERE OFICIO LIKE 'VENDEDOR'
AND OFICIO LIKE 'ANALISTA'
OR OFICIO LIKE 'EMPLEADO';


#28 Mostrar los apellidos de los empleados cuyo oficio no sea ni ʻANALISTAʼ ni
#ʻEMPLEADOʼ, y además tengan un salario mayor de 200000.

SELECT APELLIDO 
FROM EMPLE e 
WHERE OFICIO NOT LIKE 'ANALISTA'
AND OFICIO NOT LIKE 'EMPLEADO'
AND SALARIO >200000;

#29 Seleccionar  de  la  tabla  EMPLE  los  empleados  cuyo  salario  esté  entre 2000000 y 3000000 
#(utilizar BETWEEN).

SELECT *
FROM EMPLE e 
WHERE SALARIO BETWEEN 2000000 AND  300000;


#30 Seleccionar el apellido, salario y número de departamento de los empleados
#cuyo salario sea mayor que 200000 en los departamentos 10 ó 30.


SELECT APELLIDO, SALARIO, DEPT_NO 
FROM EMPLE e 
WHERE (SALARIO > 200000)
AND (DEPT_NO =10
OR DEPT_NO =30);

#31 Mostrar el apellido y número de los empleados cuyo salario no esté entre
## 100000 y 200000 (utilizar BETWEEN).

SELECT APELLIDO, DEPT_NO 
FROM EMPLE e 
WHERE SALARIO NOT BETWEEN 100000 AND 200000;

#32 Obtener el apellidos de todos los empleados en minúscula

SELECT LOWER(APELLIDO) 
FROM EMPLE e;

#33 En una consulta concatena el apellido de cada empleado con su oficio.

#He buscado si habia alguna funcion de concatenar y segun google la funcion es CONCAT, no se si estara bien

SELECT CONCAT(APELLIDO, OFICIO) 
FROM EMPLE e ;

# 34 Mostrar el apellido y la longitud del apellido (función LENGTH) de todos
#los empleados, ordenados por la longitud de los apellidos de los
#empleados descendentemente.

SELECT APELLIDO , LENGTH (APELLIDO)
FROM EMPLE e 
ORDER BY LENGTH (APELLIDO) DESC;

#35 Obtener el año de contratación de todos los empleados (función YEAR).

SELECT YEAR (FECHA_ALT) AS AÑO_CONTRATACION
FROM EMPLE e;

# 36 Mostrar los datos de los empleados que hayan sido contratados en el
# año 1992

SELECT *
FROM EMPLE e 
WHERE YEAR (FECHA_ALT)=1992;

# 37 Mostrar los datos de los empleados que hayan sido contratados en el
# mes de febrero de cualquier año (función MONTHNAME).

SELECT *
FROM EMPLE e 
WHERE MONTHNAME(FECHA_ALT)='February'; 

#despues de indagar en muchos foros creo que es así, tienes que poner el nombre del mes en ingles.

#38 Para cada empleado mostrar el apellido y el mayor valor del salario y la
# comisión que tienen.

SELECT APELLIDO, MAX(SALARIO), COMISION 
FROM EMPLE e;

#Ni idea, imagino que se hara con una funcion parecida a MAX, aunque no se cual es

#39 Mostrar los datos de los empleados cuyo apellido empiece por 'A' y
# hayan sido contratados en el año 1990

SELECT *
FROM EMPLE e 
WHERE APELLIDO LIKE 'A%'
AND YEAR(FECHA_ALT)=1990;

#40 Mostrar los datos de los empleados del departamento 10 que no tengan
#comisión

SELECT *
FROM EMPLE e 
WHERE DEPT_NO =10
AND COMISION IS NULL;




