DROP TABLE IF EXISTS usuario;
DROP TABLE IF EXISTS notebook;
DROP TABLE IF EXISTS compra;
DROP TABLE IF EXISTS soporte_tecnico;

CREATE TABLE IF NOT EXISTS usuario (
	num_usuario int NOT NULL,
	nombre text NOT NULL,
	telefono int NOT NULL,
	email text NOT NULL,
	direccion text NOT NULL,
	localidad text NOT NULL
);

CREATE TABLE IF NOT EXISTS notebook (
	cod_equipo int NOT NULL,
	marca text NOT NULL,
	descripcion text NOT NULL,
	detalle text NOT NULL,
	precio int NOT NULL
);

CREATE TABLE IF NOT EXISTS compra (
	cod_compra int NOT NULL,
	cod_equipo int NOT NULL,
	cod_soporte int NOT NULL,
	num_usuario int NOT NULL,
	fecha DATE NOT NULL,
	cantidad int NOT NULL
);

CREATE TABLE IF NOT EXISTS soporte_tecnico (
	cod_soporte int NOT NULL,
	nombre text NOT NULL,
	telefono int NOT NULL,
	email text NOT NULL,
	direccion text NOT NULL,
	localidad text NOT NULL
);

INSERT INTO usuario (num_usuario, nombre, telefono, email, direccion, localidad) VALUES
(1000, 'Darius'  , 1234, 'darius@darius.com', 'Dir1', 'Lanus'),
(2000, 'Leila'   , 2345, 'leila@leila.com', 'Dir2', 'La Matanza'),
(3000, 'Juan'    , 3456, 'juan@juan.com', 'Dir3', 'Tigre'),
(4000, 'Mercedes', 4567, 'mercedes@mercedes.com', 'Dir4', 'Tigre');

INSERT INTO notebook (cod_equipo, marca, descripcion, detalle, precio) VALUES
(100, 'HP'       , 'desc1',  'detalle1', 500),
(101, 'HP'       , 'desc2',  'detalle2', 600),
(102, 'TOSHIBA'  , 'desc3',  'detalle3', 450),
(103, 'LG'       , 'desc4',  'detalle4', 500),
(104, 'Lenovo'   , 'desc5',  'detalle5', 300 ),
(105, 'ACER'     , 'desc6',  'detalle6', 350),
(106, 'Alienware', 'desc7',  'detalle7', 1000),
(107, 'MAC'      , 'desc8',  'detalle8', 2000);

INSERT INTO compra (cod_compra, cod_equipo, num_usuario, cod_soporte, fecha, cantidad) VALUES
(300, 100, 1000, 80, '2016-06-01', 1),
(301, 101, 1000, 80, '2018-06-01', 2),
(302, 101, 1000, 80, '2017-06-02', 1),
(303, 102, 1000, 80, '2018-06-02', 1),
(304, 102, 1000, 80, '2018-06-04', 1),
(305, 101, 2000, 81, '2018-06-01', 1),
(306, 104, 2000, 80, '2018-06-02', 2),
(307, 104, 2000, 81, '2017-06-03', 3),
(308, 105, 2000, 81, '2018-06-04', 1),
(309, 107, 3000, 82, '2018-06-04', 3),
(310, 104, 3000, 82, '2018-06-05', 1),
(311, 105, 4000, 83, '2018-06-01', 1),
(312, 106, 4000, 83, '2018-06-02', 2),
(313, 106, 4000, 83, '2017-06-02', 1),
(314, 100, 4000, 83, '2018-06-03', 1);

INSERT INTO soporte_tecnico (cod_soporte, nombre, telefono, email, direccion, localidad) VALUES 
(80, 'PCrepair', 888888, 'pcrepair@gmail.com', 'pcrepair dir', 'Lanus'),
(81, 'SuportPC', 999999, 'support@gmail.com', 'suport pc dir', 'Tigre'),
(82, 'MatanzPC', 111111, 'matanzapc@gmail.com', 'matanzapc dir', 'La Matanza'),
(83, 'TigrePC' , 222222, 'tigrepc@gmail.com'  , 'tigre pc dir' , 'Tigre');