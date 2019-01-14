/* SIN TERMINAR */

/*EJERCICIO ADICIONAL 1*/
select * from localidades;

select nombre AS nombre2 from localidades where idlocalidad!=1;
select max(idlocalidad) from localidades;
select nombre AS nombre1 from localidades where idlocalidad!=(select max(idlocalidad) from localidades);

select nombre1 ||' va antes que '|| nombre2 ordenacion from (select nombre AS nombre1 from localidades where idlocalidad!=16),
(select nombre AS nombre2 from localidades where idlocalidad!=1);


/*EJERCICIO ADICIONAL 2*/


