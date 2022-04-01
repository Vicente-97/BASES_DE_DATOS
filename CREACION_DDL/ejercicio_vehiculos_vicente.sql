CREATE TABLE vehiculos
(matricula VARCHAR2(7),
marca VARCHAR2(10) NOT NULL,
modelo VARCHAR2(10) NOT NULL,
fecha_compra DATE,	
precio_por_dia NUMBER(5,2),
CONSTRAINT pk_vehiculos1 PRIMARY KEY (matricula)
);

CREATE TABLE clientes
(dni VARCHAR2(9),
nombre VARCHAR2(30) NOT NULL,
nacionalidad VARCHAR2(30),
fecha_nacimiento DATE,
direccion VARCHAR2(50),
CONSTRAINT pk_clientes1 PRIMARY KEY (dni)
);

CREATE TABLE alquileres
(dni VARCHAR2(7) NOT NULL,
matricula VARCHAR2(2) NOT NULL,
FechaHora DATE,
numDias NUMBER(2) NOT NULL,
kilometros NUMBER(4) DEFAULT 0,
CONSTRAINT pk_alquileres PRIMARY KEY (dni,matricula,FechaHora),
CONSTRAINT fk_alquileres_dni1 FOREIGN KEY (dni) REFERENCES clientes(dni),
CONSTRAINT fk_alquileres_matricula1 FOREIGN KEY (matricula) REFERENCES vehiculos(matricula)
);
ALTER TABLE vehiculos ADD CONSTRAINT chk_fechacompra1 CHECK (EXTRACT(YEAR FROM fecha_compra)>2001);
ALTER TABLE vehiculos ADD CONSTRAINT chk_preciopordida1 CHECK (precio_por_dia>0);
ALTER TABLE alquileres ADD CONSTRAINT chk_kilometros1 CHECK (regexp_like(matricula,'[0-9]{4}[A-Z]{3}'));
ALTER TABLE clientes ADD CONSTRAINT chk_dni CHECK (regexp_like(dni, '[0-9]{7}[-]{1}[A-Z]{1}'));
ALTER TABLE vehiculos ADD totalkilometros NUMBER(4);





