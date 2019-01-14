--EJ1--
SELECT nombrecompleto FROM votantes WHERE substr(dni, length(dni), length(dni))=localidad+1;
SELECT nombrecompleto FROM votantes WHERE dni LIKE concat('%', localidad+1);

--EJ2--
SELECT nombrecompleto, decode(localidades.nombre, 'Cordoba', 'Madrid', 'Montilla', 'Madrid', 'Baena', 'Madrid', localidades.nombre) AS nombre
FROM votantes, localidades WHERE votantes.localidad=localidades.idlocalidad;

SELECT nombrecompleto, nombre FROM votantes a, localidades b WHERE a.localidad=decode(b.idlocalidad, '1', 9, '2', 9, '3', 9, b.idlocalidad);

--EJ3--
SELECT count(evento) FROM eventos_resultados GROUP BY partido;

SELECT MAX(count(evento)) FROM eventos_resultados GROUP BY partido;

SELECT siglas FROM partidos a , eventos_resultados b WHERE a.idpartido=b.partido HAVING count(evento)=(SELECT MAX(count(evento)) FROM eventos_resultados GROUP BY partido) GROUP BY siglas;

--EJ4--
SELECT dni FROM votantes HAVING MIN(fechanacimiento);

select dni from votantes where fechanacimiento=(select min(fechanacimiento) from votantes);

select dni from votantes where fechanacimiento=(select min(fechanacimiento) from votantes);

select min(fechanacimiento) from votantes;

select dni, FECHANACIMIENTO 
from votantes 
where FECHANACIMIENTO>'14/05/50';

select dni, FECHANACIMIENTO from votantes where fechanacimiento=(select min(fechanacimiento) from (select dni, FECHANACIMIENTO 
from votantes 
where FECHANACIMIENTO>'14/05/50'));

