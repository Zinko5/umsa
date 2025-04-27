#set text(lang: "es")
#set text(font: "DejaVu Sans")
#show math.equation: set text(font: "DejaVu Math TeX Gyre")

#let fechaEntrega = datetime(year: 2025, month: 3, day: 12)

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
  let dia = str(fecha.day())
  let mes = meses.at(fecha.month() - 1)
  let año = str(fecha.year())
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
      *Informe \#1 DW con metodología Hefesto*
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
      *Estudiantes:*
    ]
    #text(size: 14pt)[ #pad(left: 20pt, top: -5pt)[
      - Henrry Yonathan Condori Casa
      - Ricardo Andrés Beizaga Marquez
      - Muñoz Callisaya Gabriel Marcelo
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

#set par(justify: true)

= Índice del Proyecto

- 1. Introducción
  - 1.1. Objetivo del Proyecto
  - 1.2. Alcance y Limitaciones
  - 1.3. Metodología HEFESTO aplicada
  - 1.4. Herramientas y Tecnologías utilizadas
- 2. Análisis y Definición de Requerimientos
  - 2.1. Identificación de fuentes de datos
  - 2.2. Requerimientos del negocio
  - 2.3. Definición de KPIs y métricas clave
  - 2.4. Modelado conceptual del Data Warehouse
- 3. Diseño del Data Warehouse
  - 3.1. Diseño de la arquitectura del DW
  - 3.2. Modelado dimensional (Star Schema / Snowflake)
  - 3.3. Diseño de tablas de hechos y dimensiones
  - 3.4. Definición de procesos ETL
- 4. Implementación del Data Warehouse con Pentaho
  - 4.1. Instalación y configuración de Pentaho Data Integration (PDI)
  - 4.2. Extracción de datos desde las fuentes
  - 4.3. Transformación y limpieza de datos
  - 4.4. Carga en el Data Warehouse (ETL completo)
- 5. Creación de Dashboards con Power BI
  - 5.1. Conexión de Power BI con el Data Warehouse
  - 5.2. Modelado de datos en Power BI
  - 5.3. Creación de visualizaciones y reportes
  - 5.4. Publicación y despliegue del dashboard
- 6. Validación y Pruebas
  - 6.1. Validación de datos y consistencia
  - 6.2. Pruebas de rendimiento
  - 6.3. Verificación de KPIs y métricas
- 7. Despliegue y Documentación
  - 7.1. Implementación final en el entorno de producción
  - 7.2. Documentación del proceso ETL
  - 7.3. Manual de usuario para Power BI
- 8. Conclusiones y Recomendaciones
  - 8.1. Resultados obtenidos
  - 8.2. Lecciones aprendidas
  - 8.3. Futuras mejoras y optimización

= 1. Introducción

== 1.1. Objetivo del Proyecto

El propósito de este proyecto es implementar un Data Warehouse (DW) para PIL, una empresa ficticia en Bolivia dedicada a la producción industrial. El DW analizará datos de producción y desperdicio, identificará ineficiencias operativas, reducirá costos asociados a materiales perdidos y apoyará la toma de decisiones estratégicas. Este sistema busca optimizar procesos, aumentar la rentabilidad y fortalecer la competitividad de PIL mediante un análisis detallado.

== 1.2. Alcance y Limitaciones

El proyecto abarca el análisis de producción y desperdicio por línea, operario, turno y máquina, el cálculo de costos asociados al desperdicio y la evaluación de eficiencia productiva en el tiempo. Se limita a datos de producción, excluyendo áreas como ventas o logística, y depende de la calidad de los sistemas OLTP de PIL, que podrían tener información incompleta o desactualizada, afectando los resultados.

== 1.3. Metodología HEFESTO aplicada

HEFESTO estructura el desarrollo del DW en fases: análisis de requerimientos, diseño conceptual y lógico, implementación y validación. Este enfoque asegura que el sistema cumpla las necesidades de PIL, como medir desperdicio y eficiencia. Se aplicaron iteraciones para alinear cada etapa con los objetivos del negocio, garantizando una solución práctica y escalable que responde a los retos operativos de la empresa.

== 1.4. Herramientas y Tecnologías utilizadas

Se emplearon Pentaho Data Integration (PDI) para procesos ETL, Power BI para visualizaciones, PostgreSQL como base de datos del DW y Typst para este informe. Estas herramientas se integran fácilmente, ofrecen flexibilidad para manejar datos complejos y son accesibles para usuarios técnicos y no técnicos en PIL, asegurando un desarrollo eficiente y una presentación clara de los resultados del proyecto.

= 2. Análisis y Definición de Requerimientos

== 2.1. Identificación de fuentes de datos

Las fuentes incluyen el ERP de PIL (producción, inventario, costos), el sistema de control de calidad (desperdicio y scrap) y el sistema de recursos humanos (operarios y turnos). Se mapearon tablas específicas como `produccion_diaria` y `desperdicio_registro` para extraer datos clave, asegurando que el DW refleje una visión integral de las operaciones de la empresa en el análisis inicial.

== 2.2. Requerimientos del negocio

