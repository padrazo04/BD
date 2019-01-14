/* SIN TERMINAR */

--EJ1
SELECT * FROM votantes WHERE fechanacimiento<'01/01/80';
select * from votantes;
select * from votantesAntiguos;

 create table votantesAntiguos
	(dni number(8) primary key,
	nombreCompleto varchar2(64),
	estudiosSuperiores varchar2(16) not null,
	situacionLaboral varchar2(16) not null,
  sueldo number(5,0) not null,
	email varchar2(32) not null,
	localidad number(3) not null,
	fechaNacimiento date not null,
	telefono number(14),
	constraint ck_estudios2 CHECK (estudiosSuperiores in ('Ninguno','Basicos','Superiores','Doctorado')),
	constraint ck_laboral2 CHECK (situacionLaboral in ('Estudiante','Jubilado','Parado','Activo')));

set serveroutput on;
DECLARE
  CURSOR c IS SELECT * FROM votantes WHERE fechanacimiento<'01/01/80';
  sueldo NUMBER;
BEGIN
  FOR numrow IN c LOOP
    IF numrow.situacionlaboral='ninguno' THEN sueldo := 0;
    ELSE sueldo := 1000;
    END IF;
    INSERT INTO votantesAntiguos 
    VALUES(numrow.dni, numrow.nombrecompleto, numrow.estudiossuperiores, numrow.situacionlaboral, sueldo, numrow.email, numrow.localidad, numrow.fechanacimiento, numrow.telefono);
  END LOOP;
END;

delete table votantesAntiguos;

