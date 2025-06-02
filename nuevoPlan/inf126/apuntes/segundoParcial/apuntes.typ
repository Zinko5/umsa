#set page(
  margin: (x: 2.5cm, y: 2.5cm) //Para trabajos digitales e impresos simples
  // margin: (left: 3.8cm, y: 2.5cm, right: 2.5cm) //Para trabajos impresos a doble cara
)
#set text(lang:"es")
#set text(font: "DejaVu Sans")
#show math.equation: set text(font: "DejaVu Math TeX Gyre")
#set par(justify: true)
#show math.equation:box
// #show grid:box
// #set grid(inset: 0.6em)
// #import "@preview/cetz:0.3.2"
// #show grid: g => align(center, g)
#let nor(a) = $lr(bar.v.double #a bar.v.double)$
#let vec(..args) = {
  let components = args.pos()
  let n = components.len()
  if n == 2 {
    $lr(angle.l #components.at(0), #components.at(1) angle.r)$
  } else if n == 3 {
    $lr(angle.l #components.at(0), #components.at(1), #components.at(2) angle.r)$
  } else {
    panic("La función vector debe recibir 2 o 3 parámetros, pero recibió " + str(n))
  }
}
#let ejercicio(..args) = {
  let (enunciado, resolucion, conclusion) = if args.pos().len() == 1 {
    (none, args.pos().at(0), none)
  } else if args.pos().len() == 2 {
    (args.pos().at(0), args.pos().at(1), none)
  } else {
    (args.pos().at(0), args.pos().at(1), args.pos().at(2))
  }

  block(width: 100%, breakable: false, [
    #if enunciado != none {
      align(left)[#h(1em)#enunciado]
    }
    #align(center)[#resolucion]
    #if conclusion != none {
      align(left)[#text(size: 0.8em)[#h(1em)#emph[#conclusion]]]
    }
  ])
}

= INF 126 - Cálculo 2.

== Ponderación.

#block(
grid(
    columns: (auto, auto, auto),
    inset: 0.5em,
    row-gutter: 0pt,
    stroke: 0.1em + black,
    [1er parcial.], [30 puntos.], [Sábado 29 de marzo.],
    [2do parcial.], [30 puntos.], [Sábado 17 de mayo.],
    [Exámen final.], [30 puntos.], [Sábado 21 de junio.],
    [Prácticas.], [10 puntos.], [],
    [Exámen segundo turno.], [100 puntos.], [Miércoles 25 de junio.],
))
El exámen de segundo turno solo aplica a partir de los 35 puntos.

== Auxiliar.
76267371.\
Auxiliar Alexander.
#pagebreak()


#set heading(numbering: "1.")

= Función vectorial.
Es igual a una función normal, pero en vez de tener un número como variable independiente, tiene un vector.\
Para evaluar un punto, se reemplazan las variables por los componentes del vector.\
El dominio son todos los valores que pueden ingresar en la funcion\
El rango son todos los valores que pueden salir de la funcion
= Límites de dos variables.
Primero se prueba evaluando el límite en el punto.\
Si el límite converge hacia 0, se puede reemplazar por coordenadas polares.\
$
  lim_((x,y)arrow (0,0)) f(x,y) = lim_(r arrow 0) f(r cos(theta), r sin(theta))\
  x=r cos(theta)\
  y=r sin(theta)\
$
Si no se puede, se prueba con el límite por caminos.\
Si el límite por caminos es distinto, el límite no existe.\
== Propiedades trigonométricas.
$
  sin(x) approx x\
  sin^2(x) approx x^2\
  cos(0) = 1\
  sin(0) = 0\
  cos(pi/2) = 0\
  sin(pi/2) = 1\
  cos(pi) = -1\
  sin(pi) = 0\
  sin(pi/4)=cos(pi/4)=sqrt(2)/2=1/sqrt(2)
  cos^2(x) + sin^2(x) = 1\
$