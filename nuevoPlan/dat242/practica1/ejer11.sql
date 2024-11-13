create or replace view MAX_GANADOS as
select max(count(f.idfraternidad)) veces_ganador
from fraternidad f
join presentabaile p on p.idfraternidad = f.idfraternidad
join entrada e on e.idconcurso = p.idconcurso
where posicion = 1
group by f.idfraternidad