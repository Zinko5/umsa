create or replace function esExterno(
  xci in number
) return integer
is
c integer;
begin
  select count(*)
    into c
    from participante p
    join externo e on e.ci = p.ci
    where p.ci = xci;
    if c > 0 then
      return 1;
    else
      return 0;
    end if;
end esExterno;

create or replace function esAdministrativo(
  xci in number
) return integer
is
c integer;
begin
  select count(*)
    into c
    from participante p
    join administrativo a on a.ci = p.ci
    where p.ci = xci;
    if c > 0 then
      return 1;
    else
      return 0;
    end if;
end esAdministrativo;

create or replace function esDocente(
  xci in number
) return integer
is
c integer;
begin
  select count(*)
    into c
    from participante p
    join docente d on d.ci = p.ci
    where p.ci = xci;
    if c > 0 then
      return 1;
    else
      return 0;
    end if;
end esDocente;

create or replace function esEstudiante(
  xci in number
) return integer
is
c integer;
begin
  select count(*)
    into c
    from participante p
    join estudiante e on e.ci = p.ci
    where p.ci = xci;
    if c > 0 then
      return 1;
    else
      return 0;
    end if;
end esEstudiante;

create or replace function tipo_participante(
  xci in number
) return varchar
is
c integer;
begin
  select esExterno(ci)
    into c
    from participante p
    where p.ci = xci;
    if c = 1 then
      return 'EXTERNO';
    else
      select esAdministrativo(ci)
      into c
      from participante p
      where p.ci = xci;
      if c = 1 then
        return 'ADMINISTRATIVO';
      else
        select esDocente(ci)
        into c
        from participante p
        where p.ci = xci;
        if c = 1 then
          return 'DOCENTE';
        else
          select esEstudiante(ci)
          into c
          from participante p
          where p.ci = xci;
          if c = 1 then
            return 'ESTUDIANTE';
          else
            return 'ERROR';
          end if;
        end if;
      end if;
    end if;
end tipo_participante;

select apellido, nombre, tipo_participante(ci) as tipo
  from participante
  order by apellido, nombre