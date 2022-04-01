--ALTER SESSION SET "_oracle_script"=TRUE;
--CREATE USER EJERCICIO_CONSULTAS_2 IDENTIFIED BY EJERCICIO_CONSULTAS_2;
--GRANT CONNECT, RESOURCE, DBA TO EJERCICIO_CONSULTAS_2;


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


--Universidad 2--


--1 Para cada titulación ordenar por coste mostrando primero las asignaturas más caras y para las asignaturas del mismo coste mostrar por orden alfabético de nombre de asignatura. 



--2 Mostrar el nombre y los apellidos de los profesores. --

SELECT persona .nombre , persona.Apellido 
FROM PROFESOR, PERSONA
WHERE PROFESOR.DNI = PERSONA.DNI ;

--3 Mostrar el nombre de las asignaturas impartidas por profesores de Sevilla. --

SELECT ASIGNATURA.nombre 
FROM ASIGNATURA, PROFESOR, PERSONA
WHERE (ASIGNATURA.IDPROFESOR = PROFESOR.IDPROFESOR) AND (PROFESOR.DNI = PERSONA.DNI) AND persona.Ciudad LIKE 'Sevilla';



--4 Mostrar el nombre y los apellidos de los alumnos.--

SELECT persona.nombre, persona.Apellido 
FROM PERSONA, ALUMNO
WHERE ALUMNO.DNI = PERSONA.DNI ;


-- 5 Mostrar el DNI, nombre y apellidos de los alumnos que viven en Sevilla.

SELECT ALUMNO.DNI, persona.NOMBRE, persona.APELLIDO 
FROM PERSONA, ALUMNO 
WHERE ALUMNO.DNI= PERSONA.DNI AND Ciudad  LIKE 'Sevilla';


--6  Mostrar el DNI, nombre y apellidos de los alumnos matriculados en la asignatura "Seguridad Vial". --

SELECT ALUMNO.DNI, PERSONA.NOMBRE, PERSONA.APELLIDO 
FROM ALUMNO, PERSONA, ASIGNATURA
WHERE ALUMNO.DNI= PERSONA.DNI AND ASIGNATURA.NOMBRE ='Seguridad Vial';

--7--

SELECT ASIGNATURA.IDTITULACION 
FROM ALUMNO, ALUMNO_ASIGNATURA, ASIGNATURA
WHERE ALUMNO.IDALUMNO = ALUMNO_ASIGNATURA.IDALUMNO 
AND ALUMNO_ASIGNATURA.IDASIGNATURA =ASIGNATURA.IDASIGNATURA
AND ALUMNO.DNI LIKE '20202020A';

--8--

SELECT ASIGNATURA.NOMBRE 
FROM PERSONA, ALUMNO, ALUMNO_ASIGNATURA, ASIGNATURA
WHERE PERSONA.DNI=ALUMNO.DNI AND ALUMNO.IDALUMNO =ALUMNO_ASIGNATURA.IDALUMNO
AND ALUMNO_ASIGNATURA.IDASIGNATURA = ASIGNATURA.IDASIGNATURA 
AND PERSONA.NOMBRE LIKE 'Rosa' AND PERSONA.APELLIDO LIKE 'Garcia';

--9--

SELECT ALUMNO.DNI 
FROM PERSONA, PROFESOR, ASIGNATURA, ALUMNO_ASIGNATURA, ALUMNO
WHERE PERSONA.DNI=PROFESOR.DNI 
AND ALUMNO_ASIGNATURA.IDALUMNO  = ALUMNO.IDALUMNO 
AND PROFESOR.IDPROFESOR =ASIGNATURA.IDPROFESOR 
AND ASIGNATURA.IDASIGNATURA =ALUMNO_ASIGNATURA.IDASIGNATURA 
AND PERSONA.NOMBRE='Jorge'
AND PERSONA.APELLIDO ='Saenz';


--10--

