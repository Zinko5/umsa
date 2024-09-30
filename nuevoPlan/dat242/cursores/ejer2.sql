declare
  cursor c_depar is select coddepar, nombre_d, ci_jefe
    from departamento
    order by nombre_d;
  xcoddepar varchar(15);
  xnombredepar varchar(150);
  xcijefe number;

  cursor c_investigadorM is select apellido || ' ' || nombre as nombre
    from investigador
   where coddepar = xcoddepar and sexo = 'MASCULINO'
   order by nombre;
  xnombreInvestigadorM varchar(105);
  xsalarioM number;

  cursor c_investigadorF is select apellido || ' ' || nombre as nombre
    from investigador
   where coddepar = xcoddepar and sexo = 'FEMENINO'
   order by nombre;
  xnombreInvestigadorF varchar(105);
  xsalarioF number;

  cursor c_investigadorJefe is select apellido || ' ' || nombre as nombreJefe
    from investigador
   where ci = xcijefe;
  xnombreJefe varchar(105);

  cursor c_sueldo is select round(avg(salario), 3)
    from investigador
   where coddepar = xcoddepar;
  xsueldo number;

  nroInF number;
  nroInM number;
begin
  dbms_output.put_line('Listado');
  open c_depar;
  loop
    fetch c_depar into xcoddepar, xnombredepar, xcijefe;
    exit when c_depar%notfound;
    dbms_output.put_line('Departamento: ' || xnombredepar);
    open c_investigadorJefe;
    loop
      nroInF:= 0;
      nroInM:= 0;
      fetch c_investigadorJefe into xnombreJefe;
      exit when c_investigadorJefe%notfound;
      dbms_output.put_line('    Jefe: ' || xnombreJefe);
      dbms_output.put_line('        Investigadoras:');
      open c_investigadorF;
      loop
        fetch c_investigadorF into xnombreInvestigadorF;
        exit when c_investigadorF%notfound;
        dbms_output.put_line('            ' || xnombreInvestigadorF);
        nroInF:= nroInF + 1;
      end loop;
      if nroInF = 0 then
        dbms_output.put_line('            Sin investigadoras');
      end if;
      close c_investigadorF;
      dbms_output.put_line('        Investigadores:');
      open c_investigadorM;
      loop
        fetch c_investigadorM into xnombreInvestigadorM;
        exit when c_investigadorM%notfound;
        dbms_output.put_line('            ' || xnombreInvestigadorM);
        nroInM:= nroInM + 1;
      end loop;
      if nroInM = 0 then
        dbms_output.put_line('            Sin investigadores');
      end if;
      close c_investigadorM;
    end loop;
    open c_sueldo;
    loop
      fetch c_sueldo into xsueldo;
      exit when c_sueldo%notfound;
      dbms_output.put_line('    Sueldo promedio: ' || xsueldo);
    end loop;
    close c_sueldo;
    close c_investigadorJefe;
    dbms_output.put_line(' ');
  end loop;
  close c_depar;
end;