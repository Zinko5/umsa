#set page(
  margin: (x: 2.5cm, y: 2.5cm) //Para trabajos digitales e impresos simples
  // margin: (left: 3.8cm, y: 2.5cm, right: 2.5cm) //Para trabajos impresos a doble cara
)
#set text(lang:"es")
#set text(font: "DejaVu Sans")
#show math.equation: set text(font: "DejaVu Math TeX Gyre")
#set par(justify: true)

= INF 126 - Cálculo 2

= Ponderación
Para grid:
#grid(
    columns: (auto, auto),
    inset: 0.5em,
    stroke: 0.1em + black,
    [1er parcial], [30 puntos],
    [2do parcial], [30 puntos],
    [Exámen final], [30 puntos],
    [Auxiliatura], [10 puntos]
)

// para títulos ennumerados:
// #set heading(numbering: "1.")
// #show heading.where(level: 3): set heading(numbering: "1. 1. a)")
// #show heading.where(level: 4): set heading(numbering: none)
// = Título
// == Título
// == Título
// === Título
// ==== Título

// Otros:

// #show heading.where(level: 2): it => [
//     #pad(left: 30pt)[#it]
// ]

// = Título
// == Título
// == Título
// #pad(top: 10pt)[#lorem(120)]