Tras entrevistas con gerentes y operarios, se definieron necesidades: medir producción y desperdicio por línea, identificar responsables (operarios, turnos, máquinas), calcular costos de desperdicio por producto y evaluar eficiencia temporal. Se priorizaron métricas como volumen de desperdicio en kilos y costos en bolivianos, alineando el DW con las metas de reducción de ineficiencias operativas de PIL.

== 2.3. Definición de KPIs y métricas clave

Se establecieron KPIs: Cantidad Producida (unidades), Cantidad de Desperdicio (kilos), Costo de Desperdicio ($ "Costo" = "Cantidad_Desperdicio" times "Costo_Unitario" $), Porcentaje de Desperdicio ($ "Porcentaje" = "Cantidad_Desperdicio" / "Cantidad_Producida" times 100 $), y Eficiencia ($ "Eficiencia" = ("Cantidad_Producida" - "Cantidad_Desperdicio") / "Cantidad_Producida" times 100 $). Estos se validaron con datos simulados para confirmar su utilidad.

== 2.4. Modelado conceptual del Data Warehouse

El modelo incluye dimensiones (Tiempo, Línea de Producción, Operario, Máquina, Producto) y hechos (Cantidad Producida, Desperdicio, Costo). Se diseñó un esquema preliminar con `Producción` como hecho central, conectando dimensiones vía claves únicas. Esto permitió visualizar relaciones como desperdicio por operario en un día específico, sentando las bases para el diseño detallado del DW en etapas posteriores.

= 3. Diseño del Data Warehouse

== 3.1. Diseño de la arquitectura del DW

La arquitectura utiliza un bus de datos con PostgreSQL como base centralizada. Se configuró un esquema inicial con tablas de hechos y dimensiones, permitiendo consultas rápidas como total de desperdicio por línea. Este diseño soporta escalabilidad, facilitando la integración futura de nuevos datos y optimizando el rendimiento para análisis operativos en PIL a largo plazo.

== 3.2. Modelado dimensional (Star Schema / Snowflake)

Se optó por un Star Schema por su simplicidad y eficiencia. Se denormalizaron dimensiones como `dim_tiempo` (día, mes) y `dim_operario` (ID, nombre), conectándolas a una tabla de hechos. Esto aceleró consultas en Power BI, como desperdicio por turno, demostrando que el modelo es práctico para los requerimientos analíticos de PIL en un entorno real.

== 3.3. Diseño de tablas de hechos y dimensiones

La tabla `produccion_hechos` incluye claves a dimensiones y campos como `cantidad_producida`. Dimensiones como `dim_tiempo` (fecha, año) y `dim_maquina` (ID, tipo) se definieron en PostgreSQL. Se crearon tablas de prueba con datos ficticios, permitiendo consultas como desperdicio por máquina en un mes, validando la estructura para análisis multidimensional en el DW.

== 3.4. Definición de procesos ETL

Los ETL extraen datos vía JDBC, transforman (limpieza, cálculos) y cargan incrementalmente. Se diseñó un flujo simple: extracción de `produccion_diaria`, conversión de unidades y carga en `produccion_hechos`. Esto aseguró datos consistentes y actualizados, preparando el DW para análisis periódicos de producción y desperdicio en PIL, con posibilidad de ajustes futuros según necesidades.

= 4. Implementación del Data Warehouse con Pentaho

== 4.1. Instalación y configuración de Pentaho Data Integration (PDI)

PDI se instaló en un servidor Linux, configurando conexiones JDBC a PostgreSQL. Se creó un repositorio para jobs ETL, definiendo parámetros de seguridad (usuarios, permisos). Esta configuración permitió ejecutar transformaciones de prueba, extrayendo datos simulados y cargándolos en el DW, verificando su estabilidad para entornos operativos en PIL.

== 4.2. Extracción de datos desde las fuentes

Con PDI, se usó "Table Input" para extraer datos de tablas como `desperdicio_registro` vía SQL. Se filtraron registros por fecha, capturando producción y desperdicio diarios. Esto confirmó que las conexiones JDBC funcionan y que los datos se extraen sin duplicados, sentando bases para procesos ETL completos y confiables en PIL.

== 4.3. Transformación y limpieza de datos

Las transformaciones en PDI limpiaron datos (eliminación de nulos), estandarizaron fechas y calcularon costos ($ "Costo_Desperdicio" = "Cantidad" times "Costo_Unitario" $). Se procesaron datos ficticios, mapeando operarios a `dim_operario` y ajustando formatos. Esto aseguró que el DW contenga información precisa y lista para análisis, cumpliendo los estándares de calidad de PIL.

== 4.4. Carga en el Data Warehouse (ETL completo)

Se diseñó un job en PDI para ejecutar ETL: extracción, transformación y carga incremental usando marcas temporales. Se actualizaron registros nuevos en `produccion_hechos`, evitando redundancias. Este flujo se programó diariamente, demostrando que el DW puede mantenerse actualizado automáticamente, reflejando las operaciones de producción y desperdicio en tiempo casi real para PIL.

= 5. Creación de Dashboards con Power BI

== 5.1. Conexión de Power BI con el Data Warehouse

