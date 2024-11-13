create or replace view FRAT_MAX_GANADOS as
select f.*
from fraternidad f
join (
select f.idfraternidad, count(f.idfraternidad) as veces_ganador
from fraternidad f
join presentabaile p on p.idfraternidad = f.idfraternidad
join entrada e on e.idconcurso = p.idconcurso
where posicion = 1
group by f.idfraternidad
) v on f.idfraternidad = v.idfraternidad
where v.veces_ganador = (
select * from MAX_GANADOS
)