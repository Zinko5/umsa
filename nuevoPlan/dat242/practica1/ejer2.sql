create or replace function nroEnsayos(
  xidparticipante in number
) return number
is
cantidad number;
begin
  select count(idparticipante)
    into cantidad
    from ensayo e
    join acude a on a.idensayo = e.idensayo
    where a.idparticipante = xidparticipante and anoNusta(idparticipante) = extract(year from fecha)
    group by idparticipante;
    return cantidad;
end nroEnsayos;

create or replace function anoNusta(
  xidparticipante in number
) return number
is
xfecha number;
begin
  select extract(year from fecha)
    into xfecha
    from concursa c 
    join nusta n on n.idconcurso = c.idconcurso
    join participante p on p.idparticipante = c.idparticipante
    join concurso co on co.idconcurso = c.idconcurso
    where posicion = 1 and p.idparticipante = xidparticipante;
    return xfecha;
end anoNusta;

select p.apellido, p.nombre, nroEnsayos(idparticipante) ensayos
from concursa c 
join nusta n on n.idconcurso = c.idconcurso
join participante p on p.idparticipante = c.idparticipante
join concurso co on co.idconcurso = c.idconcurso
where posicion = 1
order by apellido