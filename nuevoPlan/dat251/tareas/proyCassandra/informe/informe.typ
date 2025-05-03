#set text(lang:"es")
#set text(font: "DejaVu Sans")
#show math.equation: set text(font: "DejaVu Math TeX Gyre")

#let fechaEntrega = datetime(year: 2025, month: 4, day: 30)

#let overlay(img, color, width: auto, height: auto) = layout(bounds => {
  let size = measure(img, width: width, height: height)
  img
  place(top + left, rect(width: 100%, height: 100%, fill: color))
})

#let formatFecha(fecha) = {
  let meses = (
    "enero", "febrero", "marzo", "abril", "mayo", "junio",
    "julio", "agosto", "septiembre", "octubre", "noviembre", "diciembre"
  )
  let dia = str(fecha.day()) // Convertimos el día a cadena
  let mes = meses.at(fecha.month() - 1)
  let año = str(fecha.year()) // Convertimos el año a cadena
  dia + " de " + mes + " del " + año
}

#page(
  background: overlay(image("/utiles/logos/umsaLogo.png", width: 25em), white.transparentize(30%)), 
  margin: (x: 3cm),
  paper: "a4"
)[
  #align(center)[
    #text(size: 16pt)[#pad(top: 0pt)[
      Universidad Mayor de San Andrés\
      Facultad de Ciencias Puras y Naturales
    ]]
    #text(size: 30pt)[#pad(top: -5pt)[
      *Práctica Cassandra*
    ]]
    #text(size: 16pt)[#pad(top: -15pt)[
      DAT 251 - Base de datos 3
    ]]
  ]
  #pad(top: 260pt)[
    #text(size: 16pt)[
      *Docente:*
    ]
    #text(size: 14pt)[ #pad(left: 20pt, top: -5pt)[
      Lic. Celia Elena Tarquino Peralta
    ]]
  ]
  #pad(top: 15pt)[
    #text(size: 16pt)[
      *Estudiante:*
    ]
    #text(size: 14pt)[ #pad(left: 20pt, top: -5pt)[
      Gabriel Muñoz Marcelo Callisaya
    ]]
  ]
  #pad(top: 15pt)[
    #text(size: 16pt)[
      *Dupla:*
    ]
    #text(size: 14pt)[ #pad(left: 20pt, top: -5pt)[
      23
    ]]
  ]
  #pad(top: 15pt)[
    #text(size: 16pt)[
      *Fecha de entrega:*
    ]
    #text(size: 14pt)[ #pad(left: 20pt, top: -5pt)[
      #formatFecha(fechaEntrega)
    ]]
  ]
  #place(bottom + center)[
    #text(size: 13pt)[
      *La Paz - Bolivia*
    ]
  ]
]

= Informe de Práctica: Gestor NoSQL Apache Cassandra

== Ejercicio 1: Diseño de un Esquema de Base de Datos

=== Objetivo
Diseñar un esquema en Apache Cassandra para una aplicación de seguimiento de pedidos en tiempo real, optimizado para tres consultas específicas: pedidos de un cliente por rango de fechas, detalles de un pedido específico, y pedidos por estado.

=== Diseño del Esquema
El esquema se define en el keyspace `pedidos_app` con seis tablas para soportar las consultas iniciales y las optimizaciones posteriores. A continuación, se presentan todas las tablas, sus columnas, claves primarias, y propósito.

==== Tabla `pedidos_por_cliente`
- **Propósito**: Soporta consultas de pedidos de un cliente en un rango de fechas.
- **Columnas**:
  - `nombre_cliente` (TEXT): Nombre del cliente (clave de partición).
  - `fecha_pedido` (TIMESTAMP): Fecha y hora del pedido (clave de clustering).
  - `id_pedido` (UUID): Identificador único del pedido (clave de clustering).
  - `estado` (TEXT): Estado del pedido (pendiente, enviado, entregado).
  - `productos` (LIST\<FROZEN\<MAP\<TEXT, INT>>>): Lista de mapas con ID de producto y cantidad.
