create table h_fraternidad (
    reg int,
    idfraternidad int,
    columna varchar(200),
    valor_antiguo varchar(550),
    valor_nuevo varchar(550),
    fecha_actualizacion date
)

create or replace trigger trHFraternidad
after update on fraternidad
for each row
declare
xreg int;
begin
  select coalesce(max(reg), 0) into xreg from h_fraternidad;
  if :new.nombre != :old.nombre then
    insert into h_fraternidad 
    values (
        xreg + 1,
        :old.idfraternidad,
        'Nombre',
        :old.nombre,
        :new.nombre,
        sysdate
    );
  xreg := xreg + 1;
  end if;
  if :new.representacion != :old.representacion then
    insert into h_fraternidad 
    values (
        xreg + 1,
        :old.idfraternidad,
        'Representacion',
        :old.representacion,
        :new.representacion,
        sysdate
    );
    xreg := xreg + 1;
  end if;
  if :new.iddanza != :old.iddanza then
    insert into h_fraternidad 
    values (
        xreg + 1,
        :old.idfraternidad,
        'IDDanza',
        :old.iddanza,
        :new.iddanza,
        sysdate
    );
    xreg := xreg + 1;
  end if;
end;

UPDATE FRATERNIDAD SET IDDANZA = 2 WHERE IDFRATERNIDAD = 1;
UPDATE FRATERNIDAD SET IDDANZA = 1 WHERE IDFRATERNIDAD = 1;
UPDATE FRATERNIDAD SET NOMBRE = 'SociedadCivil', REPRESENTACION = 'IngenieriaCivil', IDDANZA = 6 WHERE IDFRATERNIDAD = 5;
UPDATE FRATERNIDAD SET NOMBRE = 'Sociedad Civil', REPRESENTACION = 'Ingenieria Civil', IDDANZA = 5 WHERE IDFRATERNIDAD = 5;
UPDATE FRATERNIDAD SET NOMBRE = 'Sociedad Civil', REPRESENTACION = 'Ingenieria Civil', IDDANZA = 5 WHERE IDFRATERNIDAD = 5;