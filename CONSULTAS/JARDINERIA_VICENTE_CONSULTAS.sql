--ALTER SESSION SET "_oracle_script"=TRUE;
--CREATE USER JARDINERIA_VICENTE IDENTIFIED BY JARDINERIA_VICENTE ;
--GRANT CONNECT, RESOURCE, DBA TO JARDINERIA_VICENTE  ;

--Subconsultas--
    --1 Devuelve el nombre del cliente con mayor límite de crédito.--

SELECT c.NOMBRE_CLIENTE 
FROM CLIENTE c 
WHERE c.LIMITE_CREDITO = (SELECT MAX(c2.LIMITE_CREDITO) 
FROM CLIENTE c2);

--2 Devuelve el nombre, apellido1 y cargo de los empleados que no representen a ningún cliente.--

SELECT e.NOMBRE , e.APELLIDO1, e.PUESTO 
FROM EMPLEADO e 
WHERE e.CODIGO_EMPLEADO  NOT IN (SELECT c.CODIGO_EMPLEADO_REP_VENTAS  FROM CLIENTE c );



 
