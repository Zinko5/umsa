create or replace function nroPerso_segun_genero(
  xQue in number,
  XSexo in integer
) return integer
is
c integer;
begin
  if xQue = 1 then -- autores
    if XSexo = 1 then -- femenino
      select count(*)
        into c
        from persona p
        join autor a on a.ci = p.ci
        where p.genero = 'F';
    else -- masculino
      select count(*)
        into c
        from persona p
        join autor a on a.ci = p.ci
        where p.genero = 'M';
    end if;
  else -- jurados
    if XSexo = 1 then -- femenino
      select count(*)
        into c
        from persona p
        join jurado j on j.ci = p.ci
        where p.genero = 'F';
    else -- masculino
      select count(*)
          into c
        from persona p
        join jurado j on j.ci = p.ci
        where p.genero = 'M';
    end if;
  end if;
  return c;
end nroPerso_segun_genero;

select nroPerso_segun_genero(1,1), nroPerso_segun_genero(1,2)
  from dual

select nroPerso_segun_genero(2,1), nroPerso_segun_genero(2,2)
  from dual