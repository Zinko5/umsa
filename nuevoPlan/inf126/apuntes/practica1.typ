#set page(
  margin: (x: 2.5cm, y: 2.5cm) //Para trabajos digitales e impresos simples
  // margin: (left: 3.8cm, y: 2.5cm, right: 2.5cm) //Para trabajos impresos a doble cara
)
#set text(lang:"es")
#set text(font: "DejaVu Sans")
#show math.equation: set text(font: "DejaVu Math TeX Gyre")
#set par(justify: true)
#set heading(numbering: "1.")
#show heading.where(level: 2): set heading(numbering: none)
#import "@preview/cetz:0.3.2"
// #let name = value

= Vectores
== Vectores en dos y tres dimensiones

2. Dibujar cada uno de los múltiplos escalares de $arrow(v)=[-1,5]$
a) $4v$\
b) $-frac(1,2)$\
c) $0v$\
d) $-6v$\

*a)*
$
  4 arrow(v)=4[-1,5]\
  [-4, 20]
$

// #align(center)[#show math.equation: block.with(fill: white, inset: .8pt)
// #cetz.canvas(length: 12pt, {
//   import cetz.draw: *

//   set-style(
//     mark: (fill: black, scale: 1),
//     stroke: (thickness: .4pt, cap: "round"),
//     angle: (
//       radius: 2,
//       label-radius: 1,
//       stroke: (paint: green.darken(5%))
//     ),
//     content: (padding: 1pt),
//   )
// let tamaño = 0.7em

//   grid((-5, -3), (3, 22), step: 1, stroke: gray + 0.5pt)
//   line((-4, 0), (2, 0), mark: (end: "stealth"))
//   content((), text(size:0.8em)[$ x $], anchor: "west")
//   line((0, -2), (0, 21), mark: (end: "stealth"))
//   content((),text(size:0.8em)[$ y $], anchor: "south")

//   line((0, 0), (-4,20), mark: (end: "o", fill:red, scale: .7, anchor: "center"), stroke: 1pt + red)
//   content((), text(size: tamaño)[$ (-4,20) $], anchor: "west", padding: 03pt)

//   for (x, ct) in ((-4, $-4$),(-3, $ -3 $),(-2, $ -2 $),(-1, $ -1 $),(1, $ 1 $),(2, $ 2 $)) {
//     line((x, 3pt), (x, -3pt))
//     content((), anchor: "north", text(tamaño)[#ct])
//   }

//   for (y, ct) in ((-2, $ -2 $), (-1, $ -1 $),(1, $ 1 $),(2, $ 2 $),(3, $ 3 $),(4, $ 4 $),(5, $ 5 $),(6, $ 6 $),(7, $ 7 $),(8, $ 8 $),(9, $ 9 $),(10, $ 10 $),(11, $ 11 $),(12, $ 12 $),(13, $ 13 $),(14, $ 14 $),(15, $ 15 $),(16, $ 16 $),(17, $ 17 $),(18, $ 18 $),(19, $ 19 $),(20, $ 20 $)) {
//     line((3pt, y), (-3pt, y))
//     content((), anchor: "east", text(tamaño)[#ct])
//   }
// })]

// ---------------------

#align(center)[#show math.equation: block.with(fill: white, inset: .8pt)
#cetz.canvas(length: 12pt, {
  import cetz.draw: *

  set-style(
    mark: (fill: black, scale: 1.1),
    stroke: (thickness: .7pt, cap: "round"),
    angle: (
      radius: 2,
      label-radius: 1,
      stroke: (paint: green.darken(5%))
    ),
    content: (padding: 1pt),
  )
