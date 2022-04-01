--ALTER SESSION SET "_oracle_script"=TRUE;
--CREATE USER GESTION IDENTIFIED BY GESTION ;
--GRANT CONNECT, RESOURCE, DBA TO GESTION  ;

--DROP TABLE MOVIMIENTO;
--DROP TABLE TIPO_MOVIMIENTO;
--DROP TABLE CUENTA;
--DROP TABLE SUCURSAL;
--DROP TABLE CLIENTE;


CREATE TABLE CLIENTE(
  COD_CLIENTE VARCHAR(20) CONSTRAINT PK_CLIENTE PRIMARY KEY,
  APELLIDOS VARCHAR(50) NOT NULL,
  NOMBRE VARCHAR (30) NOT NULL,
  DIRECCION VARCHAR (50) NOT NULL
);

CREATE TABLE SUCURSAL(
  COD_SUCURSAL NUMBER(6) CONSTRAINT PK_SUCURSAL PRIMARY KEY,
  DIRECCION VARCHAR (50) NOT NULL,
  CAPITAL_ANIO_ANTERIOR NUMBER(14,2)
);

CREATE TABLE TIPO_MOVIMIENTO(
  COD_TIPO_MOVIMIENTO VARCHAR(6) CONSTRAINT PK_TIPO_MOVIMIENTO PRIMARY KEY,
  DESCRIPCION VARCHAR(200),
  SALIDA VARCHAR(3) CHECK(SALIDA='SI' OR SALIDA='No'));

CREATE TABLE CUENTA(
  COD_CUENTA NUMBER(10) CONSTRAINT PK_CUENTA PRIMARY KEY,
  SALDO NUMBER (10,2) NOT NULL,
  INTERES NUMBER (5,4) NOT NULL CHECK (INTERES < 1),
  COD_CLIENTE VARCHAR(20),
  COD_SUCURSAL NUMBER(6),
 CONSTRAINT FK_CUENTA_CLIENTE FOREIGN KEY (COD_CLIENTE) REFERENCES CLIENTE (COD_CLIENTE),
  CONSTRAINT FK_CUENTA_SUCURSAL FOREIGN KEY (COD_SUCURSAL) REFERENCES SUCURSAL (COD_SUCURSAL) 
);

CREATE TABLE MOVIMIENTO(
  COD_CUENTA NUMBER(10),
  MES NUMBER (2) CHECK (MES >= 1 AND MES <= 12),
  NUM_MOV_MES NUMBER(6),
  IMPORTE NUMBER(12,2) NOT NULL,
  FECHA_HORA TIMESTAMP NOT NULL,
  COD_TIPO_MOVIMIENTO VARCHAR(6),
  CONSTRAINT PK_MOVIMIENTO PRIMARY KEY(COD_CUENTA, MES, NUM_MOV_MES),
  CONSTRAINT FK_MOVIMIENTO_CUENTA FOREIGN KEY (COD_CUENTA) REFERENCES CUENTA(COD_CUENTA) ON DELETE CASCADE,
  CONSTRAINT FK_MOVIMIENTO_TIPO_MOVIMIENTO FOREIGN KEY (COD_TIPO_MOVIMIENTO) REFERENCES  TIPO_MOVIMIENTO (COD_TIPO_MOVIMIENTO) 
);
  
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion) VALUES ('ARUBIO', 'Rubio Caballero', 'Ana', 'C/ Col�n, 10');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('ASOTILLO', 'Sotillo Roda', '�ngeles', 'C/ Donoso Cort�s, 1');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('CALONSO', 'Alonso Cordero', 'Carlos', 'Ctra. De la Playa, 67');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('CLUENGO', 'Luengo G�mez', 'Cristina', 'C/ Lepanto, 17');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('EPEREZ', 'P�rez Honda', 'Eusebio', 'Paseo Castellana, 230');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('FSANTOS', 'Santos P�rez', 'Fernando', 'Avda. Juan Carlos I, 10');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion) VALUES ('IBUADES', 'Buades Avaro', 'Ignacio', 'Avda. San Antonio, 4');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('JALONSO', 'Alonso Alfaro', 'Jer�nimo', 'Avda. Santa Marina, 31');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('JARANAZ', 'Aranaz Rodr�guez', 'Juan Luis', 'C/ Virgen del ?guila, 8');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('JBECERRA', 'Becerra S�nchez', 'Jos�', 'C/ Col�n, 10');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('JGOMEZ', 'G�mez Trillar', 'Joaqu�n', 'C/ Donoso Cort�s, 1');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('JMARTINEZ', 'Mart�nez Moraes', 'Juan', 'Ctra. De la Playa, 67');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion) VALUES ('JSALINAS', 'Salinas del Mar', 'Javier', 'C/ Lepanto, 17');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('JSANTOS', 'Santos P�rez', 'Jaime', 'Paseo Castellana, 230');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('MCARDO', 'Cardo Merita', 'Mar�a', 'Avda. Juan Carlos I, 10');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('MFRANCO', 'Franco Alonso', 'Mar�a', 'Avda. San Antonio, 4');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('MGUTIERREZ', 'Guti�rrez Carro', 'Mar�a', 'Avda. Santa Marina, 31');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('OLUENGO', 'Luengo Casta�o', 'Ofelia', 'C/ Virgen del �guila, 8');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion) VALUES ('PALVAREZ', '�lvarez Morr�n', 'Paloma', 'C/ Virgen del �guila, 8');

