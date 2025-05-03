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
  - 1.1 Objetivo del Proyecto
  - 1.2 Alcance y Limitaciones
  - 1.3 Metodología HEFESTO aplicada
  - 1.4 Herramientas y Tecnologías utilizadas
- 2. Empresa analizada
  - 2.1 Descripción de la empresa
    - 2.1.1. Identificación de la empresa
    - 2.1.2. Misión
    - 2.1.3. Visión
    - 2.1.4. Propósito
    - 2.1.5. Valores
    - 2.1.6. Políticas
    - 2.1.7. Organigrama
- 3. Análisis y Definición de Requerimientos
  - 3.1 Identificación de fuentes de datos
  - 3.2 Preguntas de negocio
  - 3.3 Requerimientos del negocio
  - 3.4 Definición de KPIs y métricas clave
  - 3.5 Modelado conceptual del Data Warehouse
  - 3.6 Importancia y Alcance del Modelo Conceptual
- 4. Análisis de Data Sources
  - 4.1 Hechos e Indicadores
  - 4.2 Mapeo
  - 4.3 Granularidad
- 5. Diseño de la arquitectura del DW
  - 5.1 Modelado dimensional (Star Schema / Snowflake)
  - 5.2 Diseño de tablas de hechos y dimensiones
  - 5.3 Definición de procesos ETL
- 6. Implementación.
  - 6.1 Transformaciones y jobs.
  - 6.2 solución.
  - 6.3 Conclusiones.

= 1. Introducción

== 1.1. Objetivo del Proyecto

El objetivo principal de este proyecto es diseñar e implementar un Data Warehouse (DW) para analizar la producción y el desperdicio en PIL Andina S.A., dedicada a la producción de productos lácteos, como leche pasteurizada, yogures y quesos. Este DW tiene como propósito identificar procesos ineficientes en la elaboración de estos productos, reducir costos asociados al desperdicio de materias primas como leche cruda o envases, y proporcionar a la gerencia información clave para la toma de decisiones estratégicas. Con ello, se busca mejorar la competitividad en el mercado boliviano y optimizar la rentabilidad de PIL Andina S.A., alineando los procesos productivos con estándares de calidad y eficiencia.

== 1.2. Alcance y Limitaciones

El alcance del proyecto abarca un análisis detallado de los volúmenes de producción y desperdicio generados por cada línea de producción en PIL Andina S.A., considerando factores como el procesamiento de leche y derivados. Incluye la identificación de operarios, turnos y máquinas que registran mayores niveles de desperdicio, el cálculo del costo total del desperdicio según el tipo de producto lácteo (e.g., leche liquida o yogur) o material (e.g., envases desechados), y el monitoreo de la eficiencia de producción a lo largo del tiempo para detectar tendencias estacionales o anomalías. Las limitaciones del proyecto radican en que el análisis se centra exclusivamente en datos проф relacionados con la producción y el desperdicio, excluyendo áreas como ventas, distribución o logística. Además, depende de la calidad y disponibilidad de la información en los sistemas transaccionales (OLTP) de PIL Andina S.A., lo que podría limitar la profundidad del análisis si los registros son incompletos o inconsistentes.

== 1.3. Metodología HEFESTO aplicada

La metodología HEFESTO se emplea para estructurar el desarrollo del Data Warehouse de manera sistemática y alineada con las necesidades específicas del negocio de PIL Andina S.A. Esta metodología se organiza en fases clave: análisis de requerimientos, donde se identifican las necesidades de información; diseño conceptual, que establece una visión inicial del DW; diseño lógico y físico, que detalla la estructura técnica; implementación, que pone en marcha el sistema; y validación, que asegura su correcto funcionamiento. Este enfoque garantiza una transición fluida desde la identificación de problemas operativos, como el desperdicio en la producción de lácteos, hasta la entrega de una solución analítica robusta y práctica, adaptada al contexto industrial de la empresa.

Esta metodología cuenta con las siguientes características:

