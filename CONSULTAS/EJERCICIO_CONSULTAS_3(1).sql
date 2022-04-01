--ALTER SESSION SET "_oracle_script"=TRUE;
--CREATE USER EJERCICIO_CONSULTAS3 IDENTIFIED BY EJERCICIO_CONSULTAS3;
--GRANT CONNECT, RESOURCE, DBA TO EJERCICIO_CONSULTAS3;


--drop table alumno_asignatura;
--drop table asignatura;
--drop table alumno;
--drop table profesor;
--drop table persona;
--drop table titulacion;




Create table titulacion (
Idtitulacion varchar2(6) primary key,
Nombre varchar2(30)
);


Create table persona (
dni varchar2(11) primary key,
Nombre varchar2(30),
Apellido varchar2(30),
Ciudad varchar2(15),
Direccioncalle varchar2(30),
Direccionnum number,
Telefono varchar2(9),
Fecha_nacimiento date,
Varon number
);



create table alumno (
idalumno varchar2(7) primary key,
dni varchar2(11),
foreign key (dni) references persona(dni)
);

Create table profesor (
Idprofesor varchar2(4) primary key,
Dni varchar2(11),
Foreign key(dni) references persona(dni)
);

Create table asignatura (
Idasignatura varchar2(6) primary key,
Nombre varchar2(20),
Creditos number,
Cuatrimestre number,
Costebasico number,
Idprofesor varchar2(4),
Idtitulacion varchar2(6),
Curso number,
Foreign key(idprofesor) references profesor(idprofesor),
Foreign key (idtitulacion) references titulacion(idtitulacion)
);

Create table  alumno_asignatura (
Idalumno varchar2(7),
Idasignatura varchar2(6),
Numeromatricula number,
  PRIMARY KEY(idalumno,idasignatura,numeromatricula),
Foreign key(idalumno) references alumno(idalumno),
Foreign key(idasignatura) references asignatura(idasignatura)
);


insert into persona values ('16161616A','Luis','Ramirez','Haro','Pez','34','941111111',to_date('1/1/1969','dd/mm/yyyy'),'1');
insert into persona values ('17171717A','Laura','Beltran','Madrid','Gran Va','23','912121212',to_date('8/8/1974','dd/mm/yyyy'),'0');
insert into persona values ('18181818A','Pepe','Perez','Madrid','Percebe','13','913131313',to_date('2/2/1980','dd/mm/yyyy'),'1');
insert into persona values ('19191919A','Juan','Sanchez','Bilbao','Melancola','7','944141414',to_date('3/2/1966','dd/mm/yyyy'),'1');
insert into persona values ('20202020A','Luis','Jimenez','Najera','Cigea','15','941151515',to_date('3/3/1979','dd/mm/yyyy'),'1');
insert into persona values ('21212121A','Rosa','Garcia','Haro','Alegra','16','941161616',to_date('4/4/1978','dd/mm/yyyy'),'0');
insert into persona values ('23232323A','Jorge','Saenz','Sevilla','Luis Ulloa','17','941171717',to_date('9/9/1978','dd/mm/yyyy'),'1');
insert into persona values ('24242424A','Mara','Gutierrez','Sevilla','Avda. de la Paz','18','941181818',to_date('10/10/1964','dd/mm/yyyy'),'0');
insert into persona values ('25252525A','Rosario','Diaz','Sevilla','Percebe','19','941191919',to_date('11/11/1971','dd/mm/yyyy'),'0');
insert into persona values ('26262626A','Elena','Gonzalez','Sevilla','Percebe','20','941202020',to_date('5/5/1975','dd/mm/yyyy'),'0');


insert into alumno values ('A010101','21212121A');
insert into alumno values ('A020202','18181818A');
insert into alumno values ('A030303','20202020A');
insert into alumno values ('A040404','26262626A');
insert into alumno values ('A121212','16161616A');
insert into alumno values ('A131313','17171717A');


