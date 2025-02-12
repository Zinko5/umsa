#set page(
 margin: (x: 40pt, y: 40pt),
)
#set text(lang:"es")
#set text(font: "DejaVu Sans")
#show math.equation: set text(font: "DejaVu Math TeX Gyre")

= DAT 241 - Programación distribuida y paralela
+ Introducción
+ Programación paralela (patrones)
+ Aplicaciones de la programación paralela
+ Matrices _especiales, euclideanas, espaciadas ¿?_
+ Aplicaciones de Big Data / ETL

= Herramientas
- Python, R, C, C++
- Maquinas virtuales
- Visual Studio
- NetBeans
- _Handoop ¿?_
- SQL Server

= Evaluación
- Exámenes en el aula
- Exámenes grupales
- Proyecto final

= Ponderación
// - 1er parcial.- 20 puntos
// - 2do parcial.- 30 puntos
// - Proyecto.- 30 puntos
// - Trabajos grupales.- 15 puntos
// - Exposición (con grupos).- 15 puntos
// - Puntos extras (aplicable a partir de los 46 puntos).- 15 puntos
La ponderación elegida por votación es:
#grid(
  // column-gutter: 15pt,
  // gutter: 1em,
  stroke: black,
  inset: 1em,
  columns: (auto, auto),
  [1er parcial], [20 puntos],
  [2do parcial], [30 puntos],
  [Proyecto], [30 puntos],
  [Trabajos grupales], [15 puntos],
  [Exposición (con grupos)], [15 puntos],
  [Puntos extras \*], [15 puntos]
)
\* Los puntos extras son aplicables solo a partir de los 46 puntos

= Trabajos grupales
Se avisará una clase antes que habrá un trabajo grupal. Los miembros del grupo que falten a la clase del trabajo grupal no tendrán nota. Los grupos pueden cambiar después de cada parcial

= Exposiciones
- Presentación: 30%
- Defensa (preguntas): 70%

= Exámenes
- Parte teórica: 20%. Dura 10 minutos
- Parte práctica: 80%. Dura 1 hora y 20 minutos

= Plataforma
- CVInformatica

#set heading(numbering: "1.")
#show heading.where(level: 3): set heading(numbering: none)
#show heading.where(level: 3): it => [
  #pad(left: 1em)[#it]
]

= Introducción
== Paradigmas
=== Programación centralizada

Tarea: Encontrar un software que diga las capacidades/características de un ordenador