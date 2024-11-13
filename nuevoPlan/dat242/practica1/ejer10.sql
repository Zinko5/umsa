create or replace view DAT_ENTRADA_2017 as
select posicion, nro, f.nombre as fraternidad, d.nombre as danza, fecha
from fraternidad f
join presentabaile p on p.idfraternidad = f.idfraternidad
join concurso co on co.idconcurso = p.idconcurso
join danza d on d.iddanza = f.iddanza
where extract (year from fecha) = 2017
order by posicion