let tamaño = 1em

  grid((-10, -4), (4, 22), step:2, stroke: gray + 0.5pt)
  line((-8, 0), (3, 0), mark: (end: "stealth"))
  content((), text(size:.9em)[$ x $], anchor: "west")
  line((0, -2), (0, 21), mark: (end: "stealth"))
  content((),text(size:.9em)[$ y $], anchor: "south")

  line((0, 0), (-4,20), mark: (end: "o", fill:red, scale: 1, anchor: "center"), stroke: 1pt + red)
  content((), text(size: tamaño)[$ (-4,20) $], anchor: "east", padding: 03pt)

  for (x, ct) in ((-6, $-6$),(-8, $-8$),(-4, $-4$),(-2, $ -2 $),(2, $ 2 $)) {
    line((x, 3pt), (x, -3pt))
    content((), anchor: "north", text(tamaño)[#ct])
  }

  for (y, ct) in ((-2, $ -2 $),(2, $ 2 $),(4, $ 4 $),(6, $ 6 $),(8, $ 8 $),(10, $ 10 $),(12, $ 12 $),(14, $ 14 $),(16, $ 16 $),(18, $ 18 $),(20, $ 20 $)) {
    line((3pt, y), (-3pt, y))
    content((), anchor: "east", text(tamaño)[#ct])
  }
})]

*b)*
$
  -1/2 arrow(v)=-1/2[-1,5]\
  [1/2, -5/2]\
  [0.5,2.5]
$

#align(center)[#show math.equation: block.with(fill: white, inset: .8pt)
#cetz.canvas(length: 48pt, {
  import cetz.draw: *

  set-style(
    mark: (fill: black, scale: 1.1),
    stroke: (thickness: .7pt, cap: "round"),
    angle: (
      radius: 2,
      label-radius: 1,
      stroke: (paint: green.darken(5%))
    ),
    content: (padding: 1pt),
  )
let tamaño = 1em

  grid((-1.5, -1.5), (2, 3.5), step:.5, stroke: gray + 0.5pt)
  line((-1, 0), (1.5, 0), mark: (end: "stealth"))
  content((), text(size:.9em)[$ x $], anchor: "west")
  line((0, -1), (0, 3), mark: (end: "stealth"))
  content((),text(size:.9em)[$ y $], anchor: "south")

  line((0, 0), (0.5,2.5), mark: (end: "o", fill:red, scale: 1, anchor: "center"), stroke: 1pt + red)
  content((), text(size: tamaño)[$ (0,5,2.5) $], anchor: "west", padding: 03pt)

  for (x, ct) in ((-1, $ -1 $),(1, $ 1 $)) {
    line((x, 3pt), (x, -3pt))
    content((), anchor: "north", text(tamaño)[#ct])
  }

  for (y, ct) in ((-1, $ -1 $),(1, $ 1 $),(2, $ 2 $),(2.5, $ 2.5 $)) {
    line((3pt, y), (-3pt, y))
    content((), anchor: "east", text(tamaño)[#ct])
  }
})]

*c)*
$
  0arrow(v)=0[-1,5]\
  [0,0]\
$

#align(center)[#show math.equation: block.with(fill: white, inset: .8pt)
#cetz.canvas(length: 24pt, {
  import cetz.draw: *

  set-style(
    mark: (fill: black, scale: 1.1),
    stroke: (thickness: .7pt, cap: "round"),
    angle: (
      radius: 2,
      label-radius: 1,
      stroke: (paint: green.darken(5%))
    ),
    content: (padding: 1pt),
  )
let tamaño = 1em

  grid((-2, -2), (2, 3), step: 1, stroke: gray + 0.5pt)
  line((-1, 0), (1.5, 0), mark: (end: "stealth"))
  content((), text(size:.9em)[$ x $], anchor: "west")
  line((0, -1), (0, 2.5), mark: (end: "stealth"))
  content((),text(size:.9em)[$ y $], anchor: "south")

  line((0, 0), (0,0.001), mark: (end: "o", fill:red, scale: 1, anchor: "center"), stroke: 1pt + red)
  content((), text(size: tamaño)[$ (0,0) $], anchor: "south", padding: 4pt)

  for (x, ct) in ((-1, $ -1 $),(1, $ 1 $)) {
    line((x, 3pt), (x, -3pt))
    content((), anchor: "north", text(tamaño)[#ct])
  }

  for (y, ct) in ((-1, $ -1 $),(1, $ 1 $),(2, $ 2 $)) {
    line((3pt, y), (-3pt, y))
    content((), anchor: "east", text(tamaño)[#ct])
  }
})]

*d)*
$
  -6arrow(v)=-6[-1,5]\
  [-6,30]\
