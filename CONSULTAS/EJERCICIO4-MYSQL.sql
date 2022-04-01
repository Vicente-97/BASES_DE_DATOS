CREATE TABLE GAMA_PRODUCTO
(gama VARCHAR (50),
descripcion_texto VARCHAR(250),
descripcion_html VARCHAR(250),
imagen VARCHAR(256),

CONSTRAINT PK_GAMA_PRODUCTO PRIMARY KEY (gama)
);

CREATE TABLE PRODUCTO
(codigo_producto VARCHAR (15),
nombre VARCHAR(70),
gama VARCHAR(50),
dimensiones VARCHAR (25),
proveedor VARCHAR(50),
descripcion VARCHAR(250),
cantidad_en_stock INT (6),
precio_venta DECIMAL (15,2),
precio_proveedor DECIMAL (15,2),

CONSTRAINT PK_PRODUCTO PRIMARY KEY (codigo_producto),
CONSTRAINT FK_PRODUCTO FOREIGN KEY (gama) REFERENCES GAMA_PRODUCTO (gama)
);

CREATE TABLE OFICINA
(codigo_oficina VARCHAR (10),
ciudad VARCHAR(30),
pais VARCHAR(50),
region VARCHAR(50),
codigo_postal VARCHAR(10),
telefono VARCHAR(20),
linea_direccion1 VARCHAR(50),
linea_direccion2 VARCHAR(50),

CONSTRAINT PK_OFICINA PRIMARY KEY (codigo_oficina)
);

CREATE TABLE EMPLEADO
(codigo_empleado INT(11),
nombre VARCHAR (50),
apellido1 VARCHAR(50),
apellido2 VARCHAR(50),
extension VARCHAR(10),
email VARCHAR(100),
codigo_oficina VARCHAR(10),
codigo_jefe INT (11),
puesto VARCHAR(50),

CONSTRAINT PK_EMPLEADO PRIMARY KEY (codigo_empleado),
CONSTRAINT FK_EMPLEADO FOREIGN KEY (codigo_oficina) REFERENCES OFICINA (codigo_oficina),
CONSTRAINT FK_EMPLEADO_REFLE FOREIGN KEY (codigo_jefe) REFERENCES EMPLEADO (codigo_empleado)
);

CREATE TABLE CLIENTE
(codigo_cliente INT (11),
nombre_cliente VARCHAR(50),
nombre_contacto VARCHAR(30),
apellido_contacto VARCHAR (30),
telefono VARCHAR(15),
fax VARCHAR(15),
linea_direccion1 VARCHAR(50),
linea_direccion2 VARCHAR(50),
ciudad VARCHAR(50),
region VARCHAR(50),
pais VARCHAR(50),
codigo_postal VARCHAR(10),
codigo_empleado_rep_ventas INT(11),
limite_credito DECIMAL (15,2),

CONSTRAINT PK_CLIENTE PRIMARY KEY (codigo_cliente),
CONSTRAINT FK_CLIENTE FOREIGN KEY (codigo_empleado_rep_ventas) REFERENCES EMPLEADO (codigo_empleado)
);


CREATE TABLE PEDIDO
(codigo_pedido INT(11),
fecha_pedido DATE,
fecha_esperada DATE,
fecha_entrega DATE,
estado VARCHAR(15),
comentarios VARCHAR (250),
codigo_cliente INT(11),

CONSTRAINT PK_PEDIDO PRIMARY KEY (codigo_pedido),
CONSTRAINT FK_PEDIDO FOREIGN KEY (codigo_cliente) REFERENCES CLIENTE (codigo_cliente)
);

CREATE TABLE DETALLE_PEDIDO
(codigo_pedido INT(11),
codigo_producto VARCHAR (15),
cantidad INT(11),
precio_unidad DECIMAL(15,2),
numero_linea INT (6),

CONSTRAINT PK_DETALLE_PEDIDO PRIMARY KEY (codigo_pedido, codigo_producto),
CONSTRAINT FK_DETALLE_PEDIDO FOREIGN KEY (codigo_producto) REFERENCES PRODUCTO (codigo_producto),
CONSTRAINT FK_DETALLE_PEDIDO1 FOREIGN KEY (codigo_pedido) REFERENCES PEDIDO (codigo_pedido)
);


CREATE TABLE PAGO
(codigo_cliente INT(11),
forma_pago VARCHAR(40),
id_transaccion VARCHAR(50),
fecha_pago DATE,
total DECIMAL (15,2),

CONSTRAINT PK_PAGO PRIMARY KEY (id_transaccion),
CONSTRAINT FK_PAGO FOREIGN KEY (codigo_cliente) REFERENCES CLIENTE (codigo_cliente)
);
