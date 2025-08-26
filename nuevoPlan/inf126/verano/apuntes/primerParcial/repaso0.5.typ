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

== Temario.
+ Vectores.
+ Geometría sólida.
+ Límites en varias variables.
+ Derivadas en $R$.
  + Aplicaciones
+ Integrales
  + Aplicaciones
+ Series y sucesiones.

#set heading(numbering: "1.")

= Escalar.
Un escalar es un número $x in RR$.

= Vector.
Un vector $v$ es una recta en el espacio. Un vector no es lo mism que una recta.\
En el plano cartesiano (dos dimensiones) tiene dos componentes, $v=vec(a,b)$.\
Se representa en una sistema de coordenadas; en el plano cartersiano, partiendo desde el origen $(0,0)$ hasta el punto $(a,b)$.\
Se describe por los parametros magnitud (un escalar) y dirección (un ángulo).

= Norma o magnitud.
La norma de un vector $v$ se escribe $nor(v)$ e indica el tamaño del vector.
#ejercicio(
  [Definición de norma:],
  [$
     v=vec(a,b)\
     nor(v)=sqrt(a^2+b^2)
   $],
   [Da como resultado un escalar.]
)
La norma de la suma de vectores no es igual a la suma de sus normas, es decir
#ejercicio(
  [$
    nor(v+w) eq.not nor(v)+nor(w)
   $]
)
Ese caso solo ocurre si los vectores son paralelos

= Dirección.
En un plano cartesiano, la dirección es el ángulo $theta$ que forma un vector $v=vec(a,b)$ respecto al eje x positivo.
#ejercicio(
  [Definición de ángulo:],
  [$
     theta=arctan(b/a)
   $]
)
Siguiedo las reglas:
== Si $a gt 0$:
Si $b gt.eq 0$: Sin modificaciones.\
Si $b lt 0$:Suma $360^degree$ al resultado
== Si $a lt 0$:
Suma $180^degree$ al resultado
== Si $a = 0$:
Si $b gt 0$: El resultado es $90^degree$.\
Si $b lt 0$: El resultado es $270^degree$.\

= Operaciones básicas con vectores.
== Entre un vector $v=vec(a,b)$ y un escalar $x in RR$.
#ejercicio(
  [Definición de multiplicacion por un escalar:],
  [$
     x v= x vec(a,b)=vec(a x,b x)\
   $],
   [Da como resultado un vector, que mantiene la dirección de $v$.]
)
#ejercicio(
  [Definición de división por un escalar:],
  [$
     v/x=frac(vec(a,b),x)=vec(a/x,b/x)
   $],
   [Da como resultado un vector, que mantiene la dirección de $v$.]
)

== Entre dos vectores.
Sean $v_1=vec(a_1,b_1)$ y $v_2=vec(a_2,b_2)$:
#ejercicio(
  [Definición de suma de vectores:],
  [$
     v_1+v_2\
     =vec(a_1,b_1)+vec(a_2,b_2)\
     =vec(a_1+a_2,b_1+b_2)
   $],
   [Da como resultado un vector.]
)
#ejercicio(
  [Definición de resta de vectores:],
  [$
     v_1-v_2\
     =vec(a_1,b_1)-vec(a_2,b_2)\
     =vec(a_1-a_2,b_1-b_2)
   $],
   [Da como resultado un vector.]
)
#ejercicio(
  [Definiciones de producto escalar, producto interior producto punto:],
  [$
     v_1 dot v_2 = a_1a_2+b_1b_2\
     v_1 dot v_2 = nor(v_1)nor(v_2)cos theta\
   $],
   [Donde $theta$ es el ángulo entre $v_1$ y $v_2$. Da como resultado un escalar.]
)
#ejercicio(
  [Definición de producto vectorial o producto cruz en dos dimensiones:],
  [$
     v_1 times v_2 = a_1b_2-a_2b_1\
   $],
   [Da como resultado un escalar.]
)
Sean $v_1=vec(a_1,b_1,c_1)$ y $v_2=vec(a_2,b_2,c_2)$:
#ejercicio(
  [Definición de producto vectorial o producto cruz en tres dimensiones:],
  [$
     v_1 times v_2 = vec(a_1c_2-c_1b_2,-(a_1c_2-c_1a_2),a_1b_2-b_1a_2)\
   $],
   [Da como resultado un vector que es perpendicular a $v_1$ y $v_2$.]
)
== Producto mixto o triple producto escalar
#ejercicio(
  [Definición de triple producto escalar],
  [$
     u dot (v times w)\
     ="det "(#grid(
      columns: (auto, auto, auto),
      inset:3pt,
      [$u_1$],[$u_2$],[$u_3$],
      [$v_1$],[$v_2$],[$v_3$],
      [$w_1$],[$w_2$],[$w_3$]
     ))
   $]
)

