
-- Obtener el número y descripción de aquellos artículos que no fueron vendidos ni en el 2016 ni en el 2017

SELECT DISTINCT a.nro_articulo, a.descripcion FROM articulos AS a 
EXCEPT 
SELECT a.nro_articulo, a.descripcion FROM articulos AS a
INNER JOIN ( SELECT df.nro_articulo, EXTRACT (YEAR FROM f.fecha) AS anio FROM detalle_facturas AS df 
	INNER JOIN facturas AS f ON f.nro_factura = df.nro_factura) AS x
	ON x.nro_articulo = a.nro_articulo WHERE x.anio = '2016' OR x.anio = '2017'

-- clientes (CUIT, razon_social, fecha_de_alta)
-- articulos (nro_articulo, descripcion, peso, precio, color)
-- facturas (nro_factura, CUIT, fecha)
-- detalle_facturas (nro_factura, nro_articulo, cantidad) 
--b) Obtener el numero y fecha de aquellas facturas en las que se hayan facturado todos los articulos de color rojo

--------FAIL-----------

-- Obtener el CUIT y razón social de los clientes que compraron los artículos numero 100 y 101 
-- (es decir ambos articulos) pero que no hayan comprado el artículo número 107

SELECT c.CUIT, c.razon_social FROM clientes AS c INNER JOIN facturas AS f
ON f.CUIT = c.CUIT INNER JOIN (
	SELECT df.nro_factura FROM detalle_facturas AS df 
	WHERE df.nro_articulo = 100 
	INTERSECT 
	SELECT df.nro_factura FROM detalle_facturas AS df 
	WHERE df.nro_articulo = 101
	EXCEPT 
	SELECT df.nro_factura FROM detalle_facturas AS df 
	WHERE df.nro_articulo = 107
) AS x ON x.nro_factura = f.nro_factura; 

-- clientes (CUIT, razon_social, fecha_de_alta)
-- articulos (nro_articulo, descripcion, peso, precio, color)
-- facturas (nro_factura, CUIT, fecha)
-- detalle_facturas (nro_factura, nro_articulo, cantidad) 
--Obtener el número y descripción de los artículos más pesados.
SELECT DISTINCT a.nro_articulo, a.descripcion FROM articulos AS a
EXCEPT
SELECT DISTINCT a1.nro_articulo, a1.descripcion FROM articulos AS a1 , articulos AS a2 
WHERE a1.peso < a2.peso


SELECT c.CUIT, c.razon_social, MAX(f.fecha), COUNT(f.nro_factura)
FROM clientes AS c LEFT JOIN facturas AS f USING(CUIT) GROUP BY c.CUIT, c.razon_social;

-- Recuperatorio 06-06-2018 punto 1.b
-- Para aquellas facturas en las que se vendieron tanto el articulo de mayor peso como el
-- de menor peso (es decir, ambos art´ıculos), devuelva el n´umero de factura y el importe
-- total de la misma.
-- Notas: Si hubiera m´as de un articulo con el mayor peso, alcanza con que se haya vendido
-- al menos uno de ellos. ´Idem para el menor peso. Pueden haberse vendido tambi´en otros
-- art´ıculos en la factura.
-- El importe total se calcula haciendo la sumatoria del precio de cada art´ıculo de la factura
-- multiplicado por la cantidad facturada.
SELECT DISTINCT nro_factura, SUM(a.precio * de.cantidad) FROM facturas INNER JOIN detalle_facturas de
using (nro_factura) INNER JOIN articulos a USING(nro_articulo) where nro_factura =
ANY( (SELECT DISTINCT nro_factura FROM facturas INNER JOIN detalle_facturas de USING(nro_factura)
INNER JOIN articulos a USING(nro_articulo) WHERE a.precio = ANY( SELECT MAX(precio) from articulos))
INTERSECT
(SELECT DISTINCT nro_factura FROM facturas INNER JOIN detalle_facturas de USING(nro_factura)
INNER JOIN articulos a USING(nro_articulo) WHERE a.precio = ANY( SELECT MIN(precio) from articulos))
)
GROUP BY nro_factura


SELECT DISTINCT f.nro_factura, SUM(a.precio * df.cantidad) FROM facturas AS f
INNER JOIN detalle_facturas AS df USING(nro_factura) 
INNER JOIN articulos AS a USING(nro_articulo)
WHERE f.nro_factura = ANY(
	(SELECT f.nro_factura FROM facturas AS f
	INNER JOIN detalle_facturas AS df USING(nro_factura)
	INNER JOIN articulos AS a USING(nro_articulo)
	WHERE a.precio = (SELECT MIN(precio) FROM articulos))
		INTERSECT
	(SELECT f.nro_factura FROM facturas AS f
	INNER JOIN detalle_facturas AS df USING(nro_factura)
	INNER JOIN articulos AS a USING(nro_articulo)
	WHERE a.precio = (SELECT MAX(precio) FROM articulos)))
GROUP BY f.nro_factura;
	
SELECT f.nro_factura, f.fecha FROM facturas AS f
WHERE f.nro_factura = ANY(
	SELECT df.nro_factura FROM detalle_facturas AS df
	INNER JOIN articulos AS a USING(nro_articulo) 
	WHERE a.color = 'rojo' GROUP BY df.nro_facturax
	HAVING( COUNT( DISTINCT a.nro_articulo) = (SELECT COUNT(*) FROM articulos AS a WHERE a.color = 'rojo')))


	