- Los objetivos y resultados esperados en cada fase se distinguen fácilmente y son sencillos de comprender.
- Se basa en los requerimientos de los usuarios, por lo cual su estructura es capaz de adaptarse con facilidad y rapidez ante los cambios en el negocio.
- Reduce la resistencia al cambio, ya que involucra a los usuarios finales en cada etapa para que tome decisiones respecto al comportamiento y funciones del DW.
- Utiliza modelos conceptuales y lógicos, los cuales son sencillos de interpretar y analizar.
- Es independiente del tipo de ciclo de vida que se emplee para contener la metodología.
- Es independiente de las herramientas que se utilicen para su implementación.
- Es independiente de las estructuras físicas que contengan el DW y de su respectiva distribución.
- Cuando se culmina con una fase, los resultados obtenidos se convierten en el punto de partida para llevar a cabo el paso siguiente.
- Se aplica tanto para Data Warehouse como para Data Mart.

== 1.4. Herramientas y Tecnologías utilizadas

Para llevar a cabo este proyecto, se seleccionaron herramientas específicas que aseguran un desarrollo eficiente y una presentación clara de los resultados. Pentaho Data Integration (PDI) se utilizará para los procesos de extracción, transformación y carga (ETL) de datos, permitiendo integrar información de diversas fuentes de PIL Andina S.A. Power BI se empleará para la creación de dashboards y visualizaciones interactivas, facilitando el análisis de desperdicio y producción por parte de la gerencia. PostgreSQL servirá como base de datos relacional para almacenar el DW, ofreciendo robustez y escalabilidad.

= 2. Empresa analizada

== 2.1. Descripción de la empresa

=== 2.1.1. Identificación de la empresa

Pil Andina S.A. es una Organización dedicada al procesamiento y comercialización de alimentos, destinados al mercado nacional e internacional. Esta Organización y sus trabajadores están conscientes de que la seguridad industrial & salud, la inocuidad de los alimentos, la calidad, el cuidado del medio ambiente, la seguridad en la cadena de suministro y la responsabilidad social son el resultado del esfuerzo y responsabilidad de todos, por lo que estos lineamientos son la parte esencial e integrada en todos los procesos de esta Organización.

=== 2.1.2. Misión

Acompañamos tu desarrollo en cada etapa de la vida con alimentos confiables y saludables, de forma innovadora, en armonía con el medio ambiente.

=== 2.1.3. Visión

Mantener la tradición y el liderazgo en la producción y distribución de productos lácteos y alimentos saludables, compartiendo valor con nuestros clientes, consumidores, proveedores y comunidad, en armonía con el medio ambiente, y asegurando el máximo retorno para nuestros inversionistas.

=== 2.1.4. Propósito

Crecer juntos, innovando en alimentación saludable y confiable.

=== 2.1.5. Valores

*Cultura de éxito*\
Buscamos "liderazgo "en todas las actividades que realizamos.

- Nos trazamos objetivos exigentes y trabajamos tenazmente hasta alcanzarlos
- Actuaos de manera ágil y dinámica, estandarizamos y simplificamos procesos.
- Somos eficientes, reconocemos la importancia de gestionar racionalmente los recursos para asegurar su solidez y continuidad en beneficio de sus proveedores, clientes, colaboradores y accionistas.

*Orientación a las personas*\
Reconocemos el valioso aporte de nuestros colaboradores al crecimiento y éxito de nuestra empresa.

- Fomentamos al trabajo en equipo y valoramos el profesionalismo, iniciativa y creatividad de nuestros colaboradores.
- Promovemos un ambiente de constante desarrollo para nuestra gente.

*Credibilidad y confianza*\
Todos nuestros actos se rigen por una conducta honesta, transparente y ética

- Hacemos siempre lo correcto.
- Trabajamos para brindar servicios y productos de la más alta calidad para asegurar la satisfacción de nuestros clientes y consumidores.
- Cumplimos nuestros compromisos.
- Lideramos con el ejemplo.

=== 2.1.6. Políticas

*Política integrada de los sistemas de gestión*\
*SEGURIDAD Y SALUD*\
Cuidando e incentivando el cuidado a nuestro personal

