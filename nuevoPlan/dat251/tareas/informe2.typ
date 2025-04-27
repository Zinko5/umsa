#set text(lang:"es")
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
      // #text(size: 16pt, stroke: 0.1mm + white)[#pad(top: 100pt)[
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
      // #fechaEntrega.display()
    ]]
  ]
#place(bottom + center)[
    #text(size: 13pt)[
    *La Paz - Bolivia*
  ]
]
]
#set par(justify: true)

= Análisis de Producción y Desperdicio en una Fábrica

De acuerdo con el objetivo de identificar procesos ineficientes y reducir costos de producción y desperdicio de materiales.

== ANÁLISIS DE REQUERIMIENTOS

=== (a) Identificar preguntas

1. *Relevamiento de necesidades de información* \
El primer paso consiste en recopilar y entender las necesidades de información de l\@s usuari\@s involucrad\@s en la producción. Para ello, se pueden usar entrevistas, reuniones y observaciones de los procesos de la fábrica. En este caso, se consultó a:
- Gerencia de producción
- Responsables de planta
- Operari\@s
- Personal de calidad y mantenimiento

Durante estas entrevistas, surgieron múltiples aspectos a analizar (costos, eficiencia, etc.). Sin embargo, para delimitar el alcance y obtener resultados tangibles en un tiempo razonable, se priorizó el proceso de producción y su desperdicio de materiales, al ser crítico para la competitividad y rentabilidad de la fábrica.

2. *Objetivo principal* \
El objetivo de este paso es obtener e identificar las necesidades de información clave de alto nivel que permitan a la fábrica mejorar sus procesos productivos y tomar decisiones que reduzcan el desperdicio y los costos. Por ello, se deben formular preguntas de negocio que reflejen estas metas.

3. *Preguntas de negocio* \
Tras analizar el proceso de producción y dialogar con l\@s involucrad\@s, se identificaron las siguientes preguntas de negocio:
1. “¿Cuáles son los volúmenes de producción y el desperdicio generado por cada línea de producción en un período determinado?” \
   - En otras palabras, se busca cuantificar la cantidad producida y la cantidad de desperdicio en cada línea de producción, dentro de un rango de fechas específico (día, semana, mes, etc.).
2. “¿Qué operari\@s, turnos o máquinas registran los mayores niveles de desperdicio?” \
   - Permite localizar dónde se están produciendo más pérdidas de material, ya sea por la acción de operari\@s, máquinas específicas o turnos de trabajo.
3. “¿Cuál es el costo total del desperdicio en un período determinado y cómo se distribuye por tipo de producto o material?” \
   - Apunta a conocer el impacto económico del desperdicio, diferenciando por tipo de material o producto, para priorizar planes de mejora.
4. “¿Cómo se comporta la eficiencia de producción (relación entre producto terminado y desperdicio) a lo largo del tiempo?” \
   - Permite observar tendencias y detectar si hay mejorías o retrocesos en la eficiencia de la fábrica.

Estas preguntas se alinean con los objetivos y estrategias de la fábrica, ya que aportan información para la toma de decisiones enfocada en reducir costos y maximizar la eficiencia. Además, la dimensión *Tiempo* resulta fundamental para observar variaciones y tendencias a lo largo de distintos periodos.

=== (b) Identificar indicadores y perspectivas

Una vez definidas las preguntas de negocio, se procede a descomponerlas para descubrir los indicadores (valores numéricos que se desean medir) y las perspectivas (dimensiones o ejes de análisis) que permitirán responderlas.

*Indicadores* \
1. *Cantidad Producida* \
   - Número total de unidades o lotes fabricados en un periodo determinado.
2. *Cantidad de Desperdicio* \
   - Volumen o peso de material desperdiciado durante el proceso de producción.
3. *Costo de Desperdicio* \
   - Valor monetario asociado al material perdido o inservible.
