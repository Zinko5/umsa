#import "@preview/fletcher:0.5.2" as fletcher: diagram, node, edge, shapes
#import "@preview/cetz:0.3.1": canvas, draw, tree

#set page(
 margin: (x: 40pt, y: 40pt),
)
#set text(lang:"es")
#set text(font: "New Computer Modern")
= Segment tree

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