INSERT INTO SUCURSAL (cod_sucursal, direccion, capital_anio_anterior ) VALUES (1, 'Avda. Juan Carlos I, 10', 120347);
INSERT INTO SUCURSAL (cod_sucursal, direccion, capital_anio_anterior ) VALUES (2, 'Paseo Castellana, 230', 259089);
INSERT INTO SUCURSAL (cod_sucursal, direccion, capital_anio_anterior ) VALUES (3, 'Ctra. De la Playa, 67', 100786);
INSERT INTO SUCURSAL (cod_sucursal, direccion, capital_anio_anterior ) VALUES (4, 'C/ Lepanto, 17', 70531);
INSERT INTO SUCURSAL (cod_sucursal, direccion, capital_anio_anterior ) VALUES (5, 'C / Juan de la Cosa', 500000);

INSERT INTO TIPO_MOVIMIENTO (cod_tipo_movimiento, descripcion, salida ) VALUES ('IE', 'Ingreso en efectivo', 'No');
INSERT INTO TIPO_MOVIMIENTO (cod_tipo_movimiento, descripcion, salida ) VALUES ('PR', 'Pago de recibo', 'SI');
INSERT INTO TIPO_MOVIMIENTO (cod_tipo_movimiento, descripcion, salida ) VALUES ('PT', 'Pago con tarjeta', 'SI');
INSERT INTO TIPO_MOVIMIENTO (cod_tipo_movimiento, descripcion, salida ) VALUES ('RC', 'Retirada por cajero autom�tico', 'SI');
INSERT INTO TIPO_MOVIMIENTO (cod_tipo_movimiento, descripcion, salida ) VALUES ('TR-E', 'Transferencia-Entrada', 'No');
INSERT INTO TIPO_MOVIMIENTO (cod_tipo_movimiento, descripcion, salida ) VALUES ('TR-S', 'Transferencia-Salida', 'SI' );

INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (121229, 'EPEREZ', 12300, 0.12, '1');

INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (121221, 'EPEREZ', 12300, 0.12, 1);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (121222, 'CLUENGO', 3690, 0.03, 4);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (121231, 'ASOTILLO', 31980, 0.06, 2);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (121236, 'ARUBIO', 36900, 0.05, 1);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (121237, 'CALONSO', 12300, 0.07, 3);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (121255, 'EPEREZ', 36900, 0.01, 3);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (121574, 'JBECERRA', 184500, 0.1, 2);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (124334, 'IBUADES', 15375, 0.01, 3);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (131274, 'EPEREZ', 14760, 0.11, 1);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (156234, 'JALONSO', 4920, 0.03, 4);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (185964, 'EPEREZ', 36900, 0.025, 4);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (199234, 'FSANTOS', 49200, 0.11, 2);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (331234, 'FSANTOS', 15375, 0.01, 2);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (881234, 'ASOTILLO', 7380, 0.031, 4);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (921234, 'FSANTOS', 29520, 0.2, 3);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (961234, 'JARANAZ', 73800, 0.014, 1);

INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 1, 1, 'IE', 120, TO_TIMESTAMP('23/1/2007 16:33:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 1, 2, 'TR-S', 300, TO_TIMESTAMP('30/1/2007 22:00:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 1, 3, 'RC', 300, TO_TIMESTAMP('23/1/2007 21:05:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 1, 4, 'PT', 1500, TO_TIMESTAMP('22/1/2007 14:55:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 1, 5, 'IE', 600, TO_TIMESTAMP('21/1/2007 12:43:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 1, 6, 'IE', 40, TO_TIMESTAMP('20/1/2007 23:30:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 1, 7, 'TR-S', 125, TO_TIMESTAMP('1/1/2007 22:14:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 1, 8, 'RC', 125, TO_TIMESTAMP('13/1/2007 16:33:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 1, 9, 'PT', 100, TO_TIMESTAMP('12/1/2007 22:00:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 1, 10, 'IE', 240, TO_TIMESTAMP('12/1/2007 23:30:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 1, 11, 'TR-S', 400, TO_TIMESTAMP('11/1/2007 22:14:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 2, 1, 'TR-S', 125, TO_TIMESTAMP('1/2/2007 22:14:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 2, 2, 'RC', 125, TO_TIMESTAMP('13/2/2007 16:33:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 2, 3, 'PT', 100, TO_TIMESTAMP('12/2/2007 22:00:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 2, 4, 'TR-S', 400, TO_TIMESTAMP('2/2/2007 14:55:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 2, 5, 'RC', 60, TO_TIMESTAMP('13/2/2007 12:43:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121231, 1, 1, 'PR', 300, TO_TIMESTAMP('1/1/2007 12:45:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121231, 1, 2, 'IE', 30, TO_TIMESTAMP('11/1/2007 21:05:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121231, 2, 1, 'RC', 260, TO_TIMESTAMP('2/2/2007 13:20:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121231, 2, 2, 'PT', 100, TO_TIMESTAMP('12/2/2007 22:00:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121231, 2, 3, 'TR-S', 125, TO_TIMESTAMP('1/2/2007 22:14:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121231, 2, 4, 'IE', 40, TO_TIMESTAMP('20/2/2007 23:30:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121231, 3, 1, 'TR-S', 100, TO_TIMESTAMP('3/3/2007 14:15:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121231, 3, 2, 'RC', 125, TO_TIMESTAMP('13/3/2007 16:33:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121236, 1, 1, 'IE', 600, TO_TIMESTAMP('21/1/2007 12:43:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121236, 1, 2, 'TR-S', 300, TO_TIMESTAMP('30/1/2007 22:00:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121236, 2, 1, 'PT', 1500, TO_TIMESTAMP('22/2/2007 14:55:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121236, 2, 2, 'IE', 120, TO_TIMESTAMP('23/2/2007 16:33:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121236, 2, 3, 'IE', 240, TO_TIMESTAMP('12/2/2007 23:30:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121236, 2, 4, 'RC', 60, TO_TIMESTAMP('13/2/2007 12:43:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121236, 3, 1, 'RC', 300, TO_TIMESTAMP('23/3/2007 21:05:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121236, 3, 2, 'TR-S', 400, TO_TIMESTAMP('11/3/2007 22:14:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121574, 2, 1, 'TR-S', 125, TO_TIMESTAMP('1/2/2007 22:14:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121574, 2, 2, 'RC', 125, TO_TIMESTAMP('13/2/2007 16:33:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121574, 2, 3, 'PT', 100, TO_TIMESTAMP('12/2/2007 22:00:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121574, 2, 4, 'TR-S', 400, TO_TIMESTAMP('2/2/2007 14:55:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121574, 3, 1, 'RC', 60, TO_TIMESTAMP('13/3/2007 12:43:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121574, 3, 2, 'IE', 240, TO_TIMESTAMP('12/3/2007 23:30:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121574, 3, 3, 'TR-S', 400, TO_TIMESTAMP('11/3/2007 22:14:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121574, 3, 4, 'IE', 120, TO_TIMESTAMP('23/3/2007 16:33:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121574, 3, 5, 'TR-S', 300, TO_TIMESTAMP('30/3/2007 22:00:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121574, 3, 6, 'RC', 300, TO_TIMESTAMP('23/3/2007 21:05:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121574, 3, 7, 'PT', 1500, TO_TIMESTAMP('22/3/2007 14:55:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121574, 3, 8, 'IE', 600, TO_TIMESTAMP('21/3/2007 12:43:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121574, 3, 9, 'IE', 40, TO_TIMESTAMP('20/3/2007 23:30:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 1, 1, 'RC', 300, TO_TIMESTAMP('23/1/2007 21:05:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 1, 2, 'PT', 1500, TO_TIMESTAMP('22/1/2007 14:55:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 1, 3, 'IE', 600, TO_TIMESTAMP('21/1/2007 12:43:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 1, 4, 'IE', 40, TO_TIMESTAMP('20/1/2007 23:30:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 1, 5, 'TR-S', 125, TO_TIMESTAMP('1/1/2007 22:14:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 1, 6, 'RC', 125, TO_TIMESTAMP('13/1/2007 16:33:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 2, 1, 'RC', 125, TO_TIMESTAMP('13/2/2007 16:33:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 2, 2, 'PT', 100, TO_TIMESTAMP('12/2/2007 22:00:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 2, 3, 'TR-S', 400, TO_TIMESTAMP('2/2/2007 14:55:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 2, 4, 'RC', 60, TO_TIMESTAMP('13/2/2007 12:43:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 2, 5, 'IE', 240, TO_TIMESTAMP('12/2/2007 23:30:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 2, 6, 'TR-S', 400, TO_TIMESTAMP('11/2/2007 22:14:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 2, 7, 'IE', 120, TO_TIMESTAMP('23/2/2007 16:33:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 2, 8, 'TR-S', 300, TO_TIMESTAMP('28/2/2007 22:00:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 3, 1, 'IE', 120, TO_TIMESTAMP('23/3/2007 16:33:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 3, 2, 'TR-S', 300, TO_TIMESTAMP('30/3/2007 22:00:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 3, 3, 'IE', 40, TO_TIMESTAMP('20/3/2007 23:30:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 3, 4, 'TR-S', 125, TO_TIMESTAMP('1/3/2007 22:14:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (881234, 1, 1, 'TR-S', 400, TO_TIMESTAMP('2/1/2007 14:55:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (881234, 1, 2, 'TR-S', 150, TO_TIMESTAMP('11/1/2007 13:20:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (881234, 3, 1, 'IE', 100, TO_TIMESTAMP('3/3/2007 12:45:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (881234, 3, 2, 'IE', 300, TO_TIMESTAMP('12/3/2007 14:15:00', 'DD/MM/YYYY HH24:MI:SS'));

COMMIT;


--Base de datos Boletín 3 Consultas
--CONSULTAS DE RESUMEN CON SQL:
--Para los siguientes ejemplos usaremos la base de datos: Banco.sql que posee el
--siguiente diagrama entidad-relación:

--1. Mostrar el saldo medio de todas las cuentas de la entidad bancaria con dos decimales y
--la suma de los saldos de todas las cuentas bancarias.


SELECT TRUNC(AVG(NVL(SALDO,0)),2)  AS SALDO_MEDIO, TRUNC(SUM(SALDO),2) AS SUMA_TOTAL
FROM CUENTA;

--2. Mostrar el saldo mínimo, máximo y medio de todas las cuentas bancarias

SELECT AVG(NVL(SALDO,0))  AS SALDO_MEDIO, MAX(SALDO) AS SALDO_MAXIMO, MIN(SALDO) AS SALDO_MINIMO
FROM CUENTA;

--3. Mostrar la suma de los saldos y el saldo medio de las cuentas bancarias por cada
--código de sucursal.

SELECT s.COD_SUCURSAL ,SUM(c.SALDO) AS SUMA_TOTAL, AVG(NVL(c.SALDO,0))  AS SALDO_MEDIO
FROM CUENTA c, SUCURSAL s 
WHERE c.COD_SUCURSAL = s.COD_SUCURSAL 
AND s.COD_SUCURSAL IS NOT NULL
GROUP BY s.COD_SUCURSAL;

--4. Para cada cliente del banco se desea conocer su código, la cantidad total que tiene
--depositada en la entidad y el número de cuentas abiertas.

SELECT c2.COD_CLIENTE  , sum(c2.SALDO), COUNT(c2.COD_CUENTA)
FROM CUENTA c2  
GROUP BY c2.COD_CLIENTE;

--5. Retocar la consulta anterior para que aparezca el nombre y apellidos de cada cliente en
--vez de su código de cliente.


SELECT c.NOMBRE ,c.APELLIDOS, c2.SALDO, COUNT(m.COD_CUENTA)
FROM CUENTA c2 , MOVIMIENTO m , CLIENTE c 
WHERE m.COD_CUENTA = c2.COD_CUENTA 
AND c2.COD_CLIENTE =c.COD_CLIENTE
GROUP BY c.NOMBRE ,c.APELLIDOS, c2.SALDO;

--6. Para cada sucursal del banco se desea conocer su dirección, el número de cuentas que
--tiene abiertas y la suma total que hay en ellas

SELECT s.DIRECCION, COUNT(c.COD_CUENTA), SUM(c.SALDO)  
FROM SUCURSAL s, CUENTA c 
WHERE s.COD_SUCURSAL = c.COD_SUCURSAL 
GROUP BY s.DIRECCION;

--7. Mostrar el saldo medio y el interés medio de las cuentas a las que se le aplique un
--interés mayor del 10%, de las sucursales 1 y 2.

SELECT TRUNC(AVG(NVL(c.SALDO,0)),2) AS SALDO_MEDIO, AVG(NVL(c.INTERES ,0)) AS INTERES_MEDIO
FROM CUENTA c 
WHERE c.INTERES >0.10
AND (c.COD_SUCURSAL = 1) 
OR (c.COD_SUCURSAL =2);

--8. Mostrar los tipos de movimientos de las cuentas bancarias, sus descripciones y el
--volumen total de dinero que se manejado en cada tipo de movimiento

SELECT tm.COD_TIPO_MOVIMIENTO , tm.DESCRIPCION , SUM(m.IMPORTE) AS DINERO_TOTAL
FROM TIPO_MOVIMIENTO tm , MOVIMIENTO m 
WHERE tm.COD_TIPO_MOVIMIENTO = m.COD_TIPO_MOVIMIENTO
GROUP BY tm.COD_TIPO_MOVIMIENTO , tm.DESCRIPCION;

--9 Mostrar cuál es la cantidad media que los clientes de nuestro banco tienen en el
--epígrafe “Retirada por cajero automático”.


SELECT c.COD_CLIENTE , AVG(NVL(m.IMPORTE,0)), tm.DESCRIPCION 
FROM CUENTA c , MOVIMIENTO m , TIPO_MOVIMIENTO tm 
WHERE c.COD_CUENTA = m.COD_CUENTA 
AND m.COD_TIPO_MOVIMIENTO = tm.COD_TIPO_MOVIMIENTO 
AND tm.COD_TIPO_MOVIMIENTO  LIKE 'RC'
GROUP BY c.COD_CLIENTE, tm.DESCRIPCION;


--10 Calcular la cantidad total de dinero que emite la entidad bancaria clasificada según los
--tipos de movimientos de salida.

SELECT c.COD_SUCURSAL AS NUMERO_DE_SUCURSAL , SUM(m.IMPORTE) AS SUMA_TOTAL_DINERO_EMITIDO, tm.SALIDA 
FROM CUENTA c , MOVIMIENTO m , TIPO_MOVIMIENTO tm 
WHERE c.COD_CUENTA = m.COD_CUENTA 
AND m.COD_TIPO_MOVIMIENTO = tm.COD_TIPO_MOVIMIENTO 
AND tm.SALIDA = 'SI'
GROUP BY c.COD_SUCURSAL, tm.SALIDA;


--11 Calcular la cantidad total de dinero que ingresa cada cuenta bancaria clasificada según
--los tipos de movimientos de entrada mostrando además la descripción del tipo de
--movimiento.

SELECT c.COD_SUCURSAL AS NUMERO_DE_SUCURSAL , SUM(m.IMPORTE) AS SUMA_TOTAL_DINERO_INGRESADO, tm.DESCRIPCION 
FROM CUENTA c , MOVIMIENTO m , TIPO_MOVIMIENTO tm 
WHERE c.COD_CUENTA = m.COD_CUENTA 
AND m.COD_TIPO_MOVIMIENTO = tm.COD_TIPO_MOVIMIENTO 
AND tm.SALIDA = 'No'
GROUP BY c.COD_SUCURSAL, tm.DESCRIPCION ;

--12 Calcular la cantidad total de dinero que sale de la sucursal de Paseo Castellana

SELECT SUM(m.IMPORTE) AS DINERO_TOTAL_DE_SALIDA
FROM MOVIMIENTO m , CUENTA c, TIPO_MOVIMIENTO tm 
WHERE m.COD_CUENTA = c.COD_CUENTA 
AND tm.COD_TIPO_MOVIMIENTO = m.COD_TIPO_MOVIMIENTO 
AND tm.SALIDA ='SI'
AND c.COD_SUCURSAL = (SELECT s.COD_SUCURSAL 
					  FROM SUCURSAL s 
					  WHERE s.DIRECCION LIKE '%Paseo Castellana%');


--13 Mostrar la suma total por tipo de movimiento de las cuentas bancarias de los clientes
--del banco. Se deben mostrar los siguientes campos: apellidos, nombre, cod_cuenta,
--descripción del tipo movimiento y el total acumulado de los movimientos de un
--mismo tipo.
					 
SELECT DISTINCT c.NOMBRE , c.APELLIDOS , m.COD_CUENTA , tm.DESCRIPCION , SUM(m.IMPORTE) AS SUMA_DEL_IMPORTE
FROM CLIENTE c,CUENTA c2 , MOVIMIENTO m, TIPO_MOVIMIENTO tm 
WHERE c.COD_CLIENTE  = c2.COD_CLIENTE  
AND c2.COD_CUENTA = m.COD_CUENTA 
AND m.COD_TIPO_MOVIMIENTO = tm.COD_TIPO_MOVIMIENTO 
GROUP BY c.NOMBRE , c.APELLIDOS , m.COD_CUENTA , tm.DESCRIPCION
ORDER BY c.NOMBRE ;

--14. Contar el número de cuentas bancarias que no tienen asociados movimientos.

SELECT COUNT(m.COD_CUENTA) 
FROM MOVIMIENTO m 
WHERE m.COD_TIPO_MOVIMIENTO IS NULL 
OR m.NUM_MOV_MES IS NULL;

--15 Por cada cliente, contar el número de cuentas bancarias que posee sin movimientos. Se
--deben mostrar los siguientes campos: cod_cliente, num_cuentas_sin_movimiento.

SELECT c2.COD_CLIENTE, COUNT(m.COD_CUENTA) AS NUM_CUENTAS_SIN_MOVIMIENTO
FROM  CUENTA c2 ,MOVIMIENTO m 
WHERE c2.COD_CUENTA = m.COD_CUENTA 
AND m.NUM_MOV_MES  IS NULL 
OR m.NUM_MOV_MES  =0
GROUP BY c2.COD_CLIENTE;

--16  Mostrar el código de cliente, la suma total del dinero de todas sus cuentas y el número
--de cuentas abiertas, sólo para aquellos clientes cuyo capital supere los 35.000 euros.

SELECT c.COD_CLIENTE , SUM(c.SALDO)AS DINERO_CUENTA, COUNT(c.COD_CUENTA) AS NUMERO_CUENTAS
FROM CUENTA c 
WHERE c.SALDO >35000
GROUP BY c.COD_CLIENTE;

--17 Mostrar los apellidos, el nombre y el número de cuentas abiertas sólo de aquellos
--clientes que tengan más de 2 cuentas.

SELECT c.NOMBRE , c.NOMBRE, COUNT(c2.COD_CUENTA)
FROM CLIENTE c , CUENTA c2 
WHERE c.COD_CLIENTE = c2.COD_CLIENTE
HAVING COUNT(c2.COD_CUENTA)>2
GROUP BY c.NOMBRE , c.NOMBRE;

--18 Mostrar el código de sucursal, dirección, capital del año anterior y la suma de los
--saldos de sus cuentas, sólo de aquellas sucursales cuya suma de los saldos de las
--cuentas supera el capital del año anterior ordenadas por sucursal.

SELECT s.COD_SUCURSAL , s.DIRECCION , s.CAPITAL_ANIO_ANTERIOR, SUM(c.SALDO) AS SUMA_SALDO_CUENTAS_SUCURSAL
FROM SUCURSAL s, CUENTA c 
WHERE s.COD_SUCURSAL = c.COD_SUCURSAL 
HAVING SUM(c.SALDO)>s.CAPITAL_ANIO_ANTERIOR
GROUP BY s.COD_SUCURSAL , s.DIRECCION , s.CAPITAL_ANIO_ANTERIOR
ORDER BY s.COD_SUCURSAL ;

--19 Mostrar el código de cuenta, su saldo, la descripción del tipo de movimiento y la suma
--total de dinero por movimiento, sólo para aquellas cuentas cuya suma total de dinero
--por movimiento supere el 20% del saldo.

SELECT DISTINCT c.COD_CUENTA , c.SALDO , tm.DESCRIPCION , SUM(m.IMPORTE*m.NUM_MOV_MES)AS SUMA_TOTAL_DINERO_POR_MOVIMIENTO
FROM CUENTA c , MOVIMIENTO m , TIPO_MOVIMIENTO tm 
WHERE c.COD_CUENTA = m.COD_CUENTA 
AND m.COD_TIPO_MOVIMIENTO = tm.COD_TIPO_MOVIMIENTO 
GROUP BY c.COD_CUENTA , c.SALDO , tm.DESCRIPCION
HAVING SUM(m.IMPORTE*m.NUM_MOV_MES)>(c.SALDO*0.20);

--20 Mostrar los mismos campos del ejercicio anterior pero ahora sólo de aquellas cuentas
--cuya suma de importes por movimiento supere el 10% del saldo y no sean de la
--sucursal 4.

SELECT c.COD_CUENTA , c.SALDO , tm.DESCRIPCION , SUM(m.IMPORTE*m.NUM_MOV_MES) AS SUMA_TOTAL_DINERO_POR_MOVIMIENTO
FROM CUENTA c , MOVIMIENTO m , TIPO_MOVIMIENTO tm 
WHERE c.COD_CUENTA = m.COD_CUENTA 
AND m.COD_TIPO_MOVIMIENTO = tm.COD_TIPO_MOVIMIENTO
AND c.COD_SUCURSAL <> 4
GROUP BY c.COD_CUENTA , c.SALDO , tm.DESCRIPCION
HAVING SUM(m.IMPORTE*m.NUM_MOV_MES)>(c.SALDO*0.10);


--21 Mostrar los datos de aquellos clientes para los que el saldo de sus cuentas suponga al
--menos el 20% del capital del año anterior de su sucursal

SELECT DISTINCT c.COD_CLIENTE , c.APELLIDOS , c.NOMBRE , c.DIRECCION 
FROM CLIENTE c , CUENTA c2 , SUCURSAL s 
WHERE c.COD_CLIENTE = c2.COD_CLIENTE 
AND c2.COD_SUCURSAL = s.COD_SUCURSAL 
AND c2.SALDO >= (s.CAPITAL_ANIO_ANTERIOR *0.20);











