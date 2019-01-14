--GROUP BY siempre al final excepto al usar HAVING ??
--GROUP BY debe ser del otro atributo que se muestra ??
--HAVING para funciones AVG, COUNT, MAX, MIN, SUM | NO USAR WHERE !!!
-- select * from tabla --> Visualizar los datos de la tabla

--EJ1--
SELECT * FROM votantes;
SELECT nombrecompleto FROM votantes WHERE nombrecompleto LIKE '%n';

--EJ2--
SELECT * FROM votantes;
SELECT dni FROM votantes WHERE dni LIKE '%5%5%5%';

--EJ3--
SELECT * FROM votantes;
SELECT nombrecompleto FROM votantes WHERE fechanacimiento > '01/01/1990';

--EJ4--
SELECT * FROM votantes;
SELECT * FROM localidades;
SELECT nombrecompleto, b.nombre from votantes a, localidades b WHERE a.localidad=b.idlocalidad AND b.numerohabitantes>300000;

--EJ5--
SELECT * FROM votantes;
SELECT * FROM localidades;
SELECT * FROM provincias;
SELECT a.nombrecompleto, comunidad FROM votantes a, localidades b, provincias c 
  WHERE a.localidad=b.idlocalidad AND b.provincia=c.idprovincia AND b.numerohabitantes>300000;
  
--EJ6--
SELECT * FROM consultas_datos;
SELECT partido, COUNT(consulta) conteo FROM consultas_datos GROUP BY partido;

--EJ7--
--Igual que el 6

--EJ8--
SELECT * FROM partidos;
SELECT * FROM consultas_datos;
SELECT nombrecompleto FROM partidos a, consultas_datos b 
  WHERE a.idpartido=b.partido GROUP BY nombrecompleto HAVING count(consulta)>10 ;

--SELECT nombrecompleto FROM partidos a, consultas_datos b WHERE a.idpartido=b.partido HAVING count(consulta)>10 GROUP BY partido;
--¿Por qué no funciona ^^?

--EJ9--
--Muy parecido al anterior
SELECT nombrecompleto, count(consulta) AS conteo FROM partidos a, consultas_datos b 
  WHERE a.idpartido=b.partido HAVING count(consulta)>10 GROUP BY nombrecompleto;
  
--EJ10--
SELECT * FROM partidos;
SELECT * FROM consultas_datos;
SELECT nombrecompleto, count(consulta) AS conteo FROM partidos a, consultas_datos b 
  WHERE a.idpartido=b.partido AND respuesta='Si' AND certidumbre>0.8 GROUP BY nombrecompleto;
--Para respuesta='Si' tambien se podría haber usado LIKE: respuesta LIKE 'Si'



