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

#show math.equation: block.with(fill: white, inset: 1pt)

#cetz.canvas(length: 3cm, {
  import cetz.draw: *

  set-style(
    mark: (fill: black, scale: 2),
    stroke: (thickness: 0.4pt, cap: "round"),
    angle: (
      radius: 0.3,
      label-radius: .22,
      fill: green.lighten(80%),
      stroke: (paint: green.darken(50%))
    ),
    content: (padding: 1pt)
  )

  grid((-1.5, -1.5), (1.4, 1.4), step: 0.5, stroke: gray + 0.2pt)

  circle((0,0), radius: 1)

  line((-1.5, 0), (1.5, 0), mark: (end: "stealth"))
  content((), $ x $, anchor: "west")
  line((0, -1.5), (0, 1.5), mark: (end: "stealth"))
  content((), $ y $, anchor: "south")

  for (x, ct) in ((-1, $ -1 $), (-0.5, $ -1/2 $), (1, $ 1 $)) {
    line((x, 3pt), (x, -3pt))
    content((), anchor: "north", ct)
  }

  for (y, ct) in ((-1, $ -1 $), (-0.5, $ -1/2 $), (0.5, $ 1/2 $), (1, $ 1 $)) {
    line((3pt, y), (-3pt, y))
    content((), anchor: "east", ct)
  }

  // Draw the green angle
  cetz.angle.angle((0,0), (1,0), (1, calc.tan(30deg)),
    label: text(green, [#sym.alpha]))

  line((0,0), (1, calc.tan(30deg)))

  set-style(stroke: (thickness: 1.2pt))

  line((30deg, 1), ((), "|-", (0,0)), stroke: (paint: red), name: "sin")
  content(("sin.start", 50%, "sin.end"), text(red)[$ sin alpha $])
  line("sin.end", (0,0), stroke: (paint: blue), name: "cos")
  content(("cos.start", 50%, "cos.end"), text(blue)[$ cos alpha $], anchor: "north")
  line((1, 0), (1, calc.tan(30deg)), name: "tan", stroke: (paint: orange))
  content("tan.end", $ text(#orange, tan alpha) = text(#red, sin alpha) / text(#blue, cos alpha) $, anchor: "west")
})
