delimiter //

create procedure mostrar_articulos()
begin
  declare done int default 0;
  declare xidArt int;
  declare xtituloArt varchar(200);
  declare xnotaPromArt decimal(10, 2);
  declare xnombreAutor varchar(200);
  declare xapellidoAutor varchar(200);
  declare xnombreCalifica varchar(200);
  declare xapellidoCalifica varchar(200);
  declare xpuntuacionCalifica decimal(10, 2);

  declare c_articulo cursor for 
  select id_articulo, titulo, nota_promedio
  from articulo;

  declare c_escritoPor cursor for 
  select nombre, apellido
  from autor a
  join persona p on p.ci = a.ci
  join escribe e on e.ci = p.ci
  where id_articulo = xidArt;

  declare c_calificadoPor cursor for 
  select nombre, apellido, puntuacion
  from califica c
  join persona p on p.ci = c.ci
  where id_articulo = xidArt;

  declare continue handler for not found set done = 1;

  select 'articulos';

  open c_articulo;
  read_articulo: loop
    fetch c_articulo into xidArt, xtituloArt, xnotaPromArt;
    if done then
      leave read_articulo;
    end if;
    select concat('articuloid: ', xidArt, ', titulo: ', xtituloArt, ', nota promedio: ', xnotaPromArt) as salida;

    select '  escrito por:';
    open c_escritoPor;
    set done = 0; 
    read_escritoPor: loop
      fetch c_escritoPor into xnombreAutor, xapellidoAutor;
      if done then
        leave read_escritoPor;
      end if;
      select concat('    apellido: ', xapellidoAutor, ', nombre: ', xnombreAutor) as salida;
    end loop;
    close c_escritoPor;

    set done = 0; 
    select '  calificado por:';
    open c_calificadoPor;
    read_calificadoPor: loop
      fetch c_calificadoPor into xnombreCalifica, xapellidoCalifica, xpuntuacionCalifica;
      if done then
        leave read_calificadoPor;
      end if;
      select concat('    apellido: ', xapellidoCalifica, ', nombre: ', xnombreCalifica, ', nota: ', xpuntuacionCalifica) as salida;
    end loop;
    close c_calificadoPor;
  end loop;
  close c_articulo;
end;
//

delimiter ;




  articuloIid: ... titulo: ... nota promedio: ...
    escrito por:
      apellido: ... nombre: ...
    calificado por:
      apellido ... nombre ... nota ... 

