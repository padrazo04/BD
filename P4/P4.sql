--EJ1--
--salto de linea: chr(10)
select * FROM votantes;

set serveroutput on;
DECLARE
  votante1 votantes%rowtype;
  mydni NUMBER := 30983712;
BEGIN
  SELECT * INTO votante1 FROM votantes WHERE dni=mydni;
  dbms_output.put_line(votante1.nombrecompleto||' con correo: '|| votante1.email);
END;

--EJ2--
set serveroutput on;
DECLARE
  v_nombre votantes.nombrecompleto%type; 
  v_correo votantes.email%type;
  mydni NUMBER := 30983712;
BEGIN
  SELECT SUBSTR(nombrecompleto, 1, INSTR(nombrecompleto, ' ')), email INTO v_nombre, v_correo FROM votantes WHERE dni=mydni;
  dbms_output.put_line(v_nombre||'con correo: '|| v_correo);
END;

--EJ3--
set serveroutput on;
DECLARE
  v_nombre votantes.nombrecompleto%type;
  mydni NUMBER := 30983712;
BEGIN
  SELECT SUBSTR(nombrecompleto, INSTR(nombrecompleto, ' '), LENGTH(nombrecompleto)) INTO v_nombre FROM votantes WHERE dni=mydni;
  dbms_output.put_line('Pepe' || v_nombre);
END;

