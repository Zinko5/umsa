#import "@preview/cetz:0.3.4": canvas, draw, tree
#set page(
  margin: (x: 2.5cm, y: 2.5cm) //Para trabajos digitales e impresos simples
  // margin: (left: 3.8cm, y: 2.5cm, right: 2.5cm) //Para trabajos impresos a doble cara
)
#set text(lang:"es")
#set text(font: "DejaVu Sans")
#show math.equation: set text(font: "DejaVu Math TeX Gyre")
#let separador() = align(center)[#line(length: 100%)]
#set par(justify: true)

#set quote(block: true)

#grid(
  stroke: black,
  inset: 6pt,
  columns: (auto, auto, auto),
  [Duración de la sesión (minutos)], [Cantidad de canciones escuchadas completas], [Cantidad de canciones saltadas],
  [$x_1$], [$y$], [$x_2$],
  [25], [5], [5],
  [27], [9], [4],
  [], [], [],
)

#grid(
  stroke: black,
  inset: 6pt,
  columns: (auto, auto, auto, auto),
  [Número de sesión] ,[Cantidad de canciones escuchadas completas], [Duración de la sesión (minutos)], [Cantidad de canciones saltadas],
  [] ,[$y$], [$x_1$], [$x_2$],
  [1.] ,[5], [27], [5],
  [2.] ,[9], [25], [4],
)