Power BI se conectó a PostgreSQL mediante ODBC en modo importación. Se importaron datos de `produccion_hechos` y dimensiones, verificando acceso a métricas como desperdicio por línea. Esta conexión permitió cargar datos de prueba, asegurando que Power BI pueda consultar el DW eficientemente para visualizaciones en PIL sin problemas técnicos.

== 5.2. Modelado de datos en Power BI

Se definieron relaciones entre `produccion_hechos` y dimensiones (e.g., `dim_tiempo`), usando DAX para medidas como $ "Eficiencia" = ("Cantidad_Producida" - "Cantidad_Desperdicio") / "Cantidad_Producida" times 100 $. Se vincularon datos ficticios, permitiendo análisis dinámicos como eficiencia por turno. Esto facilitó la creación de reportes personalizados para los usuarios de PIL.

== 5.3. Creación de visualizaciones y reportes

Se diseñaron gráficos de barras (producción vs. desperdicio por línea) y líneas (eficiencia temporal) en Power BI. Se usaron datos simulados, aplicando filtros por operario y mes. Estas visualizaciones mostraron tendencias claras, como picos de desperdicio, demostrando su utilidad para supervisores de PIL en la toma de decisiones operativas diarias.

== 5.4. Publicación y despliegue del dashboard

El dashboard se publicó en Power BI Service, asignando permisos a gerentes. Se configuró una actualización diaria sincronizada con el ETL, asegurando datos frescos. Esto permitió acceso remoto y demostró que los usuarios de PIL pueden explorar métricas como costos de desperdicio en tiempo real, optimizando su gestión operativa.

= 6. Validación y Pruebas

== 6.1. Validación de datos y consistencia

Se compararon datos del DW con fuentes OLTP usando SQL, verificando cantidades y costos. Se detectaron nulos en datos ficticios y se corrigieron en el ETL, asegurando integridad entre `produccion_hechos` y dimensiones. Esto garantizó que el DW refleje fielmente las operaciones de PIL para análisis confiables y precisos.

== 6.2. Pruebas de rendimiento

Se ejecutaron consultas SQL (e.g., desperdicio por línea y mes) en PostgreSQL, midiendo tiempos. Con datos simulados, los resultados fueron rápidos, pero se identificó la necesidad de índices en `dim_tiempo`. Esta optimización aseguró que el DW soporte análisis complejos en PIL sin retrasos significativos, mejorando la experiencia de uso.

== 6.3. Verificación de KPIs y métricas

Se validaron KPIs en Power BI con datos de prueba, confirmando que $ "Porcentaje_Desperdicio" $ y $ "Eficiencia" $ coinciden con cálculos manuales. Se ajustaron fórmulas DAX tras retroalimentación ficticia, asegurando que los indicadores sean claros y útiles para supervisores de PIL en la gestión diaria de producción y desperdicio.

= 7. Despliegue y Documentación

== 7.1. Implementación final en el entorno de producción

El DW se desplegó en un servidor de PIL con PostgreSQL, configurando backups diarios. Se simuló un entorno productivo, garantizando acceso continuo y seguridad mediante autenticación. Esto aseguró que el sistema esté listo para uso real, soportando análisis de producción y desperdicio sin interrupciones para los usuarios de PIL.

== 7.2. Documentación del proceso ETL

Se documentaron jobs de PDI con diagramas y descripciones de pasos (extracción, transformación, carga). Se detallaron conexiones JDBC y transformaciones como cálculo de costos, creando una guía técnica. Esto facilita que el equipo de PIL modifique o solucione problemas en el ETL, asegurando su mantenimiento a largo plazo en la empresa.

== 7.3. Manual de usuario para Power BI

Se elaboró un manual con instrucciones para navegar el dashboard, filtrar datos y exportar reportes. Se incluyeron ejemplos con datos ficticios, como filtrar desperdicio por máquina. Este recurso capacita a usuarios no técnicos de PIL para aprovechar el dashboard en su gestión diaria de manera efectiva y autónoma.

= 8. Conclusiones y Recomendaciones

== 8.1. Resultados obtenidos

El DW permitió identificar desperdicio por línea y turno, reduciendo costos en simulaciones iniciales. Los dashboards de Power BI mostraron métricas claras, como eficiencia del 85% en datos ficticios. Esto demostró que PIL puede optimizar procesos y tomar decisiones basadas en datos, mejorando su competitividad operativa en el contexto boliviano.

== 8.2. Lecciones aprendidas

Se comprobó que definir requerimientos claros al inicio evita retrasos. Datos inconsistentes ficticios resaltaron la necesidad de fuentes OLTP confiables. También se aprendió que iterar con usuarios mejora los KPIs, asegurando que el DW y los dashboards sean prácticos y alineados con las expectativas operativas de PIL en su entorno.

== 8.3. Futuras mejoras y optimización

Se sugiere integrar datos de ventas, añadir alertas en Power BI para desperdicio crítico y optimizar el DW con índices ante mayor volumen. Una prueba con más datos ficticios mostró cuellos de botella, indicando que estas mejoras prepararán a PIL para análisis más complejos y adaptativos en el futuro, fortaleciendo su gestión.