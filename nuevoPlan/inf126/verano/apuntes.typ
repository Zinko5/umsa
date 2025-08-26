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
#let det2x2(a, b, c, d) = {
  $lr(|#grid(
    columns: (auto, auto),
    inset: 3pt,
    [$#a$], [$#b$],
    [$#c$], [$#d$],
  )|)$
}
#let ejem(..args) = {
  let elements = args.pos()
  let first = elements.map(term => $#term _1$).join(" + ")
  let last = elements.map(term => $#term _n$).join(" + ")
  $ (#first, dots, #last) $
}

= INF 126 - Cálculo 2.

== Bibliografía.
- Calculus - Michael Spivak.
- Cálculo 2 - Álvaro pinzón.

== Temario.
+ Vectores.
+ Geometría sólida.
+ Límites en varias variables.
+ Derivadas en $R$.
  + Aplicaciones.
+ Integrales.
  + Aplicaciones.
+ Series y sucesiones.

== Ponderación
// #block(
#grid(
    columns: (auto, auto),
    inset: 0.5em,
    row-gutter: 0pt,
    stroke: 0.1em + black,
    [1er parcial.], [20],
    [2do parcial.], [20],
    [Exámen final.], [20],
    [Prácticas.], [30],
    [Asistencia.], [5],
    [Participación en Clases.], [5],
)
// #grid(
//     columns: (auto, auto),
//     inset: 0.5em,
//     row-gutter: 0pt,
//     stroke: 0.1em + black,
//     [1er parcial.], [20],
//     [2do parcial.], [20],
//     [Exámen final.], [8],
//     [Prácticas.], [42],
//     [Asistencia.], [5],
//     [Participación en Clases.], [5],
// )

#pagebreak()

#outline()

#pagebreak()


#set heading(numbering: "1.")

= Vectores en $RR^n$.
Un vector es un segmento de una recta que tiene un principio y un final. Para ser considerado un vector, debe tener una dirección, un sentido y una magnitud.\ Un espacio vectorial es un conjunto de vectores similares.

== Axiomas de vectores.
$
  forall A, B, C in RR^n and k, l, m, n in RR
$

=== Axiomas de la suma de vectores.
En $RR^n$, se cumplen también todos los axiomas de la suma en $RR$.

$
  A+B in RR^2 quad "cerradura"\
  (A+B)+C=A+(B+C)quad "asociatividad"\
  A+B=B+A quad"conmutatividad"\
  A+0=A quad "elemento neutro"\
  A+(-A)=0 quad "elemento inverso"\
$

=== Axiomas de la multiplicación con un escalar.
$
  k dot A in RR^n quad "cerradura"\
  (k dot l) dot A = k dot (l dot A) quad "asociatividad"\
  k dot A = A dot k quad "conmutatividad"\
  1 dot A = A quad "elemento neutro"\
  k dot (A + B)= k dot A + k dot B quad "distributividad de escalar a vectores"\
  (k + l) dot A = k dot A + l dot A quad "distributividad de vector a escalares"\
$
No aplica el elemento inverso.

=== Axiomas del producto escalar.
$
  A dot B in RR quad "cerradura"\
  (A dot B) dot C eq.not A dot (B dot C) quad "no se cumple la asociatividad"\
  A dot B = B dot A quad "conmutatividad"\
  A dot (B + C)=A dot B + A dot C quad "distributividad"
$
No se cumple el elemento neutro ni necesariamente el elemento inverso.

=== Axiomas del producto vectorial.
$
  forall A, B, C in RR^3:
  A times B in RR^3 quad "cerradura"\
  (A times B) times C eq.not A times (B times C) "no se cumple la asociatividad"\
  A times B = -(B times A) quad "anticonmutatividad"\
  A times (B + C)= A times B + A times C quad "distributividad"
$
No se cumplen el elemento neutro ni el elemento inverso.

== Demostraciones.
Para demostrar las propiedades, podemos usar dos tipos de demostaciones: Constructivas y deductivas. En las demostraciones constructivas, se debe agregar algo para llegar a la demostración.

Para las demostraciones deductivas se debe partir del lado de la ecuación más largo o con más información y hacer igualdades hasta llegar al resultado más corto.

== Operaciones con vectores.
=== Multiplicación por un escalar.
$
  forall n in RR and A in RR^n\
  n dot A:=n(a_1, dots, a_n) = (n dot a_1, dots, n dot a_n)
$
En una gráfica, el vector se deformará de una u otra forma dependiendo del valor del escalar $n$:
- Si $n gt 1$, se dilata.
- Si $0 lt n lt 1$, se contrae.
- Si $n lt 1$, se invierte.
La multiplicación por un escalar no cambia la dirección del vector.

=== Producto escalar
También llamado producto interior y producto punto.

$
  forall A,B in RR^n and theta in RR:\
  A=(a_1, a_2, dots, a_n)\
  B=(b_1, b_2, dots, b_n)\
  theta=A angle B;\
  A dot B:=sum_(i=1)^n a_i b_i=a_1b_1+a_2b_2+dots+a_n b_n\
  A dot B=||A||||B|| cos theta\
  A dot B = 0 arrow.double.r.l A perp B arrow.double.l.r theta = 90 degree\
  A dot A > 0\
  ||A||=sqrt(A dot A) arrow ||A||^2=A dot A
$

=== Producto vectorial
$
  forall A, B in RR^3:\
  A=(a_1, a_2, a_3)\
  B=(b_1, b_2, b_3);\
  A times B:= det(i,j,k,a_1,a_2,a_3,b_1,b_2,b_3)\
  mag(A times B)=mag(A)mag(B)sin theta\
  A times B = 0 arrow.double.l.r nor(A times B)=0 arrow.double.l.r A parallel B\
  A times A=0\
  \
  forall A, B in RR^3; x,y in RR\
  (x A) times (y B)=x y (A times B)
$

Area del paralelogramo: $||A times B||$ si $A$ y $B$ son dos lados adyacentes.

=== Triple producto vectorial:
$
  forall A,B,C in RR^n\
  A times (B times C)=(A dot C) B - (B dot A)C\
  (A times B)times C=(A dot C)B-(B dot C)A
$

== Magnitud.
También llamado norma o tamaño.
$
  forall A,B in RR^n and k,l in RR \
  nor(A):=sqrt(a_1^2+a_2^2+ dots + a_n^2)\
  nor(k l)=nor(l k)\
  ||A|| gt.eq 0 \
  ||A||=0 arrow.double.l.r A =0\
  forall A,B in RR^3,\
  nor(A times B)=nor(B times A)
$
Si el vector es un punto, entonces su magnitud es $0$.

== Vector unitario.
$
  forall A in RR^n \\-{0}, exists hat(A) : hat(A)=A/(||A||), ||hat(A)||=1
$

Es importante para efectos de aplicación tomar vectores unitarios para calcular la bisectriz (el vector que divide en dos partes iguales el ángulo entre dos vectores). Esta bisectriz $C$ se calcula por:
$
  C=(||a||b+||b||a)/(||a|| ||b||)
$

== Ángulo entre vectores.
$
  forall A,B in RR^n, theta, k in RR\
  sin theta=(||A times B||)/(||A||||B||)\
  cos theta=(A dot B)/(||A||||B||)\
  sin theta = 0 arrow.double.l.r A parallel B arrow.double.l.r A times B = 0\
  cos theta = 0 arrow.double.l.r A perp B arrow.double.l.r A dot B=0  \
  k A parallel A
$

== Vector proyección.
Definimos dos tipos de proyecciones vectoriales.
$
  forall a in RR^n, b in RR^n -{0}
$
- Proyección de A sobre B:
$
  "Proy"_b a:=((a dot b)/(||b||^2))b
$
- Proyección ortogonal de A sobre B:
$
  a-"proy"_b a:=a-((a dot b)/(||b||^2))b\ \
  "proy"_b a parallel b\
  (a-"proy"_b a) perp b\
  "proy"_b a dot b = a dot b\
  "proy"_b a = 0 arrow.double.l.r a perp b\
  "proy"_b a in RR^n
$

== Componente.
$
  forall a in RR^n, b in RR^n -{0}, theta in RR : theta= a angle b\
  "Comp"_b a=(a dot b)/(mag(b))=nor(a) cos theta\
  |"Comp"_b a|= nor("proy"_b a)\
  "Comp"_b a in RR
$

== Vector bisectriz.
$
  forall A,B in RR^n - {0}, C in RR^n, k in RR\
  "bisectriz"=C = k (hat(A) + hat(B))  = k(A/nor(A)+B/nor(B))
$

= Geometría analítica sólida.
La propiedad rígida de los cuerpos sólidos indica que sin importar el punto de referencia del cuerpo, este no se deformará.

Es el estudio de cuerpos geométricos en el espacio (lugares geométricos en $RR^3$). Tiene como fundamento estudiar dos tipos de problemas fundamentales, los cuales son:

- Dada la ecuación, encontrar la gráfica del lugar geométrico.
- Dada la gráfica, encontrar su ecuación.

Toda curva que todos los puntos que la integran cumplan una ley común, es un espacio geométrico

$
  forall P_i in C arrow d(P, C) = r
$

== La recta.
La recta es el lugar geométrico de puntos en el espacio que deben satifacer paralelamente las siguientes ecuaciones lineales:
$
  a_1 x+b_1 y + c_1 z + d_1=0\
  a_2 x + b_2 y + c_2 z + d_2 =0
$

La recta nace de la intersección de dos planos. 

Para hallar una recta o un segmento de esta, debemos resolver el sistema que se llega a generar, el cual con certeza será un sistema inconsistente, el cual para ser resuelto nos exigirá un proceso de parametrización.

=== Ecuaciones representativas de la recta.
Este lugar geométrico se lo puede representar bajo los siguientes criterios:
- Ecuación vectorial:
$
r=p_0+t dot A
$
_Donde $p_0=(0,0,0)$ es el punto por donde pasa la recta y $A$ es el vector director._
- Ecuación paramétrica:
$
  x=x_0+t A_x\
  y=z_0+t A_y\
  z=y_0+t A_z\
$
- Ecuación cartesiana:
$
  (x-x_0)/A_x=(y-y_0)/A_y=(z-z_0)/A_z
$

== El plano.
Es el lugar geométrico de puntos en el espacio los cuales deben satisfacer la siguiente ecuación lineal:
$
  forall N,p, p_0 in RR^n:\
  N=(A,B,C)\
  p=(x,y,z)\
  p_0=(x_0,y_0,z_0);\
  A x + B y + C z + D = 0\
  N perp (p-p_0) arrow.double.r.l N dot (p-p_0) =0
$
El vector $N$ es un vector perpendicular al vector $(p-_0p)$ y se lo llamará normal, también podemos decir que para establecer un plano como tal, deberíamos como característica suficiente conocer tres puntos de este cuerpo geométrico.\
$p$ es un punto cualquiera en el plano, $p_0$ es un punto dado.
=== Ecuaciones del plano.
En adelante considérese $p_0$ un punto del plano, $N$ la normal, entonces la ecuación vectorial está dada por:
$
  (p-p_0)N=0
$
Ecuación punto-normal:
$
  A (x-x_0) - B (y-y_0) + C (z-z_0)=0
$

#separador()

Ecuación reducida:
$
  x/a+y/b+z/c=1
$
Esta ecuación también se denomina simétrica puesto que los escalares $a,b,c$ resultan de intersectar el plano con los ejes coordenados respectivamente.

#separador()

Ecuacion del plano que pasa por tres puntos:\
$
  forall p,p_1,p_2,p_3 in RR^n\
  (p-p_1) dot [(p_2-p_1) times (p_3-p_1)]=0
$

=== Distancia de un punto al plano
Sea el plano en su forma general: $A x + B y + C z + D = 0$ y un punto $p_0=(0,0,0)$
$
  d=lr(||(A x_0+B y_0+C z_0+D)/sqrt(A^2+B^2+C^2)||)
$

= Límites en varias variables.
== Función de  varias variables.
Considerando las características que la función puede llegar a tener, estas pueden ser clasificadas de la siguiente manera:

- Funciones escalares de variable escalar.- estudiadas en cálculo 1.
- Funciones escalares de variable vectorial
- Funciones vectoriales de variable escalar
- Funciones vectoriales de variable vectorial.- $(x,y,z) arrow f(x,y,z)$

=== Funciones escalares de variable vectorial.
También denominadas funciones de varias variables. Una función escalar de variable vectorial puede ser de dimensiones diferentes (dimension $m$ que ahora pertenece al espacio $n$ dimensional).

Su estructura es la siguiente:
$
  f=f(r)\
  r=(x,y) in RR^2\
  r=(x,y,z) in RR^3\
  r= ejem(r) in RR^n
$

Usando otra notación para describir este tipo de funciones, en el caso de $RR^2$:

=== Definición general de función.
$
  forall ejem(x) in RR^n, exists! omega in RR : omega = f ejem(x)
$

Un instrumento importante para la parte operativa de la identificación de funciones hace referencia a los diagramas de Venn.

=== Ejemplo.
Tómense las siguientes funciones
$
  f(x,y)=x^2+y^2
$ 
Es una función, ya que cada imagen que saca es única y puede sacar una imagen para cada pareja del dominio.

#separador()

$
  f(x,y)=1/(x^2+y^2)
$ 
No una función, ya que aunque cada imagen que saca es única, no está definida para cada pareja del dominio. No está definida para $(0,0)$.

$log eq.not 0$

// ejercicios de dominios con dibujos como areas de circulos

#separador()

Sean $f ejem(x) and g ejem(x)$, aquí las operaciones entre funciones son:
$
  (f+g) ejem(x)=f ejem(x) + g ejem(x)\
  f g (r)=f(r)g(r)\
  (f/g) r=(f(r))/(g(r)):g eq.not 0\
  D=D_f inter D_g
$

En la notación vectorial, sea $f=(r); r in RR^n:r=(x_1(t),x_2(t), dots , x_3(t))$
$
  lim_(r arrow r_0) f(r)=(lim_(t arrow t_0) x(t)_1,lim_(t arrow t_0) x(t)_2, dots, lim_(t) x_n)
$
// con derivada e integral tambien, entran en cada coordenada del vector

== Definición de Límite.
$
  lim_(x arrow a)f(x)= l\
  arrow.double.l.r\
  forall epsilon gt 0, exists! delta gt 0: |f(x)-l| lt epsilon "cuando" |x-a| lt delta
$
// demostración de limites encontrando el delta
$
  forall epsilon >0 ,exists! delta gt 0 : |x^2-16| lt epsilon arrow |x-4| lt delta
$
// trabajar en la primera desigualdad (|x^2-16|) para encontrar lo que habia en el segundo valor absoluto (|x-4| lt delta)

// Tomar un parametro para delta, (delta=1)
// $
// delta=(epsilon)/x+4\
//   |x-4| lt 1\
//   x-4 gt -1 arrow x gt 3\
//   x-4 lt 1 arrow x lt 5\
  
// $
// encontrar delta =9 y el limite esta demostrado
// 

#separador()

$
  lim_((x,y)arrow (x_0,y_0) )f(x,y)=lim_(x arrow x_0) (lim_(y arrow y_0)f(x,y))=lim_(y arrow y_0) (lim_(x arrow x_0)f(x,y))
$

== Continuidad
Una función puede ser contínua en una región o en un punto, es contínua en una región si es contínua en todos los puntos de esa región.
- Conjunto de funciones continuas:
$
  C^0
$
- Conjunto de funciones continuas diferenciables:
$
  C^1
$
- Conjunto de funciones continuas y diferenciables dos veces:
$
  C^2
$
- Conjunto de funciones continuas y diferenciables varias veces:
$
  C^n
$
Definición de continuidad: $f(x,y) in C^0$

Una curva continua no necesariamente es diferenciable.

Propiedades:
$
  f(x,y) arrow B.D. quad "(es bien definida)"\
  f(x,y) exists\
  lim f(x,y)=f(x_0,y_0)
$
El límite existen cuando el límite lateral izquierdo y el límite lateral derecho existen y son iguales

#separador()

$
  forall f ejem(x) in C^n\
  diff/(diff x_i)f=(d f)/(d x_i)=f_x_i =f^'_x_i =lim_(h arrow 0)(f ejem(x+h)-f ejem(n))/h
$

= Derivada.
== Notación.
$
  forall f=f(x,y)\
  (diff^2f)/(diff x^2)=f x x\
  (diff^2f)/(diff x diff y)=f x y\
  (diff^2f)/(diff y^2)=f y y\
  (diff^2f)/(diff y diff x)=f y x\
  f x=(diff f)/(diff x)\
  \
  \
  \
  // x f_x=(diff f)/(diff x)
$

== Regla de la cadena.
$
 forall  f=f(x,y) and x=x(s), y=y(s)\
 (diff f)/(diff s)=(diff f)/(diff x)dot (diff x)/(diff s)+(diff f)/(diff y)dot (diff y)/(diff s)
$

Una clasificación de las funciones indica que estas pueden ser implícitas o explícitas.

*Explícita:*
$z=f(x,y)$\
*Implícita:*
$f=f(x,y,z)$\

== Teorema de la función explícita.
$
  (diff f)/(diff x)=1/((diff x)/(diff f))
$

==  Funciones con parametro simple y compuesto
Una función con parámetro simple, tiene como parámetro una simple variable. Una función con parámetro compuesto, tiene como parámetro otra ecuación.
=== Ejemplo.
*Parámetro simple:* $f=f(x)$\
*Parámetro compuesto:* $f=f(x^2-3y)$\

Cuando se encuentra con una función con parámetro compuesto, se debe hacer un cambio de variable.

== Característica importante de las funciones.

$z^3+x^5+y^7+z=x y quad$ no se puede despejar z\
$z^2+x^5+y^7+z=x y quad$ se puede despejar z mediante la fórmula cuadrática\
$z^3+x^5+y^7+z=x y quad$ no se puede despejar z\
$z^4+x^5+y^7+z^2=x y quad$ no se puede despejar z mediante la fórmula cuadrática\

== Jacoviano
$
  forall f,g : f=f(x,y) and g=g(x,y)\

$
Entonces el jacoviano de ambas se define de la siguiente manera 
$
  J((f,g)/(x,y))=
  lr(|#grid(
    columns: (auto, auto),
    inset: 3pt,
    [$f_x$], [$f_y$],
    [$g_x$], [$g_y$],
  )|)
