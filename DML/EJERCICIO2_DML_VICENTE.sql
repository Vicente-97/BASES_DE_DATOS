CREATE TABLE DEPARTAMENTO
(codigo NUMBER (10),
nombre VARCHAR2 (100),
presupuesto NUMBER (8,2),

CONSTRAINT PK_DEPARTAMENTO PRIMARY KEY (codigo)

);






CREATE TABLE EMPLEADO
(codigo NUMBER(10),
nif VARCHAR2 (9),
nombre VARCHAR2 (100),
apellido1 VARCHAR2 (100),
apellido_2 VARCHAR2 (100),
codigo_departamento NUMBER (10),

CONSTRAINT PK_EMPLEADO PRIMARY KEY (codigo),
CONSTRAINT FK_EMPLEADO FOREIGN KEY (codigo_departamento) REFERENCES DEPARTAMENTO (codigo)

);


ALTER TABLE DEPARTAMENTO ADD gastos NUMBER (6);

INSERT INTO DEPARTAMENTO (codigo, nombre, presupuesto, gastos) VALUES (1, 'Desarrollo', 120000,6000);
INSERT INTO DEPARTAMENTO (codigo, nombre, presupuesto, gastos) VALUES (2, 'Sistemas', 150000,21000);
INSERT INTO DEPARTAMENTO (codigo, nombre, presupuesto, gastos) VALUES (3, 'Recursos Humanos', 280000,25000);
INSERT INTO DEPARTAMENTO (codigo, nombre, presupuesto, gastos) VALUES (4, 'Contabilidad', 110000,3000);
INSERT INTO DEPARTAMENTO (codigo, nombre, presupuesto, gastos) VALUES (5, 'I+D', 375000,380000);
INSERT INTO DEPARTAMENTO (codigo, nombre, presupuesto, gastos) VALUES (6, 'Proyectos', 0,0);
INSERT INTO DEPARTAMENTO (codigo, nombre, presupuesto, gastos) VALUES (7, 'Publicidad', 0,1000);

------------

