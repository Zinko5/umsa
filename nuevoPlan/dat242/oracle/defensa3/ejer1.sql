declare
  cursor c_articulo is select id_articulo, titulo   
    from articulo
    order by titulo;
  xidArticulo number;
  xtitulo varchar2(150);

  cursor c_autores is select p.nombre, p.apellido, p.genero
    from autor a
    join escribe e on e.ci = a.ci
    join articulo ar on ar.id_articulo = e.id_articulo
    join persona p on p.ci = a.ci
  where ar.id_articulo = xidArticulo;
  xnombreAutor varchar2(150);
  xapellidoAutor varchar2(150);
  xgeneroAutor varchar2(50);

  cursor c_jurado is select p.nombre, p.apellido, c.puntuacion
    from jurado j
    join califica c on c.ci = j.ci
    join articulo ar on ar.id_articulo = c.id_articulo
    join persona p on p.ci = j.ci
  where ar.id_articulo = xidArticulo;
  xnombreJurado varchar2(150);
  xapellidoJurado varchar2(150);
  xpuntuacionJurado number;

  cursor c_cantidadAutores is select distinct count(*) as cantAutores
    from jurado j
    join califica c on c.ci = j.ci
    join articulo ar on ar.id_articulo = c.id_articulo
    join persona p on p.ci = j.ci
  where ar.id_articulo = xidArticulo;
  xcantAutores number;

  cursor c_promedio is select nvl(avg(c.puntuacion), 0) as prom
    from jurado j
    join califica c on c.ci = j.ci
    join articulo ar on ar.id_articulo = c.id_articulo
    join persona p on p.ci = j.ci
  where ar.id_articulo = xidArticulo;
  xpromedio number;

  begin
    dbms_output.put_line('Articulos');
  end;