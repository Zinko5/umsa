create or replace function cantTotalxAno(
  xano in number
) return number
is
c number;
begin
  select count(idparticipante)
    into c
    from fraternidad fr
    join inscribe i on i.idfraternidad = fr.idfraternidad
    where gestion = xano;
    return c;
end cantTotalxAno;

create or replace function por_part(
  xfraternidad in number,
  xano in number
) return number
is
porc number;
a number;
b number;
begin
  select count(idparticipante)
  into b
    from fraternidad fr
    join inscribe i on i.idfraternidad = fr.idfraternidad
    where fr.idfraternidad = xfraternidad and gestion = xano;
  a := cantTotalxAno(xano);
  porc := round((b / a) * 100, 2);
  return porc;
end por_part;

select nombre, por_part(idfraternidad, 2022) as PORCENTAJE_PARTICIPANTES
  from fraternidad