#set text(lang:"es")
#set text(font: "C059")
#show math.equation: set text(font: "DejaVu Math TeX Gyre")
#set text(fill:white)

#let fechaEntrega = datetime(year: 2025, month: 1, day: 1)

#let overlay(img, color, width: auto, height: auto) = layout(bounds => {
  let size = measure(img, width: width, height: height)
  img
  place(top + left, rect(width: 100%, height: 100%, fill: color))
})

#let formatFecha(fecha) = {
  let meses = (
    "enero", "febrero", "marzo", "abril", "mayo", "junio",
    "julio", "agosto", "septiembre", "octubre", "noviembre", "diciembre"
  )
  let dia = str(fecha.day()) // Convertimos el día a cadena
  let mes = meses.at(fecha.month() - 1)
  let año = str(fecha.year()) // Convertimos el año a cadena
  dia + " de " + mes + " del " + año
}

#page(
  // background: overlay(image("image.png"), white.transparentize(100%)),
  fill:rgb("#183864"),
  
  margin: (x: 3cm),
  paper: "a4"
  )[
    #align(center)[
      // #text(size: 16pt)[#pad(top: 0pt)[
      // // #text(size: 16pt, stroke: 0.1mm + white)[#pad(top: 100pt)[
      //   Universidad Mayor de San Andrés\
      //   Facultad de Ciencias Puras y Naturales
      // ]]
      #text(size: 50pt, fill:white)[#pad(top: 15pt)[
        *Cálculo de Varias Variables*
      ]]
      // #text(size: 16pt)[#pad(top: -15pt)[
      //   siglaMateria - nombreMateria
      // ]]
    ]
  // #pad(top: 260pt)[
  //   #text(size: 16pt)[
  //     *Docente:*
  //   ]
  //   #text(size: 14pt)[ #pad(left: 20pt, top: -5pt)[
  //     nombreDocente
  //   ]]
  // ]
  // #pad(top: 15pt)[
  //   #text(size: 16pt)[
  //     *Estudiante:*
  //   ]
  //   #text(size: 14pt)[ #pad(left: 20pt, top: -5pt)[
  //     - Gabriel Muñoz Marcelo Callisaya
  //   ]]
  // ]
  #pad(top: 15pt)[
    // #text(size: 16pt, fill: white)[
    //   Gabriel Muñoz Marcelo Callisaya
    // ]
    // #grid( inset:5pt, 
    //   [a],[b]
    // )
    #columns(2, gutter: 100pt)[
      #align(center)[#text(size:18pt)[Gabriel Marcelo Muñoz Callisaya]]
      #colbreak()
      #align(center)[#text(size:18pt)[M. Sc. Israel Juam Mamani Quispe]]
    ]
  ]
  #pad(bottom: -500pt, top:-50pt, x: -500pt)[
    #align(center)[#image("intersection_planes.png", height: 600pt, fit:"cover")]
    // #image("intersection_planes.png")
    // #image("planes_intersection_with_axes.png")
  ]
// #place(bottom + center)[
//     #text(size: 13pt)[
//     *La Paz - Bolivia*
//   ]
// ]
]

#set page(
  margin: (x: 2.5cm, y: 2.5cm) 
)
#set text(lang:"es")
#set text(font: "DejaVu Sans")
#show math.equation: set text(font: "DejaVu Math TeX Gyre")
#set text(fill:black)
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

// = INF 126 - Cálculo 2.

// == Bibliografía.
// - Calculus - Michael Spivak.
// - Cálculo 2 - Álvaro pinzón.

// == Temario.
// + Vectores.
// + Geometría sólida.
// + Límites en varias variables.
// + Derivadas en $R$.
//   + Aplicaciones.
// + Integrales.
//   + Aplicaciones.
// + Series y sucesiones.

// == Ponderación
// // #block(
// #grid(
//     columns: (auto, auto),
//     inset: 0.5em,
//     row-gutter: 0pt,
//     stroke: 0.1em + black,
//     [1er parcial.], [20],
//     [2do parcial.], [20],
//     [Exámen final.], [20],
//     [Prácticas.], [30],
//     [Asistencia.], [5],
//     [Participación en Clases.], [5],
// )
// // #grid(
// //     columns: (auto, auto),
// //     inset: 0.5em,
// //     row-gutter: 0pt,
// //     stroke: 0.1em + black,
// //     [1er parcial.], [20],
// //     [2do parcial.], [20],
// //     [Exámen final.], [8],
// //     [Prácticas.], [42],
// //     [Asistencia.], [5],
// //     [Participación en Clases.], [5],
// // )