- Fomentar actividades enfocadas a la prevención integral y sensibilización, con el fin de evitar el deterioro de la salud, evaluando los riesgos en cada puesto de trabajo y proceso para mejorar las condiciones en las que el personal realiza sus actividades.
- Proteger la integridad física y la salud de los Trabajadores, asumiendo la responsabilidad de hacer todo lo que esté al alcance para prevenir la ocurrencia tanto de accidentes de trabajo como la de enfermedades profesionales.
- Fomentar las prácticas seguras y saludables en nuestra Organización, promover el estado de ambientes limpios y ordenados.

*INOCUIDAD ALIMENTARIA*\
Cuidando a nuestros consumidores

- Identificar, evaluar y controlar los peligros relacionados con la inocuidad de los alimentos en la cadena alimentaria (dentro del alcance) para entregar productos inocuos.
- Controlar eficazmente la inocuidad de las materias primas, materiales y los ingredientes asociados a nuestros productos promoviendo la aplicación de los programas de prerrequisites.
- Asegurar el cumplimiento de los programas prerrequisites, que de forma general incluye el control del personal involucrado, el ambiente de trabajo, los servicios asociados, equipos y otros procesos relacionados al aseguramiento de la inocuidad de los alimentos.
- Fomentar las actividades de prevención de fraude (Food Fraud) y la contaminación intencionada de los alimentos (Food Defense).

*CALIDAD*\
Cuidando nuestra relación con nuestros clientes y consumidores

- Conocer las necesidades y expectativas de nuestros clientes y consumidores para garantizar la elaboración de productos y la prestación de servicios que permitan lograr la satisfacción y la adecuación a sus necesidades.
- Asegurar el cumplimiento de las especificaciones de nuestros productos en proceso, en producto terminado, en los eslabones de almacenamiento, distribución y comercialización, con énfasis en el cumplimiento de la "cadena de frío" de productos que demandan esta condición.
- Garantizar la calidad de nuestros productos y entregar productos sanos y nutritivos.
- Considerar la atención al cliente como un aspecto prioritario en todas nuestras operaciones.

*MEDIO AMBIENTE*\
Cuidando nuestro planeta y respetando nuestro entorno

- Impulsar la sostenibilidad en nuestras operaciones.
- Minimizar el impacto ambiental resultante de nuestras actividades mediante el compromiso de la protección del medio ambiente, la conservacion de los recursos naturales y la prevención de la contaminación, utilizando los medios tecnológicos y otros disponibles, para lograr tales objetivos.
- Impulsar las actuaciones encaminadas a Reducir, Reutilizar y Reciclar.
- Garantizar la mejora continua en el desempeño energético, aportando los recursos necesarios para optimizar el uso y consumo de energía.
- Apoyar el diseño, la adquisición de materiales y servicios energéticamente eficientes.

*RESPONSABILIDAD SOCIAL*\
Cuidando nuestro rol en la sociedad

- Buscar los canales de comunicación y conciliación con los diferentes grupos de interés que puedan verse afectados por las operaciones.
- Asumir el impacto de las actividades de la organización en la comunidad.
- Nuestro compromiso continuo con:
- Las políticas enunciadas en este documento.
- El cumplimiento de nuestro Código de Ética en el accionar cotidiano personal y profesional.
- La transparencia, como una forma de transmitir y generar confianza y credibilidad a nuestros grupos de interés.
- Los Derechos Humanos.
- Lineamientos de: Libre de Trabajo Infantil, libre de Discriminación y libre de Trabajo Forzoso.

*SEGURIDAD EN LA CADENA DE SUMINISTRO*\
Cuidando nuestra reputación y a nuestros productos

- Prevenir que nuestra Organización sea utilizada para actividades ilícitas relacionadas al narcotráfico, contrabando de mercancias, terrorismo, legitimación de ganancias ilícitas, robo, fraude y otros.
- Implementar estándares de seguridad herramientas que permitan mantener y fortalecer el negocio con seguridad en la logística de comercio internacional (procesos de exportación e importación). El sistema preventivo de gestión diseñado tiene como base:
- La seguridad fisica y control de acceso en las instalaciones.
- La seguridad con el personal.
- La seguridad de nuestros productos o mercancias (Apoyado en el Plan de Defensa de Alimentos).
- La seguridad con los socios comerciales.
- La seguridad de la Información.
- Estandarizar los procesos, operaciones y protocolos de seguridad.

=== 2.1.7. Organigrama
#image("proy11.png")

