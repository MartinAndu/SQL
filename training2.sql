DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS articulos;
DROP TABLE IF EXISTS facturas;
DROP TABLE IF EXISTS detalle_facturas;

CREATE TABLE IF NOT EXISTS clientes (
	CUIT int NOT NULL,
	razon_social text NOT NULL,
	fecha_de_alta text NOT NULL
);

CREATE TABLE IF NOT EXISTS articulos (
	nro_articulo int NOT NULL,
	precio int NOT NULL,
	descripcion text NOT NULL,
	peso int NOT NULL,
	color text NOT NULL
);

CREATE TABLE IF NOT EXISTS facturas (
	nro_factura int NOT NULL,
	fecha DATE NOT NULL,
	CUIT int NOT NULL
);

CREATE TABLE IF NOT EXISTS detalle_facturas (
	nro_factura int NOT NULL,
	nro_articulo int NOT NULL,
	cantidad int NOT NULL
);


INSERT INTO clientes (CUIT, razon_social, fecha_de_alta) VALUES
(1000, 'DariusCo'  , '1992-08-11'),
(2000, 'LeilaCo'   , '1988-09-20'),
(3000, 'JuanCo'    , '1954-12-11'),
(4000, 'MercedesCo', '1955-05-26');
	
INSERT INTO articulos (nro_articulo, descripcion, peso, precio, color) VALUES
(100, 'Secadora'  , 20,  500, 'rojo'  ),
(101, 'Tostadora' ,  1,  300, 'rojo'  ),
(102, 'Lavarropa' , 40, 2000, 'negro' ),
(103, 'Licuadora' ,  3,  500, 'gris'  ),
(104, 'Sarten'    ,  1,  600, 'negro' ),
(105, 'Microondas', 10,  800, 'blanco'),
(106, 'Cocina'    , 50, 6000, 'gris'  ),
(107, 'Heladera'  , 50, 5000, 'rojo'  );

INSERT INTO facturas (nro_factura, CUIT, fecha) VALUES
(300, 1000, '2016-06-01'),
(301, 1000, '2018-06-01'),
(302, 1000, '2017-06-02'),
(303, 1000, '2018-06-02'),
(304, 1000, '2018-06-04'),
(305, 2000, '2018-06-01'),
(306, 2000, '2018-06-02'),
(307, 2000, '2018-06-03'),
(308, 2000, '2018-06-04'),
(309, 3000, '2018-06-04'),
(310, 3000, '2018-06-05'),
(311, 4000, '2018-06-01'),
(312, 4000, '2018-06-02'),
(313, 4000, '2018-06-02'),
(314, 4000, '2018-06-03');

INSERT INTO detalle_facturas (nro_factura, nro_articulo, cantidad) VALUES 
(300, 100, 2),
(300, 101, 2),
(300, 107, 1),
(300, 106, 4),
(301, 100, 2),
(301, 101, 2),
(301, 107, 1),
(301, 103, 2),
(302, 100, 1),
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