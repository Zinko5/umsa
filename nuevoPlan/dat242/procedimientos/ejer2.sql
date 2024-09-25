create or replace function monto_financia(
  xcodins in integer
) return number
is
    xfinancia number;
begin
  select sum(monto)
    into xfinancia
    from financia
   where codins = xcodins;
   return xfinancia;
   exception
     when no_data_found then
       return 0;
end monto_financia;

create or replace procedure p_datinsfin(
  xcodins in integer,
  xrazon out varchar2,
  xnro_prys out integer,
  xmonto out number
)
is
begin
  select razonsocial
    into xrazon
    from inst_finan
   where codins = xcodins;

   select count(*)
     into xnro_prys
     from financia
    where codins = xcodins;

    select monto_financia(xcodins) 
      into xmonto
      from dual;

    exception
      when no_data_found then
        xrazon:= 'Error no data';
        xnro_prys:= 0;
        xmonto:= 0;
end p_datinsfin;

declare
  zcodins integer:= 957843;
  zrazon varchar2(150);
  znropry integer;
  zinsfin number;
begin
  p_datinsfin(zcodins, zrazon, znropry, zinsfin);
  dbms_output.put_line('Institucion financiera');
  dbms_output.put_line('Institucion: ' || zcodins || ' ' || zrazon);
  dbms_output.put_line('Numero de proyectos: ' || znropry);
  dbms_output.put_line('Monto de financiaminento: ' || zinsfin || '$');
end;