insert into profesor values ('P101','19191919A');
insert into profesor values ('P117','25252525A');
insert into profesor values ('P203','23232323A');
insert into profesor values ('P204','26262626A');
insert into profesor values ('P304','24242424A');


insert into titulacion values ('130110','Matematicas');
insert into titulacion values ('150210','Quimicas');
insert into titulacion values ('160000','Empresariales');


insert into asignatura values ('000115','Seguridad Vial','4','1','30 ','P204',null,null);
insert into asignatura values ('130113','Programacion I', '9','1','60 ','P101','130110','1');
insert into asignatura values ('130122','Analisis II',    '9','2','60 ','P203','130110','2');
insert into asignatura values ('150212','Quimica Fisica','4','2','70','P304','150210','1');
insert into asignatura values ('160002','Contabilidad','6','1','70','P117','160000','1');


insert into alumno_asignatura values('A010101','150212','1');
insert into alumno_asignatura values('A020202','130113','1');
insert into alumno_asignatura values('A020202','150212','2');
insert into alumno_asignatura values('A030303','130113','3');
insert into alumno_asignatura values('A030303','150212','1');
insert into alumno_asignatura values('A030303','130122','2');
insert into alumno_asignatura values('A040404','130122','1');
insert into alumno_asignatura values('A121212','000115','1');
insert into alumno_asignatura values('A131313','160002','4');


---------------------------

--Universidad3--


-- Cuantos costes básicos hay.--

SELECT  COUNT (COSTEBASICO)
FROM ASIGNATURA;

--Para cada titulación mostrar el número de asignaturas que hay junto con el nombre de la titulación.--

SELECT COUNT (ASIGNATURA.IDASIGNATURA), TITULACION.NOMBRE 
FROM TITULACION, ASIGNATURA
WHERE TITULACION .IDTITULACION = ASIGNATURA .IDTITULACION
GROUP BY TITULACION .NOMBRE ;

--Para cada titulación mostrar el nombre de la titulación junto con el precio total de todas sus asignaturas.

SELECT TITULACION.NOMBRE, SUM(COSTEBASICO) 
FROM TITULACION, ASIGNATURA
WHERE TITULACION .IDTITULACION =ASIGNATURA .IDTITULACION 
GROUP BY TITULACION .NOMBRE 

--Cual sería el coste global de cursar la titulación de Matemáticas si el coste de cada asignatura fuera incrementado en un 7%. 

SELECT TITULACION.NOMBRE, (ASIGNATURA.COSTEBASICO *0.07) + ASIGNATURA .COSTEBASICO AS COSTEMATEMATICAS
FROM TITULACION, ASIGNATURA
WHERE TITULACION.IDTITULACION = ASIGNATURA.IDTITULACION
AND TITULACION.NOMBRE ='Matematicas';

--Cuantos alumnos hay matriculados en cada asignatura, junto al id de la asignatura. 

SELECT COUNT (ALUMNO_ASIGNATURA.IDALUMNO), ASIGNATURA.IDASIGNATURA
FROM ASIGNATURA, ALUMNO_ASIGNATURA 
WHERE ALUMNO_ASIGNATURA.IDASIGNATURA = ASIGNATURA.IDASIGNATURA
GROUP BY ASIGNATURA.IDASIGNATURA;

--Igual que el anterior pero mostrando el nombre de la asignatura.

SELECT COUNT (ALUMNO_ASIGNATURA.IDALUMNO), ASIGNATURA.IDASIGNATURA, ASIGNATURA.NOMBRE 
FROM ASIGNATURA, ALUMNO_ASIGNATURA 
WHERE ALUMNO_ASIGNATURA.IDASIGNATURA = ASIGNATURA.IDASIGNATURA
GROUP BY ASIGNATURA.IDASIGNATURA, ASIGNATURA.NOMBRE;

