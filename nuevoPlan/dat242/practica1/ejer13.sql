create or replace view DAT_MAX_GANADORA as 
select nombre, TOT_RECAUDADO, FRATERNOS, INSCRIPCIONES, ENSAYOS_REALIZADOS
from 
(select nombre
from FRAT_MAX_GANADOS 
)a,
(select count(ci) inscripciones, count(distinct ci) fraternos, sum(costo) tot_recaudado
from FRAT_MAX_GANADOS f
join inscribe i on i.idfraternidad = f.idfraternidad
) b,
(select count(distinct idensayo) ensayos_realizados
from FRAT_MAX_GANADOS f
join inscribe i on i.idfraternidad = f.idfraternidad
join ensayo e on e.idfraternidad = f.idfraternidad
) c