// #pagebreak()

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

=== Ejercicios.
- conmutatividad en $RR^n$:
$
  forall a,b in RR&^n\
  a+b=b+a\
  a+b=(a_1,dots,a_n)+(b_1,dots,b_n)\
  =(a_1+b_1,dots,a_n+b_n)\
  "por la conmutatividad en "RR:\
  =(b_1+a_1,dots,b_n+a_n)\
  =(b_1,dots,b_n)+(a_n,dots,a_n)\
  =b+a quad qed
$

#separador()

- Distributividad en $RR^n$:
$
  A+(B+C)=(A+B)+C\
  A+(B+C)=(a_1,a_2, dots , a_n)+((b_1,b_2, dots , b_n)+(c_1,c_2, dots , c_n))\
  =(a_1,a_2, dots , a_n)+(b_1+c_1,b_2+c_2,+ dots+ , b_n+c_n)\
  =(a_1+b_1+c_1,a_2+b_2+c_2, +dots+ , a_n+b_n+c_n)\
  "con "a_i, b_i, c_i in RR forall i":"\
  =(a_1+b_1,a_2+b_2, +dots+ , a_n+b_n)+(c_1,c_2, dots , c_n)\
  =(A+B)+C quad qed\
$

#separador()

- Existencia del neutro en $RR^n$:
$
  A+0=0+A=A\
  A+0=(a_1, dots, a_n)+(0,dots, 0)\
  "suma de vectores:"\
  =(a_1+0, dots , a_n+0)\
  "con "a_i in RR forall i":"\
  =(a_1, dots, a_n)=A quad qed
$

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

=== Producto escalar.
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

=== Producto vectorial.
$
  forall A, B in RR^3:\
  A=(a_1, a_2, a_3)\
  B=(b_1, b_2, b_3);\
  A times B:= det(i,j,k,a_1,a_2,a_3,b_1,b_2,b_3)\
  mag(A times B)=mag(A)mag(B)sin theta\
  A times B = 0 arrow.double.l.r nor(A times B)=0 arrow.double.l.r A parallel B\
  A times A=0
$

Area del paralelogramo: $||A times B||$ si $A$ y $B$ son dos lados adyacentes.

*Ejemplo:*
$
  A=(1,2,3)\
  B=(4,7,8)\
  C=(10,9,5)\
  D=(-2,4,6)\
  (A times B)dot (C times D) 
$

$
A times B=
  "det "(#grid(
     columns: (auto, auto, auto),
     inset:3pt,
     [$i$],[$j$],[$k$],
     [$1$],[$2$],[$3$],
     [$4$],[$7$],[$8$]
    ))=(16-21, -(8-12),7-8)=(-5,4,-1)
$
$
C times D=
  "det "(#grid(
     columns: (auto, auto, auto),
     inset:3pt,
     [$i$],[$j$],[$k$],
     [$10$],[$9$],[$5$],
     [$-2$],[$4$],[$6$]
    ))=(54-20,-(60-(-10)),40-(-18))=(34,-70,58)
$

$
  (A times B)dot (C times D) =(-5,4,-1) dot (34,-70,58)=(-170+-280+-58)=508 quad qed
$

=== Triple producto vectorial.
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

== Ejercicios.
// Encontrar $a$ y $b$ para que los puntos $A=(1,2,-1)$, $B=(3,0,-2)$ y $C=(4,2,B)$

En un triángulo rectángulo, la hipotenusa es mas pequeña que la suma de los catetos, en la desigualdad trinagular es menor o igual. ¿Cuándo se da la igualdad?
// $
//   c = a+b\
//   a^2+b^2=c^2\
//   a^2+b^2=(a+b)^2\
//   a^2+b^2=a^2+2a b +b^2\
//   2a b=0\
//   a=0 or b=0
// $
\ \
Eso ocurre en un triángulo de altura $0$, es decir que los vértices son colineales
$
  ||A||=||B||+||C||
$

#separador()

Justificando tu respuesta, analizar la veracidad o falsedad de la información siguiente:

Se conoce que $A times B=C$ y $A times C=D$, entonces $B$ y $D$ son paralelos

Si $B$ y $D$ son paralelos, entonces $||B times D||=0$\

$
  A times C=D\
  C=A times B\
  "Reemplazando "C:\
  A times (A times B)=D\
  (A dot B)A-(A dot A)B=D\
