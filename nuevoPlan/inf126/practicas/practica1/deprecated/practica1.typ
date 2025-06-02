#set page(
  margin: (x: 2.5cm, y: 2.5cm) //Para trabajos digitales e impresos simples
  // margin: (left: 3.8cm, y: 2.5cm, right: 2.5cm) //Para trabajos impresos a doble cara
)
#set text(lang:"es")
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
#ejercicio([$
  5 arrow(u)=5[2, -1]=[10,-5]\
  3 arrow(w)=3[1,2]=[3,6]\
  arrow(v)= 5 arrow(u)-3arrow(w)=[10,-5]-[3,6]=[7,-11]
$
],
[
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

      // cuadricula (x1, y,1), (x2, y2)
      grid((-4, -14), (16, 4), step:2, stroke: gray + 0.5pt)
      // linea eje x: (x1, 0), (x2, 0)
      line((-2, 0), (15, 0), mark: (end: "stealth"))
      content((), text(size:.9em)[$ x $], anchor: "west")
      // linea eje y: (0, y1), (0, y2)
      line((0, -12), (0, 3), mark: (end: "stealth"))
      content((),text(size:.9em)[$ y $], anchor: "south")

      line((0, 0), (7,-11), mark: (end: "o", fill:red, scale: 1, anchor: "center"), stroke: 1pt + red)
      content((), text(size: tamaño, red)[$ (7,-11) $], anchor: "east", padding: 04pt)

      line((0, 0), (10, -5), mark: (end: "stealth", fill:green, scale: 1), stroke: 1pt + green)
      content((), text(size: tamaño, green)[$ (10,-5) $], anchor: "west", padding: 2pt)

      line((10, -5), (7, -11), mark: (end: "stealth", fill:blue, scale: 1), stroke: 1pt + blue)
      content((), text(size: tamaño,blue)[$ (10,-5) $], anchor: "west", padding: 6pt)

      // marcas eje x:
      for (x, ct) in ((-2, $ -2 $),(2, $ 2 $),(4, $ 4 $),(6, $ 6 $),(8, $ 8 $),(10, $ 10 $), (12, $ 12 $), (14, $ 14 $)) {
        line((x, 3pt), (x, -3pt))
        content((), anchor: "north", text(tamaño)[#ct])
      }
      // marcas eje y:
      for (y, ct) in ((-12, $ -12 $),(-10, $ -10 $),(-8, $ -8 $),(-6, $ -6 $),(-4, $ -4 $),(-2, $ -2 $),(2, $ 2 $)) { 
        line((3pt, y), (-3pt, y))
        content((), anchor: "east", text(tamaño)[#ct])
      }
    })
])

#cetz.canvas(length: 12pt, {
  set-style(
    mark: (fill: black, scale: 1.1),
    stroke: (thickness: .7pt, cap: "round"),
    content: (padding: 6pt),
  )
  let tamaño = 1em

  // Ejes en 3D
  // Eje X: (0,0,0) a (15,0,0)
  line((0, 0, 0), (15, 0, 0), mark: (end: "stealth"), stroke: red + 1pt)
  content((15, 0, 0), text(size: .9em, red)[$ x $], anchor: "west")
  
  // Eje Y: (0,0,0) a (0,15,0)
  line((0, 0, 0), (0, 15, 0), mark: (end: "stealth"), stroke: green + 1pt)
  content((0, 15, 0), text(size: .9em, green)[$ y $], anchor: "south")
  
  // Eje Z: (0,0,0) a (0,0,15)
  line((0, 0, 0), (0, 0, 15), mark: (end: "stealth"), stroke: blue + 1pt)
  content((0, 0, 15), text(size: .9em, blue)[$ z $], anchor: "west")

  // Líneas en 3D adaptadas (ajustadas para mostrar profundidad)
  // Línea de (0,0,0) a (7,-11,5)
  line((0, 0, 0), (7, -11, 5), mark: (end: "o", fill: red, scale: 1), stroke: 1pt + red)
  content((7, -11, 5), text(size: tamaño, red)[$ (7,-11,5) $], anchor: "east", padding: 4pt)

  // Marcas en los ejes (opcional, solo para referencia)
  for (x, ct) in ((5, $ 5 $), (10, $ 10 $), (15, $ 15 $)) {
    line((x, 3pt, 0), (x, -3pt, 0))
    content((x, 0, 0), anchor: "north", text(tamaño, red)[#ct])
  }
  for (y, ct) in ((5, $ 5 $), (10, $ 10 $), (15, $ 15 $)) {
    line((-3pt, y, 0), (3pt, y, 0))
    content((0, y, 0), anchor: "east", text(tamaño, green)[#ct])
  }
  for (z, ct) in ((5, $ 5 $), (10, $ 10 $), (15, $ 15 $)) {
    line((3pt, -3pt, z), (-3pt, 3pt, z))
    content((0, 0, z), anchor: "east", text(tamaño, blue)[#ct])
  }
})