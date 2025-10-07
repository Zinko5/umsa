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


#outline()

#pagebreak()

= Títulos

#set heading(numbering: "1.")
#show heading.where(level: 2): set heading(numbering: "1.a.")
#show heading.where(level: 3): set heading(outlined: false)
#show heading.where(level: 3): set heading(numbering: none)
#show heading.where(level: 4): set heading(outlined: false)
#set heading(outlined: false)

= Título nivel 1
== Título nivel 2
== Título nivel 2
=== Título nivel 3
==== Título nivel 4

#show heading.where(level: 2): set heading(numbering: "1.")
#show heading.where(level: 3): set heading(numbering: "1.")

#show heading.where(level: 2): it => [
    #pad(left: 20pt)[#it]
]

#show heading.where(level: 3): it => [
    #pad(left: 40pt)[#it]
]

= Título nivel 1
== Título nivel 2
== Título nivel 2
=== Título nivel 3
== Título nivel 2

#pad(top: 10pt)[#lorem(120)]

#pagebreak()

#counter(heading).update(1)
#set heading(outlined: true)
#set heading(numbering: "1.")
#show heading.where(level: 3): set heading(outlined: false)
#show heading.where(level: 4): set heading(outlined: false)
#show heading.where(level: 2): it => [
    #pad(left: -20pt)[#it]
]
#show heading.where(level: 3): it => [
    #pad(left: -40pt)[#it]
]

= Grid

#grid(
  inset: 6pt,
  stroke: black,
  // stroke: 2pt + blue,
  // stroke: (paint: blue, thickness: 4pt, cap: "round"),
  // stroke: (paint: blue, thickness: 2pt, dash: "densely-dash-dotted"),
  // stroke: 2pt + gradient.linear(..color.map.rainbow),
  columns: (auto, 50pt, auto),
  [a], [b], [c],
  [d], [#align(center)[e]], [f],
  [g], grid.cell(
    colspan: 2,
    [h]
  ),
  [i], [j], [k],
  grid.cell(
    stroke: red,
    colspan: 3,
    [*l*]
  ),
  [m], 
  grid.cell(
    stroke: black + 2pt,
    colspan: 1,
    [n]
  ), [ñ],
)

#pagebreak()

= Cajas y bloques

La diferencia entre una caja y un bloque es que la caja se puede rompes por un salto de página pero un bloque, no.

#box(
  inset: (x: 2pt, y: 0pt),
  outset: (x: 0pt, y: 2pt),
  stroke: black,
  fill: luma(91.18%),
  radius: 2pt
)[Todo puede estar dentro de una caja o bloque], o no estarlo.

#box(
  inset: (x: 20pt, y: 20pt),
  outset: (x: 0pt, y: 0pt),
  stroke: black,
  fill: luma(91.18%),
  radius: 2pt
)[#image("typst/a.png", width: 200pt)]

#pagebreak()

= Stack

Sirve para apilar cosas en cualquier dirección.

#circle()
#circle()
#circle()

#stack(
  dir: ltr,
  spacing: 5pt,
  circle(), circle(), circle()
)

#pagebreak()

= Texto

#text()[#lorem(25)]

== Stroke

#text(stroke: red + 0.4pt)[#lorem(25)]

#text(stroke: black + 0.4pt, fill: red)[#lorem(25)]

#text(stroke: black + 0.5pt, fill: blue, weight: "black")[#lorem(25)]

== Strech

#text(stretch: 200%)[#lorem(25)]

#text(stretch: 50%)[#lorem(25)]

== Tracking

#text(tracking: 2pt)[#lorem(25)]

#text(tracking: -1pt)[#lorem(25)]

== spacing

#text(spacing: 25pt)[#lorem(25)]

#text(spacing: -1pt)[#lorem(25)]

#pagebreak()

= Color

#set stack(
  dir: ltr,
  spacing: 8pt
)

#set circle(height: 7em)

No tiene constructor, se usa a través de `fill`.

