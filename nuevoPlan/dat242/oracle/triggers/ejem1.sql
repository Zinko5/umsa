create table historicoProyecto (
    codpry varchar(15),
    nom_pry varchar(150),
    antiguoPresupuesto number,
    nuevoPresupuesto number,
    coddepar varchar(15),
    ci_responsable number,
    fechaModi date
)

create or replace trigger trHistoricoProyecto
after update or delete or insert on proyecto
for each row
declare
begin
  if updating then
    insert into historicoProyecto
    values (
      :old.codpry,
      :old.nom_pry,
      :old.presupuesto,
      :new.presupuesto,
      :old.coddepar,
      :old.ci_responsable,
      sysdate
  );
  end if;
  if inserting then
    insert into historicoProyecto
    values (
        :new.codpry,
        :new.nom_pry,
        0,
        :new.presupuesto,
        :new.coddepar,
        :new.ci_responsable,
        sysdate
    );
  end if;
  if deleting then
    insert into historicoProyecto
    values (
        :old.codpry,
        :old.nom_pry,
        :old.presupuesto,
        null,
        :old.coddepar,
        :old.ci_responsable,
        sysdate
    );
  end if;
end;

insert into financia
values ('P10', 454575, '1000')