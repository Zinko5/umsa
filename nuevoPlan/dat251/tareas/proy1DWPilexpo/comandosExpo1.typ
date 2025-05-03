#set text(lang:"es")
#set text(font: "DejaVu Sans")
#show math.equation: set text(font: "DejaVu Math TeX Gyre")
= Para la creación de la base de datos:
== CMD:
```cmd
psql -U postgres
CREATE DATABASE dw_pil1;
\q
psql -U postgres -d dw_pil1 -h 127.0.0.1 -p 5432
```
== PostgreSQL:
```sql
-- Dimensión: Tiempo
CREATE TABLE dim_tiempo (
    id_tiempo SERIAL PRIMARY KEY,
    fecha DATE,
    dia INT,
    mes VARCHAR(20),
    anio INT,
    trimestre VARCHAR(5)
);

-- Dimensión: Operario
CREATE TABLE dim_operario (
    id_operario INT PRIMARY KEY,
    operario VARCHAR(100),
    nombre_operario VARCHAR(100),
    apellido_operario VARCHAR(100),
    turno VARCHAR(20),
    cargo_operario VARCHAR(50),
    genero_operario VARCHAR(20),
    antiguedad_operario INT
);

-- Dimensión: Máquina
CREATE TABLE dim_maquina (
    id_maquina INT PRIMARY KEY,
    maquina VARCHAR(100),
    estado_maquina VARCHAR(50),
    modelo_maquina VARCHAR(50),
    tipo_maquina VARCHAR(50),
    anio_compra INT
);

-- Dimensión: Línea de Producción
CREATE TABLE dim_linea_produccion (
    id_linea INT PRIMARY KEY,
    linea_produccion VARCHAR(100),
    ubicacion_linea VARCHAR(100),
    capacidad_linea INT
);

-- Dimensión: Producto
CREATE TABLE dim_producto (
    id_producto INT PRIMARY KEY,
    producto VARCHAR(100),
    unidad_medida VARCHAR(20),
    costo_unitario DECIMAL(10,2)
);

-- Tabla de Hechos: Producción
CREATE TABLE hechos_produccion (
    id_hecho SERIAL PRIMARY KEY,
    id_registro INT,
    id_tiempo INT REFERENCES dim_tiempo(id_tiempo),
    id_producto INT REFERENCES dim_producto(id_producto),
    id_linea INT REFERENCES dim_linea_produccion(id_linea),
    id_operario INT REFERENCES dim_operario(id_operario),
    id_maquina INT REFERENCES dim_maquina(id_maquina),
    cantidad_producida INT,
    cantidad_desperdicio INT,
    costo_unitario DECIMAL(10,2),
    costo_desperdicio DECIMAL(10,2),
    porcentaje_desperdicio DECIMAL(5,2),
    eficiencia DECIMAL(5,2)
);
```
\
```sql
-- Cargar dim_tiempo
COPY dim_tiempo(id_tiempo, fecha, dia, mes, anio, trimestre)
FROM 'C:\Users\gabri\Downloads\Empr_Pil-20250412T023843Z-001\Empr_Pil\dim_tiempo.csv'
DELIMITER ','
CSV HEADER;

-- Cargar dim_operario
COPY dim_operario(id_operario, operario, nombre_operario, apellido_operario, turno, cargo_operario, genero_operario, antiguedad_operario)
FROM 'C:\Users\gabri\Downloads\Empr_Pil-20250412T023843Z-001\Empr_Pil\dim_operario.csv'
DELIMITER ','
CSV HEADER;

-- Cargar dim_maquina
COPY dim_maquina(id_maquina, maquina, estado_maquina, modelo_maquina, tipo_maquina, anio_compra)
FROM 'C:\Users\gabri\Downloads\Empr_Pil-20250412T023843Z-001\Empr_Pil\dim_maquina.csv'
DELIMITER ','
CSV HEADER;

-- Cargar dim_linea_produccion
COPY dim_linea_produccion(id_linea, linea_produccion, ubicacion_linea, capacidad_linea)
FROM 'C:\Users\gabri\Downloads\Empr_Pil-20250412T023843Z-001\Empr_Pil\dim_lineaproduccion.csv'
DELIMITER ','
CSV HEADER;

-- Cargar dim_producto
COPY dim_producto(id_producto, producto, unidad_medida, costo_unitario)
FROM 'C:\Users\gabri\Downloads\Empr_Pil-20250412T023843Z-001\Empr_Pil\dim_producto.csv'
DELIMITER ','
CSV HEADER;

-- Cargar hechos_produccion
COPY hechos_produccion(id_registro, id_tiempo, id_producto, id_linea, id_operario, id_maquina, cantidad_producida, cantidad_desperdicio, costo_unitario, costo_desperdicio, porcentaje_desperdicio, eficiencia)
FROM 'C:\Users\gabri\Downloads\Empr_Pil-20250412T023843Z-001\Empr_Pil\hechos_produccion.csv'
DELIMITER ','
CSV HEADER;
```