- **Clave primaria**: `(nombre_cliente, fecha_pedido, id_pedido)` con `fecha_pedido` ordenado DESC.
- **CQL**:
  ```cql
  CREATE TABLE IF NOT EXISTS pedidos_app.pedidos_por_cliente (
    nombre_cliente TEXT,
    fecha_pedido TIMESTAMP,
    id_pedido UUID,
    estado TEXT,
    productos LIST<FROZEN<MAP<TEXT, INT>>>,
    PRIMARY KEY (nombre_cliente, fecha_pedido, id_pedido)
  ) WITH CLUSTERING ORDER BY (fecha_pedido DESC);
  ```

==== Tabla `pedidos_por_id`
- **Propósito**: Permite consultar los detalles de un pedido específico por su ID.
- **Columnas**:
  - `id_pedido` (UUID): Identificador único del pedido (clave de partición).
  - `nombre_cliente` (TEXT): Nombre del cliente.
  - `fecha_pedido` (TIMESTAMP): Fecha y hora del pedido.
  - `estado` (TEXT): Estado del pedido.
  - `productos` (LIST\<FROZEN\<MAP\<TEXT, INT>>>): Lista de productos.
- **Clave primaria**: `(id_pedido)`.
- **CQL**:
  ```cql
  CREATE TABLE IF NOT EXISTS pedidos_app.pedidos_por_id (
    id_pedido UUID,
    nombre_cliente TEXT,
    fecha_pedido TIMESTAMP,
    estado TEXT,
    productos LIST<FROZEN<MAP<TEXT, INT>>>,
    PRIMARY KEY (id_pedido)
  );
  ```

==== Tabla `pedidos_por_estado`
- **Propósito**: Soporta consultas de pedidos por estado (por ejemplo, todos los entregados).
- **Columnas**: Igual que `pedidos_por_cliente`, pero con `estado` como clave de partición.
- **Clave primaria**: `(estado, fecha_pedido, id_pedido)` con `fecha_pedido` ordenado DESC.
- **CQL**:
  ```cql
  CREATE TABLE IF NOT EXISTS pedidos_app.pedidos_por_estado (
    estado TEXT,
    fecha_pedido TIMESTAMP,
    id_pedido UUID,
    nombre_cliente TEXT,
    productos LIST<FROZEN<MAP<TEXT, INT>>>,
    PRIMARY KEY (estado, fecha_pedido, id_pedido)
  ) WITH CLUSTERING ORDER BY (fecha_pedido DESC);
  ```

==== Tabla `compras_por_producto`
- **Propósito**: Registra compras de productos para el sistema de recomendaciones.
- **Columnas**:
  - `producto_id` (TEXT): ID del producto (clave de partición).
  - `fecha_compra` (TIMESTAMP): Fecha de la compra (clave de clustering).
  - `cliente` (TEXT): Nombre del cliente (clave de clustering).
  - `cantidad` (INT): Cantidad comprada.
- **Clave primaria**: `(producto_id, fecha_compra, cliente)` con `fecha_compra` ordenado DESC.
- **CQL**:
  ```cql
  CREATE TABLE IF NOT EXISTS pedidos_app.compras_por_producto (
    producto_id TEXT,
    fecha_compra TIMESTAMP,
    cliente TEXT,
    cantidad INT,
    PRIMARY KEY (producto_id, fecha_compra, cliente)
  ) WITH CLUSTERING ORDER BY (fecha_compra DESC);
  ```

==== Tabla `pedidos_por_estado_fecha`
- **Propósito**: Optimización para consultas de pedidos por estado y rango de fechas, eliminando `ALLOW FILTERING`.
- **Columnas**: Igual que `pedidos_por_estado`.
- **Clave primaria**: `(estado, fecha_pedido, id_pedido)` con `fecha_pedido` ordenado DESC.
- **CQL**:
  ```cql
  CREATE TABLE IF NOT EXISTS pedidos_app.pedidos_por_estado_fecha (
    estado TEXT,
    fecha_pedido TIMESTAMP,
    id_pedido UUID,
    nombre_cliente TEXT,
    productos LIST<FROZEN<MAP<TEXT, INT>>>,
    PRIMARY KEY (estado, fecha_pedido, id_pedido)
  ) WITH CLUSTERING ORDER BY (fecha_pedido DESC);
  ```

