#set page(
  margin: (x: 2.5cm, y: 2.5cm) //Para trabajos digitales e impresos simples
  // margin: (left: 3.8cm, y: 2.5cm, right: 2.5cm) //Para trabajos impresos a doble cara
)
#set text(lang:"es")
#set text(font: "DejaVu Sans")
#show math.equation: set text(font: "DejaVu Math TeX Gyre")
#set par(justify: true)
#show math.equation:box
#let separador() = align(center)[#line(length: 100%)]
#let nor(a) = $lr(bar.v.double #a bar.v.double)$
#let mag(a) = $lr(bar.v.double #a bar.v.double)$
#let det(a, b, c, d, e, f, g, h, i) = {
  $lr(|#grid(
    columns: (auto, auto, auto),
    inset: 3pt,
    [$#a$], [$#b$], [$#c$],
    [$#d$], [$#e$], [$#f$],
    [$#g$], [$#h$], [$#i$]
  )|)$
}
#let matriz(a, b, c, d, e, f, g, h, i) = {
  $(#grid(
    columns: (auto, auto, auto),
    inset: 3pt,
    [$#a$], [$#b$], [$#c$],
    [$#d$], [$#e$], [$#f$],
    [$#g$], [$#h$], [$#i$]
  ))$
}
#let ejem(..args) = {
  let elements = args.pos()
  let first = elements.map(term => $#term _1$).join(" + ")
  let last = elements.map(term => $#term _n$).join(" + ")
  $ (#first, dots, #last) $
}

= INF 126 - Cálculo 2.
#outline()
#pagebreak()

#set heading(numbering: "1.")
 
= Propiedades útiles.

$
  forall a,b,x,y in RR
$
- Definición de logaritmo:
$
  log_a x= y arrow.double.l.r x=a^y
$
- Propiedades del logaritmo:
$
  ln e = 1
$
- Simetría de la ecuación:
$
  forall x,y in RR\
  x=y\
  arrow.double\
  f(x)=f(y)\
  "ejemplos:"\
  x=y\
  arrow.double\
  x+a=y+a\
  x^2=y^2\
  abs(x)=abs(y)\
  forall x,y in RR : x,y gt.eq 0\
  x=y\
  arrow.double\
  sqrt(x)=sqrt(y)\
  sqrt(x^2)=sqrt(y^2)
$
- Raiz cuadrada:
$
  sqrt(x^2)=abs(x)
$
- Diferencia de cosenos:
$
  cos a - cos b = -2 sin((a+b)/2) sin((a-b)/2)
$ 
== Identidades trigonométricas.
#align(center)[#image("magic-hexagon-hdr.png", width: 35%)]
$
  tan (theta)=(sin (theta))/(cos (theta))=(sec (theta))/(csc (theta))\
  sin (theta)=(cos (theta))/(cot (theta))=(tan (theta))/(sec (theta))\
  cos (theta)=(cot (theta))/(csc (theta))=(sin (theta))/(tan (theta))\
  cot (theta)=(csc (theta))/(sec (theta))=(cos (theta))/(sin (theta))\
  csc (theta)=(sec (theta))/(tan (theta))=(cot (theta))/(cos (theta))\
  sec (theta)=(tan (theta))/(sin (theta))=(csc (theta))/(cot (theta))
$
Porque la primera función al lado es el dividendo y la segunda, el cociente.

#align(center)[#line(length: 100%)]

$
  tan (theta) dot cot (theta)=1\
  sin (theta) dot csc (theta)=1\
  cos (theta) dot sec (theta)=1
$
Porque el producto con la función de al frente es uno.

#align(center)[#line(length: 100%)]

$
  tan (theta) dot cos (theta)=sin (theta)\
  sin (theta) dot cot (theta)=cos (theta)\
  cos (theta) dot csc (theta)=cot (theta)\
  cot (theta) dot sec (theta)=csc (theta)\
  csc (theta) dot tan (theta)=sec (theta)\
  sec (theta) dot sin (theta)=tan (theta)
$
Porque el producto de dos funciones separadas por otra, es esa función que las separa.

#align(center)[#line(length: 100%)]

$
  tan (theta)=1/(cot (theta))\
  sin (theta)=1/(csc (theta))\
  cos (theta)=1/(sec (theta))\
  cot (theta)=1/(tan (theta))\
  csc (theta)=1/(sin (theta))\
  sec (theta)=1/(cos (theta))\
$
Porque la función de enfrente es la función recíproca.

#align(center)[#line(length: 100%)]

$
  sin (theta) = cos(90 degree - theta)\
  cos (theta) = sin(90 degree - theta)\
  tan (theta) = cot(90 degree - theta)\
  cot (theta) = tan(90 degree - theta)\
  sec (theta) = csc(90 degree - theta)\
  csc (theta) = sec(90 degree - theta)\
$
Porque la función apuntando exactamente a su derecha o izquierda es la función a la que apunta pero restada con noventa grados.

#align(center)[#line(length: 100%)]

$
  sin^2 (theta)+cos^2 (theta)=1\
  1+cot^2 (theta)=csc^2 (theta)\
  tan ^2 (theta)+1=sec^2 (theta)
$
Porque cuando hay una dupla de funciones que con el uno forman un triángulo apuntando abajo, el valor al cuadrado del de abajo es igual a la suma de los otros valores al cuadrado.

// == Integrales notables.
// === Integrales notables trigonométricas.
== Geometría.
=== Triángulo.
$
  forall a,b,c in RR
$
- Desigualdad trinagular:
$
  a+b gt.eq c\
  a+c gt.eq b\
  b+c gt.eq a
$
- Triángulo rectángulo:
$
  a^2+b^2=c^2\
$

= Axiomas de los números reales.
$
  forall a,b,c in RR:
$
== Axiomas de la suma
$
  a+b in RR quad "cerradura"\
  (a+b)+c=a+(b+c) quad "asociatividad"\
  a + b = b + a quad "conmutatividad"\
  a+0=a quad "elemento neutro"\
  a+(-a) = 0 quad "elemento inverso"
$
== Axiomas de la multiplicación
$
  a dot b in RR quad "cerradura"\
  (a dot b) dot c = a dot (b dot c) quad "asociatividad"\
  a dot b = b dot a quad "conmutatividad"\
  a dot 1 = a quad "elemento neutro"\
  a dot 1/a = 1 quad "elemento inverso"\
  a dot (b+c)=a dot b + a dot c quad "distributividad"
$

= Funciones
- Una relación es un subconjunto del producto cartesiano de dos conjuntos
- Una función es una relación de dos conjuntos, omitiendo la relación del subconjunto vacío

Sean dos conjuntos $A$ y $B$, su cardinalidad significa la cantidad de elementos de cada conjunto, y se anota $\#(A)$ y $\#(B)$

Si $\#(A)=n, \#(B)=m$, la cantidad de relaciones de $A times B$ es $2^(n m)$, y la cantidad de funciones es $A times B$ es $2^(n m)-1$

Una función inyectiva significa que cada elemento del conjunto $B$ tiene como máximo una pareja del conjunto $A$.

= Límites.
== Definición y reglas.
$
forall x,a,l in RR\
  lim_(x arrow a)f(x)= l\
  arrow.double.l.r\
  // forall epsilon gt 0, exists! delta gt 0: |f(x)-l| lt epsilon "cuando" |x-a| lt delta
  forall epsilon gt 0, exists! delta gt 0: |f(x)-l| lt epsilon arrow |x-a| lt delta\ \
  forall x,a,b in RR\
  lim_(x arrow a)b=b\
  lim_(x arrow a)x=a\
  lim_(x arrow infinity)a/x=0\
$

// propiedades limites y funciones
// limite constante constante
// limite constante por funcion - sale la constante 
// limite suma - el limite se reparte
// limite del cociente cociente de limites con el cociente de abajo diferente de 0

// derivada constante es 0
// derivava de una suma - suna de Derivadas
// derivava de restada
// derivava FUNCION por constanta sale la contstant
// derivava de un producto el primero sin segundo + segundo sin primero
// derivava del cociente


// el limite si existe debe ser unico
// 
// limites y desrivadsa notables

== Modelos para cada indeterminación.
Cuando se encuentra una inderterminación al evaluar un límite, se resuelve por distintos modelos según cada tipo de inderterminación: 

- $0/0$.- factorizar (transformar la expresión a productos de expresiones). Ver si existe con límites laterales.

- $infinity/infinity$.- cocientar entre la variable elevada a la $n$ ($x^n$) donde $n$ es la mayor potencia. Tener cuidado al identificar la mayor potencia, pues la variable puede estar dentro de una raiz

- $infinity - infinity$.- factorizar para transformar a una indeterminación de $0/0$ o $infinity/infinity$.

- $1^infinity$.- converge a una de dos opciones:

 - $lim_(x arrow infinity) (1+1/x)^x=e$

 - $lim_(x arrow 0) (1+x)^(1/x)=e$

Una función es continua cuando el límite lateral izquierdo es igual al límite lateral derecho en todos los puntos de la función.

== Límites notables no trigonométricos.
$
  forall x,a,b in RR\

  lim_(x arrow 0)(e^x-1)/x=1\
  lim_(x arrow 0^+)(ln(1+x))/x=1\
  lim_(x arrow 0)(1+x)^(1/x)=e\
  lim_(x arrow 0)((1+x)^a-1)/(x)=a\
  // lim_(x arrow 1)(x^n-1)/(x-1)=n\
  // lim_(x arrow infinity)(ln(x))/(x^a)=0\
  lim_(x arrow infinity)(1+a/x)^x=e^a\
  lim_(x arrow infinity)(1+1/x)^(a x)=e^a\
  lim_(x arrow infinity)(x^a ln(x))=0 quad (a lt 0)
$

== Límites notables trigonométricos.
$
  forall x,a in RR\
  lim_(x arrow 0)(sin(x))/x=1\
  lim_(x arrow 0)(1-cos(x))/x=0\
  lim_(x arrow 0)(1-cos(x))/x^2=1/2\
  lim_(x arrow 0)(tan(x))/x=1\
  lim_(x arrow 0)(arcsin(x))/x=1\
  lim_(x arrow 0)(arctan(x))/x=1\
  lim_(x arrow 0)(arccos(1-x))/x=1\
$

= Derivadas
== Definición y reglas.
$
  forall f,g in C^1; x,a,c in RR\
   d/(d x)=(d f)/(d x)= f'= (diff f)/(diff x)=f_x=lim_(h arrow 0)(f(x+h)-f(x))/(h)\ \
   (d )/(d x)c=0\
   (d )/(d x)(c f(x))=c f'(x)\
   (d )/(d x)(x^a)=a x^(a-1)\
   (d )/(d x)(f(x) plus.minus g(x))=f'(x)plus.minus g'(x)\
   (d )/(d x)(f(x) g(x))=f'(x) g(x)+f(x) g'(x)\
   (d )/(d x)(f(x) / g(x))=(f'(x) g(x) - f(x) g'(x))/(g(x))^2 quad quad g(x) eq.not 0\
   (d )/(d x)(sqrt(x))=1/(2 sqrt(x))\
   (d )/(d x)(root(a,x))=1/(a root(a,x^(a-1)))
$

La derivada sirve para encontrar propiedades de las funciones, como los puntos críticos, mínimos o silla.

La derivada es la pendiente de una curva en un punto específico.

== Derivadas notables no trigonométricas.
$
  forall f,g in C^1; x,a,c in RR\
  (d)/(d x)(e^x)=e^x\
  // (d)/(d x)(e^(x+a))=e^x (a)'\
  (d)/(d x)(a^x)=a^x ln(a) quad quad a gt 0, a eq.not 1\
  d/(d x)(ln|x|)=1/x quad quad x eq.not 0\
  d/(d x)(log_a|x|)=1/(x ln(a)) quad quad x eq.not 0, a eq.not 1, a gt 0\
  d/(d x)(f^(-1)(x))=1/(f'(f^(-1)(x)))
$

== Derivadas notables trigonométricas.
$
  forall f,g in C^1; x,a,c in RR\
  d/(d x) sin(x)=cos(x)\
  d/(d x) cos(x)=-sin(x)\ 
  \
  d/(d x) tan(x)=sec^2(x)\
  d/(d x) sec(x)=tan(x)sec(x)\ 
  \
  d/(d x) cot(x)=-csc^2(x)\
  d/(d x) csc(x)=-cot(x)csc(x)\ 
  \ 
  separador()
  \
  d/(d x) sin^(-1)(x)=1/(sqrt(1-x^2))\
  d/(d x) cos^(-1)(x)=-1/(sqrt(1-x^2))\
  \
  d/(d x) tan^(-1)(x)=1/(1+x^2)\
  d/(d x) cot^(-1)(x)=-1/(1+x^2)\
  \
  d/(d x) sec^(-1)(x)=1/(abs(x) sqrt(x^2-1))\
  d/(d x) csc^(-1)(x)=-1/(abs(x) sqrt(x^2-1))\
$


= Integrales

= Curvas.
Una curva (recta) se puede clafificar según su relación con otra curva:
- *Exterior*.- no se cortan con la curva.
- *Secante*.- se cortan con la curva en dos o más lugares.
- *Tangente*.- se corta con la curva en un único lugar.