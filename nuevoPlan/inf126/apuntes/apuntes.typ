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
#set grid(inset: 0.6em)
#import "@preview/cetz:0.3.2"
#show grid: g => align(center, g)
= INF 126 - Cálculo 2a

== Ponderación 

#block(
grid(
    columns: (auto, auto, auto),
    inset: 0.5em,
    row-gutter: 0pt,
    stroke: 0.1em + black,
    [1er parcial], [30 puntos], [Sábado 29 de marzo],
    [2do parcial], [30 puntos], [Sábado 17 de mayo],
    [Exámen final], [30 puntos], [Sábado 21 de junio],
    [Prácticas], [10 puntos], [],
    [Exámen segundo turno], [100 puntos], [Miércoles 25 de junio],
))
El exámen de segundo turno solo aplica a partir de los 35 puntos

== Auxiliar
76267371\
Auxiliar Alexander
#pagebreak()

= Norma 
La norma de un vector $v$ se escribe $||v||$ e indica el tamaño del vector
#grid(
    columns: (auto, auto),
    align: (right + horizon, left + horizon),
    [Si el vector es], [$arrow(v)=[a, b]$],
    [su norma es], [$||v||=sqrt(a^2 + b^2)$],
)

= Vectores unitarios
Son vectores $v$ tal que su norma $||v|| = 1$\
Ejemplo: 

#grid(
    columns: (auto, auto),
    align: (right + horizon, left + horizon),
    [Si el vector es], [$
    arrow(v)=[3, 4]$],
    [su norma es], [$||v||=sqrt(3^2 + 4^2)$],
    [], [$||v||=sqrt(25)=5$],
)

Por lo tanto, $arrow(v)=[3, 4]$ no es un vector unitario
Algunos vectores unitarios son $arrow(v)=[0, 1]$, $arrow(v)=[1, 0]$, que son los vectores canónicos

= Descomposición de vectores
Sea un vector $arrow(v)=[a, b]$, se puede descomponer por: $[a, b] = [a, 0] + [0, b] = a[1,0]+b[0,1]$

Un vector $v$ está dado por $arrow(v)= [cos theta, sin theta]$. Donde $theta$ es el ángulo que forman las componentes del vector tomando como referencia el centro del plano cartesiano

= Suma de vectores
#grid(
    columns: (auto, auto),
    align: (right + horizon, left + horizon),
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
    align: (right + horizon, left + horizon),
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

= Producto interior o escalar
#grid(
    columns: (auto, auto),
    align: (right + horizon, left + horizon),
    [Si el vector vectores es], [$arrow(v)=[v_1, v_2, v_3]$],
    [y el escalar es], [$x=x$],
    [el producto escalar es], [$x dot arrow(v)=[x v_1,x v_2,x v_3]$],
)

= Producto cruz o vectorial 
#grid(
    columns: (auto, auto),
    align: (right + horizon, left + horizon),
    [Si los vectores son], [$arrow(v)=[v_1, v_2, v_3]$],
    [y], [$arrow(w)=[w_1, w_2, w_3]$],
    [el producto vectorial es], [$arrow(v) dot arrow(w)=v_1 w_1 + v_2 w_2 + v_3 w_3$],
)

= Propiedades con el ángulo entre vectores
#grid(
    columns: (auto, auto),
    align: (right + horizon, left + horizon),
    [El ángulo $theta$ entre dos vectores debe estar entre $0$ y $pi$], [$0 lt.eq theta lt.eq pi$],
    [Relación de normas y el ángulo], [$||v-w||^2 = ||w||^2 + ||v||^2 = ||v|| dot||w|| cos theta$],
    [Definición del coseno], [$cos theta=frac(v dot w, ||v||dot||w||) $]
)

$$

= Desigualdad de Cauchy-Schwarz
$
  forall v,w in RR^n, w eq.not 0\
  |v dot w| lt.eq ||v|| dot ||w||
$