==== Tabla `compras_por_cliente`
- **Propósito**: Optimización para consultas de compras de un cliente, eliminando índices secundarios.
- **Columnas**:
  - `cliente` (TEXT): Nombre del cliente (clave de partición).
  - `fecha_compra` (TIMESTAMP): Fecha de la compra (clave de clustering).
  - `producto_id` (TEXT): ID del producto (clave de clustering).
  - `cantidad` (INT): Cantidad comprada.
- **Clave primaria**: `(cliente, fecha_compra, producto_id)` con `fecha_compra` ordenado DESC.
- **CQL**:
  ```cql
  CREATE TABLE IF NOT EXISTS pedidos_app.compras_por_cliente (
    cliente TEXT,
    fecha_compra TIMESTAMP,
    producto_id TEXT,
    cantidad INT,
    PRIMARY KEY (cliente, fecha_compra, producto_id)
  ) WITH CLUSTERING ORDER BY (fecha_compra DESC);
  ```

=== Justificación del Diseño
El diseño sigue las mejores prácticas de Cassandra:
- **Denormalización**: Cada tabla duplica datos para evitar JOINs, optimizando consultas específicas.
- **Orientación a consultas**: Las claves primarias están diseñadas para soportar patrones de acceso directos (por cliente, ID, estado, o producto).
- **Particionamiento eficiente**: `nombre_cliente`, `estado`, `producto_id`, y `cliente` distribuyen datos uniformemente.
- **Ordenamiento**: `fecha_pedido` y `fecha_compra` ordenados DESC aseguran acceso rápido a los datos más recientes.
- **Estructura de datos**: `LIST<FROZEN<MAP<TEXT, INT>>>` permite almacenar múltiples productos con cantidades, manteniendo integridad.
- **Optimizaciones posteriores**: `pedidos_por_estado_fecha` y `compras_por_cliente` eliminan `ALLOW FILTERING` e índices secundarios, mejorando el rendimiento.

=== Ejecución
El esquema se crea ejecutando:
```bash
cqlsh -f scripts/schema.cql
```
La captura de la ejecución:
#image("sc3/schema_execution.png")

== Ejercicio 2: Importación y Consultas

=== Objetivo
Importar datos ficticios desde un CSV a las tablas diseñadas y ejecutar consultas para validar el esquema.

=== Implementación

==== Generación de Datos (`generate_pedidos.py`)
- **Propósito**: Crea un archivo CSV (`data/pedidos.csv`) con 100 pedidos ficticios.
- **Funcionamiento**:
  - Genera UUIDs para `id_pedido`.
  - Selecciona nombres de clientes de una lista predefinida (por ejemplo, JuanPerez, AnaRodriguez).
  - Crea fechas aleatorias en 2025 (formato `YYYY-MM-DDTHH:MM:SSZ`).
  - Asigna estados (`pendiente`, `enviado`, `entregado`) con distribución uniforme.
  - Genera listas de productos (1-5 productos por pedido, con IDs `prod1` a `prod20` y cantidades de 1 a 10) en formato JSON.
- **Salida**: `data/pedidos.csv` con columnas: `id_pedido`, `nombre_cliente`, `fecha_pedido`, `estado`, `productos`.
- **Ejecución**:
  ```bash
  python scripts/generate_pedidos.py
  ```
  Captura:
  #image("sc3/generate_pedidos.png")

==== Importación (`import_pedidos.py`)
- **Propósito**: Importa los datos de `pedidos.csv` a las tablas `pedidos_por_cliente`, `pedidos_por_id`, y `pedidos_por_estado`.
- **Funcionamiento**:
  - Lee `pedidos.csv` usando la biblioteca `csv`.
  - Conecta a Cassandra usando el driver `cassandra-driver`.
  - Usa sentencias preparadas para insertar datos en las tres tablas.
  - Agrupa inserciones en batches para mejorar la eficiencia.
  - Convierte fechas a formato `TIMESTAMP` y productos a `LIST<FROZEN<MAP<TEXT, INT>>>`.
