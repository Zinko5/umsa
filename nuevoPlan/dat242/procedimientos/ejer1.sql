create or replace function jefe_x_depto(
  xcoddepar in varchar2
) return varchar2
is
    v_jefe_nombre varchar2(100);
begin
  select i.apellido || ' ' || i.nombre
    into v_jefe_nombre
    from investigador i
    join departamento d on d.ci_jefe = i.ci
    where d.coddepar = xcoddepar;
    return v_jefe_nombre;
    exception
      when no_data_found then
        return 'Error no data';
end jefe_x_depto;

create or replace function nroinv_x_dep(
  xcoddepar in varchar2
) return number
is
    v_num_investigadores integer;
begin
  select count(*)
    into v_num_investigadores
    from investigador
   where coddepar = xcoddepar;
   return v_num_investigadores;
   exception
     when no_data_found then
       return 0;
end nroinv_x_dep;

create or replace procedure pdat_depto(
  xcoddepar in varchar2,
  xnombre_depto out varchar2,
  xsal_promedio out number
)
is
begin
  select nombre_d
    into xnombre_depto
    from departamento
   where coddepar = xcoddepar;

   select avg(salario)
     into xsal_promedio
     from investigador
    where coddepar = xcoddepar;

    exception
      when no_data_found then
        xnombre_depto:= 'Error no data';
        xsal_promedio:= 0;
end pdat_depto;

declare 
v_coddepar varchar2(15):= 'D15';
v_nombre_depto varchar2(150);
v_sal_promedio number;
v_jefe_nombre varchar2(100);
v_num_investigadores integer;
begin
  pdat_depto(v_coddepar, v_nombre_depto, v_sal_promedio);
  v_jefe_nombre:= jefe_x_depto(v_coddepar);
  v_num_investigadores:= nroinv_x_dep(v_coddepar);

  dbms_output.put_line('Ficha del departamento');
  dbms_output.put_line('Departamento: ' || v_coddepar || ' ' || v_nombre_depto);
  dbms_output.put_line('Jefe del departamento: ' || v_jefe_nombre);
  dbms_output.put_line('Numero de investigadores: ' || v_num_investigadores);
  dbms_output.put_line('Salario promedio: ' || v_sal_promedio);
end;