--Mostrar para cada alumno, el nombre del alumno junto con lo que 
--tendría que pagar por el total de todas las asignaturas en las que está matriculada. 
--Recuerda que el precio de la matrícula tiene un incremento de un 10% por cada año en el que 
--esté matriculado.

SELECT PERSONA.NOMBRE, SUM(ASIGNATURA.COSTEBASICO * (0.10 * ALUMNO_ASIGNATURA.NUMEROMATRICULA) + ASIGNATURA.COSTEBASICO ) AS PRECIOTOTAL
FROM PERSONA, ALUMNO, ALUMNO_ASIGNATURA, ASIGNATURA
WHERE PERSONA.DNI =ALUMNO.DNI
AND ALUMNO.IDALUMNO =ALUMNO_ASIGNATURA.IDALUMNO
AND ALUMNO_ASIGNATURA.IDASIGNATURA = ASIGNATURA.IDASIGNATURA 
GROUP BY PERSONA.NOMBRE;

--Coste medio de las asignaturas de cada titulación, 
--para aquellas titulaciones en el que el coste total de la 1ª matrícula sea mayor que 60 euros.

SELECT AVG(ASIGNATURA.COSTEBASICO)
FROM TITULACION, ASIGNATURA, ALUMNO_ASIGNATURA
WHERE TITULACION.IDTITULACION = ASIGNATURA.IDTITULACION 
AND ASIGNATURA.IDASIGNATURA = ALUMNO_ASIGNATURA.IDASIGNATURA 
AND ALUMNO_ASIGNATURA.NUMEROMATRICULA =1
AND ASIGNATURA.COSTEBASICO >60;

--Nombre de las titulaciones  que tengan más de tres alumnos.

SELECT TITULACION.NOMBRE 

FROM TITULACION, ASIGNATURA,ALUMNO, ALUMNO_ASIGNATURA

WHERE TITULACION.IDTITULACION =ASIGNATURA.IDTITULACION 
AND ASIGNATURA.IDASIGNATURA = ALUMNO_ASIGNATURA.IDASIGNATURA 
AND ALUMNO_ASIGNATURA.IDALUMNO = ALUMNO.IDALUMNO 

GROUP BY TITULACION.NOMBRE 

HAVING COUNT(ALUMNO.IDALUMNO)>3; 

--Nombre de cada ciudad junto con el número de personas que viven en ella--

SELECT PERSONA.CIUDAD, COUNT(PERSONA.DNI) 

FROM PERSONA

GROUP BY PERSONA.CIUDAD;

--Nombre de cada profesor junto con el número de asignaturas que imparte.--

SELECT PERSONA.NOMBRE, COUNT(ASIGNATURA.IDASIGNATURA)

FROM PERSONA, PROFESOR,ASIGNATURA

WHERE PERSONA.DNI = PROFESOR.DNI 
AND PROFESOR.IDPROFESOR = ASIGNATURA.IDPROFESOR 
GROUP BY PERSONA.NOMBRE ;

--Nombre de cada profesor junto con el número de alumnos que tiene,
-- para aquellos profesores que tengan dos o más de 2 alumnos.

SELECT PERSONA.NOMBRE, COUNT(ALUMNO.IDALUMNO)
FROM PERSONA, ALUMNO, PROFESOR, ASIGNATURA, ALUMNO_ASIGNATURA

WHERE PERSONA.DNI = PROFESOR.DNI 

AND PROFESOR.IDPROFESOR =ASIGNATURA.IDPROFESOR 

AND ASIGNATURA.IDASIGNATURA = ALUMNO_ASIGNATURA.IDASIGNATURA

AND ALUMNO_ASIGNATURA.IDALUMNO = ALUMNO.IDALUMNO 

GROUP BY PERSONA.NOMBRE
HAVING COUNT(ALUMNO.IDALUMNO)>=2;

--Obtener el máximo de las sumas de los costesbásicos de cada cuatrimestre-

