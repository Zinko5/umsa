#set page(
  margin: (x: 2.5cm, y: 2.5cm) //Para trabajos digitales e impresos simples
  // margin: (left: 3.8cm, y: 2.5cm, right: 2.5cm) //Para trabajos impresos a doble cara
)
#set text(lang:"es")
#set text(font: "DejaVu Sans") //Sans
// #set text(font: "DejaVu Serif") //Serif
#set par(justify: true)
#show math.equation: set text(font: "DejaVu Math TeX Gyre")
#show math.equation:box
#let separador() = align(center)[#line(length: 100%)]

#text(weight: "bold", stroke: black + 2pt, fill: red, size: 40pt, font: "Droid Sans Fallback")[Hamdy Taha]
#line(length: 100%, stroke: 3pt + gradient.linear(..color.map.inferno))

#outline()

#pagebreak()

#set heading(numbering: "1.")
#show heading.where(level: 3): set heading(numbering: none, outlined: false) 

= Historia

Inicia en la segunda guerra mundial.

= Planteamiento de modelos de investigación operativa

== Introducción

Al plantear un modelo, se como un problema de toma de desiciones cuya solución requiere responder las preguntas en orden:

+ ¿Cuáles son las alternativas de desición?
+ ¿Cuáles son las restricciones de la desición?
+ ¿Cuál es el criterio objetivo para evaluar las alternativas?

Un criterio objetivo es un valor relacionado al problema, puede ser de tiempo, dinero, etc.

En resumen, los tres componentes principales de un modelo de investigación operativa son *alternativas, restricciones y criterio objetivo*.

== Planteamiento formal

Hay situaciones en el que la cantidad de alternativas es infinita, como en problemas teóricos matemáticos, en estos casos, las alternativas se representan definiendo variables algebráicas.

Las restricciones también se traducen de manera algebráica, a través de ecuaciones o inecuaciones.

Para el criterio objetivo del problema, se debe definir qué variable se quiere maximizar o minimizar, se traduce a una ecuación llamada *función objetivo*.

== Modelo general

El modelo general de investigación operativa se organiza en el siguiente formato:

#align(center)[
  #rect(radius: 10pt, stroke: gradient.linear(red, blue) + 3pt, inset: 7pt)[
    #align(left)[
      _Maximizar_ o _minimizar_ *Función objetivo*.

      Sujeto a

      *Restricciones*
    ]
  ]
]

== Factibilidad y optimización

La solución de un modelo es factible si cumple todas las restricciones y es óptima si además de ser factible produce el mejor valor (máximo o mínimo) de la función objetivo.

La calidad de la solución resultante depende de la exactitud con la que el modelo representa el sistema real.

= Solución de un modelo

La solución de un modelo de investigación operativa se obtiene aplicando diferentes técnicas dependientes del tipo y la complejidad del modelo.

== Técnicas de resolución

- *Programación lineal*.- cuando las funciones objetivo y restricciones son lineales.
- *Programación entera*.- cuando las variables asumen valores enteros.
- *Programación dinámica*.- cuando el modelo puede dividirse en subproblemas más pequeños.
- *Programación de red*.- cuando el problema puede modelarse como una red.
- *Programación no lineal*.- cuando las funciones objetivo y restricciones no son lineales.

La mayoría de técnicas de resolución se aplican ejecutando algoritmos.

Existen modelos tan complejos que es imposible resolverlos con cualquier algoritmo de optimización descubierto, en ese caso se debe optar por encontrar una solución buena en lugar de una óptima.

== Abstracción del modelo

En un problema real, los modelos casi nunca son una perfecta representación del sistema real, ya que este presenta demasiadas variables incalculables; en cambio se aplican niveles de abstracción para el modelo.

El primer nivel de abstracción requiere definir los límites del mundo real supuesto. Para pasar el mundo real al mundo real supuesto, se debe concentrar varios parámetros del mundo real en un único parámetro del mundo real supuesto.

