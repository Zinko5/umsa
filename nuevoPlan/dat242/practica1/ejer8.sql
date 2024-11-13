CREATE TABLE TOTAL_PARTICIPANTES (
IDFRATERNIDAD INT,
GESTION INT,
CANTIDAD INT DEFAULT 0
)

create or replace trigger trTotalParticipantes
  before insert on TOTAL_PARTICIPANTES
  for each row
declare
c int;
begin
  select count(*)
    into c
    from TOTAL_PARTICIPANTES
   where IDFRATERNIDAD = :new.IDFRATERNIDAD and GESTION = :new.GESTION;
   if c > 0 then
     raise_application_error(-20000, 'Ya existe el registro');
   end if;

   select count(*)
     into c
     from fraternidad
    where IDFRATERNIDAD = :new.IDFRATERNIDAD;
  if c = 0 then
    raise_application_error(-20000, 'La fraternidad no existe');
  end if;
end;

INSERT INTO TOTAL_PARTICIPANTES VALUES(16, 2020, 0);

INSERT INTO TOTAL_PARTICIPANTES VALUES(15, 2020, 0);

INSERT INTO TOTAL_PARTICIPANTES VALUES(15, 2020, 0);
