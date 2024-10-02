DECLARE
  v_id_articulo NUMBER;
  v_titulo VARCHAR2(255);
  v_nota_promedio NUMBER;
  v_cant_autores NUMBER;
  v_ci_autor NUMBER;
  v_nombre_autor VARCHAR2(255);
  v_apellido_autor VARCHAR2(255);
  v_genero_autor VARCHAR2(10);
  v_ci_jurado NUMBER;
  v_nombre_jurado VARCHAR2(255);
  v_apellido_jurado VARCHAR2(255);
  v_nota_jurado NUMBER;
  v_contador_articulo NUMBER := 1;

  CURSOR cur_articulos IS
    SELECT a.id_articulo, a.titulo
    FROM ARTICULO a
    ORDER BY a.titulo;

  CURSOR cur_autores(p_id_articulo ARTICULO.id_articulo%TYPE) IS
    SELECT p.ci, p.nombre, p.apellido, p.genero
    FROM PERSONA p
    JOIN AUTOR au ON p.ci = au.ci
    JOIN ESCRIBE e ON au.ci = e.ci
    WHERE e.id_articulo = p_id_articulo
    ORDER BY p.apellido;

  CURSOR cur_jurados(p_id_articulo ARTICULO.id_articulo%TYPE) IS
    SELECT p.ci, p.nombre, p.apellido, c.puntuacion
    FROM PERSONA p
    JOIN JURADO j ON p.ci = j.ci
    JOIN CALIFICA c ON j.ci = c.ci
    WHERE c.id_articulo = p_id_articulo
    ORDER BY p.apellido;

BEGIN
  OPEN cur_articulos;
  LOOP
    FETCH cur_articulos INTO v_id_articulo, v_titulo;
    EXIT WHEN cur_articulos%NOTFOUND;

    SELECT NVL(AVG(c.puntuacion), 0)
    INTO v_nota_promedio
    FROM CALIFICA c
    WHERE c.id_articulo = v_id_articulo;

    SELECT COUNT(*)
    INTO v_cant_autores
    FROM ESCRIBE e
    WHERE e.id_articulo = v_id_articulo;

    DBMS_OUTPUT.PUT_LINE(v_contador_articulo || '. ' || v_titulo || '     CantAutores: ' || v_cant_autores || ' Promedio obt: ' || v_nota_promedio);
    DBMS_OUTPUT.PUT_LINE('           AUTORES');

    OPEN cur_autores(v_id_articulo);
    LOOP
      FETCH cur_autores INTO v_ci_autor, v_nombre_autor, v_apellido_autor, v_genero_autor;
      EXIT WHEN cur_autores%NOTFOUND;

      DBMS_OUTPUT.PUT_LINE('          ' || v_apellido_autor || ' ' || v_nombre_autor || '   ' || v_genero_autor);
    END LOOP;
    CLOSE cur_autores;

    DBMS_OUTPUT.PUT_LINE('           JURADOS');

    OPEN cur_jurados(v_id_articulo);
    LOOP
      FETCH cur_jurados INTO v_ci_jurado, v_nombre_jurado, v_apellido_jurado, v_nota_jurado;
      EXIT WHEN cur_jurados%NOTFOUND;

      DBMS_OUTPUT.PUT_LINE('          ' || v_apellido_jurado || ' ' || v_nombre_jurado || '     ' || NVL(v_nota_jurado, 0));
    END LOOP;
    CLOSE cur_jurados;

    v_contador_articulo := v_contador_articulo + 1;
    DBMS_OUTPUT.PUT_LINE('');
  END LOOP;
  CLOSE cur_articulos;
END;
