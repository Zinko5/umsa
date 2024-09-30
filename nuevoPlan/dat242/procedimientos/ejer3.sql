create or replace function nombre_supervisor(
  xci in integer
) return varchar2
is
  xnombre varchar2(150);
begin
  select apellido || ' ' || nombre
    into xnombre
    from investigador
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
) return varchar2
is
  c integer;
begin
  select count(*)
    into c
    from proyecto
   where ci_responsable = xci;
   if c > 0 then
     return 'Si';
   else
     return 'No';
   end if;
   exception
     when others then
       return 'No';
end es_responsable;

create or replace procedure ficha_investigador(
  xci in varchar2,
  xnombre out varchar2,
  xsupervisor out varchar2,
  xnumHabilidades out number,
  xresponsable out varchar2
)
is
begin
  select apellido || ' ' || nombre
    into xnombre
    from investigador
   where ci = xci;

   select nombre_supervisor(ci_supervisor)
     into xsupervisor
     from investigador
    where ci = xci;

    xnumHabilidades:= nro_habilidades(xci);
    xresponsable:= es_responsable(xci);

    exception
      when others then
        xnombre:= 'Error';
        xsupervisor:= 'Error';
        xnumHabilidades:= -1;
        xresponsable:= 'Error';
end ficha_investigador;

declare
  xci varchar2(30):= '16';
  xnombre varchar2(150);
  xsupervisor varchar2(150);
  xnumHabilidades number;
  xresponsable varchar2(30);
begin
  ficha_investigador(xci, xnombre, xsupervisor, xnumHabilidades, xresponsable);
  dbms_output.put_line('Investigador');
  dbms_output.put_line('Apellidos y nombres: ' || xnombre);
  dbms_output.put_line('Supervisor:' || xsupervisor);
  dbms_output.put_line('Nro de habilidades: ' || xnumHabilidades);
  dbms_output.put_line('Es responsable (si/no): ' || xresponsable);
end;