$
En general:
$
  J((f_1,f_2,dots,f_n)/(x_1,x_2,dots,x_n))=
  lr(|#grid(
    columns: (auto, auto, auto, auto),
    inset: 3pt,
    [$f_1_x_1$], [$f_1_x_2$], [$dots$], [$f_1_x_n$],
    [$f_2$], [$$], [$$], [$$],
    [$dots$], [$$], [$$], [$$],
    [$dots$], [$$], [$$], [$$],
    [$f_n_x_1$], [$f_n_x_2$], [$dots$], [$f_n_x_n$],
  )|)
$

== Aplicaciones.
$
  forall r_0,f_0 in RR^2:  r_0=(x_0,y_0)\
  r_0" es un máximo relativo " arrow.double.r.l f(r_0) gt.eq  f(arrow(r))\
  r_0" es un mínimo relativo " arrow.double.r.l f(r_0) lt.eq  f(arrow(r))\
$

Sea $f_0$ un f. vec. $r_0=(x_0,y_0)$ es un maximo relativo de f si existe una vecindad de tal manera que $f(r+0) gt.eq f_r r_0=(x_0,y_0)$.
Es un minimo relativo si y solo si existe una vecindad de tal manera que $f_0 lt.eq  f_r$

=== Puntos críticos.
$(x_0,y_0)$ es un punto crítico sí y solo sí:
$
  (diff f)/(diff x)=  (diff f)/(diff y)=0