$
$A dot A$ es un número, por lo que $(A dot A)B=D$ es suficiente para decir que $B$ y $D$ son paralelos, pero sobra la parte de $(A dot B)A$, por lo que la afirmación es falsa.\
Para que sea verdadera, se debería decir que $A$ y $B$ son perpendiculares.

#separador()

Anotar la condición que deben cumplir $A$ y $B$ para que $A+B$ sea la bisectriz de $A$ y $B$

$
  A+B=k(A/(||A||)+B/(||B||))\
  A+B=(k A)/nor(A)+(k B)/nor(B)\
  A+B -A k/nor(A)-B k/nor(B)=0\
  A(1-k/nor(A))+B(1-k/nor(B))=0\
  therefore 1-k/nor(A)=0 and 1-k/nor(B)=0\
  1-k/nor(A)=1-k/nor(B)\
  k/nor(A)=k/nor(B)\
  therefore nor(A)= nor(B) quad qed
$

#separador()

¿Qué condición deben cumplir los vectores $A$ y $B$ para que $A +B$ y $A-B$ sean perpendiculares?
// $
//   (A+B)dot (A-B)=0\
//   A dot A-A dot B+B dot A -B dot B=0\
//   "Si son perpendiculares:"\
//   A dot A-B dot B=0\
//   ||A||-||B||=0\
//   ||A||=||B||
// $
$
  (A+B)dot (A-B)=0\
  A dot A-A dot B+A dot B-B dot B=0\
  nor(A)^2-nor(B)^2=0\
  nor(A)^2=nor(B)^2\
  nor(A)=nor(B) quad qed
$

#separador()

Demostrar 
$
  (C-D)times (C + D)=2(C times D)\
  "Por distributividad:"\
  (C-D)times (C + D)=C times C+C times D-D times C - C times D\
  = C times D- D times C = C times D + C times D\
  =2(C times D) quad qed
$
#separador()
Para todo par de vectores demostrar:
$
  1/4(||c+d||^2-||c-d||^2)=c dot d\
  1/4((c+d)dot (c+d)-(c-d)dot (c-d))=\
  "Distributividad:"\
  1/4(c dot c+c dot d+ c dot d+d dot d-c dot c+c dot d + c dot d -d dot d)\
  =1/4(4 (c dot d) )=c dot d quad qed
$

#separador()

Escribir el vector $A =(3,2,-6)$ como la suma de dos vectores, uno paralelo a $B=(2,-4,1)$ y otro perpendicular a $B$
$
  C="vector paralelo a B"\
  D="vector perpendicular a B"\
  A=C+D arrow D=A-C\
  C=B n\  
  D dot B=0\
  C= B n=(2n,-4n,n)\
  D=A-C=(3,2,-6)-(2n,-4n,n)\
  D=(3-2n,2+4n,-6-n)\
  (3-2n,2+4n,-6-n)dot (2,-4,1) =0\
  6-4n-8+-16n-6-n=0\
  -8-21n=0\
  21n=-8\
  n=-8/21\
  C=(-16/21,32/21,-8/21)\
  D=(79/21,10/21,-118/21)\
  A=(-16/21,32/21,-8/21)+(79/21,10/21,-118/21) quad qed
$

#separador()

Cada par de vectores $u, v, omega$ forman entre sí un ángulo de $pi/3$. Si $||u||=4,||v||=2, ||omega||=6$, hallar el módulo de $p$, donde $p=u+v+omega$
$
  ||p||^2=||u+v+omega||^2=sqrt((u+v+omega)dot (u+v+omega))^2\
  "distributividad:"\
  ||p||^2=u dot u + u dot v + u dot omega + v dot u +v cot v + v dot omega + omega dot u + omega dot v + omega dot omega\
  =||u||^2+||v||^2+||omega||^2+2(u dot v + u dot omega + v dot omega)\
  ||p||^2=100\
  ||p||=10 quad qed
$

#separador()

