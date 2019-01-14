--EJ1--
SELECT * FROM votantes;
SELECT nombrecompleto FROM votantes WHERE localidad+1=SUBSTR(dni, LENGTH(dni), LENGTH(dni));
--FORMA 2
SELECT nombrecompleto FROM votantes WHERE dni LIKE concat('%', localidad+1);

--EJ2--
SELECT * FROM votantes;
SELECT * FROM localidades;
SELECT nombrecompleto, DECODE(nombre, 'Cordoba', 'Madrid', 'Montilla', 'Madrid', 'Baena', 'Madrid', nombre) nombre FROM votantes a, localidades b 
  WHERE a.localidad=b.idlocalidad;
--Otra forma más pro
SELECT nombrecompleto, nombre FROM votantes a, localidades b WHERE DECODE(a.localidad, 1, 9, 2, 9, 3, 9, a.localidad)=b.idlocalidad;

--EJ3--
SELECT * FROM partidos;
SELECT * FROM eventos_resultados;
SELECT partido, count(evento) FROM eventos_resultados GROUP BY partido;   --Numero de eventos en los que participa cada partido
SELECT max(count(evento)) FROM eventos_resultados GROUP BY partido;       --Partido que participa en más eventos
  --SELECT partido, max(count(evento)) FROM eventos_resultados GROUP BY partido; --¿POR QUÉ NO FUNCIONA?
  
SELECT siglas 
FROM partidos a, eventos_resultados b 
WHERE a.idpartido=b.partido
HAVING count(evento)=(SELECT max(count(evento)) 
  FROM eventos_resultados 
  GROUP BY partido)
GROUP BY siglas; --Por qué no funciona GROUP BY partido?

--EJ4--
SELECT * FROM votantes;
--SELECT dni FROM votantes HAVING MIN(fechanacimiento);   --Por qué no va?
SELECT MIN(fechanacimiento) FROM votantes;  --El más viejo
SELECT fechanacimiento FROM votantes GROUP BY fechanacimiento HAVING MIN(fechanacimiento)>'14/05/50';   --Todos las fechas menos la del mas viejo

SELECT dni FROM votantes HAVING fechanacimiento=min(
  SELECT fechanacimiento FROM votantes GROUP BY fechanacimiento HAVING MIN(fechanacimiento)>'14/05/50'); --Sin terminar

--Otra forma
SELECT dni 
FROM votantes 
WHERE fechanacimiento = (
  SELECT min(fechanacimiento) 
  FROM votantes 
  WHERE fechanacimiento > ALL ( 
    SELECT MIN(fechanacimiento) FROM votantes
  )
);

--EJ5--
SELECT * FROM votantes;
SELECT * FROM consultas;
SELECT votante, count(idconsulta) AS num_consultas FROM consultas GROUP BY votante ORDER BY num_consultas DESC;

--EJ6--
SELECT * FROM consultas;

SELECT votante, count(idconsulta) FROM consultas GROUP BY votante;

SELECT avg(num_consultas) FROM (SELECT votante, count(idconsulta) AS num_consultas FROM consultas GROUP BY votante);
  
SELECT votante, count(idconsulta) FROM consultas GROUP BY votante 
HAVING count(idconsulta) > (SELECT avg(num_consultas) FROM (SELECT votante, count(idconsulta) AS num_consultas FROM consultas GROUP BY votante))
ORDER BY count(idconsulta) DESC;

--EJ7--
SELECT * FROM votantes;
SELECT * FROM consultas;

SELECT avg(num_consultas) FROM (SELECT votante, count(idconsulta) AS num_consultas FROM consultas GROUP BY votante);

SELECT nombrecompleto FROM votantes a, consultas b WHERE a.dni=b.votante GROUP BY a.nombrecompleto
HAVING count(idconsulta)>(SELECT avg(num_consultas) FROM (SELECT votante, count(idconsulta) AS num_consultas FROM consultas GROUP BY votante));

--EJ8--
SELECT * FROM consultas;
SELECT * FROM votantes;

SELECT votante, count(idconsulta) AS num_consultas FROM consultas GROUP BY votante ORDER BY num_consultas DESC;

SELECT min(fechanacimiento) FROM votantes;
SELECT min(fechanacimiento) FROM votantes WHERE fechanacimiento > ALL (SELECT min(fechanacimiento) FROM votantes);

SELECT dni, count(votante)  FROM consultas, votantes WHERE consultas.votante=votantes.dni
AND votantes.fechanacimiento != '23/01/53' GROUP BY votantes.dni ORDER BY count(votante) DESC;







