SELECT nombrecompleto FROM votantes WHERE nombrecompleto LIKE '%n';

SELECT DNI FROM votantes WHERE DNI LIKE '%5%5%5%';

SELECT nombrecompleto FROM votantes WHERE fechanacimiento>'1/1/1990';

SELECT nombrecompleto, nombre FROM votantes a, localidades b WHERE a.localidad=b.idlocalidad AND b.numerohabitantes>'300000';

SELECT nombrecompleto, comunidad FROM votantes a, localidades b, provincias c 
  WHERE a.localidad=b.idlocalidad AND b.provincia=c.idprovincia AND b.numerohabitantes>'300000';

SELECT idpartido, count(consulta) conteo FROM partidos a, consultas_datos b WHERE a.idpartido=b.partido GROUP BY b.partido;

SELECT partido, count(consulta) FROM consultas_datos GROUP BY partido ORDER BY partido;

SELECT nombrecompleto FROM partidos a, consultas_datos b WHERE a.idpartido=b.partido GROUP BY nombrecompleto HAVING count(consulta)>10;

SELECT nombrecompleto, count(consulta) conteo FROM partidos a, consultas_datos b 
  WHERE a.idpartido=b.partido GROUP BY nombrecompleto HAVING count(consulta)>10;

SELECT nombrecompleto, count(consulta) conteo FROM partidos a, consultas_datos b  
  WHERE a.idpartido=b.partido AND respuesta like 'Si' AND certidumbre>0.8 GROUP BY nombrecompleto;






