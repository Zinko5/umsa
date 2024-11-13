create or replace trigger trActPresupuesto
  after insert or update on financia
  for each row
declare 
begin
  if updating then
    update proyecto
       set presupuesto = presupuesto - :old.monto + :new.monto
     where codpry = :new.codpry;
  end if;
  if inserting then
    update proyecto
       set presupuesto = presupuesto + :new.monto
     where codpry = :new.codpry;
  end if;
  exception
    when others then
      dbms_output.put_line('Error');
end;

update financia
   set monto = 0
 where codpry = 'P10' and codins = 454575