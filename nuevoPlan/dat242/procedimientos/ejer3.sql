create or replace function nombre_supervisor(
  xci in integer
) return varchar2
is
  xnombre varchar2(150);
begin
  select apellido || nombre
    into xnombre
    from supervisor
   where ci = xci;
   return xnombre;
   exception
     when no_data_found then
       return 'Error no data';
end nombre_supervisor;

create or replace function nro_habilidades(
  xci in integer
) return integer
is
xnro integer;
begin
  select count(*)
    into xnro
    from tiene_hab
   where ci = xci;
   return xnro;
   exception
     when no_data_found then
       return 0;
end nro_habilidades;

create or replace function es_responsable(
  xci in integer
) return varchar2(10);
is
  es boolean;
  c integer;
begin
  es = false;
  select count(*)
    into c
    from proyecto
   where ci_responsable = xci;
   if c > 0 then
     es:= true;
   end if;
   if c then
     return 'Si';
   else
     return 'No';
   end if;
   exception
     when others then
       return 'No';
end es_responsable;