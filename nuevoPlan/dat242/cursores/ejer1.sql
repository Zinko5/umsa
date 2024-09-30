declare
  cursor c_insti is select codins, razonsocial
    from inst_finan
    order by razonsocial;
  xcodinsti number;
  xrazon varchar(150);

  cursor c_proy is select nom_pry, monto
    from proyecto p
    join financia f on f.codpry = p.codpry
   where codins = xcodinsti
   order by 1;
  xnomproy varchar(150);
  xmonto varchar(25);

  c number;
begin
  dbms_output.put_line('Listado');
  open c_insti;
  loop
    c:= 0;
    fetch c_insti into xcodinsti, xrazon;
    exit when c_insti%notfound;
    dbms_output.put_line('Institucion: ' || xrazon);
    open c_proy;
    loop
      fetch c_proy into xnomproy, xmonto;
      exit when c_proy%notfound;
      dbms_output.put_line('    ' || xnomproy || '    ' || xmonto);
      c:= c + xmonto;
    end loop;
    close c_proy;
    dbms_output.put_line('    Total: ' || c);
    dbms_output.put_line(' ');
  end loop;
  close c_insti;
end;