- **Ejecución**:
  ```bash
  python scripts/import_pedidos.py
  ```
  Captura:
  #image("sc3/import_pedidos.png")

==== Consultas (`consultas.cql`)
- **Propósito**: Valida el esquema con tres consultas específicas.
- **Consultas**:
  1. **Pedidos de un cliente en el último mes**:
     - Propósito: Obtener los pedidos de `JuanPerez` desde el 1 de marzo de 2025.
     - CQL:
       ```cql
       SELECT *
       FROM pedidos_app.pedidos_por_cliente
       WHERE nombre_cliente = 'JuanPerez'
         AND fecha_pedido >= '2025-03-01T00:00:00Z';
       ```
     - Resultado:
     #image("sc3/consulta1.png")
       
  2. **Productos de un pedido específico**:
     - Propósito: Obtener los productos de un pedido con un `id_pedido` específico (por ejemplo, `01749128-37ff-4939-af74-17188af036dd`).
     - CQL:
       ```cql
       SELECT id_pedido, productos
       FROM pedidos_app.pedidos_por_id
       WHERE id_pedido = '01749128-37ff-4939-af74-17188af036dd';
       ```
     - Resultado:
      #image("sc3/consulta2.png")
  3. **Pedidos entregados en un rango de fechas**:
     - Propósito: Listar pedidos con estado `entregado` entre el 1 de enero y el 30 de abril de 2025.
     - CQL:
       ```cql
       SELECT *
       FROM pedidos_app.pedidos_por_estado
       WHERE estado = 'entregado'
         AND fecha_pedido >= '2025-01-01T00:00:00Z'
         AND fecha_pedido <= '2025-04-30T23:59:59Z'
         ALLOW FILTERING;
       ```
     - Resultado:
        #image("sc3/consulta3.png")
- **Ejecución de las tres consultas en conjunto**:
  ```bash
  cqlsh -f scripts/consultas.cql
  ```
  #image("sc3/consultas.png")

=== Resultados
La generación creó un CSV válido con 100 pedidos. La importación pobló las tablas correctamente, y las consultas devolvieron los resultados esperados: 3 pedidos para `JuanPerez`, 1 fila para el pedido específico, y 17 pedidos entregados.

== Ejercicio 3: Solución Creativa (Sistema de Recomendaciones)

=== Objetivo
Diseñar un sistema de recomendaciones basado en los productos más comprados, con consultas para analizar patrones de compra.

=== Implementación

==== Diseño de Tabla (`compras_por_producto`)
- Definida en `schema.cql` (ver Ejercicio 1), permite consultar compras por producto o cliente.

==== Población (`populate_recomendaciones.py`)
- **Propósito**: Extrae datos de `pedidos.csv` e inserta compras individuales en `compras_por_producto`.
- **Funcionamiento**:
  - Lee `pedidos.csv` y descompone las listas de productos.
  - Para cada producto en un pedido, inserta una fila con `producto_id`, `fecha_compra`, `cliente`, y `cantidad`.
  - Usa sentencias preparadas para eficiencia.
  - Genera 328 filas a partir de los 100 pedidos.
- **Ejecución**:
  ```bash
  python scripts/populate_recomendaciones.py
  ```
  Captura:
  #image("sc3/populate_recomendaciones.png")

