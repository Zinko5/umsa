select apellido, nombre
  from(
    select ci ,count(ci) cant
      from fraternidad f
      join presentabaile pr on pr.idfraternidad = f.idfraternidad
      join inscribe i on i.idfraternidad = f.idfraternidad
      join participante p on p.idparticipante = i.idparticipante
      group by ci
    ) v
  join participante p on p.ci = v.ci
where v.cant = (
  select max(count(ci)) cantidad
    from fraternidad f
    join presentabaile pr on pr.idfraternidad = f.idfraternidad
    join inscribe i on i.idfraternidad = f.idfraternidad
    join participante p on p.idparticipante = i.idparticipante
    group by ci
  )
order by 1, 2