Organigrama de la compañía.

= 3. Análisis y Definición de Requerimientos

== 3.1. Identificación de fuentes de datos

El primer paso consiste en recopilar y entender las necesidades de información de los usuarios involucrados en la producción. Para ello, se pueden usar entrevistas, reuniones y observaciones de los procesos de la fábrica. En este caso, se consultó a:

- Gerencia de producción
- Responsables de planta
- Operarios
- Personal de calidad y mantenimiento

Durante estas entrevistas, surgieron múltiples aspectos a analizar (costos, eficiencia, etc.). Sin embargo, para delimitar el alcance y obtener resultados tangibles en un tiempo razonable, se priorizó el proceso de producción y su desperdicio de materiales, al ser crítico para la competitividad y rentabilidad de la fábrica.

Las fuentes de datos principales para el DW provienen de los sistemas operativos de PIL Andina S.A. El sistema comparable con un ERP (Planificación de recursos empresariales) de PIL Andina S.A. registra datos detallados de producción (e.g., litros de leche procesados por turno), inventario (e.g., stock de materia prima) y costos de materiales (e.g., precio por litro de leche cruda o envases). El Sistema de control de calidad contiene información crítica sobre desperdicio y scrap generado durante la producción de lácteos, como leche derramada o productos rechazados por defectos. El Sistema de recursos humanos proporciona datos sobre operarios, turnos y horarios, esenciales para correlacionar el desempeño humano con los niveles de desperdicio en las líneas de producción.

== 3.2. Preguntas de Negocio

Tras analizar el proceso de producción y dialogar con los involucrados, se identificaron las siguientes preguntas de negocio:

- "¿Cúales son los volúmenes de producción y el desperdicio generado por cada línea de producción en un período determinado?"\
En otras palabras, se busca cuantificar la cantidad producida y la cantidad de desperdicio en cada línea de producción, dentro de un rango de fechas específico (día, semana, mes, etc.).
- "¿Qué operarios, turnos o máquinas registran los mayores niveles de desperdicio?"\
Permite localizar dónde se están produciendo más pérdidas de material, ya sea por la acción de operarios, máquinas específicas o turnos de trabajo.
- "¿Cúal es el costo total del desperdicio en un período determinado y cómo se distribuye por tipo de producto o material?"\
Apunta a conocer el impacto económico del desperdicio, diferenciando por tipo de material o producto, para priorizar planes de mejora.
- "¿Cómo se comporta la eficiencia de producción (relación entre producto terminado y desperdicio) a lo largo del tiempo?"\
Permite observar tendencias y detectar si hay mejorías o retrocesos en la eficiencia de la fábrica.

Estas preguntas se alinean con los objetivos y estrategias de la fábrica, ya que aportan información para la toma de decisiones enfocada en reducir costos y maximizar la eficiencia. Además, la dimensión Tiempo resulta fundamental para observar variaciones y tendencias a lo largo de distintos periodos.

== 3.3. Requerimientos del negocio

Mediante entrevistas con gerentes de producción, responsables de planta y operarios de PIL Andina S.A., se identificaron requerimientos clave para optimizar la producción de productos lácteos. Estos incluyen c uantificar volúmenes de producción y desperdicio por línea en un período determinado (e.g., diario o mensual), determinar qué operarios, turnos o máquinas generan mayores niveles de desperdicio (como fallos en pasteurizadoras), calcular el costo total del desperdicio y su distribución por tipo de producto (e.g., yogur vs. queso) o material (e.g., envases plásticos), y evaluar la eficiencia de producción a lo largo del tiempo para detectar tendencias, como incrementos en desperdicio durante turnos nocturnos o picos estacionales.

== 3.4. Definición de KPIs y métricas clave

Los KPIs y métricas definidas reflejan las necesidades operativas de PIL Andina S.A. en la producción de lácteos

Una vez definidas las preguntas de negocio, se procede a descomponerlas para descubrir los indicadores (valores numéricos que se desean medir) y las perspectivas (dimensiones o ejes de análisis) que permitirán responderlas.

*Indicadores*

