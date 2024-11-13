create or replace function fraterEntrada(
  xanyo in number
) return varchar
is
xfrater varchar(200);
begin
  select f.nombre
    into xfrater
    from fraternidad f
    join presentabaile p on p.idfraternidad = f.idfraternidad
    join entrada e on e.idconcurso = p.idconcurso
    join concurso co on co.idconcurso = e.idconcurso
    where posicion = 1 and extract (year from co.fecha) = xanyo;
  return xfrater;
  exception
     when no_data_found then
       return 'NO EXISTEN DATOS';
end fraterEntrada;

create or replace function fraterMonografia(
  xanyo in number
) return varchar
is
xfrater varchar(200);
begin
  select f.nombre
    into xfrater
    from fraternidad f
    join presenta p on p.idfraternidad = f.idfraternidad
    join concurso co on co.idconcurso = p.idconcurso
    join monografia m on m.idconcurso = p.idconcurso
    where posicion = 1 and extract (year from co.fecha) = xanyo;
  return xfrater;
  exception
     when no_data_found then
       return 'NO EXISTEN DATOS';
end fraterMonografia;

create or replace function fraterNusta(
  xanyo in number
) return varchar
is
xfrater varchar(200);
begin
  select f.nombre
    into xfrater
    from fraternidad f
    join inscribe i on i.idfraternidad = f.idfraternidad
    join participante p on p.idparticipante = i.idparticipante
    join concursa c on c.idparticipante = p.idparticipante
    join concurso co on co.idconcurso = c.idconcurso
    join nusta n on n.idconcurso = co.idconcurso
    where posicion = 1 and extract (year from co.fecha) = xanyo and xanyo = gestion;
  return xfrater;
  exception
     when no_data_found then
       return 'NO EXISTEN DATOS';
end fraterNusta;

create or replace function concursanteNusta(
  xanyo in number
) return varchar
is
xnombre varchar(350);
begin
  select p.apellido || ' ' || p.nombre as nombre
  into xnombre
    from fraternidad f
    join inscribe i on i.idfraternidad = f.idfraternidad
    join participante p on p.idparticipante = i.idparticipante
    join concursa c on c.idparticipante = p.idparticipante
    join concurso co on co.idconcurso = c.idconcurso
    join nusta n on n.idconcurso = co.idconcurso
    where posicion = 1 and extract (year from co.fecha) = xanyo and xanyo = gestion;
  return xnombre;
  exception
     when no_data_found then
       return 'NO EXISTEN DATOS';
end concursanteNusta;

create or replace function concursanteAfiche(
  xanyo in number
) return varchar
is
xnombre varchar(350);
begin
  select p.apellido || ' ' || p.nombre as nombre
  into xnombre
    from fraternidad f
    join inscribe i on i.idfraternidad = f.idfraternidad
    join participante p on p.idparticipante = i.idparticipante
    join concursa c on c.idparticipante = p.idparticipante
    join concurso co on co.idconcurso = c.idconcurso
    join afiche a on a.idconcurso = co.idconcurso
    where posicion = 1 and extract (year from co.fecha) = xanyo and xanyo = gestion;
  return xnombre;
  exception
     when no_data_found then
       return 'NO EXISTEN DATOS';
end concursanteAfiche;

create or replace function concursanteFotografia(
  xanyo in number
) return varchar
is
xnombre varchar(350);
begin
  select p.apellido || ' ' || p.nombre as nombre
  into xnombre
    from fraternidad f
    join inscribe i on i.idfraternidad = f.idfraternidad
    join participante p on p.idparticipante = i.idparticipante
    join concursa c on c.idparticipante = p.idparticipante
    join concurso co on co.idconcurso = c.idconcurso
    join fotografia f on f.idconcurso = co.idconcurso
    where posicion = 1 and extract (year from co.fecha) = xanyo and xanyo = gestion;
  return xnombre;
  exception
     when no_data_found then
       return 'NO EXISTEN DATOS';
end concursanteFotografia;

create or replace procedure fichaEntrada(
  xanyo in number,
  xfraterEntrada out varchar,
  xfraterMonografia out varchar,
  xfraterNusta out varchar, 
  xnombreNusta out varchar,
  xnombreAfiche out varchar,
  xnombreFotografia out varchar  
)
is
begin
  xfraterEntrada := fraterEntrada(xanyo);
  xfraterMonografia := fraterMonografia(xanyo);
  xfraterNusta := fraterNusta(xanyo);
  xnombreNusta := concursanteNusta(xanyo);
  xnombreAfiche := concursanteAfiche(xanyo);
  xnombreFotografia := concursanteFotografia(xanyo);
  exception
    when others then
      xfraterEntrada := 'Otro error'; 
      xfraterMonografia := 'Otro error'; 
      xfraterNusta := 'Otro error'; 
      xnombreNusta := 'Otro error'; 
      xnombreAfiche := 'Otro error'; 
      xnombreFotografia := 'Otro error'; 
end fichaEntrada;

declare
  xanyo number:= '2015';
  xfraterEntrada varchar(200);
  xfraterMonografia varchar(200);
  xfraterNusta varchar(200);
  xnombreNusta varchar(350);
  xnombreAfiche varchar(350);
  xnombreFotografia varchar(350);
begin
  fichaEntrada(xanyo, xfraterEntrada, xfraterMonografia, xfraterNusta, xnombreNusta, xnombreAfiche, xnombreFotografia);
  dbms_output.put_line('Ganadores en la gestion: ' || xanyo);
  dbms_output.put_line('Fraternidad ganadora de la entrada: ' || xfraterEntrada);
  dbms_output.put_line('Fraternidad ganadora del concurso de monografia: ' || xfraterMonografia);
  dbms_output.put_line('Fraternidad ganadora del concurso de ñusta: ' || xfraterNusta);
  dbms_output.put_line('Concurstane ganador del concurso de ñusta: ' || xnombreNusta);
  dbms_output.put_line('Concurstane ganador del concurso de afiche: ' || xnombreAfiche);
  dbms_output.put_line('Concurstane ganador del concurso de fotografia: ' || xnombreFotografia);
end;