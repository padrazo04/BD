--EJ1
select * from votantes;
select nombrecompleto from votantes where NOMBRECOMPLETO like '%n';

--EJ2
SELECT dni FROM votantes WHERE dni LIKE '%5%5%5%';

--EJ3
select NOMBRECOMPLETO from VOTANTES where FECHANACIMIENTO>'1/1/1990';

--EJ4
SELECT * FROM localidades;
SELECT nombrecompleto, nombre FROM votantes a, localidades b WHERE a.localidad=b.idlocalidad AND numerohabitantes>300000;

--EJ5
SELECT * FROM provincias;
SELECT nombrecompleto, comunidad FROM votantes a, localidades b, provincias c
  WHERE a.localidad=b.idlocalidad AND b.provincia=c.idprovincia AND b.numerohabitantes>300000;
  
--EJ6
SELECT * FROM partidos;
SELECT * FROM consultas;
SELECT * FROM consultas_datos;

SELECT partido, count(consulta) AS conteo FROM consultas_datos GROUP BY partido;

--EJ8
SELECT nombrecompleto FROM partidos, consultas_datos
  WHERE partidos.idpartido=consultas_datos.partido 
  HAVING(count(consulta))>10 GROUP BY nombrecompleto;
  
--EJ9
SELECT nombrecompleto, count(consulta) FROM partidos, consultas_datos
  WHERE partidos.idpartido=consultas_datos.partido 
  HAVING(count(consulta))>10 GROUP BY nombrecompleto;
  
--EJ10
SELECT * FROM partidos;
SELECT * FROM consultas;
SELECT * FROM consultas_datos;

SELECT nombrecompleto, count(consulta) FROM partidos a, consultas_datos b WHERE b.respuesta LIKE 'Si' 
  AND a.idpartido=b.partido AND b.certidumbre>0.8 GROUP BY nombrecompleto;