Sea $A, B, C in RR^3$, se conoce que el angulo entre $A$ y $B$ es $pi/4$.\
También se conoce que $||A-B+C||=||A+2B+C||$.\
Y que $||A||=||B||, ||C||=4$.\ 
Determinar el coseno entre $B$ y $C$
$
  cos theta=(B dot C)/(||B||||C||)\
  ||C||^2=C dot C=16\
  ||A-B+C||^2=(A-B+C)dot (A-B+C)\
  =A dot A - A dot B + A dot C-B dot A+B dot B-B dot C+C dot A-C dot B+C dot C\
  =-A dot B+A dot C- B dot A-B dot C+ C dot A- C dot B\
  ||A+2B+C||^2=||A||+2A dot B+ A dot C+2A dot B+ 4B dot B+2 B dot C+A dot C+2B dot C+C dot C\
  0=6A dot B+3||B||^2+6B dot C\
  =2 A dot B+||B||^2+2||B||||C|| cos theta\
  =sqrt(2)||B||^2+||B||^2+8||B|| cos theta\
  "distributividad y bicotomia:"\
  =(1+sqrt(2))||B||^2+8||B|| cos theta=0\
  ||B||(||B||(1+sqrt(2))+8 cos theta)=0\
  ||B||=0\
  "o"\
  ||B||(1+sqrt(2))+8 cos theta=0\
  ||B||(1+sqrt(2))=-8cos theta\
  ||B||(1+sqrt(2))=-8cos theta\
  cos theta=((-sqrt(2)+1)||B||)/8 quad qed
$
// cuando hay normas, usar la propiedad relacionada con el proudcto escalar, usar la distrubituvidad y 

#separador()

Para el cuadrado, escribir el vector $S$ en función de $A$ y de $B$.
Donde dos lados adyacentes del cuadrado son los vectores $A, B$, y $A, B$ son del tamaño del radio de la circunferencia con una cuarta parte encerrada en el cuadrado
$
  ||A||=||B||=||S||\
  ||S||^2=S dot S\
  S=k+B\
  ||S||^2=K^2||(A+B)||^2\
  =K^2(A+B)dot (A+B)\
  =K^2(A dot A+A dot B+B dot A+B dot B)\
  = K^2( A^2+ 2(A dot A) + B^2)\
  S=k(A+B) quad qed
$

#separador()

Si $A, B, C$ son vértices de un triángulo equilátero en $RR^3$, usando propiedad vectoriales, deducir la expresión para calcular el área.
// $
//   "Área del triángulo"=(b dot h)/2\
//   b=||A||\
//   h=lr(||((||A||)/2 - B)||)\
//   "Área"=(||A||dot lr(||((||A||)/2 - B)||))/2
// $
$
  "Área del paralelogramo": ||A times B||\
  "Área del triángulo": (||A times B||)/2\
  ||A times B||="área" dot 2\
  ||A||||B|| sin theta = "área" dot 2
  // (A times B)dot (A times B)="área"^2 dot 4\

$

#separador()

¿Qué condición deberían cumplir los vectores $A,B$ para que se cumpla que la componente de $A$ sobre $B$ sea igual a la componente de $B$ sobre $A$?\


$
  "Comp"_b a=||"proy"_b a||
$

- Proyección de A sobre B:
$
  "Proy"_b a=((a dot b)/(||b||^2))b
$

$
  ||"proy"_b a||=||"proy"_a b||\
  lr(||((a dot b)/(||b||^2))b||)=lr(||((b dot a)/(||a||^2))a||)\
  ((a dot b)/(||b||^2))||b||=((b dot a)/(||a||^2))||a||\
  (a dot b)/(||b||)=(b dot a)/(||a||)\
  ||b||=||a|| quad qed
$

// #separador()

// Hallar el área del paralelogramo cuyas diagonales son $2A-B$ y $4A-5B$, sabiendo que $A$ y $B$ subtienden un ángulo de $pi/6$ y además sabiendo que $||A||=1, ||B||=root(3,3)$\
// $
//   ||A B||times||B C||=||A B||||A C||sin pi/6\
// $

// $
//   ||(3 A - 3 B) times (-A + 2B)||\
//   ||(3A-3B times -A)||
// $

= Geometría analítica sólida.
La propiedad rígida de los cuerpos sólidos indica que sin importar el punto de referencia del cuerpo, este no se deformará.

Es el estudio de cuerpos geométricos en el espacio (lugares geométricos en $RR^3$). Tiene como fundamento estudiar dos tipos de problemas fundamentales, los cuales son:

- Dada la ecuación, encontrar la gráfica del lugar geométrico.
- Dada la gráfica, encontrar su ecuación.

Toda curva que todos los puntos que la integran cumplan una ley común, es un espacio geométrico

$
  forall P_i in C arrow d(P, C) = r
$