- *Cantidad Producida*\
Número total de unidades o lotes fabricados en un periodo determinado.
- *Cantidad de Desperdicio*\
Volumen o peso de material desperdiciado durante el proceso de producción.
- *Costo de Desperdicio*\
Valor monetario asociado al material perdido o inservible.
- *Porcentaje de Desperdicio*\
Relación porcentual entre el desperdicio y la cantidad producida:

$ text("Porcentaje de Desperdicio") = frac(text("Cantidad de Desperdicio"), text("Cantidad Producida")) * 100 $

- *Eficiencia de Producción*

$ text("Eficiencia") = frac(text("Cantidad Producida (sin desperdicio)"), text("Cantidad Producida Total")) * 100 $

O bien, incluir variables de tiempo, paradas de máquina, etc.\
Estos indicadores permiten cuantificar y monitorear el desempeño productivo y el nivel de desperdicio.

*Perspectivas (Dimensiones)*\
Para responder las preguntas de negocio y analizar los indicadores desde distintos ángulos, se definen las siguientes perspectivas:

- *Tiempo*\
Es fundamental para identificar tendencias. Se analizarán datos por día, semana, mes, trimestre, año, etc.
- *Línea de Producción / Sección*\
Permite saber qué línea (o sección) de la fábrica está generando más producción y/o desperdicio.
- *Operario*\
Se podrá analizar el desempeño individual o de equipos de operarios y detectar necesidades de capacitación o mejoras.
- *Máquina*\
Permite determinar qué máquinas generan más fallas o desperdicio y planificar mantenimientos.
- *Producto / Tipo de Material*\
Identifica qué productos o materiales tienden a generar más desperdicio, ayudando a priorizar la optimización de procesos.

Dependiendo de la complejidad de la fábrica, se podrían agregar más perspectivas, como Turno (mañana, tarde, noche) o Planta (si la empresa tiene varias plantas de producción).

== 3.5. Modelado conceptual del Data Warehouse

El modelo conceptual establece las bases del DW para PIL Andina S.A., definiendo dimensiones y hechos clave adaptados a su producción de lácteos.

El objetivo es describir, a alto nivel, cómo se relacionan las perspectivas (dimensiones) con los indicadores (medidas) a través de la relación (proceso o área de estudio), de modo que sea sencillo visualizar el alcance y la estructura del futuro Data Warehouse.

*Descripción de alto nivel*\
El modelo conceptual muestra, de un solo vistazo, los objetos más relevantes para el análisis:

- Las perspectivas o dimensiones (a la izquierda).
- La relación central que representa el proceso de negocio (en este caso, la Producción).
- Los indicadores (a la derecha), que reflejan las métricas numéricas clave que se desean analizar.

Este modelo se suele representar con una notación sencilla (como recuadros u óvalos) para que cualquier persona, incluso sin conocimientos técnicos profundos, pueda comprender cuáles son los datos que se recopilarán y cómo se relacionan.

*Modelo Conceptual para producción y desperdicio*\
En nuestro caso, se han definido las siguientes perspectivas y sus respectivos indicadores:

- *Perspectivas (Dimensiones)*\
*Tiempo*\
Permite analizar la producción y el desperdicio a lo largo de distintos periodos (dia, semana, mes, trimestre, año).\
*Línea de Producción*\
Diferencia cada sección o línea de la fábrica para identificar cuál genera más (o menos) desperdicio y cuál tiene mayor eficiencia.\
*Operario*\
Analiza el desempeño de cada operario o equipo de trabajo, permitiendo detectar necesidades de capacitación o supervisión.\
*Máquina*\
Evalúa la maquinaria utilizada en la producción, identificando fallas o puntos de ineficiencia que generen desperdicio.\
*Manifesto / Material*\
Observa qué productos o materiales tienen mayores niveles de desperdicio, ayudando a priorizar mejoras en procesos o insumos.

- *Relación (Proceso)*\
*"Producción"*\
Es el proceso central que vincula a las dimensiones anteriores. En otras palabras, Producción es la relación mediante la cual se combinan (por ejemplo, en un determinado momento y lugar) un producto/material, un operario, una máquina y una línea de producción para obtener resultados medibles (los indicadores).