INSERT INTO EMPLEADO (codigo, nif, nombre, apellido1, apellido_2, codigo_departamento) VALUES (1, '32481596F', 'Aarón','Rivero','Gómez',1);
INSERT INTO EMPLEADO (codigo, nif, nombre, apellido1, apellido_2, codigo_departamento) VALUES (2, 'Y5575632D', 'Adelfa','Salas','Díaz',2);
INSERT INTO EMPLEADO (codigo, nif, nombre, apellido1, apellido_2, codigo_departamento) VALUES (3, 'R6970642B', 'Adolfo','Rubio','Flores',3);
INSERT INTO EMPLEADO (codigo, nif, nombre, apellido1, apellido_2, codigo_departamento) VALUES (4, '77705545E', 'Adrian','Suarez', null,4);
INSERT INTO EMPLEADO (codigo, nif, nombre, apellido1, apellido_2, codigo_departamento) VALUES (5, '17087203C', 'Marcos','Loyola','Méndez',5);
INSERT INTO EMPLEADO (codigo, nif, nombre, apellido1, apellido_2, codigo_departamento) VALUES (6, '38382980M', 'María', 'Santana', 'Moreno', 1);
INSERT INTO EMPLEADO (codigo, nif, nombre, apellido1, apellido_2, codigo_departamento) VALUES (7, '80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO EMPLEADO (codigo, nif, nombre, apellido1, apellido_2, codigo_departamento) VALUES (8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3);
INSERT INTO EMPLEADO (codigo, nif, nombre, apellido1, apellido_2, codigo_departamento) VALUES (9, '56399183D', 'Juan', 'Gómez', 'López', 2);
INSERT INTO EMPLEADO (codigo, nif, nombre, apellido1, apellido_2, codigo_departamento) VALUES (10, '46384486H', 'Diego','Flores', 'Salas', 5);
INSERT INTO EMPLEADO (codigo, nif, nombre, apellido1, apellido_2, codigo_departamento) VALUES (11, '67389283A', 'Marta','Herrera', 'Gil', 1);
INSERT INTO EMPLEADO (codigo, nif, nombre, apellido1, apellido_2, codigo_departamento) VALUES (12, '41234836R', 'Irene','Salas', 'Flores', NULL);


--------------------

--1. Inserta un nuevo departamento indicando
--su código, nombre y presupuesto

INSERT INTO DEPARTAMENTO (codigo, nombre, presupuesto) VALUES (14, 'Ventas', 60000);

--2. Inserta un nuevo departamento indicando su nombre y presupuesto.

--No voy a poder por que codigo es su clave primaria y no se puede dejar sin registro o nulo--

---3. Inserta un nuevo departamento indicando
---su código, nombre, presupuesto y gastos--


INSERT INTO DEPARTAMENTO (codigo, nombre, presupuesto, gastos) VALUES (15, 'Marketing', 500000,150000);

--4. Inserta un nuevo empleado asociado a uno de los nuevos
--departamentos. La sentencia de inserción debe
--incluir: código, nif, nombre, apellido1, apellido2 y codigo_departamento.

INSERT INTO EMPLEADO (codigo, nif, nombre, apellido1, apellido_2, codigo_departamento) VALUES (15, '32481996V', 'Pablo','Perez','Villalba',15);


--5. Inserta un nuevo empleado asociado a uno de los nuevos
--departamentos. La sentencia de inserción debe
--incluir: nif, nombre, apellido1, apellido2 y codigo_departamento.

--No me va a dejar por que el código es su clave principal y no se puede dejar sin un registro o nulo.--

--6. Crea una nueva tabla con el nombre departamento_backup que tenga las
--mismas columnas que la tabla departamento. Una vez creada copia todos
--las filas de tabla departamento en departamento_backup.

CREATE TABLE DEPARTAMENTO_BACKUP
(codigo_backup NUMBER (10),
nombre_backup VARCHAR2 (100),
presupuesto_backup NUMBER (8,2),

CONSTRAINT PK_DEPARTAMENTO_BACKUP PRIMARY KEY (codigo_backup)

);

ALTER TABLE DEPARTAMENTO_BACKUP ADD gastos_backup NUMBER (6);

-------


INSERT INTO DEPARTAMENTO_BACKUP (codigo_backup, nombre_backup, presupuesto_backup, gastos_backup) VALUES (1, 'Desarrollo', 120000,6000);
INSERT INTO DEPARTAMENTO_BACKUP (codigo_backup, nombre_backup, presupuesto_backup, gastos_backup) VALUES (2, 'Sistemas', 150000,21000);
INSERT INTO DEPARTAMENTO_BACKUP (codigo_backup, nombre_backup, presupuesto_backup, gastos_backup) VALUES (3, 'Recursos Humanos', 280000,25000);
INSERT INTO DEPARTAMENTO_BACKUP (codigo_backup, nombre_backup, presupuesto_backup, gastos_backup) VALUES (4, 'Contabilidad', 110000,3000);
INSERT INTO DEPARTAMENTO_BACKUP (codigo_backup, nombre_backup, presupuesto_backup, gastos_backup) VALUES (5, 'I+D', 375000,380000);
INSERT INTO DEPARTAMENTO_BACKUP (codigo_backup, nombre_backup, presupuesto_backup, gastos_backup) VALUES (6, 'Proyectos', 0,0);
INSERT INTO DEPARTAMENTO_BACKUP (codigo_backup, nombre_backup, presupuesto_backup, gastos_backup) VALUES (7, 'Publicidad', 0,1000);


--7. Elimina el departamento Proyectos. ¿Es posible eliminarlo? Si no fuese
---posible, ¿qué cambios debería realizar para que fuese posible borrarlo?

DELETE FROM DEPARTAMENTO WHERE nombre='Proyectos';


---8. Elimina el departamento Desarrollo. ¿Es posible eliminarlo? Si no fuese
---posible, ¿qué cambios debería realizar para que fuese posible borrarlo?

ALTER TABLE EMPLEADO DROP CONSTRAINT FK_EMPLEADO;
ALTER TABLE EMPLEADO ADD CONSTRAINT FK_EMPLEADO  FOREIGN KEY (codigo_departamento) REFERENCES DEPARTAMENTO (codigo) ON DELETE CASCADE;


DELETE FROM DEPARTAMENTO WHERE nombre='Desarrollo';

SELECT * FROM DEPARTAMENTO;


--9. Actualiza el código del departamento Recursos Humanos y asígnale el valor
--30. ¿Es posible actualizarlo? Si no fuese posible, ¿qué cambios debería
--realizar para que fuese actualizarlo?--

INSERT INTO DEPARTAMENTO  (codigo, nombre, presupuesto, gastos) VALUES  (30, 'Recursos Humanos',280000,25000);

UPDATE EMPLEADO SET codigo_departamento=30 WHERE codigo_departamento=3;

---10. Actualiza el código del departamento Publicidad y asígnale el valor 40.
---¿Es posible actualizarlo? Si no fuese posible, ¿qué cambios debería
---realizar para que fuese actualizarlo?

UPDATE DEPARTAMENTO SET codigo =40 WHERE codigo =7;


--11. Actualiza el presupuesto de los departamentos sumándole 50000 € al
--valor del presupuesto actual, solamente a aquellos departamentos que
--tienen un presupuesto menor que 20000 €.

UPDATE DEPARTAMENTO SET presupuesto= presupuesto +50000 WHERE presupuesto <20000;

---12. Realiza una transacción que elimine todas los empleados que no tienen
---un departamento asociado.


DELETE FROM EMPLEADO WHERE codigo_departamento = NULL;
























