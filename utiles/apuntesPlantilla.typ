#set page(
  margin: (x: 2.5cm, y: 2.5cm) //Para trabajos digitales e impresos simples
  // margin: (left: 3.8cm, y: 2.5cm, right: 2.5cm) //Para trabajos impresos a doble cara
)
#set text(lang:"es")
#set text(font: "DejaVu Sans")
#show math.equation: set text(font: "DejaVu Math TeX Gyre")
#set par(justify: true)
#import "@preview/cetz:0.3.1": canvas, draw, tree
// #set grid(inset: 0.6em, row-gutter: 0.6em)

Para grid:
#grid(
    columns: (auto, auto, auto),
    inset: 0.5em,
    stroke: 0.1em + black,
    [1], [2], [3],
    [1], [2], [3],
    [1], [2], [3],
    [1], [2], [3],
)

para títulos ennumerados:
#set heading(numbering: "1.")
#show heading.where(level: 3): set heading(numbering: "1. 1. a)")
#show heading.where(level: 4): set heading(numbering: none)
= Título
== Título
== Título
=== Título
==== Título

Otros:

#show heading.where(level: 2): it => [
    #pad(left: 30pt)[#it]
]

= Título
== Título
== Título
#pad(top: 10pt)[#lorem(120)]

paquetes utiles:

#import "@preview/fletcher:0.5.2" as fletcher: diagram, node, edge, shapes
#import "@preview/cetz:0.3.1": canvas, draw, tree

#let data = (
  [-2], ([0], ([3], [5], [3]), ([0], [0], [7])), ([-1], ([-2], [-2], [4]), ([1], [8], [1]))
  // [A], ([B], [C], ([G], [H]), [D]), ([E], [F])

)

#canvas(length: 1cm, {
  import draw: *

  set-style(content: (padding: .2),
    fill: gray.lighten(70%),
    stroke: black.lighten(10%))

  tree.tree(data, spread: 2.5, grow: 1.5, draw-node: (node, ..) => {
    circle((), radius: .45, stroke: none)
    content((), node.content)
  }, draw-edge: (from, to, ..) => {
    line((a: from, number: .45, b: to),
         (a: to, number: .45, b: from))
  }, name: "tree")

  // Draw a "custom" connection between two nodes
  // let (a, b) = ("tree.0-0-1", "tree.0-1-0",)
  // line((a, .45, b), (b, .45, a))
})

#diagram(
  node-stroke: .1em,
  node-fill: gray.lighten(70%),
  spacing: 0em,
  node((0,0), `5 `),
  node((1,0), `3 `),
  node((2,0), `0 `),
  node((3,0), `7 `),
  node((4,0), `-2`),
  node((5,0), `4 `),
  node((6,0), `8 `),
  node((7,0), `1 `),
)