// = Guión:

// // ===  _[7] Identificacion de fuentes de datos: preguntas de negocio_

// // "Empecemos con cómo entendimos las necesidades de PIL Andina. Hablamos con gerentes, operarios, y personal de calidad, y revisamos sus sistemas, como el ERP de producción y los registros de calidad. Esto nos llevó a preguntas clave: ¿Cuánto produce y desperdicia cada línea? ¿Qué operarios o máquinas generan más pérdidas? ¿Cuál es el costo del desperdicio por producto? Y, ¿cómo cambia la eficiencia con el tiempo? Estas preguntas fueron nuestro punto de partida para construir el Data Warehouse."\ \
// // === _[8] KPIs e indicadores_

// // "Con las preguntas claras, definimos los indicadores para medir el desempeño. Por ejemplo, contamos la Cantidad Producida, como unidades fabricadas por línea, y la Cantidad de Desperdicio, el material perdido. Calculamos el Costo del Desperdicio, el valor de lo inservible, y el Porcentaje de Desperdicio, comparando desperdicio con producción. También medimos la Eficiencia, restando ese porcentaje de 100%. Estos números nos dieron una foto clara de qué mejorar en PIL Andina."\ \
// // === _[9] Perspectivas (dimensiones)_

// // "Para analizar estos indicadores, necesitábamos diferentes ángulos. Definimos cinco dimensiones: Tiempo, para ver datos por día o mes; Operario, para evaluar desempeños individuales; Producto, para saber qué genera más desperdicio; Línea de Producción, para comparar secciones de la fábrica; y Máquina, para detectar fallas. Con estas, podemos responder cosas como: ¿Qué operario necesita capacitación? O, ¿Qué máquina hay que revisar?"\ \
// // === _[10] diseño conceptual_

// // "Con las dimensiones listas, diseñamos cómo organizar los datos [señala gráfico]. Este modelo conceptual muestra cómo conectamos la información de producción y desperdicio. Agrupa los indicadores, como costos y cantidades, con ejes como tiempo y máquinas, para que PIL Andina pueda explorar sus procesos fácilmente. Es como un plano inicial que nos guió para construir el sistema."\ \
// // === _[11] Modelado dimensional (estrella)_

// // "Aquí está el modelo final que usamos: un esquema estrella [señala gráfico]. En el centro, el hecho que es la producción, rodeado por dimensiones como Operario y Producto. Este diseño es súper simple y hace que las consultas sean rápidas, perfectas para que PIL Andina analice datos sin complicaciones. Fue nuestra base para llevar todo a la práctica."\ \
// // === _[12] diseño logico y fisico (tablas)_

// // "Ahora, convertimos el modelo en algo real [señala gráfico]. Este diagrama muestra cómo organizamos los datos de producción en tablas, como una para hechos y otras para dimensiones. Cada tabla está conectada, reflejando los procesos de PIL Andina, desde máquinas hasta productos. Esto nos preparó para cargar todo en una base de datos."\ \
// // === _[13] mapeo_

// // "Aquí conectamos los dos mundos [señala gráfico]. Las flechas muestran cómo las tablas, como la de producción, encajan con el modelo conceptual que vimos antes. Por ejemplo, los datos de desperdicio se unen con dimensiones como Tiempo o Máquina. Esto aseguró que nuestro diseño fuera claro y funcional para PIL Andina."\ \
// // === _[14] (sigue tablas)_

// // "Y aquí está el resultado final [señala gráfico]. Estas tablas, como hechos_produccion y dim_tiempo, forman el modelo estrella en acción. Las implementamos en PostgreSQL, listas para guardar datos reales de PIL Andina, desde costos hasta desperdicios. Con esto, el sistema está listo para analizar todo lo que necesitan."\ \

// // = _[7] Identificación de fuentes de datos: preguntas de negocio_

// // "Para entender PIL Andina, hablamos con gerentes y revisamos su ERP. Esto nos dio preguntas clave: ¿Cuánto produce cada línea? ¿Qué causa más desperdicio? ¿Cuál es el costo? Estas guiaron el Data Warehouse."

// // = _[8] KPIs e indicadores_

// // "Definimos indicadores como Cantidad Producida y Desperdicio, Costo, y Porcentaje de Desperdicio, comparando con producción. La Eficiencia completa la imagen de qué mejorar en PIL Andina."

// // = _[9] Perspectivas (dimensiones)_