==== Consultas (`recomendaciones.cql`)
- **Propósito**: Analiza patrones de compra para recomendaciones.
- **Consultas**:
  1. **Compras de un producto específico**:
     - Propósito: Obtener todas las compras de `prod1`.
     - CQL:
       ```cql
       SELECT fecha_compra, cliente, cantidad
       FROM pedidos_app.compras_por_producto
       WHERE producto_id = 'prod1';
       ```
     - Resultado:
        #image("sc3/recomendacion1.png")
  2. **Compras de un cliente específico**:
     - Propósito: Listar las compras de `JuanPerez`.
     - Requiere un índice secundario:
       ```cql
       CREATE INDEX IF NOT EXISTS idx_compras_cliente
       ON pedidos_app.compras_por_producto(cliente);
       ```
     - CQL:
       ```cql
       SELECT producto_id, fecha_compra, cantidad
       FROM pedidos_app.compras_por_producto
       WHERE cliente = 'JuanPerez';
       ```
     - Resultado:
        #image("sc3/recomendacion2.png")
  3. **Compras en un rango de fechas**:
     - Propósito: Listar compras de `prod1` entre el 1 de enero y el 30 de abril de 2025.
     - CQL:
       ```cql
       SELECT producto_id, fecha_compra, cliente, cantidad
       FROM pedidos_app.compras_por_producto
       WHERE producto_id = 'prod1'
         AND fecha_compra >= '2025-01-01'
         AND fecha_compra <= '2025-04-30';
       ```
     - Resultado:
        #image("sc3/recomendacion3.png")
- **Ejecución de las tres consultas de recomendacion en conjunto**:
  ```bash
  cqlsh -f scripts/recomendaciones.cql
  ```
#image("sc3/recomendaciones.png")

==== Agregaciones (`agregaciones_recomendaciones.py`)
- **Propósito**: Calcula los productos más comprados para recomendaciones.
- **Funcionamiento**:
  - Lee datos de `compras_por_producto`.
  - Calcula:
    1. Top 5 productos generales (suma de cantidades por `producto_id`).
    2. Top 5 productos de `JuanPerez`.
    3. Top 5 en un rango de fechas (1 de enero a 30 de abril de 2025).
  - Usa consultas CQL y procesamiento en Python para ordenar resultados.
- **Resultados**:
  - Top 5 generales: `prod10: 144`, `prod4: 139`, `prod5: 128`, `prod19: 111`, `prod13: 110`.
  - Top 5 de `JuanPerez`: `prod5: 29`, `prod6: 23`, `prod2: 15`, `prod8: 15`, `prod15: 14`.
  - Top 5 en rango de fechas: Igual que generales.
- **Ejecución**:
  ```bash
  python scripts/agregaciones_recomendaciones.py
  ```
  Captura:
  #image("sc3/trampa_wajaja.png")

=== Relevancia
El sistema permite a la tienda en línea:
- Identificar productos populares para promociones.
- Personalizar recomendaciones basadas en el historial de un cliente.
- Analizar tendencias temporales para ajustar inventarios.
La tabla `compras_por_producto` es eficiente para consultas por producto, y el índice secundario soporta consultas por cliente, aunque se optimizó en el Ejercicio 4.

== Ejercicio 4: Investigación y Mejora de Rendimiento

=== Objetivo
Investigar prácticas de optimización en Cassandra, medir tiempos de consultas, y mejorar el esquema y consultas.

=== Investigación
Se estudiaron las siguientes prácticas:
- **Diseño orientado a consultas**: Crear tablas específicas para cada consulta.
- **Evitar `ALLOW FILTERING`**: Usar tablas con claves primarias que soporten filtros directamente.
- **Minimizar índices secundarios**: Reemplazarlos con tablas denormalizadas.
- **Denormalización**: Duplicar datos para evitar consultas complejas.
- **Particionamiento eficiente**: Claves de partición que distribuyan datos uniformemente.
- **Materialized views**: Para consultas frecuentes con filtros predefinidos.
- **Configuración de nodos**: Ajustar `replication_factor` y estrategias como `NetworkTopologyStrategy` para clústeres grandes.

=== Implementación

==== Problemas Identificados
- **Consulta 3 de `consultas.cql`**: Usa `ALLOW FILTERING` para filtrar por `fecha_pedido`, lo que escanea particiones innecesariamente.
- **Consulta 2 de `recomendaciones.cql`**: Depende de un índice secundario (`idx_compras_cliente`), que es menos eficiente que una tabla dedicada.

==== Mejoras Aplicadas
1. **Tabla `pedidos_por_estado_fecha`**:
   - Definida en `schema.cql` (ver Ejercicio 1).
   - Elimina la necesidad de `ALLOW FILTERING` al usar `estado` y `fecha_pedido` en la clave primaria.
