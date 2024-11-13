create or replace function esEncargado(
  xid in integer
) return varchar2
is
  c integer;
begin
  select count(*)
    into c
    from persona p
    join encargado e on e.id_persona = p.id_persona
    where xid = p.id_persona;
    if c > 0 then
      return 'Si';
    else
      return 'No';
    end if;
    exception
      when no_data_found then
        return 'No';
end esEncargado;

create or replace function esPropietario(
  xid in integer
) return varchar2
is
  c integer;
begin
  select count(*)
    into c
    from persona p
    join propietario pro on pro.id_persona = p.id_persona
    where xid = p.id_persona;
    if c > 0 then
      return 'Si';
    else
      return 'No';
    end if;
    exception
      when no_data_found then
        return 0;
end esPropietario;

create or replace function expensasCobradas(
  xid in integer
) return integer
is
  c integer;
begin
  select count(e.id_persona)
    into c
    from persona p
    join expensa e on e.id_persona = p.id_persona
    where p.id_persona = xid
    group by e.id_persona;
    return c;
    exception
      when no_data_found then
        return 0;
end expensasCobradas;

create or replace procedure fichaPerso(
  xid in integer,
  xnombre out varchar2,
  xEsPropietario out varchar2,
  xEsEncargado out varchar2,
  xExpensas out integer
)
is
begin
  select paterno || ' ' || materno || ' ' || nombre
    into xnombre
    from persona
   where id_persona = xid;
  xEsPropietario:= esPropietario(xid);
  xEsEncargado:= esEncargado(xid);
  xExpensas:= expensasCobradas(xid);
  exception
    when no_data_found then
      xnombre:= 'Error';
      xEsPropietario:= 'Error';
      xEsEncargado:= 'Error';
      xExpensas:= -1;
end fichaPerso;

declare
  id integer:= 1567;
  nombre varchar2(200);
  esPropietario varchar2(5);
  esEncargado varchar2(5);
  expensasCobradas integer;
begin
  fichaPerso(id, nombre, esPropietario, esEncargado, expensasCobradas);

  dbms_output.put_line('Ficha de Persona');
  dbms_output.put_line('Persona: ' || id || ' ' || nombre);
  dbms_output.put_line('Es propietario de departamento(Si/No): ' || esPropietario);
  dbms_output.put_line('Es encargado (Si/No):' || esEncargado);
  dbms_output.put_line('Cuantas expensas cobro: ' || expensasCobradas);
end;

declare
  id integer:= 1489;
  nombre varchar2(200);
  esPropietario varchar2(5);
  esEncargado varchar2(5);
  expensasCobradas integer;
begin
  fichaPerso(id, nombre, esPropietario, esEncargado, expensasCobradas);

  dbms_output.put_line('Ficha de Persona');
  dbms_output.put_line('Persona: ' || id || ' ' || nombre);
  dbms_output.put_line('Es propietario de departamento(Si/No): ' || esPropietario);
  dbms_output.put_line('Es encargado (Si/No):' || esEncargado);
  dbms_output.put_line('Cuantas expensas cobro: ' || expensasCobradas);
end;