// // "Usamos cinco dimensiones: Tiempo, Operario, Producto, Línea, y Máquina. Así podemos ver, por ejemplo, qué operario genera desperdicio o qué máquina falla, dando flexibilidad al análisis."

// // = _[10] Diseño conceptual_

// // "Diseñamos cómo organizar datos [señala gráfico]. Este modelo conecta indicadores como costos con ejes como tiempo, ayudando a PIL Andina a explorar procesos. Es nuestro plano inicial."

// // = _[11] Modelado dimensional (estrella)_

// // "Usamos un esquema estrella [señala gráfico], con producción en el centro y dimensiones como Operario alrededor. Es simple, rápido, y perfecto para analizar datos de PIL Andina."

// // = _[12] Diseño lógico y físico (tablas)_

// // "Convertimos el modelo en tablas [señala gráfico], organizando datos de producción. Conectan procesos de PIL Andina, como máquinas y productos, listos para la base de datos."

// // = _[13] Mapeo_

// // "Conectamos tablas con el modelo conceptual [señala gráfico]. Las flechas muestran cómo desperdicio se une a Tiempo o Máquina, asegurando un diseño claro para PIL Andina."

// // = _[14] (Sigue tablas)_

// // "Aquí están las tablas finales [señala gráfico], como hechos_produccion, en PostgreSQL. Guardan datos de PIL Andina, desde costos a desperdicios, listos para su análisis."

// = _[8] Identificación de fuentes de datos: preguntas de negocio_

// "Empecemos con cómo entendimos las necesidades de PIL Andina. Hablamos con gerentes, operarios, y personal de calidad, y revisamos sus sistemas, como el ERP de producción y los registros de calidad. Esto nos llevó a preguntas clave: ¿Cuánto produce y desperdicia cada línea? ¿Qué operarios o máquinas generan más pérdidas? ¿Cuál es el costo del desperdicio por producto? Y, ¿cómo cambia la eficiencia con el tiempo? Estas preguntas fueron nuestro punto de partida para construir el Data Warehouse."

// = _[9] KPIs e indicadores_

// "Con las preguntas claras, definimos los indicadores para medir el desempeño. Por ejemplo, contamos la Cantidad Producida, como unidades fabricadas por línea, y la Cantidad de Desperdicio, el material perdido. Calculamos el Costo del Desperdicio, el valor de lo inservible, y el Porcentaje de Desperdicio, comparando desperdicio con producción. También medimos la Eficiencia, restando ese porcentaje de 100%. Estos números nos dieron una foto clara de qué mejorar en PIL Andina."

// = _[10] Perspectivas (dimensiones)_

// "Para analizar estos indicadores, necesitábamos diferentes ángulos. Definimos cinco dimensiones: Tiempo, para ver datos por día o mes; Operario, para evaluar desempeños individuales; Producto, para saber qué genera más desperdicio; Línea de Producción, para comparar secciones de la fábrica; y Máquina, para detectar fallas. Con estas, podemos responder cosas como: ¿Qué operario necesita capacitación? O, ¿Qué máquina hay que revisar?"

// = _[11] Diseño conceptual_

// "Diseñamos cómo organizar datos [señala gráfico]. Este modelo conecta indicadores como costos con ejes como tiempo, ayudando a PIL Andina a explorar procesos. Es nuestro plano inicial."

// = _[12] Modelado dimensional (estrella)_

// "Usamos un esquema estrella [señala gráfico], con producción en el centro y dimensiones como Operario alrededor. Es simple, rápido, y perfecto para analizar datos de PIL Andina."

// = _[13] Diseño lógico y físico (tablas)_

// "Convertimos el modelo en tablas [señala gráfico], organizando datos de producción. Conectan procesos de PIL Andina, como máquinas y productos, listos para la base de datos."

// = _[14] Mapeo_

// "Conectamos tablas con el modelo conceptual [señala gráfico]. Las flechas muestran cómo desperdicio se une a Tiempo o Máquina, asegurando un diseño claro para PIL Andina."

// = _[15] (Sigue tablas)_

// "Aquí están las tablas finales [señala gráfico], como hechos_produccion, en PostgreSQL. Guardan datos de PIL Andina, desde costos a desperdicios, listos para su análisis."

#pagebreak()
== Comandos:
```sql
psql -U postgres
CREATE DATABASE dw_pil1;
\q
pg_restore -U postgres -d dw_pil1 --verbose 'C:\Users\ruta\dw_pil1backup.dump'
psql -U postgres -d dw_pil1 -h 127.0.0.1 -p 5432
```
== Otro:
```sql
createdb -U postgres dw_pil1
pg_restore -U postgres -d dw_pil1 --verbose 'C:\Users\ruta\dw_pil1backup.dump'
psql -U postgres -d dw_pil1 -h 127.0.0.1 -p 5432
```