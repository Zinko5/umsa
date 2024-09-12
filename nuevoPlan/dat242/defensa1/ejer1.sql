create or replace function nroArt_x_Medio(
  xidMedio in number
) return number
is
c integer;
begin
  select count(*)
    into c
    from medio m
    join difunde d on d.id_medio = m.id_medio
    where m.id_medio = xidMedio;
    return c;
end nroArt_x_Medio;

select nombrem, nroArt_x_Medio(id_medio)
  from medio m
  order by 1