- *Indicadores (Medidas)*\
*Cantidad Producida*\
Cuántas unidades o lotes se fabrican en un periodo y condiciones determinadas.\
*Cantidad de Desperdicio*\
Volumen o peso de material desperdiciado en el mismo periodo.\
*Costo de Desperdicio*\
Valor monetario asociado a la materia prima perdida o inservible.\
*Porcentaje de Desperdicio*\
Relación porcentual entre la cantidad de desperdicio y la cantidad producida, para medir la eficiencia.\
*Eficiencia de Producción*\
Métrica que puede definirse de distintas formas (ej. porcentaje de unidades "buenas" sobre el total fabricado) y que resume el desempeño productivo.

El Modelo Conceptual resultante de los datos que se han recolectado, es el siguiente:

#image("/nuevoPlan/dat251/media/proy12.png")

En esta ilustración, las dimensiones o perspectivas (Tiempo, Línea de Producción, Operario, Máquina, Producto/Material) se conectan a la relación "Producción", de la cual se desprenden los indicadores (Cantidad Producida, Cantidad de Desperdicio, Costo de Desperdicio, Porcentaje de Desperdicio, Eficiencia de Producción).

== 3.6. Importancia y Alcance del Modelo Conceptual

- *Visión clara del proyecto:* Permite ver de inmediato cuáles serán los resultados (indicadores) y qué variables (dimensiones) se utilizarán para analizarlos.
- *Comunicación con los usuarios:* Es un nivel de abstracción alto, por lo que puede explicarse a personas no técnicas, asegurando que el proyecto refleje sus necesidades reales.
- *Base para el diseño posterior:* Sobre este modelo conceptual, se construirá el modelo lógico (esquema de base de datos) y finalmente la implementación física en el Data Warehouse.

= 4. Análisis de Data Sources

== 4.1. Hechos e Indicadores

Este paso se centra en examinar las fuentes de datos y determinar cómo se obtendrán los indicadores (hechos y agregaciones), cómo se mapean los campos entre el modelo conceptual y las tablas de origen, y cuál será el nivel de granularidad de la información que finalmente ingresará al Data Warehouse.

A continuación, se muestra cómo conformar cada uno de los indicadores identificados en el modelo conceptual de nuestro proyecto de Análisis de Producción y Desperdicio en una Fábrica, definiendo tanto la fórmula de cálculo como la función de sumarización que se utilizará. Esta información servirá de guía para establecer la correspondencia entre los datos en los sistemas OLTP y la forma en que se cargarán (y calcularán) en el Data Warehouse.

*Conformar Indicadores*\
*Cantidad Producida*

- *Hecho:* Cantidad_Producida (unidades, lotes, kilos, etc., según el tipo de producción).
- *Fórmula de Cálculo:* Se corresponde directamente con el valor registrado en el OLTP sobre la producción realizada.\
(Ejemplo: Cantidad_Producida = "Unidades fabricadas" en la tabla de producción del ERP).
- *Función de Sumarización:* SUM.\
*Aclaración:* Este indicador representa la sumatoria de todo lo producido en un periodo determinado (día, semana, mes, etc.), para las distintas dimensiones (Línea de Producción, Máquina, Operario, etc.).

*Cantidad de Desperdicio*

- *Hecho:* Cantidad_Desperdicio (unidades, kilos, litros, etc., de material desperdiciado).
- *Fórmula de Cálculo:* Se toma directamente de los registros de scrap o pérdida en el OLTP (p. ej., "Desperdicio en kg" en la tabla de control de calidad).
- *Función de Sumarización:* SUM.\
*Aclaración:* Se acumulan todas las cantidades de material desechado o no aprovechado en la producción.

*Costo de Desperdicio*

- *Hechos:* Cantidad_Desperdicio y Costo_Unitario del material o producto.
- *Fórmula de Cálculo:*\
$ text("Costo_Desperdicio") = text("Cantidad_Desperdicio") + text("Costo_Unitario") $
- *Función de Sumarización:* SUM.\
*Aclaración:* El Monto Total de desperdicio se obtiene al multiplicar la cantidad de material desechado por su costo unitario (registrado en el OLTP, por ejemplo, en la lista de materiales).

*Porcentaje de Desperdicio*

