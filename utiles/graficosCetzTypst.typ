#set page(
  margin: (x: 2.5cm, y: 2.5cm) //Para trabajos digitales e impresos simples
  // margin: (left: 3.8cm, y: 2.5cm, right: 2.5cm) //Para trabajos impresos a doble cara
)
#set text(lang:"es")
#set text(font: "DejaVu Sans") //Sans
// #set text(font: "DejaVu Serif") //Serif
#show math.equation: set text(font: "DejaVu Math TeX Gyre")
#set par(justify: true)
#set par(justify: true)
#show math.equation:box
#let separador() = align(center)[#line(length: 100%)]
#set heading(numbering: "1.")

#import "@preview/fletcher:0.5.2" as fletcher: diagram, node, edge, shapes
#import "@preview/cetz:0.3.1": canvas, draw, tree
#import "@preview/cetz:0.3.2"

#outline()

#pagebreak()

= Diagrama de árbol

#let data = (
  [-2], ([0], ([3], [5], [3]), ([0], [0], [7])), ([-1], ([-2], [-2], [4]), ([1], [8], [1]))
  // [A], ([B], [C], ([G], [H]), [D]), ([E], [F])

)

#canvas(length: 1cm, {
  import draw: *

  set-style(content: (padding: .2),
    fill: gray.lighten(70%),
    stroke: black.lighten(10%))

  tree.tree(data, spread: 2.2, grow: 1.5, draw-node: (node, ..) => {
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
