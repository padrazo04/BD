--EJ1--
SELECT nombrecompleto FROM votantes WHERE dni LIKE concat('%', localidad+1);

set serveroutput on;
DECLARE
CURSOR c IS SELECT nombrecompleto FROM votantes WHERE dni LIKE concat('%', localidad+1);
contador NUMBER :=0;
BEGIN
FOR num_row IN c LOOP
  dbms_output.put_line(num_row.nombrecompleto);
  contador := contador + 1;
END LOOP;
dbms_output.put_line('Hay un total de '||contador||' votantes');
END;

--EJ2--
/*DOS FORMAS DE HACERLO, UNA CON DOS CURSORES Y OTRA CON 1*/
SELECT * FROM votantes;
SELECT * FROM localidades;

SELECT nombrecompleto, nombre
FROM votantes a, localidades b 
WHERE DECODE(a.localidad, 1, 9, 2, 9, 3, 9, a.localidad)=b.idlocalidad
ORDER BY b.idlocalidad;
--chr(10) Salto de linea
set serveroutput on;
DECLARE
  CURSOR c IS SELECT nombrecompleto, nombre, idlocalidad FROM votantes a, localidades b WHERE DECODE(a.localidad, 1, 9, 2, 9, 3, 9, a.localidad)=b.idlocalidad ORDER BY b.idlocalidad;
   --LO DEJO TODO EN UNA LINEA??
  contador NUMBER := 0 ;
BEGIN
  FOR num_row IN c LOOP
    dbms_output.put_line(num_row.nombrecompleto || ' es de ' || num_row.nombre);
    IF (num_row.idlocalidad=9) THEN contador := contador+1;
    END IF;
  END LOOP;
  dbms_output.put_line('Hay un total de ' || contador || ' votantes de Madrid');
END;

--EJ3--
SELECT count(dni) FROM votantes;

set serveroutput on;
DECLARE
  CURSOR c IS SELECT * FROM votantes ORDER BY dni DESC;
  v1 votantes%rowtype;
  v2 votantes%rowtype;
  filas NUMBER;
BEGIN
  SELECT count(dni) INTO filas FROM votantes;
  open c;
    FETCH c INTO v1;
    FETCH c INTO v2;
  LOOP
    EXIT WHEN (c%rowcount)=filas;
    dbms_output.put_line(v1.dni || ' va antes que ' || v2.dni);
    v1 := v2;
    FETCH c INTO v2;
  END LOOP;
  dbms_output.put_line(v2.dni || ' es el menor');
END;

--EJ4--
SELECT * FROM votantes;
SELECT * FROM consultas;
SELECT votante, count(idconsulta) AS participaciones FROM consultas GROUP BY votante ORDER BY participaciones DESC;

SELECT avg(participaciones) FROM (SELECT votante, count(idconsulta) AS participaciones FROM consultas GROUP BY votante);

set serveroutput on;
DECLARE
  CURSOR C IS SELECT votante, count(idconsulta) AS participaciones FROM consultas GROUP BY votante ORDER BY participaciones DESC;
  media NUMBER;
BEGIN
  SELECT avg(participaciones) INTO media FROM (SELECT votante, count(idconsulta) AS participaciones FROM consultas GROUP BY votante);
  FOR num_row IN c LOOP
    IF (num_row.participaciones>media) THEN dbms_output.put_line(num_row.votante || ' ha participado ' || num_row.participaciones ||  ' veces');
    END IF;
  END LOOP;
END;