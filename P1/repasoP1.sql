--repasoP1

select table_name from user_tables; -- Muestra el nombre de todas las tablas
select nombrecompleto||' con dni '||dni AS NOMBREYDNI FROM votantes; -- Operador concatenar

drop table votantes CASCADE CONSTRAINTS;  -- Borrar tabla votantes eliminando las restricciones

--INSERCION
DESCRIBE votantes;
INSERT INTO votantes
VALUES(30653845, 'Maria Gonzalez Ramirez', 'Doctorado', 'Activo',
       'goram@telefonica.es', 1, '21/08/1989', 677544822);
       
INSERT INTO votantes
VALUES(30653895, 'Maria Gonzalez Ramirez', 'Doctorado', 'Activo',
       'goram@telefonica.es', 1, 21/09/1989, 677544822); -- La fecha debe ir entre comillas simples ''
       
--ACTUALIZACION
UPDATE votantes SET nombrecompleto='Mario Gonzalez Ramirez' WHERE dni=30653845;

--ELIMINACION
DELETE FROM votantes WHERE nombrecompleto='Mario Gonzalez Ramirez';

--EJ9
SELECT * FROM eventos;
SELECT nombre, tipo, fecha FROM eventos;

--EJ10
select nombre||' de tipo '|| tipo AS Convocatoria FROM eventos;

-- CREACION DE TABLAS
CREATE TABLE prueba1 (idPrueba number(3) primary key, nombre varchar2(3) not null);
DROP TABLE prueba1;

CREATE TABLE figura (idFigura number(2) primary key, nombrefigura varchar(20) not null,
  CONSTRAINT ck_nombrefigura CHECK (nombrefigura in ('Cuadrado', 'Triangulo', 'Pentagono')));
INSERT INTO figura VALUES (01, 'Cuadrado');
INSERT INTO figura VALUES (02, 'Triangulo');
INSERT INTO figura VALUES (03, 'Pentagono');
INSERT INTO figura VALUES (01, 'Circulo');

CREATE TABLE persona(
  dni number(9) primary key, 
  nombre varchar(10) not null, 
  apellidos varchar(20) not null, 
  figurafavorita number(2),
  CONSTRAINT fk_figurafav_Fig FOREIGN KEY (figurafavorita) REFERENCES figura(idFigura));
  
INSERT INTO persona VALUES(1,'Carlos','Patata',1);
INSERT INTO persona VALUES(2,'Carles','Patata',2);
INSERT INTO persona VALUES(3,'Charli','Patata',3);

DROP TABLE persona;
DROP TABLE figura;
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'figura';

  
  