$

#align(center)[#show math.equation: block.with(fill: white, inset: .8pt)
#cetz.canvas(length: 8pt, {
  import cetz.draw: *

  set-style(
    mark: (fill: black, scale: 1.1),
    stroke: (thickness: .7pt, cap: "round"),
    angle: (
      radius: 2,
      label-radius: 1,
      stroke: (paint: green.darken(5%))
    ),
    content: (padding: 1pt),
  )
let tamaño = 1em

  grid((-15, -6), (6, 33), step:3, stroke: gray + 0.5pt)
  line((-12, 0), (4.5, 0), mark: (end: "stealth"))
  content((), text(size:.9em)[$ x $], anchor: "west")
  line((0, -3), (0, 31.5), mark: (end: "stealth"))
  content((),text(size:0.9em)[$ y $], anchor: "south")

  line((0, 0), (-6,30), mark: (end: "o", fill:red, scale: 1, anchor: "center"), stroke: 1pt + red)
  content((), text(size: tamaño)[$ (-6,30) $], anchor: "east", padding: 03pt)

  for (x, ct) in ((-12, $-12$),(-9, $-9$),(-6, $-6$),(-3, $-3$),(3, $ 3 $)) {
    line((x, 3pt), (x, -3pt))
    content((), anchor: "north", text(tamaño)[#ct])
  }

  for (y, ct) in ((-3, $ -3 $),(3, $ 3 $),(6, $ 6 $),(9, $ 9 $),(12, $ 12 $),(15, $ 15 $),(18, $ 18 $),(21, $ 21 $),(24, $ 24 $),(27, $ 27 $),(30, $ 30 $)) {
    line((3pt, y), (-3pt, y))
    content((), anchor: "east", text(tamaño)[#ct])
  }
})]

// #align(center)[#show math.equation: block.with(fill: white, inset: .8pt)
// #cetz.canvas(length: 12pt, {
//   import cetz.draw: *

//   set-style(
//     mark: (fill: black, scale: 1.1),
//     stroke: (thickness: .7pt, cap: "round"),
//     angle: (
//       radius: 2,
//       label-radius: 1,
//       stroke: (paint: green.darken(5%))
//     ),
//     content: (padding: 1pt),
//   )
// let tamaño = 1em

//   grid((-8, -4), (4, 32), step:2, stroke: gray + 0.5pt)
//   line((-6, 0), (3, 0), mark: (end: "stealth"))
//   content((), text(size:.9em)[$ x $], anchor: "west")
//   line((0, -2), (0, 31), mark: (end: "stealth"))
//   content((),text(size:0.9em)[$ y $], anchor: "south")

//   line((0, 0), (-6,30), mark: (end: "o", fill:red, scale: 1, anchor: "center"), stroke: 1pt + red)
//   content((), text(size: tamaño)[$ (-6,30) $], anchor: "west", padding: 03pt)

//   for (x, ct) in ((-6, $-6$),(-4, $-4$),(-2, $ -2 $),(2, $ 2 $)) {
//     line((x, 3pt), (x, -3pt))
//     content((), anchor: "north", text(tamaño)[#ct])
//   }

//   for (y, ct) in ((-2, $ -2 $),(2, $ 2 $),(4, $ 4 $),(6, $ 6 $),(8, $ 8 $),(10, $ 10 $),(12, $ 12 $),(14, $ 14 $),(16, $ 16 $),(18, $ 18 $),(20, $ 20 $),(22, $ 22 $),(24, $ 24 $),(26, $ 26 $),(28, $ 28 $),(30, $ 30 $)) {
//     line((3pt, y), (-3pt, y))
//     content((), anchor: "east", text(tamaño)[#ct])
//   }
// })]
// 
