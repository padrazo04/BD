--EJ1--
--Mostrar el nombre de la localidad y su numero de habitantes para el votante con menor edad--
SELECT * FROM localidades;
SELECT * FROM votantes;

SELECT max(fechanacimiento) FROM votantes;

SELECT nombre, numerohabitantes FROM localidades a, votantes b WHERE a.idlocalidad=b.localidad AND b.fechanacimiento='28/01/00';

SELECT nombre, numerohabitantes FROM localidades a, votantes b WHERE a.idlocalidad=b.localidad AND b.fechanacimiento=(SELECT max(fechanacimiento) FROM votantes);

--EJ2--
--Mostrar el nombre y la fecha de nacimiento de los votantes andaluces que han nacido despues de la creacion del partidopopular. Ordenar el resultado por edad(de mayor a menor edad). (2 registros)
SELECT * FROM votantes;
SELECT * FROM partidos;

SELECT fechacreacion FROM partidos WHERE nombrecompleto='Partido Popular';

SELECT nombrecompleto, fechanacimiento FROM votantes WHERE fechanacimiento > (SELECT fechacreacion FROM partidos WHERE nombrecompleto='Partido Popular') ORDER BY fechanacimiento ASC;

--EJ3--
--Mostrar el nombre de las localidades y su comunidad autónoma para aquellas localidades que tienen un numero de habitantes mayor que la localidad del votante que es el segundo votante
--de más edad de entre todos los votantes existentes en la base de datos. Ordenar el resultado alfabéticamente por nombre de localidad.
SELECT * FROM votantes;
SELECT * FROM provincias;
SELECT * FROM localidades;

SELECT min(fechanacimiento) FROM votantes;

SELECT min(fechanacimiento) FROM votantes WHERE fechanacimiento > ('14/05/50');

SELECT numerohabitantes FROM localidades a, votantes b WHERE a.idlocalidad=b.localidad AND fechanacimiento='23/01/53';

SELECT localidades.nombre, provincias.comunidad FROM localidades , provincias WHERE localidades.provincia=provincias.idprovincia AND localidades.numerohabitantes > 90566 ORDER BY localidades.nombre ASC;

SELECT localidades.nombre, provincias.comunidad 
FROM localidades , provincias 
WHERE localidades.provincia=provincias.idprovincia 
AND localidades.numerohabitantes > 
(
  SELECT numerohabitantes 
  FROM localidades a, votantes b 
  WHERE a.idlocalidad=b.localidad 
  AND fechanacimiento= 
  (
    SELECT min(fechanacimiento) 
    FROM votantes 
    WHERE fechanacimiento > (SELECT min(fechanacimiento) FROM votantes
    )
  )
) ORDER BY localidades.nombre ASC;

--EJ2 BIEN HECHO
--ANDALUCES: LOCALIDAD 1-6
select * from votantes;
select * from localidades;
select * from provincias;
select * from partidos;

select fechacreacion from partidos where siglas like 'PP';
select idprovincia from provincias where comunidad like 'Andalucia';
select idlocalidad from localidades where provincia=ANY(select idprovincia from provincias where comunidad like 'Andalucia');

select nombrecompleto, fechanacimiento from votantes where
  fechanacimiento>(select fechacreacion from partidos where siglas like 'PP') and 
  localidad=ANY(select idlocalidad from localidades where provincia=ANY(select idprovincia from provincias where comunidad like 'Andalucia'));














