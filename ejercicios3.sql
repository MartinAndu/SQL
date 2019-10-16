
-- Para cada par de soportes tecnicos distintos que esten en la misma localidad, devolver
-- el codigo de soporte y nombre de cada uno de ellos. No se debe devolver cada par mas
-- de una vez.

SELECT DISTINCT st.cod_soporte, st.nombre, st2.cod_soporte, st2.nombre 
FROM soporte_tecnico AS st INNER JOIN soporte_tecnico as st2
ON st.localidad = st2.localidad AND st.cod_soporte < st2.cod_soporte

-- Listar el nombre de usuario y el telefono para aquellos usuarios que tengan al menos
-- una compra con cada uno de los soportes tecnicos de la localidad de Lanus.

SELECT DISTINCT u.nombre, u.telefono FROM usuario AS u 
INNER JOIN compra AS c ON c.num_usuario = u.num_usuario
GROUP BY u.nombre, u.telefono, c.cod_soporte
HAVING ( c.cod_soporte = ANY(SELECT DISTINCT st.cod_soporte FROM soporte_tecnico AS st
				WHERE st.localidad = 'Lanus') AND
COUNT (DISTINCT c.cod_soporte) = (SELECT DISTINCT COUNT(st.cod_soporte) FROM soporte_tecnico AS st
						WHERE st.localidad = 'Lanus'))

SELECT DISTINCT u.nombre, u.telefono FROM usuario AS u INNER JOIN compra AS c ON u.num_usuario = c.num_usuario
WHERE c.cod_soporte = ALL( SELECT st.cod_soporte FROM soporte_tecnico AS st WHERE st.localidad = 'Lanus')

SELECT u.nombre, u.telefono from usuario u 
INNER JOIN compra c using(num_usuario)
INNER JOIN soporte_tecnico AS st using(cod_soporte) WHERE st.localidad = 'Lanus'
GROUP BY u.nombre, u.telefono
HAVING COUNT(DISTINCT(c.cod_soporte)) = ( SELECT COUNT(cod_soporte)
FROM soporte_tecnico where localidad = 'Lanus') 

-- Mostrar el codigo y nombre de soporte tecnico para aquellos soportes que fueron asig-
-- nados al menos a una compra de notebook de marca ‘HP’ y jamas fueron asignados a
-- una compra de notebook de marca ‘LENOVO’.

SELECT st.cod_soporte, st.nombre FROM soporte_tecnico AS st
INNER JOIN compra AS c ON c.cod_soporte = st.cod_soporte
INNER JOIN notebook AS nb ON c.cod_equipo = nb.cod_equipo
WHERE nb.marca = 'HP' 
EXCEPT 
SELECT st.cod_soporte, st.nombre FROM soporte_tecnico AS st
INNER JOIN compra AS c ON c.cod_soporte = st.cod_soporte
INNER JOIN notebook AS nb ON c.cod_equipo = nb.cod_equipo
WHERE nb.marca = 'Lenovo' 


-- usuario (num usuario, nombre, tel ́efono, email, direccion, localidad)
-- compra (cod compra, cod equipo, cod soporte, num usuario, fecha, cantidad)
-- notebook (cod equipo, marca, descripcion, detalle, precio)
-- soporte t ́ecnico (cod soporte, nombre, tel ́efono, email, direccion, localidad)

-- Mostrar para cada usuario su numero, nombre y cantidad total de equipos comprados
-- en 2017. Incluir tambien a los usuarios que no hayan efectuado ninguna compra en
-- 2017.
SELECT u.num_usuario, u.nombre, SUM(c.cantidad) FROM usuario AS u
INNER JOIN compra AS c ON c.num_usuario = u.num_usuario 
WHERE (EXTRACT (YEAR FROM c.fecha)) = '2017'
GROUP BY u.num_usuario, u.nombre 
UNION
SELECT u.num_usuario, u.nombre, SUM(c.cantidad) FROM usuario AS u
INNER JOIN compra AS c ON c.num_usuario = u.num_usuario 
WHERE (EXTRACT (YEAR FROM c.fecha)) != '2017'
GROUP BY u.num_usuario, u.nombre 


EXTRACT (YEAR FROM f.fecha) AS anio FROM detalle_facturas AS df





