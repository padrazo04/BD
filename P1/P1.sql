--EJ2--
SELECT table_name FROM user_tables;

--EJ3--
DESCRIBE consultas;
DESCRIBE consultas_datos;
DESCRIBE eventos;
DESCRIBE eventos_resultados;
DESCRIBE localidades;
DESCRIBE partidos;
DESCRIBE provincias;
DESCRIBE votantes;

--EJ4--
DROP TABLE votantes; --Alguna columna es una clave foránea, se impide la eliminación
DROP TABLE votantes CASCADE CONSTRAINTS; --Forzamos la eliminación
DROP TABLE consultas CASCADE CONSTRAINTS;
DROP TABLE consultas_datos CASCADE CONSTRAINTS;
DROP TABLE eventos CASCADE CONSTRAINTS;
DROP TABLE eventos_resultados CASCADE CONSTRAINTS;
DROP TABLE localidades CASCADE CONSTRAINTS;
DROP TABLE partidos CASCADE CONSTRAINTS;
DROP TABLE provincias CASCADE CONSTRAINTS;

--EJ5--
--Carga de votacion.sql
INSERT INTO votantes
VALUES (30653845, 'Maria Gonzalez Ramirez', 'Doctorado', 'Activo', 'goram@telefonica.es', 1, '21/08/1999', 677544822);

--EJ6--
SELECT * FROM votantes;

--EJ7--
DELETE FROM votantes WHERE dni=30653845;

--EJ8--
SELECT * FROM eventos_resultados;

INSERT INTO consultas
VALUES (55, 3, 30852845, '27/10/2018');

INSERT INTO consultas_datos
VALUES (62,55,3, 'No', 0.5);

INSERT INTO eventos
VALUES (12, 'Cordoba', '27/10/18', 'Otras', 'Elecciones patata');

INSERT INTO eventos_resultados
VALUES (46, 12, 3, 0.12);

INSERT INTO localidades
VALUES (17, 'Hogwarts', 777, 6);

INSERT INTO partidos
VALUES (6, 'Partido Charli', 'PC', 'c/ Mi calle', 'Cordoba', 'Yo', '27/10/18', 0);

INSERT INTO provincias
VALUES (7, 'Hogwarts', 777, 'Londres');

--EJ9--
SELECT nombre, tipo, fecha FROM eventos;

--EJ10--
SELECT * FROM eventos;
SELECT nombre||' de tipo '||tipo convocatoria FROM eventos;

--EJ11--
SELECT * FROM votantes;
SELECT nombrecompleto||' con estudios '||estudiossuperiores||' y teléfono '||telefono||' es un pringao' AS info_votantes FROM votantes;

