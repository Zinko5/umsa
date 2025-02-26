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
#show heading.where(level: 3): it => block[
  #set text(weight: "regular")
  #h(1em)
  #counter(heading.where(level: 3)).step()
  #let count = counter(heading.where(level: 3)).get().first()
  #(str((count) * 2 + 2) + ". " + it.body)
]
#set enum(indent: 2em)
#show list: it => enum(
  numbering: "a)",
  // numbering: n => strong(numbering("a)", n)),
  ..it.children.map(item => enum.item()[#item.body]),
)
#import "@preview/cetz:0.3.2"
#import cetz.draw: *
#let ejercicio(..args) = {
  let (enunciado, resolucion) = if args.pos().len() == 1 {
    (none, args.pos().at(0))
  } else {
    (args.pos().at(0), args.pos().at(1))
  }

  block(width: 100%, breakable: false, [
    #if enunciado != none {
      align(left)[#h(1em)#enunciado]
    }
    #align(center)[#h(1em)#resolucion]
  ])
}

= Vectores
== Vectores en dos y tres dimensiones
=== Dibujar cada uno de los múltiplos escalares de $arrow(v)=[-1,5]$

- $4v$\  
- $-frac(1,2)$\
- $0v$\
- $-6v$\

#ejercicio(
  [*a)* $4v$],
  [
    $
      4 arrow(v)=4[-1,5]\
      [-4, 20]
    $
    #show math.equation: block.with(fill: white, inset: .8pt)
    #cetz.canvas(length: 12pt, {
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
    })
  ]
)

#ejercicio(
  [*b)* $-1/2v$],
  [
    $
      -1/2 arrow(v)=-1/2[-1,5]\
      [1/2, -5/2]\
      [0.5,2.5]
    $
    #show math.equation: block.with(fill: white, inset: .8pt)
    #cetz.canvas(length: 48pt, {
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
    })
  ]
)

#ejercicio(
  [*c)* $0v$],
  [
    $
      0arrow(v)=0[-1,5]\
      [0,0]\
    $
    #show math.equation: block.with(fill: white, inset: .8pt)
    #cetz.canvas(length: 24pt, {
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
    })
  ]
)

#ejercicio(
  [*d)* $-6v$],
  [
    $
      -6arrow(v)=-6[-1,5]\
      [-6,30]\
    $
    #show math.equation: block.with(fill: white, inset: .8pt)
    #cetz.canvas(length: 8pt, {
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
    })
  ]
)

=== Hallar el vector $arrow(v)=5arrow(u)-3arrow(w)$ donde $arrow(u)=[2,-1]$ y $arrow(w)=[1,2]$. Ilustrar geométricamente la operación vectorial
