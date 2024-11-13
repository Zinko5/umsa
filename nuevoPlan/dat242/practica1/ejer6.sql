declare
  xanyo number;
  
  cursor cfrater is select nombre
    from fraternidad;
  xFraterNom varchar(200);

  cursor cinscritos is select count(*)
    from inscribe i
    join fraternidad f on f.idfraternidad = i.idfraternidad
   where f.nombre = xFraterNom and gestion = xanyo;
   xNroInscritos int;

   cursor cbloque is select b.nombre
     from bloque b
     join fraternidad f on f.idfraternidad = b.idfraternidad
    where f.nombre = xFraterNom;
    xBloqueNom varchar(150);
begin
  xanyo := 2019;
  open cfrater;
  loop
    fetch cfrater into xFraterNom;
    exit when cfrater%notfound;
    dbms_output.put_line('Fraternidad: ' || xFraterNom);
    open cinscritos;
    loop
      fetch cinscritos into xNroInscritos;
      exit when cinscritos%notfound;
      dbms_output.put_line('Nro inscritos: ' || xNroInscritos);
      open cbloque;
      loop
        fetch cbloque into xBloqueNom;
        exit when cbloque%notfound;
        dbms_output.put_line('    Bloque:' || xBloqueNom);
      end loop;
      close cbloque;
    end loop;
    close cinscritos;
  end loop;
  close cfrater;
end;
