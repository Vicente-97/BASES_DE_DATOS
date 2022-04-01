CREATE TABLE GAMA_PRODUCTO
(gama VARCHAR2 (50),
descripcion_texto VARCHAR2(250),
descripcion_html VARCHAR2(250),
imagen VARCHAR2(256),

CONSTRAINT PK_GAMA_PRODUCTO PRIMARY KEY (gama)
);

CREATE TABLE PRODUCTO
(codigo_producto VARCHAR2 (15),
nombre VARCHAR2(70),
gama VARCHAR2(50),
dimensiones VARCHAR2 (25),
proveedor VARCHAR2(50),
descripcion VARCHAR2(250),
cantidad_en_stock NUMBER (6),
precio_venta DECIMAL (15,2),
precio_proveedor DECIMAL (15,2),

CONSTRAINT PK_PRODUCTO PRIMARY KEY (codigo_producto),
CONSTRAINT FK_PRODUCTO FOREIGN KEY (gama) REFERENCES GAMA_PRODUCTO (gama)
);

CREATE TABLE OFICINA
(codigo_oficina VARCHAR2 (10),
ciudad VARCHAR2(30),
pais VARCHAR2(50),
region VARCHAR2(50),
codigo_postal VARCHAR2(10),
telefono VARCHAR2(20),
linea_direccion1 VARCHAR2(50),
linea_direccion2 VARCHAR2(50),

CONSTRAINT PK_OFICINA PRIMARY KEY (codigo_oficina)
);

CREATE TABLE EMPLEADO
(codigo_empleado NUMBER(11),
nombre VARCHAR2 (50),
apellido1 VARCHAR2(50),
apellido2 VARCHAR2(50),
extension VARCHAR2(10),
email VARCHAR2(100),
codigo_oficina VARCHAR2(10),
codigo_jefe NUMBER (11),
puesto VARCHAR2(50),

CONSTRAINT PK_EMPLEADO PRIMARY KEY (codigo_empleado),
CONSTRAINT FK_EMPLEADO FOREIGN KEY (codigo_oficina) REFERENCES OFICINA (codigo_oficina),
CONSTRAINT FK_EMPLEADO_REFLE FOREIGN KEY (codigo_jefe) REFERENCES EMPLEADO (codigo_empleado)
);

CREATE TABLE CLIENTE
(codigo_cliente NUMBER (11),
nombre_cliente VARCHAR2(50),
nombre_contacto VARCHAR2 (30),
apellido_contacto VARCHAR2 (30),
telefono VARCHAR2(15),
fax VARCHAR2(15),
linea_direccion1 VARCHAR2(50),
linea_direccion2 VARCHAR2(50),
ciudad VARCHAR2(50),
region VARCHAR2(50),
pais VARCHAR2(50),
codigo_postal VARCHAR2(10),
codigo_empleado_rep_ventas NUMBER(11),
limite_credito DECIMAL (15,2),

CONSTRAINT PK_CLIENTE PRIMARY KEY (codigo_cliente),
CONSTRAINT FK_CLIENTE FOREIGN KEY (codigo_empleado_rep_ventas) REFERENCES EMPLEADO (codigo_empleado)
);


CREATE TABLE PEDIDO
(codigo_pedido NUMBER(11),
fecha_pedido DATE,
fecha_esperada DATE,
fecha_entrega DATE,
estado VARCHAR2(15),
comentarios VARCHAR2 (250),
codigo_cliente NUMBER(11),

CONSTRAINT PK_PEDIDO PRIMARY KEY (codigo_pedido),
CONSTRAINT FK_PEDIDO FOREIGN KEY (codigo_cliente) REFERENCES CLIENTE (codigo_cliente)
);

CREATE TABLE DETALLE_PEDIDO
(codigo_pedido NUMBER(11),
codigo_producto VARCHAR2 (15),
cantidad NUMBER(11),
precio_unidad DECIMAL(15,2),
numero_linea NUMBER (6),

CONSTRAINT PK_DETALLE_PEDIDO PRIMARY KEY (codigo_pedido, codigo_producto),
CONSTRAINT FK_DETALLE_PEDIDO FOREIGN KEY (codigo_producto) REFERENCES PRODUCTO (codigo_producto),
CONSTRAINT FK_DETALLE_PEDIDO1 FOREIGN KEY (codigo_pedido) REFERENCES PEDIDO (codigo_pedido)
);


CREATE TABLE PAGO
(codigo_cliente NUMBER(11),
forma_pago VARCHAR2(40),
id_transaccion VARCHAR2(50),
fecha_pago DATE,
total DECIMAL (15,2),

CONSTRAINT PK_PAGO PRIMARY KEY (id_transaccion),
CONSTRAINT FK_PAGO FOREIGN KEY (codigo_cliente) REFERENCES CLIENTE (codigo_cliente)
);