== Colores predefinidos

#stack(
  circle(fill: black), circle(fill: red), circle(fill: eastern)
)

== Luma

#circle(fill: luma(221))

== RGB

#circle(fill: rgb("#239eee"))

== Transparencia

#circle(fill: red.transparentize(50%))

== Mix

#stack(
  circle(fill: white.mix(red)), 
  circle(fill: color.mix(red, white, green)), 
  circle(fill: color.mix((red, 60%), (white, 10%), (green,30%)))
)

== Gradientes

=== Predefinidos 

#stack(
  circle(fill: gradient.linear(..color.map.rainbow)),
  circle(fill: gradient.radial(..color.map.rainbow)),
  circle(fill: gradient.conic(..color.map.rainbow)),
  circle(fill: gradient.conic(..color.map.rainbow)),
)

#stack(
  circle(fill: gradient.radial(..color.map.cividis)),
  circle(fill: gradient.radial(..color.map.crest)),
  circle(fill: gradient.radial(..color.map.inferno)),
  circle(fill: gradient.radial(..color.map.rocket)),
)

=== Personalizados

#stack(
  circle(fill: gradient.linear(red, blue, green)),
  circle(fill: gradient.radial(red, blue, green)),
  circle(fill: gradient.conic(red, blue, green)),
  circle(fill: gradient.linear(yellow, fuchsia)),
)

#stack(
  circle(fill: gradient.linear(black, blue)),
  circle(fill: gradient.linear(black, blue, angle: 90deg)),
  circle(fill: gradient.linear(black, blue, angle: 180deg)),
  circle(fill: gradient.linear(black, blue, angle: 270deg)),
)

=== Sharp

#stack(
  circle(fill: gradient.linear(..color.map.rainbow)),
  circle(fill: gradient.linear(..color.map.rainbow).sharp(5)),
  circle(fill: gradient.linear(..color.map.rainbow).sharp(20)),
  circle(fill: gradient.linear(..color.map.rainbow).sharp(5, smoothness: 50%)),
)

#stack(
  circle(fill: gradient.linear(yellow, fuchsia, blue)),
  circle(fill: gradient.linear(yellow, fuchsia, blue).sharp(5)),
  circle(fill: gradient.linear(yellow, fuchsia, blue).sharp(20)),
  circle(fill: gradient.linear(yellow, fuchsia, blue).sharp(5, smoothness: 50%)),
)

=== Repeat

#stack(
  circle(fill: gradient.linear(black, blue)),
  circle(fill: gradient.linear(black, blue).repeat(4)),
  circle(fill: gradient.radial(black, blue)),
  circle(fill: gradient.radial(black, blue).repeat(2)),
  circle(fill: gradient.radial(black, blue).repeat(4)),
  circle(fill: gradient.radial(black, blue).repeat(7)),
)

#stack(
  circle(fill: gradient.linear(yellow, fuchsia, blue).sharp(3)),
  circle(fill: gradient.linear(yellow, fuchsia, blue).sharp(3).repeat(2)),
  circle(fill: gradient.linear(yellow, fuchsia, blue).sharp(3).repeat(4)),
  circle(fill: gradient.radial(yellow, fuchsia, blue).sharp(3).repeat(3)),
  circle(fill: gradient.radial(yellow, fuchsia, blue).sharp(6).repeat(3)),
)

#stack(
  circle(fill: gradient.radial(red, white).sharp(2).repeat(3)),
  circle(stroke: black + 5pt, fill: gradient.radial(red,white).sharp(2).repeat(3)),
  circle(stroke: red + 5pt, fill: gradient.radial(red,white).sharp(2).repeat(3)),
  circle(stroke: gradient.linear(..color.map.rainbow) + 5pt, fill: gradient.radial(red,white).sharp(2).repeat(3)),
  circle(stroke: gradient.conic(..color.map.rainbow) + 5pt, fill: gradient.radial(red,white).sharp(2).repeat(3)),
)