= Vectores unitarios.
Son vectores $v$ tal que su norma $nor(v) = 1$\.
#ejercicio(
  [Definición de vector unitario:],
  [$
     v=vec(a,b)\ 
     nor(v)=sqrt(a^2+b^2)=sqrt(1)=1
   $]
)

= Nomalización.
Es el proceso de convertir un vector $v$ cualquiera, a otro vector $arrow(v)$ con la misma dirección que $v$ pero con norma igual a uno $nor(arrow(v))=1$; es decir, unitario.
#ejercicio(
  [Definición de normalización:],
  [$
     "sea" v=vec(a,b)\
      arrow(v)=frac(v,nor(v))
   $]
)

= Vectores canónicos
Todo vector en dos dimensiones ($RR^2$) tiene 2 vectores canónicos.
$
  i = vec(1,0)\
  j = vec(0,1)\
$

= Descomposición de vectores
Un vector se puede descomponer por sus vectores canónicos.
#ejercicio(
  [$ 
    v=vec(a,b)\
    =vec(a,0)+vec(0,b)\
    =a vec(1,0)+b vec(0,1)\
    =a i+b j
 $]
)

= Vectores paralelos
Dos vectores son paralelos si uno es un producto escalar del otro.
#ejercicio(
  [Definición de vectores paralelos:],
  [$
     v_1=vec(a_1,b_1)\
     v_2=vec(a_2,b_2)\
     x in RR\
     "Son paralelos si" x v_1=v_2
   $]
)

= Vectores ortogonales
Dos vectores son ortogonales (perpendiculares) si su producto escalar es cero
#ejercicio(
  [Definición de vectores ortogonales:],
  [$
     v_1 dot v_2=0 \
     nor(v_1)nor(v_2)cos theta=0
   $],
   [Se cumple siempre que $theta=90^degree$]
)

