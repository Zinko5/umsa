create or replace function fraternosxParticipaciones(
  xidparticipante in number
) return number
is
xcantidad number;
begin
    select count(ci) cant
    into xcantidad
    from fraternidad f
    join presentabaile pr on pr.idfraternidad = f.idfraternidad
    join inscribe i on i.idfraternidad = f.idfraternidad
    join participante p on p.idparticipante = i.idparticipante
    where p.idparticipante = xidparticipante
    group by ci;
    return xcantidad;
    exception
      when no_data_found then
        return 'Error';
end fraternosxParticipaciones;

create or replace function maxParticipaciones
return number
is
xmaxParticipaciones number;
begin
  select max(count(ci)) cantidad
    into xmaxParticipaciones
    from fraternidad f
    join presentabaile pr on pr.idfraternidad = f.idfraternidad
    join inscribe i on i.idfraternidad = f.idfraternidad
    join participante p on p.idparticipante = i.idparticipante
    group by ci;
    return xmaxParticipaciones;
    exception
      when others then
        return -1;
end maxParticipaciones;

select apellido, nombre
    from participante
    where fraternosxParticipaciones(idparticipante) = (
    select maxParticipaciones() from dual
    )
order by 1