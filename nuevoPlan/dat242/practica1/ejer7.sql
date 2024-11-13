declare
  xanyo int;

  cursor cFrater is select nombre
    from fraternidad f
    join presentabaile p on p.idfraternidad = f.idfraternidad
    join concurso co on co.idconcurso = p.idconcurso
   where extract (year from fecha) = xanyo
   order by posicion;
  xFraterNom varchar(450);

  cursor cGuia is select p.apellido || ' ' || p.nombre
    from fraternidad f
    join inscribe i on i.idfraternidad = f.idfraternidad
    join participante p on p.idparticipante = i.idparticipante
  where esguia = 'SI' and gestion = xanyo and f.nombre = xFraterNom
  order by p.apellido;
  xGuiaNom varchar(450);

  cursor cDirectivo is select p.apellido || ' ' || p.nombre
    from fraternidad f
    join inscribe i on i.idfraternidad = f.idfraternidad
    join participante p on p.idparticipante = i.idparticipante
  where esdirectivo = 'SI' and gestion = xanyo and f.nombre = xFraterNom
  order by p.apellido;
  xDirectivoNom varchar(450);
begin
  xanyo := 2020;
  dbms_output.put_line('Entrada año ' || xanyo);
  open cFrater;
  loop
    fetch cFrater into xFraterNom;
    exit when cFrater%notfound;
    dbms_output.put_line('    Fraternidad: ' || xFraterNom);
    dbms_output.put_line('    Guías:');
    open cGuia;
    loop
      fetch cGuia into xGuiaNom;
      exit when cGuia%notfound;
      dbms_output.put_line('        ' || xGuiaNom);
    end loop;
    close cGuia;
    dbms_output.put_line('    Directivos:');
    open cDirectivo;
    loop
      fetch cDirectivo into xDirectivoNom;
      exit when cDirectivo%notfound;
      dbms_output.put_line('        ' || xDirectivoNom);
    end loop;
    close cDirectivo;
  end loop;
  close cFrater;
end;