= Propiedades de vectores
#ejercicio(
  [Desigualdad del triángulo:],
  [$
     nor(v_1+v_2)lt.eq nor(v_1)+nor(v_2)
   $]
)
#ejercicio(
  [Vector que se forma entre los puntos $p_1=(a_1,b_1)$ y $p_2=(a_2,b_2)$:],
  [$
     v=p_2-p_1\
     =vec(a_2-a_1,b_2-b_1)
   $]
)
#ejercicio(
  [Distancia $D$ entre los puntos $p_1=(a_1,b_1)$ y $p_2=(a_2,b_2)$:],
  [$
     v=p_2-p_1\
     D=nor(v)\
   $]
)
#ejercicio(
  [Componentes a partir de medidas:],
  [$
     "Magnitud:" nor(v)", dirección:" theta\
     v=vec(nor(v)cos theta, nor(v)sin theta)
   $]
)
#ejercicio(
  [Punto medio entre dos puntos:],
  [$
     (a_1,b_1)", "(a_2,b_2)\
     M=(frac(a_1+a_2,2),frac(b_1+b_2,2))
   $]
)
#ejercicio(
  [Norma del producto vectorial:],
  [$
     nor(u times v)=nor(u)nor(v)sin theta
   $],
   [Siendo $theta$ el ángulo que forman los vectores.]
)
#ejercicio(
  [Paralelogramo a partir de cuatro puntos:],
  [$
     A, B, C, D\
     "Si se cumple que" A+arrow(A D)+arrow(A C)=B\
     "O que" A+arrow(A B)+arrow(A D)=C\
     "O que" A+arrow(A B)+arrow(A C)=D\
   $],
   [Entonces los cuatro puntos forman un paralelogramo con $arrow(A X)$ y $arrow(A Y)$ como lados adyacentes.]
)
#ejercicio(
  [Área del paralelogramo con lados adyacentes igual a los vectores $v$ y $u$:],
  [$
     A=nor(u times v)
   $]
)
#ejercicio(
  [Paralelepípedo a partir de ocho puntos:],
  [$
     A, B, C, D, E, F, G, H\
     "Si se cumple que:"\
     A+u=B\
     A+v=C\
     A+w=D\
     A+u+v=E\
     A+u+w=F\
     A+v+w=G\
     A+u+v+w=H\
     "Probar con" u= arrow(A U)", " v= arrow(A V)" y "w= arrow(A W)
   $],
   [Siendo U, Y y W cualquier punto; u, v y w deben ser linealmente independientes. Entonces los ocho puntos forman un paralelepípedo con $u$, $v$ y $w$ como aristas adyacentes.]
)
#ejercicio(
  [Volumen del paralelepípedo con aristas adyacentes $u$, $v$ y $w$:],
  [$
     V=u dot (v times w)
   $]
)
= Proyección ortogonal
La proyección ortogonal de un vector $u$ sobre otro vector $v$ es un vector que tiene la misma dirección que $v$ con una magnitud determinada de qué tanto $u$ apunta a esa dirección.
#ejercicio(
  [Definición de proyección ortogonal:],
  [$
     "proj"_v u=v(frac(u dot v,nor(v)^2))
   $]
)

= Propiedades de la proyección ortogonal
#ejercicio(
  [Componente $w_1$ de un vector $u$ paralelo a un vector $v$],
  [$f\
     w_1 = "proj"_v u
    $]
)
#ejercicio(
  [Componente $w_2$ de un vector $u$ ortogonal a un vector $v$],
  [$
     w_2 = u-"proj"_v u
    $]
)
= Recta en tres dimensiones
Una recta en el sistema de coordenadas de tres dimensiones no tiene un punto de inicio ni fin, o sea que mientras que está atravesando infinitos puntos. \
Una recta se puede describir con un punto al que atraviesa, un ángulo y una variable $t$, que representa cualquier punto que esa recta atraviera. El ángulo es la dirección de un vector, conocido como el vector director.\
La recta puede escribirse con ecuaciones paramétricas o en forma vectorial.

#ejercicio(
  [Definición de recta con ecuaciones paramétricas:],
  [$
     x=p_1+v_1t\
     y=p_2+v_2t\
     z=p_3 +v_3t
   $],
   [Donde $p=(p_1, p_2, p_3)$ es el punto que atraviesa, y $v=vec(v_1,v_2,v_3)$ es el vector director.]
)
#ejercicio(
  [Definición de recta con forma vectorial:],
  [$
     r(t)=(p_1, p_2, p_3)+(v_1,v_2,v_3)t
   $],
   [Donde $p=(p_1, p_2, p_3)$ es el punto que atraviesa, y $v=vec(v_1,v_2,v_3)$ es el vector director.]
)
A partir de las ecuaciones paramétricas, se pueden formar las ecuaciones simétricas despejando $t$ e igualando cada término.
#ejercicio(
  [Definición de recta con forma vectorial:],
  [$
     x=p_1+v_1t arrow.long t=(x-p_1)/v_1\
     y=p_2+v_2t arrow.long t=(y-p_2)/v_2\
     z=p_3 +v_3 arrow.long t=(z-p_2)/v_2\
     t=(x-p_1)/v_1=(y-p_2)/v_2=(z-p_2)/v_2\
   $],
   [Donde $p=(p_1, p_2, p_3)$ es el punto que atraviesa, y $v=vec(v_1,v_2,v_3)$ es el vector director ]
)

