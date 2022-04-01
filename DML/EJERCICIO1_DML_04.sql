CREATE TABLE FABRICANTE 
(codigo NUMBER (10),
nombre VARCHAR2 (100),

CONSTRAINT PK_FABRICANTE PRIMARY KEY (codigo)
);





CREATE TABLE PRODUCTO
(codigo NUMBER (10),
nombre VARCHAR2 (100),
precio NUMBER (5,2),
codigo_fabricante NUMBER (10),


CONSTRAINT PK_PRODUCTO PRIMARY KEY (codigo),
CONSTRAINT FK_PRODUCTO FOREIGN KEY (codigo_fabricante) REFERENCES FABRICANTE (codigo)
);

--SELECT * FROM FABRICANTE;

INSERT  INTO FABRICANTE (codigo, nombre) VALUES (1, 'Asus');
INSERT  INTO FABRICANTE (codigo, nombre) VALUES (2, 'Lenovo');
INSERT  INTO FABRICANTE (codigo, nombre) VALUES (3, 'Hawlett-Packard');
INSERT  INTO FABRICANTE (codigo, nombre) VALUES (4, 'Samsung');
INSERT  INTO FABRICANTE (codigo, nombre) VALUES (5, 'Seagate');
INSERT  INTO FABRICANTE (codigo, nombre) VALUES (6, 'Crucial');
INSERT  INTO FABRICANTE (codigo, nombre) VALUES (7, 'Gigabyte');
INSERT  INTO FABRICANTE (codigo, nombre) VALUES (8, 'Huawei');
INSERT  INTO FABRICANTE (codigo, nombre) VALUES (9, 'Xiaomi');
---><---

--ALTER TABLE PRODUCTO MODIFY precio NUMBER(6,2);--

INSERT  INTO PRODUCTO (codigo, nombre, precio, codigo_fabricante) VALUES (1,'Disco duro SATA3 1TB', 86.99, 5);
INSERT  INTO PRODUCTO (codigo, nombre, precio, codigo_fabricante) VALUES (2,'Memoria RAM DDR4 8GB', 120, 6);
INSERT  INTO PRODUCTO (codigo, nombre, precio, codigo_fabricante) VALUES (3,'Disco SSD 1 TB', 150.99, 4);
INSERT  INTO PRODUCTO (codigo, nombre, precio, codigo_fabricante) VALUES (4,'Geforce GTX 1050Ti', 185, 7);
INSERT  INTO PRODUCTO (codigo, nombre, precio, codigo_fabricante) VALUES (5,'Geforce GTX 1080 Xtreme', 755, 6);
INSERT  INTO PRODUCTO (codigo, nombre, precio, codigo_fabricante) VALUES (6,'Monitor 24 LED Full HD', 202, 1);
INSERT  INTO PRODUCTO (codigo, nombre, precio, codigo_fabricante) VALUES (7,'Monitor 27 LED Full HD', 245.99, 1);
INSERT  INTO PRODUCTO (codigo, nombre, precio, codigo_fabricante) VALUES (8,'Portatil Yoga 520', 559, 2);
INSERT  INTO PRODUCTO (codigo, nombre, precio, codigo_fabricante) VALUES (9,'Portatil Ideapd 320', 444, 2);
INSERT  INTO PRODUCTO (codigo, nombre, precio, codigo_fabricante) VALUES (10,'Impresora HP Deskjet 3720', 55.99, 3);
INSERT  INTO PRODUCTO (codigo, nombre, precio, codigo_fabricante) VALUES (11,'Impresora HP Laserjet Pro M26nw', 180, 3);

--SELECT * FROM PRODUCTO;--

--1 Inserta un nuevo fabricante indicando su código y su nombre---

INSERT  INTO FABRICANTE (codigo, nombre) VALUES (10, 'Nvidia');

---2. Inserta un nuevo fabricante indicando solamente su nombre.---

--En Oracle  no se podría añadir un registro a un campo solamente sin añadir datos para su clave primaria, pues al estar en no nula, tenemos que añadir necesariamente un dato y a posteriori el dato que queramos meter en el campo indicado.---

--3. Inserta un nuevo producto asociado a uno de los nuevos fabricantes. La
--sentencia de inserción debe--
---incluir: código, nombre, precio y código_fabricante.----

INSERT  INTO PRODUCTO (codigo, nombre, precio, codigo_fabricante) VALUES (12,'RTX 3060 ti', 699, 10);


--4. Inserta un nuevo producto asociado a uno de los nuevos fabricantes. La
--sentencia de inserción debe incluir: nombre, precio y código_fabricante.---

--En Oracle  no se podría añadir un registro a un campo solamente sin añadir datos para su clave primaria, pues al estar en no nula, tenemos que añadir necesariamente un dato y a posteriori el dato que queramos meter en el campo indicado.---

---5. Elimina el fabricante Asus. ¿Es posible eliminarlo? Si no fuese posible,
---¿qué cambios debería realizar para que fuese posible borrarlo?---

--DELETE FROM FABRICANTE WHERE nombre='Asus';

-- Directamente no se podŕia eliminar el fabricante ASUS por que su codigo está asociado a un producto de otra tabla, habŕia que hacer las siguientes modificaciones para que se pudises borrar en ambas tablas.---

ALTER TABLE PRODUCTO DROP CONSTRAINT FK_PRODUCTO;
ALTER TABLE PRODUCTO ADD CONSTRAINT FK_PRODUCTO  FOREIGN KEY (codigo_fabricante) REFERENCES FABRICANTE (codigo) ON DELETE CASCADE;
DELETE FROM FABRICANTE WHERE nombre='Asus';


--6. Elimina el fabricante Xiaomi. ¿Es posible eliminarlo? Si no fuese posible,
---¿qué cambios debería realizar para que fuese posible borrarlo?--

DELETE FROM FABRICANTE WHERE nombre='Xiaomi';

--Se podría eliminar por que el codigo de Xiaomi, correspondiente al valor 9
---No esta asociado a ningun producto como clave foranea--

----7. Actualiza el código del fabricante Lenovo y asígnale el valor 20. ¿Es
--posible actualizarlo? Si no fuese posible, ¿qué cambios debería realizar
--para que fuese actualizarlo?---