- *Hechos:* Cantidad_Producida y Cantidad_Desperdicio.
- *Fórmula de Cálculo (a nivel agregado):*\
$ text("Porcentaje_Desperdicio") = frac(sum(text("Cantidad_Producida")), sum(text("Cantidad_Desperdicio"))) times 100 $
- *Función de Sumarización:*\
Se realiza la suma de ambos hechos por el periodo o dimensión deseada y luego se calcula la división.\
En la práctica, el Data Warehouse almacena Cantidad_Producida y Cantidad_Desperdicio, y el Porcentaje de Desperdicio se obtiene como medida calculada al consultar (p. ej., en Pentaho o Power BI).
- *Aclaración:* No es recomendable sumar los porcentajes individuales de cada registro, ya que el resultado sería inexacto. En su lugar, se suman las cantidades totales de producción y desperdicio y luego se calcula el porcentaje sobre ese total.

*Eficiencia de Producción*

- *Hechos:* Cantidad_Producida y Cantidad_Desperdicio.
- *Fórmula de Cálculo (a nivel agregado):*\
$ text("Eficiencia") = (frac(sum(text("Cantidad producida")) - sum(text("Cantidad Desperdicio")), sum(text("Cantidad producida"))) ) times 100 $

Y de forma equivalente:\
$ text("Eficiencia") = 100 % - text("Porcentaje_Desperdicio") $
- *Función de Sumarización:*\
Nueivamente, se realiza la suma de las cantidades totales de producción y desperdicio en el periodo, y luego se aplica la fórmula.\
En la herramienta de BI, se implementa como medida calculada.
- *Aclaración:* Este indicador refleja el porcentaje de producción que no se ha desperdiciado. Un valor alto indica una producción más eficiente, mientras que un valor bajo señala ineficiencias o fallas en el proceso.

Con estos indicadores conformados, queda establecido cómo se obtendrán los valores numéricos desde los sistemas OLTP y qué funciones de agregación se usarán. Este paso es esencial para asegurar la correcta correspondencia entre los campos en las fuentes de datos y los cálculos que realizará el Data Warehouse.

Además, esta definición servirá de guía cuando se realicen los procesos ETL (Extracción, Transformación y Carga), garantizando que cada indicador se alimente con la información adecuada y que los reportes generados (por ejemplo, en Pentaho o Power BI) sean precisos y consistentes con la realidad de la fábrica.

== 4.2. Mapeo

En el Data Source de la empresa, el proceso de producción está representado por el siguiente Diagrama de Entidad Relación.

En este punto, se examinan los Data Sources (OLTP) disponibles y sus características para asegurarse de que contienen la información requerida. Luego se determina cómo se obtendrán los elementos definidos en el modelo conceptual, estableciendo la correspondencia entre los campos del modelo conceptual y los del OLTP.

#image("proy13.png")

A continuación, se expondrá el Mapeo entre los dos Modelos:

#image("proy14.png")

El Mapeo realizado es el siguiente:

- Perspectiva "Producto/Material" $arrow$ Tabla Materiale en el ERP (contiene costo, tipo de producto, etc.)
- Perspectiva "Operario" $arrow$ Tabla Operario (registra información del personal)
- Perspectiva "Máquina" $arrow$ Tabla Maquina (contiene tipo, modelo, capacidad, etc.)
- Perspectiva "Linea de Producción" $arrow$ Tabla o campo "Linea_Produccion" dentro del ERP (cada línea puede tener un ID y descripción)
- Perspectiva "Tiempo" $arrow$ Campo fecha en la tabla de producción (indica el día de la producción/desperdicio)
- Indicador "Cantidad Producida" $arrow$ Campo unidades_fabricadas de la tabla Producción.
- Indicador "Cantidad Desperdicio" $arrow$ Campo unidades_desechadas de la tabla Producción.
- Indicador "Costo de Desperdicio" $arrow$ Multiplización de unidades_desechadas por costo_unitario

== 4.3. Granularidad

De acuerdo al Mapeo realizado, se analizaron los campos que constituyen cada tabla a la que se hace referencia a través de dos métodos diferentes. Primero se inspeccionó la base de datos portrayedo intuir los significados de cada campo, y luego se consultó quién es administrador del sistema para indagar acerca de una serie de aspectos que NO estaban claros.