SELECT MAX(SUM(ASIGNATURA.COSTEBASICO /ASIGNATURA.CUATRIMESTRE))

FROM ASIGNATURA 

GROUP BY ASIGNATURA.CUATRIMESTRE ;


--Suma del coste de las asignaturas

SELECT SUM(ASIGNATURA.COSTEBASICO)
FROM ASIGNATURA;

--¿Cuántas asignaturas hay?

SELECT COUNT(ASIGNATURA.IDASIGNATURA) 
FROM ASIGNATURA;

--Coste de la asignatura más cara y de la más barata

SELECT MAX(ASIGNATURA.COSTEBASICO), MIN(ASIGNATURA.COSTEBASICO)
FROM ASIGNATURA;

--Cuántas posibilidades de créditos de asignatura hay?

SELECT COUNT(ASIGNATURA.CREDITOS) 
FROM ASIGNATURA;

--Cuántos cursos hay?

SELECT COUNT(ASIGNATURA.CURSO) 
FROM ASIGNATURA;

--¿Cuántas ciudades hay?

SELECT COUNT (PERSONA.CIUDAD)
FROM PERSONA;

--Nombre y número de horas de todas las asignaturas.

SELECT ASIGNATURA.NOMBRE, ASIGNATURA.CREDITOS *10 AS NUMHORAS

FROM ASIGNATURA;

--Mostrar las asignaturas que no pertenecen a ninguna titulación.

SELECT ASIGNATURA.NOMBRE
FROM ASIGNATURA, TITULACION 
WHERE ASIGNATURA.IDTITULACION  IS NULL
GROUP BY ASIGNATURA.NOMBRE ;



--22--


--23--

SELECT (EXTRACT(DAY FROM PERSONA.FECHA_NACIMIENTO+1)), PERSONA.NOMBRE 
FROM PERSONA;

--24--

SELECT (EXTRACT(YEAR FROM SYSDATE)), EXTRACT(YEAR FROM PERSONA.FECHA_NACIMIENTO)
FROM PERSONA;


--25--

SELECT PERSONA.NOMBRE, PERSONA.APELLIDO 
FROM PERSONA
WHERE (EXTRACT (YEAR FROM SYSDATE )- (EXTRACT(YEAR FROM PERSONA.FECHA_NACIMIENTO)))<1997;

--26--

SELECT PERSONA.NOMBRE, PERSONA.APELLIDO 

FROM PERSONA, ALUMNO, PROFESOR 
WHERE PERSONA.DNI = PROFESOR.DNI 
AND PERSONA.DNI = ALUMNO.DNI;

--27--

SELECT SUM(ASIGNATURA.CREDITOS)
FROM ASIGNATURA, TITULACION
WHERE ASIGNATURA.IDTITULACION = TITULACION .IDTITULACION 
AND TITULACION.NOMBRE ='Matematicas';

--28--
SELECT COUNT(ASIGNATURA.IDASIGNATURA)
FROM ASIGNATURA, TITULACION
WHERE TITULACION.NOMBRE ='Matematicas';


--29--

SELECT ASIGNATURA.COSTEBASICO, PERSONA.NOMBRE 
FROM ASIGNATURA, ALUMNO, ALUMNO_ASIGNATURA, PERSONA

WHERE ASIGNATURA.IDASIGNATURA = ALUMNO_ASIGNATURA.IDASIGNATURA 
AND ALUMNO_ASIGNATURA.IDALUMNO =ALUMNO.IDALUMNO
AND PERSONA.DNI =ALUMNO.DNI ;

--30--
SELECT COUNT (ALUMNO_ASIGNATURA.IDALUMNO)
FROM ASIGNATURA, ALUMNO_ASIGNATURA 
WHERE ALUMNO_ASIGNATURA.IDASIGNATURA = ASIGNATURA.IDASIGNATURA
GROUP BY ASIGNATURA.IDASIGNATURA;










