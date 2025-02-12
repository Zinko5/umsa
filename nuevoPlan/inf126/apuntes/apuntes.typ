#set page(
  margin: (x: 2.5cm, y: 2.5cm) //Para trabajos digitales e impresos simples
  // margin: (left: 3.8cm, y: 2.5cm, right: 2.5cm) //Para trabajos impresos a doble cara
)
#set text(lang:"es")
#set text(font: "DejaVu Sans")
#show math.equation: set text(font: "DejaVu Math TeX Gyre")
#set par(justify: true)
#show math.equation:box
#show grid:box
#set grid(inset: 0.6em, row-gutter: 0.6em)
#import "@preview/cetz:0.3.2"

= INF 126 - Cálculo 2a

=== Auxiliar
76267371\
Auxiliar Alexander
#pagebreak()

= Norma 
La norma de un vector $v$ se escribe $||v||$ e indica el tamaño del vector
#grid(
    columns: (auto, auto),
    // stroke: 0.1em + black,
    [Si el vector es], [$arrow(v)=[a, b]$],
    [su norma es], [$||v||=sqrt(a^2 + b^2)$],
)

= Vectores unitarios
Son vectores $v$ tal que su norma $||v|| = 1$\
Ejemplo: 

#grid(
    columns: (auto, auto),
    [Si el vector es], [$arrow(v)=[3, 4]$],
    [su norma es], [$||v||=sqrt(3^2 + 4^2)$],
    [], [$||v||=sqrt(25)=5$],
)

Por lo tanto, $arrow(v)=[3, 4]$ no es un vector unitario
Algunos vectores unitarios son $arrow(v)=[0, 1]$, $arrow(v)=[1, 0]$, que son los vectores canónicos

Sea un vector $arrow(v)=[a, b]$, se puede descomponer por: $[a, b] = [a, 0] + [0, b] = a[1,0]+b[0,1]$

Un vector $v$ está dado por $arrow(v)= [cos theta, sin theta]$. Donde $theta$ es el ángulo que forman las componentes del vector tomando como referencia el centro del plano cartesiano

= Suma de vectores
#grid(
    columns: (auto, auto),
    [Si los vectores son], [$arrow(v)=[3, 4]$],
    [y], [$arrow(w)=[5, 2]$],
    [su suma es], [$arrow(v)+arrow(w)=[3 + 5, 4+ 2] =[8,6]$],
)

Es decir, se deben sumar sus componentes

La norma de la suma de vectores no es igual a la suma de sus normas, es decir
$
  ||v+w|| eq.not ||v||+||w||
$
Ese caso solo ocurre si los vectores son paralelos

= Vectores paralelos
Dos vectores son paralelos si uno es un producto escalar del otro, por ejemplo:
#grid(
    columns: (auto, auto),
    [Si los vectores son], [$arrow(v)=[3, 4]$],
    [y], [$arrow(w)=[6, 8]$],
    [son paralelos, porque], [$2[3,4]=[6,8]$],
)

= Vectonres unitarios canónicos
Si un vector está en $RR^3$, tiene 3 vectores canónicos
$
  arrow(i) = [1,0,0]\
  arrow(j) = [0,1,0]\
  arrow(k) = [0,0,1]\
$


#pagebreak()

#show math.equation: block.with(fill: white, inset: 1pt)

#cetz.canvas(length: 20pt, {
  import cetz.draw: *

  set-style(
    mark: (fill: black, scale: 1),
    stroke: (thickness: 0.4pt, cap: "round"),
    // angle: (
    //   radius: 0.3,
    //   label-radius: .22,
    //   fill: green.lighten(80%),
    //   stroke: (paint: green.darken(50%))
    // ),
    content: (padding: 1pt)
  )

  grid((-10, -10), (10, 10), step: 1, stroke: gray + 0.5pt)

  // circle((0,0), radius: 1)

  line((-9, 0), (9, 0), mark: (end: "stealth"))
  content((), $ x $, anchor: "west")
  line((0, -9), (0, 9), mark: (end: "stealth"))
  content((), $ y $, anchor: "south")

  line((0, 0), (5, 8), mark: (end: "stealth"), stroke: 1pt)
  content((), $ (5,8) $, anchor: "west")

  for (x, ct) in ((-8, $ -8 $),(-7, $ -7 $),(-6, $ -6 $),(-5, $ -5 $),(-4, $ -4 $),(-3, $ -3 $),(-2, $ -2 $),(-1, $ -1 $),(1, $ 1 $),(2, $ 2 $),(3, $ 3 $),(4, $ 4 $),(5, $ 5 $),(6, $ 6 $),(7, $ 7 $),(8, $ 8 $)) {
    line((x, 3pt), (x, -3pt))
    content((), anchor: "north", ct)
  }

  for (y, ct) in ((-8, $ -8 $),(-7, $ -7 $),(-6, $ -6 $),(-5, $ -5 $),(-4, $ -4 $),(-3, $ -3 $),(-2, $ -2 $),(-1, $ -1 $),(1, $ 1 $),(2, $ 2 $),(3, $ 3 $),(4, $ 4 $),(5, $ 5 $),(6, $ 6 $),(7, $ 7 $),(8, $ 8 $)) {
    line((3pt, y), (-3pt, y))
    content((), anchor: "east", ct)
  }

  // Draw the green angle
  // cetz.angle.angle((0,0), (1,0), (1, calc.tan(30deg)),
  //   label: text(green, [#sym.alpha]))

  // line((0,0), (1, calc.tan(30deg)))

  // set-style(stroke: (thickness: 1.2pt))

  // line((30deg, 1), ((), "|-", (0,0)), stroke: (paint: red), name: "sin")
  // content(("sin.start", 50%, "sin.end"), text(red)[$ sin alpha $])
  // line("sin.end", (0,0), stroke: (paint: blue), name: "cos")
  // content(("cos.start", 50%, "cos.end"), text(blue)[$ cos alpha $], anchor: "north")
  // line((1, 0), (1, calc.tan(30deg)), name: "tan", stroke: (paint: orange))
  // content("tan.end", $ text(#orange, tan alpha) = text(#red, sin alpha) / text(#blue, cos alpha) $, anchor: "west")
})