4. *Porcentaje de Desperdicio* \
   - Relación porcentual entre el desperdicio y la cantidad producida: \
     $ "Porcentaje de Desperdicio" = "Cantidad de Desperdicio" / "Cantidad Producida" times 100 $
5. *Eficiencia de Producción* \
   - $ "Eficiencia" = "Cantidad Producida (sin desperdicio)" / "Cantidad Producida Total" times 100 $ \
   - O bien, incluir variables de tiempo, paradas de máquina, etc.

Estos indicadores permiten cuantificar y monitorear el desempeño productivo y el nivel de desperdicio.

*Perspectivas (Dimensiones)* \
Para responder las preguntas de negocio y analizar los indicadores desde distintos ángulos, se definen las siguientes perspectivas:
1. *Tiempo* \
   - Es fundamental para identificar tendencias. Se analizarán datos por día, semana, mes, trimestre, año, etc.
2. *Línea de Producción / Sección* \
   - Permite saber qué línea (o sección) de la fábrica está generando más producción y/o desperdicio.
3. *Operari@* \
   - Se podrá analizar el desempeño individual o de equipos de operari\@s y detectar necesidades de capacitación o mejoras.
4. *Máquina* \
   - Permite determinar qué máquinas generan más fallas o desperdicio y planificar mantenimientos.
5. *Producto / Tipo de Material* \
   - Identifica qué productos o materiales tienden a generar más desperdicio, ayudando a priorizar la optimización de procesos.

Dependiendo de la complejidad de la fábrica, se podrían agregar más perspectivas, como *Turno* (mañana, tarde, noche) o *Planta* (si la empresa tiene varias plantas de producción).

*Resultado del Paso Análisis de Requerimientos* \
Al finalizar este Análisis de Requerimientos, se dispone de:
- *Preguntas de negocio enfocadas en la producción y el desperdicio*: \
  1. Volúmenes de producción y desperdicio por línea de producción, en un período.
  2. Operari\@s, turnos o máquinas con mayor desperdicio.
  3. Costo total del desperdicio y su distribución por tipo de producto/material.
  4. Evolución de la eficiencia de producción a lo largo del tiempo.
- *Indicadores (valores numéricos a analizar)*: \
  - Cantidad Producida
  - Cantidad de Desperdicio
  - Costo de Desperdicio
  - Porcentaje de Desperdicio
  - Eficiencia de Producción
- *Perspectivas (dimensiones o ejes de análisis)*: \
  - Tiempo
  - Línea de Producción
  - Operari@
  - Máquina
  - Producto / Material

Este resultado se plasma en un modelo conceptual inicial que muestra los indicadores y sus relaciones con las dimensiones, sirviendo como base para la construcción del Data Warehouse o Data Mart orientado a la producción y al desperdicio.

=== (c) Modelo Conceptual

El objetivo es describir, a alto nivel, cómo se relacionan las perspectivas (dimensiones) con los indicadores (medidas) a través de la relación (proceso o área de estudio), de modo que sea sencillo visualizar el alcance y la estructura del futuro Data Warehouse.

*Descripción de alto nivel* \
El modelo conceptual muestra, de un solo vistazo, los objetos más relevantes para el análisis:
- Las perspectivas o dimensiones (a la izquierda).
- La relación central que representa el proceso de negocio (en este caso, la *Producción*).
- Los indicadores (a la derecha), que reflejan las métricas numéricas clave que se desean analizar.

Este modelo se suele representar con una notación sencilla (como recuadros u óvalos) para que cualquier persona, incluso sin conocimientos técnicos profundos, pueda comprender cuáles son los datos que se recopilarán y cómo se relacionan.

*Modelo Conceptual para Producción y Desperdicio* \
En nuestro caso, se han definido las siguientes perspectivas y sus respectivos indicadores:

1. *Perspectivas (Dimensiones)* \
   - *Tiempo* \
     Permite analizar la producción y el desperdicio a lo largo de distintos periodos (día, semana, mes, trimestre, año).
   - *Línea de Producción* \
     Diferencia cada sección o línea de la fábrica para identificar cuál genera más (o menos) desperdicio y cuál tiene mayor eficiencia.
   - *Operari@* \
     Analiza el desempeño de cada operari@ o equipo de trabajo, permitiendo detectar necesidades de capacitación o supervisión.
   - *Máquina* \
     Evalúa la maquinaria utilizada en la producción, identificando fallas o puntos de ineficiencia que generen desperdicio.
   - *Producto / Material* \
     Observa qué productos o materiales tienen mayores niveles de desperdicio, ayudando a priorizar mejoras en procesos o insumos.

2. *Relación (Proceso)* \
   - *“Producción”* \
     Es el proceso central que vincula a las dimensiones anteriores. En otras palabras, *Producción* es la relación mediante la cual se combinan (por ejemplo, en un determinado momento y lugar) un producto/material, un operari@, una máquina y una línea de producción para obtener resultados medibles (los indicadores).

3. *Indicadores (Medidas)* \
   - *Cantidad Producida* \
     Cuántas unidades o lotes se fabrican en un periodo y condiciones determinadas.
   - *Cantidad de Desperdicio* \
     Volumen o peso de material desperdiciado en el mismo periodo.
   - *Costo de Desperdicio* \
     Valor monetario asociado a la materia prima perdida o inservible.
   - *Porcentaje de Desperdicio* \
     Relación porcentual entre la cantidad de desperdicio y la cantidad producida, para medir la eficiencia.
   - *Eficiencia de Producción* \
     Métrica que puede definirse de distintas formas (ej. porcentaje de unidades “buenas” sobre el total fabricado) y que resume el desempeño productivo.

*Representación Gráfica (Ejemplo)* \
#image("../media/i1.png")
En esta ilustración, las dimensiones o perspectivas (*Tiempo*, *Línea de Producción*, *Operari@*, *Máquina*, *Producto/Material*) se conectan a la relación *“Producción”*, de la cual se desprenden los indicadores (*Cantidad Producida*, *Cantidad de Desperdicio*, *Costo de Desperdicio*, *Porcentaje de Desperdicio*, *Eficiencia de Producción*).

*Importancia y Alcance del Modelo Conceptual* \
- *Visión clara del proyecto*: Permite ver de inmediato cuáles serán los resultados (indicadores) y qué variables (dimensiones) se utilizarán para analizarlos.
- *Comunicación con l\@s usuari\@s*: Es un nivel de abstracción alto, por lo que puede explicarse a personas no técnicas, asegurando que el proyecto refleje sus necesidades reales.
- *Base para el diseño posterior*: Sobre este modelo conceptual, se construirá el modelo lógico (esquema de base de datos) y finalmente la implementación física en el Data Warehouse.

Así, con este Modelo Conceptual, finaliza la etapa de la Metodología HEFESTO. Hemos definido con claridad la relación (Proceso de Producción) y sus indicadores, así como las perspectivas que permitirán analizar la eficiencia y el desperdicio de materiales en la fábrica.

== (a) Conformar Indicadores

A continuación, se muestra cómo conformar cada uno de los indicadores identificados en el modelo conceptual de nuestro proyecto de Análisis de Producción y Desperdicio en una Fábrica, definiendo tanto la fórmula de cálculo como la función de sumarización que se utilizará. Esta información servirá de guía para establecer la correspondencia entre los datos en los sistemas OLTP y la forma en que se cargarán (y calcularán) en el Data Warehouse.

1. *Cantidad Producida* \
   - *Hecho*: `Cantidad_Producida` (unidades, lotes, kilos, etc., según el tipo de producción). \
   - *Fórmula de Cálculo*: Se corresponde directamente con el valor registrado en el OLTP sobre la producción realizada. \
     (Ejemplo: `Cantidad_Producida` = “Unidades fabricadas” en la tabla de producción del ERP). \
   - *Función de Sumarización*: `SUM`. \
   - *Aclaración*: Este indicador representa la sumatoria de todo lo producido en un periodo determinado (día, semana, mes, etc.), para las distintas dimensiones (*Línea de Producción*, *Máquina*, *Operari@*, etc.).

