-- Obtenga el numero (columna nro prod) y descripcion de aquellos productos que fueron
-- enviados al cliente de codigo 1000 (columna cod cliente) y no fueron enviados ni al
-- cliente de codigo 2000 ni al de codigo 3000.

SELECT prod.nro_prod, prod.descripcion, env.cod_cliente FROM productos AS prod INNER JOIN detalles_envios 
AS de ON prod.nro_prod = de.nro_prod 
INNER JOIN envios AS env ON env.cod_envio = de.cod_envio 
GROUP BY prod.nro_prod, prod.descripcion, env.cod_cliente;

SELECT pr.nro_prod,pr.descripcion FROM productos AS pr
WHERE pr.nro_prod = ANY 
          (SELECT de.nro_prod FROM detalles_envios AS de
          INNER JOIN envios AS en ON de.cod_envio = en.cod_envio
          WHERE en.cod_cliente = 1000)
AND pr.nro_prod != ALL 
          (SELECT de.nro_prod FROM detalles_envios AS de
          INNER JOIN envios AS en ON de.cod_envio = en.cod_envio
          WHERE en.cod_cliente = 2000 OR en.cod_cliente = 3000);


-- Para cada cliente al que se le hayan efectuado al menos tres envios, devuelva su codigo
-- de cliente, nombre y cantidad de distintos productos que se le enviaron. Ordene el
-- listado por esta ultima cantidad descendente.
SELECT cli.cod_cliente, cli.nombre, COUNT(DISTINCT de.nro_prod) FROM 
clientes AS cli INNER JOIN envios AS env ON cli.cod_cliente = env.cod_cliente 
INNER JOIN detalles_envios AS de ON env.cod_envio = de.cod_envio
GROUP BY cli.cod_cliente, cli.nombre HAVING (COUNT(DISTINCT de.cod_envio) >= 3)
ORDER BY COUNT(DISTINCT de.nro_prod) DESC;

--clientes (cod cliente, nombre, tipo cliente)
--productos (nro prod, descripcion, unidad medida, precio)
--envios (cod envio, cod cliente, direccion, ciudad, provincia)
--detalles envios (cod envio, nro prod, cantidad enviada)
-- Para aquellos productos que hayan sido enviados al menos una vez a todos los clientes,
-- devuelva su numero de producto (columna nro prod) y descripcion.

SELECT p.nro_prod, p.descripcion FROM productos AS p
INNER JOIN detalles_envios AS de ON de.nro_prod = p.nro_prod
INNER JOIN envios AS e ON e.cod_envio = de.cod_envio
GROUP BY p.nro_prod, p.descripcion 
HAVING ( COUNT (DISTINCT e.cod_cliente) = (SELECT COUNT(*) FROM clientes))

SELECT prod.nro_prod, prod.descripcion FROM productos AS prod 
WHERE NOT exists ((SELECT cli.cod_cliente FROM clientes AS cli)
EXCEPT (SELECT env.cod_cliente FROM detalles_envios AS de INNER JOIN 
envios AS env ON de.cod_envio = env.cod_envio WHERE de.nro_prod = prod.nro_prod))

SELECT p.nro_prod, p.descripcion FROM productos AS p
INNER JOIN detalles_envios AS de on de.nro_prod = p.nro_prod
INNER JOIN envios AS e on e.cod_envio = de.cod_envio
GROUP BY p.nro_prod, p.descripcion 
HAVING COUNT(DISTINCT(e.cod_cliente)) = (select COUNT(*) FROM clientes)

-- Para cada env ́ıo hecho al cliente de c ́odigo 1000 (columna cod cliente), indique el codigo
-- de envio, la direccion a la que debe ser enviado, cuantos distintos productos se enviaron
-- en el envio y la cantidad total enviada de todos los productos que conforman el envio.

SELECT e.cod_envio, e.direccion, COUNT(DISTINCT de.nro_prod), SUM(de.cantidad_enviada) FROM envios AS e
INNER JOIN detalles_envios AS de ON e.cod_envio = de.cod_envio WHERE e.cod_cliente = 1000 
GROUP BY e.cod_envio, e.direccion;

-- Para aquellos clientes a los que se les haya enviado al menos uno de los productos de
-- mayor precio, devuelva su codigo de cliente y nombre.

SELECT c.cod_cliente, c.nombre FROM clientes AS c
INNER JOIN envios AS e ON e.cod_cliente = c.cod_cliente 
INNER JOIN detalles_envios AS de ON de.cod_envio = e.cod_envio
INNER JOIN productos AS p ON p.nro_prod = de.nro_prod
GROUP BY c.cod_cliente, c.nombre, p.precio
HAVING p.precio = (SELECT MAX(precio) FROM productos);


--clientes (cod cliente, nombre, tipo cliente)
--productos (nro prod, descripcion, unidad medida, precio)
--envios (cod envio, cod cliente, direccion, ciudad, provincia)
--detalles envios (cod envio, nro prod, cantidad enviada)
-- Para cada tipo de cliente, devuelva el tipo de cliente, cuantos clientes son de dicho tipo
-- y cuantos envios se les hizo a clientes de ese tipo
select c.tipo_cliente, COUNT( DISTINCT c.cod_cliente), COUNT(e.cod_envio)
FROM clientes as c INNER JOIN envios as e ON c.cod_cliente = e.cod_cliente
GROUP BY c.tipo_cliente;



--a) Obtenga el n´umero (columna nro prod) y descripci´on de aquellos productos que fueron
--enviados al cliente de c´odigo 1000 (columna cod cliente) y no fueron enviados ni al
--cliente de c´odigo 2000 ni al de c´odigo 3000.

SELECT DISTINCT p.nro_prod, p.descripcion FROM productos AS p
INNER JOIN detalles_envios AS de USING(nro_prod)
WHERE de.nro_prod = ANY(
	(SELECT de.nro_prod FROM detalles_envios de INNER JOIN envios AS e USING(cod_envio) 
	WHERE e.cod_cliente = 1000)
	EXCEPT
	(SELECT de.nro_prod FROM detalles_envios de INNER JOIN envios AS e USING(cod_envio) 
	WHERE e.cod_cliente = 2000)
	EXCEPT
	(SELECT de.nro_prod FROM detalles_envios de INNER JOIN envios AS e USING(cod_envio) 
	WHERE e.cod_cliente = 3000))


SELECT DISTINCT nro_prod, descripcion FROM productos p 
INNER JOIN detalles_envios de USING (nro_prod)
INNER JOIN envios e USING(cod_envio)
WHERE e.cod_cliente = 1000 AND nro_prod != ALL (
	SELECT nro_prod FROM productos INNER JOIN
	detalles_envios USING (nro_prod) INNER JOIN
	envios e USING (cod_envio) WHERE e.cod_cliente
	IN (2000,3000))

SELECT c.cod_cliente, c.nombre, COUNT(DISTINCT de.nro_prod) FROM clientes AS c
INNER JOIN envios AS e USING(cod_cliente) INNER JOIN detalles_envios AS de USING(cod_envio)
GROUP BY c.cod_cliente, c.nombre HAVING (COUNT(DISTINCT e.cod_envio) >= 3)
ORDER BY COUNT(DISTINCT de.nro_prod) DESC;

	


