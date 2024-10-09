create or replace trigger trActPresupuesto
  after insert on financia
  for each row
declare
begin
  update proyecto
     set presupuesto = presupuesto + to_number(:new.monto)
   where codpry = :new.codpry;
end;

update financia
   set monto = 0
 where codpry = 'P10' and codins = 454575