2. **Tabla `compras_por_cliente`**:
   - Definida en `schema.cql`.
   - Reemplaza el índice secundario, permitiendo consultas directas por `cliente` y `fecha_compra`.
3. **Población (`populate_optimizaciones.py`)**:
   - **Propósito**: Pobla `pedidos_por_estado_fecha` y `compras_por_cliente` con datos de `pedidos.csv`.
   - **Funcionamiento**:
     - Lee `pedidos.csv`.
     - Inserta en `pedidos_por_estado_fecha` los mismos datos que en `pedidos_por_estado`.
     - Descompone productos y los inserta en `compras_por_cliente` (328 filas).
     - Usa sentencias preparadas y batches.
   - **Ejecución**:
     ```bash
     python scripts/populate_optimizaciones.py
     ```
     Captura:
      #image("sc3/populate_optimizaciones.png")
4. **Consultas Optimizadas (`optimizaciones.cql`)**:
   - **Consulta 3 optimizada**:
     - Propósito: Listar pedidos entregados entre el 1 de enero y el 30 de abril de 2025.
     - CQL:
       ```cql
       SELECT *
       FROM pedidos_app.pedidos_por_estado_fecha
       WHERE estado = 'entregado'
         AND fecha_pedido >= '2025-01-01T00:00:00Z'
         AND fecha_pedido <= '2025-04-30T23:59:59Z';
       ```
     - Resultado:
        #image("sc3/optimizacion1.png")
   - **Consulta 2 optimizada**:
     - Propósito: Listar compras de `JuanPerez` en 2025.
     - CQL:
       ```cql
       SELECT producto_id, fecha_compra, cantidad
       FROM pedidos_app.compras_por_cliente
       WHERE cliente = 'JuanPerez'
         AND fecha_compra >= '2025-01-01'
         AND fecha_compra <= '2025-04-30';
       ```
     - Resultado:
        #image("sc3/optimizacion2.png")
   - **Ejecución de las dos consultas optimizadas en conjunto**:
     ```bash
     cqlsh -f scripts/optimizaciones.cql
     ```
     #image("sc3/optimizaciones.png")

==== Tiempos de Ejecución
Se usó `TRACING ON` en `cqlsh` para medir el rendimiento:
- **Consulta 3 original** (`pedidos_por_estado`): 3.147 ms.
- **Consulta 3 optimizada** (`pedidos_por_estado_fecha`): 1.624 ms (48% más rápida).
- **Consulta 2 original** (`compras_por_producto` con índice): 7.898 ms.
- **Consulta 2 optimizada** (`compras_por_cliente`): 4.215 ms (47% más rápida).
La captura de la ejecución es demasiado larga, pero se puede ver en detalle en el archivo `trazado_completo.png`.

=== Resultados y Conclusiones
Las optimizaciones lograron:
- **Eliminación de `ALLOW FILTERING`**: `pedidos_por_estado_fecha` permite filtros directos, reduciendo el tiempo de 3.147 ms a 1.624 ms.
- **Reemplazo de índices secundarios**: `compras_por_cliente` mejora el tiempo de 7.898 ms a 4.215 ms.
- **Escalabilidad**: Las mejoras serán más significativas con datasets grandes, ya que evitan escaneos completos.
- **Limitaciones**: El dataset pequeño (100 pedidos, 328 compras) limita las diferencias de tiempo, pero el diseño es robusto para entornos reales.

=== Recomendaciones
1. **Materialized views**: Crear vistas para consultas frecuentes, como pedidos por cliente y estado, para reducir duplicación manual.
2. **Ajustar particionamiento**: Usar `NetworkTopologyStrategy` y aumentar `replication_factor` en clústeres multi-nodo.
3. **Monitoreo**: Usar herramientas como `nodetool` para analizar el tamaño de particiones y evitar particiones demasiado grandes.
4. **Caching**: Habilitar caché de filas para consultas repetitivas.
5. **Compresión**: Configurar compresión de datos en tablas para reducir el uso de disco.
