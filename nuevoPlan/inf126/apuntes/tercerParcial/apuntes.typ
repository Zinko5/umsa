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

= Integrales dobles.
Una integral dobla calcula el volumen sobre una región $R$.

= Integrales dobles sobre regiones generales.
== Definir el tipo de región.
Para regiones que no sean cuadradas ni rectangulares.\
La integral doble se puede dividir en dos integrales sencillas. \
La región $R$ de una integral doble puede estar limitada, las regiones se pueden clasificar como:\
=== Región verticalmente simple.
Una región $R$ es verticalmente simple si es definida por los puntos 
$
  (x,y) arrow f_1(x)lt.eq y lt.eq f_2(x)\
  a lt.eq x lt.eq b  
$
Donde a y b son los límites horizontales, se pueden calcular con \

=== Región horizontalmente simple.
Una región $R$ es horizontalmente simple si es definida por los puntos 
$
  (x,y) arrow f_1(y)lt.eq x lt.eq f_2(y)\
  c lt.eq y lt.eq d
$
Donde c y d son los límites verticales\
== Procedimiento para cada tipo de región.
- Si $R$ es verticalmente simple, se debe integrar primero con respecto a $y$ desde $a$ a $b$\
- Si $R$ es horizontalmente simple, se debe integrar primero con respecto a $x$ desde $c$ a $d$\
- Si $R$ es tanto horizontalmente como verticalmente simple, se puede hacer de cualquiera de las dos maneras\

#pagebreak()
$
  y=x^2\
  y=x
$
\
$
  f_1(x)=x^2\
  f_2(x)=x\
$
\
$
  
  f_1(y)=sqrt(y)\
  f_2(y)=y\ \
  sqrt(y) lt.eq x lt.eq y\
  0 lt.eq y lt.eq 1\

  \
  integral.double_R d A= integral_0^1(integral_(sqrt(y))^y x y d x)d y\
  integral_(sqrt(y))^y x y d x=y integral_(sqrt(y))^y x d x=y(x^2/2 lr(|, size:#300%)_(x=sqrt(y))^(x=y)) \
  lr(4 x 4] integral, size:#700%)\
  lr(a b c mid(integral) d e, size:#200%)
$

