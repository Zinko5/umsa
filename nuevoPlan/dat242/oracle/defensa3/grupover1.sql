DECLARE
    CURSOR C_ARTICULOS IS
        SELECT A.ID_ARTICULO, A.TITULO, A.NOTA_PROMEDIO
        FROM ARTICULO A
        ORDER BY A.TITULO;
        
    CURSOR C_AUTORES(P_ID_ARTICULO NUMBER) IS
        SELECT P.NOMBRE, P.APELLIDO, P.GENERO
        FROM PERSONA P, AUTOR AU, ESCRIBE E
        WHERE P.CI = AU.CI
        AND AU.CI = E.CI
        AND E.ID_ARTICULO = P_ID_ARTICULO
        ORDER BY P.APELLIDO;
        
    CURSOR C_JURADOS(P_ID_ARTICULO NUMBER) IS
        SELECT P.NOMBRE, P.APELLIDO, C.PUNTUACION
        FROM PERSONA P, JURADO J, CALIFICA C
        WHERE P.CI = J.CI
        AND J.CI = C.CI
        AND C.ID_ARTICULO = P_ID_ARTICULO
        ORDER BY P.APELLIDO;
        
    CURSOR C_PROMEDIO(P_ID_ARTICULO NUMBER) IS
        SELECT NVL(AVG(C.PUNTUACION), 0) AS PROMEDIO
        FROM CALIFICA C
        WHERE C.ID_ARTICULO = P_ID_ARTICULO;
        
    CURSOR C_CONT_AUTORES(P_ID_ARTICULO NUMBER) IS
        SELECT COUNT(*) AS NUM_AUTORES
        FROM ESCRIBE E
        WHERE E.ID_ARTICULO = P_ID_ARTICULO;
        
    V_TITULO ARTICULO.TITULO%TYPE;
    V_PROMEDIO NUMBER;
    V_NOMBRE PERSONA.NOMBRE%TYPE;
    V_APELLIDO PERSONA.APELLIDO%TYPE;
    V_GENERO PERSONA.GENERO%TYPE;
    V_PUNTUACION CALIFICA.PUNTUACION%TYPE;
    V_NUM_AUTORES NUMBER;
    V_ROW_COUNTER NUMBER := 0;  -- Contador de filas

BEGIN
    -- RECORRE LOS ARTÍCULOS
    DBMS_OUTPUT.PUT_LINE('  A R T I C U L O');
    DBMS_OUTPUT.PUT_LINE(' ');
    
    FOR ART_REC IN C_ARTICULOS LOOP
        V_ROW_COUNTER := V_ROW_COUNTER + 1;  -- Incrementa el contador de filas

        -- CALCULA EL PROMEDIO
        OPEN C_PROMEDIO(ART_REC.ID_ARTICULO);
        FETCH C_PROMEDIO INTO V_PROMEDIO;
        CLOSE C_PROMEDIO;
        
        -- CALCULA EL NÚMERO DE AUTORES
        OPEN C_CONT_AUTORES(ART_REC.ID_ARTICULO);
        FETCH C_CONT_AUTORES INTO V_NUM_AUTORES;
        CLOSE C_CONT_AUTORES;

        -- MUESTRA INFORMACIÓN DEL ARTÍCULO CON EL CONTADOR DE FILAS
        DBMS_OUTPUT.PUT_LINE(V_ROW_COUNTER || ' ' || ART_REC.TITULO || ' CantAutores: ' || V_NUM_AUTORES || ' Promedio Obt: ' || V_PROMEDIO);
        
        -- MUESTRA LOS AUTORES DEL ARTÍCULO
        DBMS_OUTPUT.PUT_LINE('      A U T O R E S');
        FOR AUT_REC IN C_AUTORES(ART_REC.ID_ARTICULO) LOOP
            DBMS_OUTPUT.PUT_LINE('      '|| AUT_REC.APELLIDO || ' ' || AUT_REC.NOMBRE || ' ' || AUT_REC.GENERO);
        END LOOP;
        
        -- MUESTRA LOS JURADOS DEL ARTÍCULO
        DBMS_OUTPUT.PUT_LINE('      J U R A D O S');
        FOR JUR_REC IN C_JURADOS(ART_REC.ID_ARTICULO) LOOP
            DBMS_OUTPUT.PUT_LINE('      '|| JUR_REC.APELLIDO || ' ' || JUR_REC.NOMBRE || ' ' || NVL(JUR_REC.PUNTUACION, 0));
        END LOOP;
        
        DBMS_OUTPUT.PUT_LINE('');  -- Salto de línea para separar cada artículo
    END LOOP;
END;