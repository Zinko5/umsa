DECLARE
    CURSOR c_articulos IS
        SELECT a.ID_ARTICULO, a.TITULO, a.NOTA_PROMEDIO
        FROM ARTICULO a
        ORDER BY a.titulo;
        
    CURSOR c_autores(p_id_articulo NUMBER) IS
        SELECT p.NOMBRE, p.APELLIDO, p.GENERO
        FROM PERSONA p
        JOIN AUTOR au ON p.CI = au.CI
        JOIN ESCRIBE e ON au.CI = e.CI
        WHERE e.ID_ARTICULO = p_id_articulo;
        
    CURSOR c_jurados(p_id_articulo NUMBER) IS
        SELECT p.NOMBRE, p.APELLIDO, c.PUNTUACION
        FROM PERSONA p
        JOIN JURADO j ON p.CI = j.CI
        JOIN CALIFICA c ON j.CI = c.CI
        WHERE c.ID_ARTICULO = p_id_articulo;
        
    v_titulo ARTICULO.TITULO%TYPE;
    v_promedio ARTICULO.NOTA_PROMEDIO%TYPE;
    v_nombre PERSONA.NOMBRE%TYPE;
    v_apellido PERSONA.APELLIDO%TYPE;
    v_genero PERSONA.GENERO%TYPE;
    v_puntuacion CALIFICA.PUNTUACION%TYPE;
    
    v_num_autores NUMBER;
BEGIN
    -- Recorre los artículos
    FOR art_rec IN c_articulos LOOP
        v_num_autores := 0;
        
        -- Muestra información del artículo
        DBMS_OUTPUT.PUT_LINE('ARTÍCULO ' || ' ' || art_rec.TITULO || ' Promedio Obt: ' || NVL(art_rec.NOTA_PROMEDIO, 0));
        
        -- Muestra los autores del artículo
        DBMS_OUTPUT.PUT_LINE('A U T O R E S');
        FOR aut_rec IN c_autores(art_rec.ID_ARTICULO) LOOP
            v_num_autores := v_num_autores + 1;
            DBMS_OUTPUT.PUT_LINE(aut_rec.APELLIDO || ' ' || aut_rec.NOMBRE || ' ' || aut_rec.GENERO);
        END LOOP;
        
        -- Si no hay autores
        IF v_num_autores = 0 THEN
            DBMS_OUTPUT.PUT_LINE('No hay autores.');
        END IF;
        
        -- Muestra los jurados del artículo
        DBMS_OUTPUT.PUT_LINE('J U R A D O S');
        FOR jur_rec IN c_jurados(art_rec.ID_ARTICULO) LOOP
            DBMS_OUTPUT.PUT_LINE(jur_rec.APELLIDO || ' ' || jur_rec.NOMBRE || ' ' || NVL(jur_rec.PUNTUACION, 0));
        END LOOP;
        
        DBMS_OUTPUT.PUT_LINE('');
    END LOOP;
END;
