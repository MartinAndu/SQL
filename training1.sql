DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS envios;
DROP TABLE IF EXISTS detalles_envios;

CREATE TABLE IF NOT EXISTS clientes (
	cod_cliente int NOT NULL,
	nombre text NOT NULL,
	tipo_cliente text NOT NULL
);

CREATE TABLE IF NOT EXISTS productos (
	nro_prod int NOT NULL,
	descripcion text NOT NULL,
	unidad_medida text NOT NULL,
	precio int NOT NULL
);

CREATE TABLE IF NOT EXISTS envios (
	cod_envio int NOT NULL,
	cod_cliente int NOT NULL,
	direccion text NOT NULL,
	ciudad text NOT NULL,
	provincia text NOT NULL
);

CREATE TABLE IF NOT EXISTS detalles_envios (
	cod_envio int NOT NULL,
	nro_prod int NOT NULL,
	cantidad_enviada int NOT NULL
);

INSERT INTO clientes (cod_cliente, nombre, tipo_cliente) VALUES
(1000, 'Darius'  , 'A'),
(2000, 'Leila'   , 'A'),
(3000, 'Juan'    , 'B'),
(4000, 'Mercedes', 'B');

INSERT INTO productos (nro_prod, descripcion, unidad_medida, precio) VALUES
(100, 'Secadora'  , 'unidad', 500 ),
(101, 'Tostadora' , 'unidad', 300 ),
(102, 'Lavarropa' , 'unidad', 2000),
(103, 'Licuadora' , 'unidad', 500 ),
(104, 'Sarten'    , 'unidad', 600 ),
(105, 'Microondas', 'unidad', 800 ),
(106, 'Cocina'    , 'unidad', 6000),
(107, 'Heladera'  , 'unidad', 5000);

INSERT INTO envios (cod_envio, cod_cliente, direccion, ciudad, provincia) VALUES
(300, 1000, 'Cochabamba 1347', 'Buenos Aires', 'CABA'),
(301, 1000, 'Cochabamba 1347', 'Buenos Aires', 'CABA'),
(302, 1000, 'Cochabamba 1347', 'Buenos Aires', 'CABA'),
(303, 1000, 'Cochabamba 1347', 'Buenos Aires', 'CABA'),
(304, 1000, 'Cochabamba 1347', 'Buenos Aires', 'CABA'),
(305, 2000, 'Viamonte 947'   , 'Buenos Aires', 'CABA'),
(306, 2000, 'Viamonte 947'   , 'Buenos Aires', 'CABA'),
(307, 2000, 'Viamonte 947'   , 'Buenos Aires', 'CABA'),
(308, 2000, 'Viamonte 947'   ,'Buenos Aires', 'CABA'),
(309, 3000, 'Paris 123'      , 'Buenos Aires', 'CABA'),
(310, 3000, 'Paris 123'      , 'Buenos Aires', 'CABA'),
(311, 4000, 'Carrer 14 de marc', 'Buenos Aires', 'CABA'),
(312, 4000, 'Carrer 14 de marc', 'Buenos Aires', 'CABA'),
(313, 4000, 'Carrer 14 de marc', 'Buenos Aires', 'CABA'),
(314, 4000, 'Carrer 14 de marc', 'Buenos Aires', 'CABA');

INSERT INTO detalles_envios (cod_envio, nro_prod, cantidad_enviada) VALUES 
(300, 100, 2),
(300, 101, 2),
(301, 101, 2),
(302, 101, 1),
(303, 101, 1),
(304, 101, 1),
(305, 102, 1),
(306, 100, 1),
(307, 103, 1),
(308, 103, 1),
(309, 100, 1),
(310, 100, 1),
(311, 104, 1),
(312, 101, 1),
(313, 100, 1),
(314, 103, 1);