SELECT ALUMNO.DNI, PERSONA.NOMBRE , PERSONA.APELLIDO 
FROM PERSONA, PROFESOR, ASIGNATURA, ALUMNO_ASIGNATURA, ALUMNO
WHERE PERSONA.DNI=PROFESOR.DNI 
AND PROFESOR.IDPROFESOR = ASIGNATURA.IDPROFESOR 
AND ASIGNATURA.IDASIGNATURA = ALUMNO_ASIGNATURA.IDASIGNATURA 
AND ALUMNO_ASIGNATURA.IDALUMNO = ALUMNO.IDALUMNO 
AND ALUMNO.DNI = PERSONA.DNI
AND PERSONA.DNI= PROFESOR.DNI 
AND PERSONA.NOMBRE='Jorge'
AND PERSONA.APELLIDO ='Saenz';

--11--
SELECT TITULACION.NOMBRE
FROM TITULACION, ASIGNATURA
WHERE TITULACION.IDTITULACION =ASIGNATURA.IDTITULACION 
AND ASIGNATURA.CREDITOS >=4;

--12--

SELECT ASIGNATURA.NOMBRE ,ASIGNATURA.CREDITOS, TITULACION.NOMBRE 
FROM ASIGNATURA, TITULACION
WHERE TITULACION.IDTITULACION =ASIGNATURA.IDTITULACION AND CUATRIMESTRE =1;

--13--

SELECT ASIGNATURA.NOMBRE , ASIGNATURA.COSTEBASICO , PERSONA.NOMBRE
FROM ASIGNATURA, PERSONA, ALUMNO_ASIGNATURA, ALUMNO
WHERE ASIGNATURA.IDASIGNATURA = ALUMNO_ASIGNATURA.IDASIGNATURA 
AND ALUMNO_ASIGNATURA.IDALUMNO  = ALUMNO.IDALUMNO 
AND ALUMNO.DNI =PERSONA.DNI ;

--14--

SELECT PERSONA.NOMBRE 
FROM PERSONA, PROFESOR , ASIGNATURA
WHERE PERSONA.DNI= PROFESOR.DNI
AND ASIGNATURA.IDPROFESOR = PROFESOR.IDPROFESOR 
AND COSTEBASICO BETWEEN 25 AND 35;

--15--

SELECT PERSONA.NOMBRE 
FROM PERSONA, ALUMNO, ALUMNO_ASIGNATURA
WHERE PERSONA.DNI =ALUMNO.DNI
AND ALUMNO.IDALUMNO  = ALUMNO_ASIGNATURA.IDALUMNO 
AND ALUMNO_ASIGNATURA.IDALUMNO ='150212'
AND ALUMNO_ASIGNATURA.IDALUMNO  ='130113'
AND ALUMNO_ASIGNATURA.IDALUMNO ='150212' AND ALUMNO_ASIGNATURA.IDALUMNO='130113';

--16--
SELECT ASIGNATURA.NOMBRE, TITULACION.NOMBRE 
FROM ASIGNATURA, TITULACION
WHERE ASIGNATURA.IDTITULACION =TITULACION.IDTITULACION 
AND ASIGNATURA.CUATRIMESTRE =2
AND ASIGNATURA.CREDITOS !=6;


--17--

SELECT ASIGNATURA.NOMBRE , ASIGNATURA.CREDITOS*10 AS HORAS, ALUMNO.DNI 
FROM ASIGNATURA, ALUMNO, ALUMNO_ASIGNATURA
WHERE ASIGNATURA.IDASIGNATURA= ALUMNO_ASIGNATURA.IDASIGNATURA 
AND ALUMNO.IDALUMNO = ALUMNO_ASIGNATURA.IDALUMNO ;


--18--

SELECT PERSONA.NOMBRE 
FROM PERSONA, ALUMNO, ALUMNO_ASIGNATURA
WHERE PERSONA.DNI=ALUMNO.DNI 
AND ALUMNO_ASIGNATURA.IDALUMNO  = ALUMNO.IDALUMNO 
AND PERSONA.VARON =0
AND PERSONA.CIUDAD LIKE 'Sevilla';


--19--

SELECT ASIGNATURA.NOMBRE 
FROM ASIGNATURA
WHERE CURSO =1
AND UPPER(IDPROFESOR)  = 'P101';

--20--

SELECT PERSONA.NOMBRE 
FROM PERSONA, ALUMNO, ALUMNO_ASIGNATURA
WHERE ALUMNO.DNI = PERSONA.DNI 
AND ALUMNO_ASIGNATURA.IDALUMNO = ALUMNO.IDALUMNO 
AND ALUMNO_ASIGNATURA.NUMEROMATRICULA >=3;




