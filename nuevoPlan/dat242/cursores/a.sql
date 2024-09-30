DECLARE
  CURSOR c_instit IS 
    SELECT razonsocial, codins
    FROM INST_FINAN
    ORDER BY razonsocial;

  xrazonsocial  VARCHAR2(200);
  xcodins      NUMBER;
  xnro         NUMBER;

  CURSOR c_proyect IS 
    SELECT i.NOM_PRY, s.monto  
    FROM PROYECTO i, FINANCIA s
    WHERE s.codins = xcodins AND s.codpry = i.codpry;

  xnom   VARCHAR2(200); 
  xmonto NUMBER;
  xtotal NUMBER;

BEGIN
  DBMS_OUTPUT.PUT_LINE('LISTADO DE PROYECTOS SEGUN INSTITUCION FINANCIERA');
  DBMS_OUTPUT.PUT_LINE('=================================================');
  
  OPEN c_instit;
  
  LOOP
    FETCH c_instit INTO xrazonsocial, xcodins;
    EXIT WHEN c_instit%NOTFOUND;

    DBMS_OUTPUT.PUT_LINE('INSTITUCION: ' || xrazonsocial);

    OPEN c_proyect;
    xnro := 1;
    xtotal:= 0;
    LOOP 
      FETCH c_proyect INTO xnom, xmonto;
      EXIT WHEN c_proyect%NOTFOUND;

      DBMS_OUTPUT.PUT_LINE('        ' || xnom || ' ' || xmonto);
      xtotal:=xtotal+xmonto;
      xnro := xnro + 1;
    END LOOP;
      DBMS_OUTPUT.put_line('         TOTAL: '|| xtotal);
    CLOSE c_proyect;
  END LOOP;

  CLOSE c_instit;
  

END;