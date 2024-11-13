create table historicoProyecto (
    codpry varchar(15),
    nom_pry varchar(150),
    presupuesto number,
    coddepar varchar(15),
    ci_responsable number,
    fechaModi date
)

create or replace trigger trHistoricoProyecto
after update or delete on proyecto
for each row
declare
begin
  insert into historicoProyecto
  values (
    :old.codpry,
    :old.nom_pry,
    :old.presupuesto,
    :old.coddepar,
    :old.ci_responsable,
    sysdate
  );
end;

insert into financia
values ('P10', 454575, '1000')