*Perspectiva Tiempo:*\
Se determinan campos como:\
Día, Mes y Año

*Perspectiva Operario:*\
Se define si se requiere:\
Nombre_Operario, Turno y Área

*Perspectiva Máquina:*\
Se decide guardar:\
Nombre_Máquina, Tipo y Capacidad

*Perspectiva Material/ Manifesto:*\
Se incluye:\
Descripción_Material, Costo_Unitario y Categoria

*Perspectiva Línea de Producción:*\
Se decide registrar:\
Nombre_Línea, Capacidad_Máxima y Estado

= 5. Diseño de la arquitectura del DW

La arquitectura del DW sigue un enfoque de bus de datos, diseñado para integrar eficientemente las tablas de hechos y dimensiones en una base de datos PostgreSQL. Este esquema centralizado optimiza las consultas analiticas requeridas por PIL Andina S.A., como el análisis de desperdicio por línea o producto lácteo, y permite una escalabilidad futura para incorporar datos adicionales (e.g., nuevos productos o plantas). La elección de PostgreSQL asegura robustez y soporte para grandes volúmenes de datos generados en la producción diaria de lácteos.

== 5.1. Modelado dimensional (Star Schema / Snowflake)

Se seleccionó un esquema en estrella (Star Schema) por su simplicidad y alto rendimiento en consultas multidimensionales, ideal para las necesidades analíticas de PIL Andina S.A. Las dimensiones se mantienen des normalizadas para minimizar uniones complejas, facilitando reportes rápidos en Power BI sobre desperdicio por turno o máquina. Este modelo contrasta con el Snowflake Schema, descartado por su mayor complejidad, que no se justifica frente a la estructura operativa relativamente directa de la producción de lácteos.

#image("proy15.png")

== 5.2. Diseño de tablas de hechos y dimensiones

El diseño incluye una Tabla de Hechos llamada h_producion, con campos como claves foráneas a dimensiones, cantidad_producida (e.g., litros de leche), cantidad_desperdicio (e.g., litros perdidos), y costo_desperdicio (en bolivianos), etc. Las Tablas de Dimensiones son: dim_tiempo ( fecha, mes, trimestre, año), dim_LineaProduccion (ID, nombre, e.g., "Línea Yogur"), dim_operaño (ID, nombre, tumo), dim_maquina (ID, nombre, tipo, e.g., "Pasteurizadora"), y dim_producto (ID, nombre, categoría, e.g., "Leche Entera"). Esta estructura soporta análisis específicos de PIL Andina S.A.

#image("proy16.png")

== 5.3. Definición de procesos ETL

Los procesos ETL están diseñados para integrar datos desde las fuentes OLTP de PIL Andina S.A. de manera eficiente. La extracción se realizará desde sistemas como el ERP y control de calidad, capturando registros de producción y desperdicio diarios. La transformación incluye limpieza de datos (e.g., corrección de valores nulos en litros producidos), estandarización de formatos y cálculo de métricas derivadas como el Porcentaje de Desperdicio. La carga se hará en las tablas del DW en PostgreSQL, asegurando integridad referencial y consistencia para análisis futuros.

= 6. Implementación
== 6.1 Transformaciones y jobs.

dimTtiempo.ktr:
#image("proy17.png")
Configuraciones:
#grid(
  columns: (auto,auto),
  [#image("proy171.png")],[#image("proy172.png")]
)
Configuraciones similares se aplican a cada transformación.
dimTtiempo.ktr:
#image("proy17.png")
dimLinea.ktr:
#image("proy18.png")
dimMaquina.ktr:
#image("proy19.png")
dimOperario.ktr:
#image("proy110.png")
dimProducto.ktr:
#image("proy111.png")
hProduccion.ktr:
#image("proy112.png")
Configuraciones:
#grid(
  columns: (auto,auto),
  [#image("proy1121.png")],[#image("proy1122.png")],
  [#image("proy1123.png")],[#image("proy1124.png")],
  [#image("proy1125.png")],[#image("proy1126.png")],
)
Preview:
#image("proy1127.png")
etl_pil.kjb:
#image("proy113.png")

== 6.2 Solución.
  - 6.3 Conclusiones.