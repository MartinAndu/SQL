1er Parcial 1C 2019

CREATE TABLE destinos_por_prop ( 
  cod_prop INTEGER NOT NULL,
  calle varchar(20),
  altura INTEGER NOT NULL,
  cod_destino INTEGER NOT NULL,
  desc_destino varchar(20),
  superficie INTEGER NULL
);

INSERT INTO destinos_por_prop VALUES 
  (10, 'neuquen', 1578, 5, 'locales', 82),
  (10, 'neuquen', 1578, 15, 'depositos', 500),
  (20, 'amenabar', 1260, 15, 'depositos', 214),
  (30, 'corrientes av.', 4210, 3, 'garages', 185),
  (40, 'cabildo av.', 1236, 9, 'mercados', 45),
  (40, 'cabildo av.', 1236, 15, 'depositos', 265),
  (50, 'cabildo av.', 1138, 11, 'maxiquiosco', 100),
  (60, 'rivadavia av.', 2318, 15, 'depositos', 273),
  (70, 'rivadavia av.', 2340, 3, 'garages', 200),
  (70, 'rivadavia av.', 2340, 5, 'locales', 90);


select d1.cod_prop, d1.calle,d1.altura, d1.cod_destino, d1.desc_destino, d1.superficie   
from destinos_por_prop d1, destinos_por_prop d2, destinos_por_prop d3
where d1.cod_destino IN (9, 5, 15)
AND d2.cod_destino IN (9, 5, 15)
AND d3.cod_destino IN (9, 5, 15)
AND (
(d1.cod_destino=9 and d2.cod_destino!=9 and d3.cod_destino!=9)
OR
(d1.cod_destino=5 and d2.cod_destino!=5 and d3.cod_destino!=5)
OR (d1.cod_destino=15 and d2.cod_destino!=15 and d3.cod_destino!=15)
)
AND NOT (d1.superficie is null and d2.superficie is null and d3.superficie is null)
group by d1.cod_prop