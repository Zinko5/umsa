--1
create or replace function nroanios(
  xfecha in date
) return number
is
edad integer;
begin
  edad := extract(year from sysdate) - extract(year from xfecha);
  return edad;
end nroanios;

select apellido, nombre, nroanios(fechanaci) edad
  from investigador
  order by apellido

--2
create or replace function jefe_x_departamento(
  xcoddepar in varchar2
) return varchar2
is
cod varchar2(120);
begin
  select i.apellido |' '| i.nombre
    into cod
    from departamento d
    join investigador i on i.ci = d.ci_jefe
    where d.coddepar = xcoddepar;
    return cod;
end jefe_x_departamento;

select coddepar, jefe_x_departamento(coddepar) jefe
  from departamento
 order by jefe

 --3
 create or replace function sexo(
   xtipo in integer
 ) return integer
 is
 xnro integer;
 begin
   if xtipo = 1 then
     select count(*)
       into xnro
       from investigador i
      where i.sexo = 'MASCULINO';
   end if;
    if xtipo = 2 then
      select count(*)
        into xnro
        from investigador i
       where i.sexo = 'FEMENINO';
    end if;
    if xtipo = 3 then
      select count(*)
        into xnro
        from investigador i;
    end if;
    if xtipo != 2 and xtipo != 3 and xtipo != 1 then
    xnro := 0;
    end if;
    return xnro;
 end sexo;

 select sexo(1) MASCULINO, sexo(2) FEMENINO, sexo(3) TOTAL
   from dual