2. *Cantidad de Desperdicio* \
   - *Hecho*: `Cantidad_Desperdicio` (unidades, kilos, litros, etc., de material desperdiciado). \
   - *Fórmula de Cálculo*: Se toma directamente de los registros de scrap o pérdida en el OLTP (p. ej., “Desperdicio en kg” en la tabla de control de calidad). \
   - *Función de Sumarización*: `SUM`. \
   - *Aclaración*: Se acumulan todas las cantidades de material desechado o no aprovechado en la producción.

3. *Costo de Desperdicio* \
   - *Hechos*: `Cantidad_Desperdicio` y `Costo_Unitario` del material o producto. \
   - *Fórmula de Cálculo*: \
     $ "Costo_Desperdicio" = "Cantidad_Desperdicio" times "Costo_Unitario" $ \
   - *Función de Sumarización*: `SUM`. \
   - *Aclaración*: El Monto Total de desperdicio se obtiene al multiplicar la cantidad de material desechado por su costo unitario (registrado en el OLTP, por ejemplo, en la lista de materiales).

4. *Porcentaje de Desperdicio* \
   - *Hechos*: `Cantidad_Producida` y `Cantidad_Desperdicio`. \
   - *Fórmula de Cálculo (a nivel agregado)*: \
     $ "Porcentaje_Desperdicio" = (sum("Cantidad_Desperdicio") / sum("Cantidad_Producida")) times 100 $ \
   - *Función de Sumarización*: \
     - Se realiza la suma de ambos hechos por el período o dimensión deseada y luego se calcula la división. \
     - En la práctica, el Data Warehouse almacena `Cantidad_Producida` y `Cantidad_Desperdicio`, y el *Porcentaje de Desperdicio* se obtiene como medida calculada al consultar (p. ej., en Pentaho o Power BI). \
   - *Aclaración*: No es recomendable sumar los porcentajes individuales de cada registro, ya que el resultado sería inexacto. En su lugar, se suman las cantidades totales de producción y desperdicio y luego se calcula el porcentaje sobre ese total.

5. *Eficiencia de Producción* \
   - *Hechos*: `Cantidad_Producida` y `Cantidad_Desperdicio`. \
   - *Fórmula de Cálculo (a nivel agregado)*: \
     $ "Eficiencia" = ((sum("Cantidad_Producida") - sum("Cantidad_Desperdicio")) / sum("Cantidad_Producida")) times 100 $ \
     Y de forma equivalente: \
     $ "Eficiencia" = 100% - "Porcentaje_Desperdicio" $ \
   - *Función de Sumarización*: \
     - Nuevamente, se realiza la suma de las cantidades totales de producción y desperdicio en el período, y luego se aplica la fórmula. \
     - En la herramienta de BI, se implementa como medida calculada. \
   - *Aclaración*: Este indicador refleja el porcentaje de producción que no se ha desperdiciado. Un valor alto indica una producción más eficiente, mientras que un valor bajo señala ineficiencias o fallas en el proceso.

Con estos indicadores conformados, queda establecido cómo se obtendrán los valores numéricos desde los sistemas OLTP y qué funciones de agregación se usarán. Este paso es esencial para asegurar la correcta correspondencia entre los campos en las fuentes de datos y los cálculos que realizará el Data Warehouse.

Además, esta definición servirá de guía cuando se realicen los procesos ETL (Extracción, Transformación y Carga), garantizando que cada indicador se alimente con la información adecuada y que los reportes generados (por ejemplo, en Pentaho o Power BI) sean precisos y consistentes con la realidad de la fábrica.