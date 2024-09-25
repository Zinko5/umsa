create or replace function nroPropFemenino(
  xid in integer
) return integer
is
  c integer;
begin
  select count(*)
    into c
    from persona
   where genero = 'F';
   return c;
end nroPropFemenino;

create or replace function nroPropMasculino(
  xid in integer
) return integer
is
  c integer;
begin
  select count(*)
    into c
    from persona
   where genero = 'M';
   return c;
end nroPropMasculino;

create or replace procedure montoPorTipos(
  porTarjeta out number;
  
)
is
begin
  
end montoPotTipos;