$

=== Hessiano
$
  forall in RR^2 :f=f(x,y)\
  Delta = det2x2(f_(x x), f_(x y), f_(y x), f_(y y))\
$

Tomando en cuenta el hessiano se puede establecer lo siguiente:
$
  Delta(x_0,y_0)
  cases(
    Delta gt 0 quad "existe un máximo relativo o un mínimo relativo."\
    Delta lt 0 quad "no existe un máximo relativo o un mínimo relativo. Es un punto silla."\
    Delta =0 quad "no hay información."
  )
$

=== Criterio de la segunda derivada
Para determinar si un punto crítico ya establecido $p_0=(x_0,y_0)$ es o máximo o mínimo, nos enfocamos en el siguiente criterio:
$
  cases(
    f_(x x)(p_0) gt 0 arrow "es un punto mínimo relativo"\
    f_(x x)(p_0) lt 0 arrow "es un punto máximo relativo"\
    f_(x x)(p_0) = 0 arrow "es un punto silla"
  )
$

=== Optimización
Para establecer un modelo matemático, en los puntos de optimización se sugiere seguir los siguientes pasos:
+ Establecer con claridad si se desea maximizar o minimizar el modelo.
+ Elaborar un esquema o gráfico que nos permita orientar nuestro trabajo.
+ Establecer la función a maximizar o minimizar la cual debe cubrir a todas las variables.
+ Eliminar variables extras que se vayan a generar (variables auxiliares).

== Multiplicadores de Lagrange
Sea $f(r)$ una función vectorial, con el objetivo de optimizarla podemos generar una nueva función dependiente de los parámetros originales añadiendo a esta un nuevo parámetro 'lamba' $lambda$ el cual cumplirá las condiciones de la función original a optimizar, por consiguiente, los procedimientos para la aplicación u optimización son exactamente los mismos, entonces debemos armar un sistema de ecuaciones anulando las derivadas parciales de la nueva función generada, aplicar la teoría correspondiente para hallar los puntos óptimos.

$
  f(x,y)=f(r):r=r(x,y)\
  F(x,y,lambda)-f(x,y)+ lambda g(x,y)\
  "puntos críticos:"\
  (diff F)/(diff x)=0\
  (diff F)/(diff y)=0\
  (diff F)/(diff lambda)=0\
  Delta = det(F_(x x),F_(x y),F_(x lambda),F_(y x),F_(y y),F_(y lambda),F_(lambda x),F_(lambda y), F_(lambda lambda))
$

= Integrales múltiples