== Ejercicios.
$forall A,B in RR^3$, y $A=(a_1,a_2,a_3), B=(b_1,b_2,b_3)$ demostrar que la distancia entre puntos en $RR^3$ es:
$
  d=(sum^3_(i=1) (a_i-b_i)^2)^(1/2)\
  =((a_1-b_1)^2+(a_2-b_2)^2+(a_3-b_3)^2)^(1/2)\
  d=||A-B||\
  // =sqrt(a_1^2-2 a_1 b_1+b_2^2+a_2^2-2 a_2 b_2+b_2^2+a_3^2-2 a_3 b_3+b_3^2)\
  (7,10,4)-(0,0,0)=(7,10,4)\
  d=||(7,10,4)||=||(7,10,4)-(0,0,0)||=sqrt(7^2+10^2+4^2) quad qed
$

#separador()

Sean los puntos $a=(1,1,2), b=(2,4,7), c=(3,7,2)$.
- Demostrar que se trara de un triángulo isosceles.
$
  ||b c|| = ||a c||\
  b c = (2,4,7)-(3,7,2)=(-1,-3,5)\
  a c=(1,1,2)-(3,7,2)=(-2,-6,0)\
  ||b c||=sqrt(1+9+25)=sqrt(35)\
  ||a c||=sqrt(4+36)=sqrt(40)\
  ||a b||=||(1,3,5)||=sqrt(1+9+25)=sqrt(35)\
  ||b c||=||a b|| quad qed
$
- Encontrar el área del triángulo
$
  "área"= (||b c times a b||)/2\
  =(||(-1,-3,5)times(1,3,5)||)/2\
  (-1,-3,5)times(1,3,5)=  "det "(#grid(
     columns: (auto, auto, auto),
     inset:3pt,
     [$i$],[$j$],[$k$],
     [$-1$],[$-3$],[$5$],
     [$1$],[$3$],[$5$]
    ))=(-15-15,-5-5,-3+3)=(-30,-10,0)\
    ||(-30,-10,0)||=sqrt(900+100)=sqrt(1000)\
    "área"=sqrt(1000)/2=sqrt(1000/4)=sqrt(250) quad qed
$

== La recta.
La recta es el lugar geométrico de puntos en el espacio que deben satifacer paralelamente las siguientes ecuaciones lineales:
$
  a_1 x+b_1 y + c_1 z + d_1=0\
  a_2 x + b_2 y + c_2 z + d_2 =0
$

La recta nace de la intersección de dos planos. 

Para hallar una recta o un segmento de esta, debemos resolver el sistema que se llega a generar, el cual con certeza será un sistema inconsistente. el cual para ser resuelto, nos exigirá un proceso de parametrización.

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

=== Ejercicios.
Determinar la ecuación de la recta que pasa por el punto $p_0=(2,7,1)$ y vector director $A=(1,4,3)$
$
  r=p_0+t A\
  =(2,7,1)+t(1,4,3) quad qed
$

#separador()

Hallar la intersección entre las rectas:
$
  r_0=(x-1)/1=(y+3)/5=(z-2)/2\
  r_1=(x+4)/7=(y-5)/2=(z-3)/3
$
$
  r_0:\
  x-1=t arrow x=1+t\
  y+3=5t arrow y=-3+5t\
  z-2=2t arrow z=2+2t\
  r_0=(1,-3,2) + t(1,5,2)\ \
  r_1:\
  x+4=7t arrow x=-4+7t\
  y-5=2t arrow y=5+2t\
  z-3=3t arrow z=3+3t\
  r_1=(-4,5,3)+t(7,2,3)\ \
  "Las rectas se intersectarán cuando:"\
  1+t=-4+7t_0\ 
  -3+5t=5+2t_0\
  t=2, t_0=1
$
$
  x=1+t=1+2=3\
  y=-3+5t=-3+5(2)=-3+10=7\
  z=2+2t=2+2(2)=2+4=6\
  "intersección:" (3,7,6) quad qed
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

#separador()

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

propiedades limites y funciones
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
Funcion con parametro compuesto -> cambio de variable

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

// sea f_0 un f.vec. r_0=(x_0,y_0) es un maximo relativo de f si existe una vecindad de tal manera que f de r_0 sea gt.eq al f_r r_0=(x_0,y_0) es un minimo relativo si y solo si existe una vecindad de tal manera que f_0 sea lt.eq a f_r
$
  
$

=== Puntos críticos.
$(x_0,y_0)$ es un punto crítico sí y solo sí:
$
  (diff f)/(diff x)=  (diff f)/(diff y)=0
$

=== Hesiano
$
  forall in RR^2 :f=f(x,y)\
  Delta = det2x2(f_(x x), f_(x y), f_(y x), f_(y y))\
$

Tomando en cuenta el hesiano se puede establecer lo siguiente:
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