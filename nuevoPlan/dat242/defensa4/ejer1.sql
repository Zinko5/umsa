create or replace trigger trActMonto
  after insert on recibe
  for each row
declare
begin
  update mascota
     set montototal = montototal + (select precio
        from servicio
        where idservicio = :new.idservicio)
   where idmascota = :new.idmascota;
end;

create or replace trigger trActServicios
  after insert on recibe
  for each row
declare
begin
  update empleado
     set nroservicios = nroservicios + 1
   where ciempleado = :new.ciempleado;
end;

insert into recibe (ciempleado, idservicio, idmascota, fechaser)
values (13330703, 313, '8E9K6', SYSDATE)

insert into recibe (ciempleado, idservicio, idmascota, fechaser)
values (13330703, 581, '8E9K6', SYSDATE)

-----------------
create or replace trigger trActMonto
  after insert on recibe
  for each row
declare
begin
  update mascota
     set montototal = montototal + (select precio
        from servicio
        where idservicio = :new.idservicio)
   where idmascota = :new.idmascota;
   update empleado
     set nroservicios = nroservicios + 1
   where ciempleado = :new.ciempleado;
end;