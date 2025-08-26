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
- Conmutatividad en $RR^n$:
Demostrar que $a+b=b+a$.
$
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

== Preguntas de exámen.
Dados los vectores:
$
  A=(1,2,3)\
  B=(4,7,8)\
  C=(10,9,5)\
  D=(-2,4,6)\
$

Determinar $(A times B)dot (C times D) $

$
  A times B = det(i,j,k,1,2,3,4,7,8)=(16-21, -(8-12),7-8)=(-5,4,-1)\
  C times D = det(i,j,k,10,9,5,-2,4,6)=(54-20,-(60-(-10)),40-(-18))=(34,-70,58)\
  (A times B)dot (C times D) =(-5,4,-1) dot (34,-70,58)=(-170+-280+-58) = 508 quad qed
$

#separador()

En un triángulo rectángulo, la hipotenusa es mas pequeña que la suma de los catetos, en la desigualdad trinagular es menor o igual. ¿Cuándo se da la igualdad?

Esto ocurre en un triángulo de altura $0$, es decir que los vértices son colineales
$
  ||A||=||B||+||C|| quad qed
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
Para que sea verdadera, se debería decir que $A$ y $B$ son perpendiculares. $quad qed$

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
  =nor(A)^2 + nor(B)^2 + nor(C)^2-2 A dot B +2 A dot C - 2 B dot C\
  =2 nor(A)^2+ 16-2 A dot B +2 A dot C - 2 B dot C\
$
$
  nor(A+2B+C)^2=(A+2B+C) dot (A+2B+C)\
  = A dot A + 2 A dot B+A dot C + 2 A dot B+4B dot B+2B dot C+ A dot C+2 B dot C+C dot C\
  =nor(A)^2+nor(C)^2+4 nor(B)^2+4 A dot B+2 A dot C+4 B dot C\
  =5 nor(A)^2+16+4 A dot B+2 A dot C+4 B dot C\
$
$
  2 nor(A)^2+nor(C)^2-2 A dot B +2 A dot C - 2 B dot C=5 nor(A)^2+16+4 A dot B+2 A dot C+4 B dot C\
  3 nor(A)^2+6 A dot B+6 B dot C=0\
  nor(A)^2+2 A dot B+2 B dot C=0\
$
$
  A dot B= cos pi/4 nor(A) nor(B)=cos pi/4 nor(A) nor(A)=sqrt(2)/2 nor(A)^2
$
$
  nor(A)^2+sqrt(2) nor(A)^2+2B dot C =0\
  B dot C=-(sqrt(2) nor(A)^2 + nor(A)^2)/2\
$
$
  cos theta = ((sqrt(2) nor(A)^2 + nor(A)^2)/(-2))/((nor(B)nor(C))/1)=(sqrt(2) nor(A)^2 + nor(A)^2)/(-2 nor(B) nor(C))\
  =-(nor(A)^2(sqrt(2)+1))/(2 nor(B) 4)=-(nor(A)^2(sqrt(2)+1))/(8 nor(A)) =-(nor(A)(sqrt(2)+1))/(8)\
$
$
  cos theta = -(nor(A)(sqrt(2)+1))/(8) quad qed
$
// cuando hay normas, usar la propiedad relacionada con el proudcto escalar, usar la distrubituvidad y 

#separador()

Si $A, B, C$ son vértices de un triángulo equilátero en $RR^3$, usando propiedad vectoriales, deducir la expresión para calcular el área.
$
  nor(A)=nor(B)=nor(C)\
  A angle B = A angle C = 60 degree=theta\
  "Área del paralelogramo": ||A times B||\
  "Área del triángulo": (||A times B||)/2\
$
$
  ||A times B||="área" dot 2\
  ||A||||B|| sin theta = "área" dot 2\
  nor(A)^2 sin 60 degree= 2 "área" \
  sqrt(3)/2 nor(A)^2= 2 "área" \
  sqrt(3)/4 nor(A)^2= "área" quad qed
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

#separador()

Hallar el área del paralelogramo cuyas diagonales son $2A-B$ y $4A-5B$, sabiendo que $A$ y $B$ subtienden un ángulo de $pi/6$ y además sabiendo que $||A||=1, ||B||=root(3,3)$\
$
  "área" = nor((2A-B) times (4A-5B))\
  =nor(  (2A times 4 A) - (2A times 5 B)- (B times 4A) +( B times 5B)  )\
  =nor(  (-2A times 5B) + (A times 4B)  )\
  =nor(  -10(A times B) + 4(A times B)  )\
  =nor(  (-10+4)(A times B)  )\
  =nor(  (-6)(A times B)  )=6 nor(A times B)\
$
$
  nor(A times B)=sin theta nor(A) nor(B)\
  =1/2 root(3,3)\
$
$
  "área"=6 root(3,3)/2=3 root(3,3) quad qed
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
  (-1,-3,5)times(1,3,5)=det(i,j,k,-1,-3,5,1,3,5)=(-15-15,-5-5,-3+3)=(-30,-10,0)\
    ||(-30,-10,0)||=sqrt(900+100)=sqrt(1000)\
    "área"=sqrt(1000)/2=sqrt(1000/4)=sqrt(250) quad qed
$

#separador()

$forall A,B in RR^3$, y $A=(a_1,a_2,a_3), B=(b_1,b_2,b_3)$ demostrar que la distancia entre puntos en $RR^3$ es:
$
  d=(sum^3_(i=1) (a_i-b_i)^2)^(1/2)\
  =((a_1-b_1)^2+(a_2-b_2)^2+(a_3-b_3)^2)^(1/2)\
  d=||A-B||\
  (7,10,4)-(0,0,0)=(7,10,4)\
  d=||(7,10,4)||=||(7,10,4)-(0,0,0)||=sqrt(7^2+10^2+4^2) quad qed
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
  r_0=(1,-3,2) + t(1,5,2)\
$
$
  r_1:\
  x+4=7t arrow x=-4+7t\
  y-5=2t arrow y=5+2t\
  z-3=3t arrow z=3+3t\
  r_1=(-4,5,3)+t(7,2,3)\
$
$
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

=== Ejercicio.
Hallar la ecuación del plano que pasa por el punto $(1,3,4), N=(2,4,3)$
$
  (p-(1,3,4))(2,4,3)=0\
  p=(x,y,z)\
  (x-1,y-3,z-4)(2,4,3)=0\
  2(x-1)+4(y-3)+3(z-4)=0\
  2x-2+4y-12+3z-12=0\
  2x+4y+3z-26=0\
  2x+4y+3z=26 quad qed
$

=== Distancia de un punto al plano
Sea el plano en su forma general: $A x + B y + C z + D = 0$ y un punto $p_0=(0,0,0)$
$
  d=lr(||(A x_0+B y_0+C z_0+D)/sqrt(A^2+B^2+C^2)||)
$

== Ejercicios.
Hallar la ecuación del plano equidistante a las rectas $L_1: (x-1)/1=(y-2)/3=(z+1)/1$, $L_2:(x-5)/2=(y+1)/1=(z+2)/(-2)$
$
  L_1:\
  x=1+t\
  y=2+3t\
  z=-1+t\
  p_1=(1,2,-1)\
  v_1=(1,3,1)\
$
$
  L_2:\
  x=5+2t\
  y=-1+t\
  z=-2+2t\
  p_2=(5,-1,-2)\
  v_2=(2,-1,2)\
$
$
  v_1 times v_2= det(i,j,k,1,3,1,2,-1,2)= (6+1,-(2-2),1+6)=(7,0,-7)\
  (7,0,-7) parallel N\
$
$
  "punto medio"=(p_1+p_2)/2=(6/2,1/2,-3/2)=(3,1/2,-3/2)=p_0\
$
$
  "ecuación del plano"=7(x-3)-7(z+3/2)=0\
  =7x-21-7z-21/2=0\
  7x-7z-63/2=0\
  x-z-9/2=0 quad qed
$

#separador()

Hallar la ecuación del lugar geometrico de las siguientes intersecciones:$p_0:3x+2x-4z+8=0, p_1:2x+4y-z-5=0$
$
  (#grid(inset: 6pt, columns:(auto, auto, auto, auto),
  [3],[2],[-4],[-8],
  [2],[4],[-1],[5],
  ))
  =
  (#grid(inset: 6pt, columns:(auto, auto, auto, auto),
  [1],[2],[-$1/2$],[$5/2$],
  [3],[2],[-4],[-8],
  ))
  =
  (#grid(inset: 6pt, columns:(auto, auto, auto, auto),
  [1],[2],[-$1/2$],[$5/2$],
  [0],[-4],[-1],[-23],
  ))
  =
  (#grid(inset: 6pt, columns:(auto, auto, auto, auto),
  [1],[2],[-$1/2$],[$5/2$],
  [0],[1],[$1/4$],[$23/4$],
  ))\
  =
  (#grid(inset: 6pt, columns:(auto, auto, auto, auto),
  [1],[0],[$-1$],[-9],
  [0],[1],[$1/4$],[$23/4$],
  ))\
$
$
  x=-9+z\
  y=23/4-z/4\
  z in RR\
$
$
  "Si" z=0:\
  P=(-9,23/4,0)\
$
$
  "Si" z=1:\
  Q=(-8,11/2,1)\
$
$
  v=P-Q=(1,-1/4,1)\
$
$
  "lugar geométrico (recta)":\
  r=(-9,23/4,0)+(1,-1/4,1)t quad qed
$


#separador()

Dada la recta $L$ en su forma paramétrica $x=2t-1, y=2t+2, z=-t+2$, hallar la intersección con el plano $z-2y=0$.

$
  x=2t-1\
  y=2t+2\
  z=-t+2\
  p_0=(2t-1,2t+2,-t+2)\
$
$
  z-2y=0\
  -t+2-2(2t+2)    =0\
  2-t-4t-4=0\
  -5t+2=0\
  t=2/5\
$
$
  x=2(2/5)-1=-9/5\
  y=2(2/5)+2=6/5\
  z=-(2/5)+2=12/5\
  "Intersección"=(-9/5,6/5,12/5) quad qed
$

#separador()

Hallar la ecuación de la recta que pasa por el punto $p_0=(3,-2,-4)$ y es paralela al plano $3x-2y-3z-7=0$ y se corta con la recta $L_1:(x-2)/3=(y+4)/(-2)=(z-1)/2$
$
  x=2+3t\
  y=-4-2t\
  z=1+2t\
  L_1:(2,-4,1)+t(3,-2,2)\
  N=(3,-2,-3)\
  p=(2+3t,-4-2t,1+2t)
$
$
  "recta":(p-p_0)N=0\
  =(3-2-3t,-2+4+2t,-4-1-2t)(3,-2,-3)\
  =(1-3t,2+2t,-5-2t) dot (3,-2,-3)\
  =3(1-3t)-2(2+2t)-3(-5-2t)\
  =3-9t-4-4t+15+6t=14-7t=0\
  7t=14\
  t=2
$
$
  p=(2+3(2),-4-2(2),1+2(2))=(8,-8,5)\
  v=p-p_0=(8,-8,5)-(3,-2,-4)\
  =(5,-6,9)
$
$
  r=(3,-2,-4)+(5,-6,9)t quad qed
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

== Ejercicios.
$
  f(x,y)=x^2+x y + y^2\
  // f(x)=
  "dom" {(x,y):x,y in RR}
$

$
  f RR^2 arrow RR\
  (x,y) arrow f(x,y)=(x+y)/(x-y)
$
No es una función porque $f(0,0)$ no tiene pareja.\
En cambio:
$
  // f RR^2-{0,0} arrow RR\
  forall (x,y) in RR^2: x eq.not y\
  // forall (x,y) in RR^2-{0,0}\
  (x,y) arrow f(x,y)=(x+y)/(x-y)
$
Sí es una función, ya que todos elementos de $RR^2:x eq.not y$ están en $RR$

#separador()

$
  f(x,y)=sqrt(4-x^2-y^2)\
  D_f:{(x,y)in RR^2 : x^2+y^2 lt.eq 2^2} quad qed
$
#align(center)[#image("{6FFE68CD-CA8B-472A-8259-F6857CD6EA2B}.png")]

#separador()

$
  f(x,y)=e^(sqrt(-y))+ln(5x^2+7y^2-4)\
  f_1: e^(sqrt(-y))\
  f_2: ln(5x^2+7y^2-4)
$

El dominio es la intersección de la suma de las que se tienen.

$
  D_f_1:{(x,y)in RR^2:y lt.eq 0}
$

Hay que tener los dominios de cada cosa y la intersección es el dominio de todo.

$
  5x^2+7y^2-4 gt 0\
  5x^2+7y^2 gt 4\
  (5x^2)/4+(7y^2)/4 gt 1\
  (x^2)/(sqrt(4/5)^2)+(y^2)/(sqrt(4/7)^2) gt 1\
$
La gráfica del dominio es el área exterior de la elipse con radio $r_1=4/5,r_2=4/7 quad qed$

#align(center)[#image("{42DFEFE1-FDAB-4C27-8C00-A4B54A61C578}.png")]

// EL dominio de toda funcion polinomial es todos los reales

#separador()

$
  f(x,y)=(1/(x y)+e^(8x^2+8y^2-25))/x\
  x, y eq.not 0\
  D_f={(x,y) in RR^2:x,y eq.not 0} quad qed
$
#align(center)[#image("{B3339E30-886C-417D-92CB-B0F36095AC83}.png")]

#separador()

$
  f(x,y)=(ln(x y)+sqrt(8x^2+8y^2-25))/(ln(x))\
  x gt 0\
  x y gt 0 arrow y gt 0\
  ln(x) eq.not 0 arrow x eq.not 1\
  {(y,x)in RR^2:y eq.not 0, x eq.not 1, x eq.not 0}\
  8x^2+8y^2-25 gt.eq 0\
  8x^2+8y^2 gt.eq 25\
  (x^2+y^2) gt.eq 25/8\
  // (8x^2)/25+(8y^2)/25 gt.eq 1\
  // (x^2)/sqrt(25/8)^2+(y^2)/sqrt(25/8)^2 gt.eq 1\
  D_f={(x,y) in RR^2:x gt 0, y gt 0, x eq.not 1,x^2+y^2 gt.eq 25/8} quad qed
$

#align(center)[#image("{46C805BF-1C44-450B-96D1-3C2CA66AE45B}.png")]

#separador()

Dado
$
  f(x,y,z)=x^3+5y z^2
$
Demostrar que 
// Demostrar f xxx 6x^3\
$f(a x, a y, a z)=a^2 dot f(x,y,z)$
$
  f(a x, a y, a z)=(a x)^3+5 (a y)(a z)^2\
  =a^3 x^3 + 5a^3y z^2\
  =a^3(x^3+5y z^2)quad qed
$



#separador()

$
  lim_((x,y) arrow (0,0)) (x-y) /(x+y)\
  "indeterminación" 0/0\
  (lim_((x,y) arrow (0,0))x-y)/(lim_((x,y) arrow (0,0))x+y)\
  "Lateral izquierdo:" 1\
  "Lateral derecho:" -1\
$
Como el límite lateral izquierdo y el lateral derecho son diferentes, el límite no existe. $quad qed$

= Derivada.
== Ejemplo derivación por definición.
Derivar
$
  f(x,y) =x^2+4y
$
respecto de y
$
  diff/(diff y)f=lim_(h arrow 0) (x^2+4(y+h)-x^2-4y)/(h)
$

- Derivada del seno por definición:
$
  f'(x)=lim_(h arrow 0)(cos(x+h)-cos(x))/(h)\
  lim_(h arrow 0)= (sin x dot cos h + sin h dot cos x - sin x)/h=sin x (cos h -1)/h+cos x (sin h)/h=cos x quad qed
$

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

== Ejercicios.
$
  f(x,y)=7x y^4+sqrt(ln(x y))\
  (diff f)/(diff x)=7y^4+1/(2sqrt(ln(x y))) dot  1/(x y) dot y quad qed
$

#separador()

$
  f(x,y,z)=2^x+ tan(root(3,sin(x^3 y ^4)))+z^4 y x^3\
  (diff f)/(diff x)=2^x ln(2)+sec^2(root(3,sin(x^3 y ^4)))dot 1/(3root(3,sin(x^3 y ^4)^2))dot cos (x^3 y^4) dot 3x^2y^4+3x^2z^4y quad qed
$

#separador()

$
  f(x,y)=7x^4+8x^2y\
  x=x(t)=t^2-5t\
  y=y(t)=t^8\
  (diff f)/(diff t)=(diff f)/(diff x)dot (diff x)/(diff t)+(diff f)/(diff y)dot (diff y)/(diff t)\
  (diff f)/(diff x)=28x^3+16x y\
  (diff x)/(diff t)=2t-5\
  (diff f)/(diff y)=8x^2\
  (diff y)/(diff t)=8t^7\
  (diff f)/(diff x)dot (diff x)/(diff t)+(diff f)/(diff y)dot (diff y)/(diff t)= (28x^3+16x y) dot (2t-5) + (8x^2) dot (8t^7) quad qed
$

#separador()

$
  f=f(x^2y)\
  "demostrar que" x dot f_x =2y dot f_y\
  u=u(x,y)=x^2y\
  (diff f)/(diff x)=(diff f)/(diff u)(diff u)/(diff x)=f_u 2x y\
  (diff f)/(diff y)=(diff f)/(diff u)(diff u)/(diff y)=f_u x^2\
  x dot f_x =2y dot f_y\
  arrow x f_u 2x y=2y f_u x^2\
  2 f_u x^2 y=2 f_u x^2y\
  1=1 quad qed\
$

#separador()
$
  f=f(y/x)\
  "demostrar que " x f_x + y f_y=0\
  u=u(x,y)=y/x\
  f_x=(diff f)/(diff u) (diff u)/(diff x)=f_u (-y/x^2)=-(f_u y)/x^2\
  f_y=(diff f)/(diff u) (diff u)/(diff y)=f_u 1/x=(f_u)/x\
  x(-(f_u y)/x^2)+y((f_u)/x)=0\
  -(f_u y)/x+(y f_u)/x=0\
  0=0 quad qed
$

#separador()
$
  x^x=y\
  ln(x^x)=ln(y)\
  x ln(x)=ln(y)\
  (x ln(x))'=(ln(y))'\
  ln(x)+x 1/x=1/y dot y'\
  ln(x)+1=1/y dot y'\
  y(ln(x)+1)= y'\
  x^x (ln(x)+1)= y' quad qed
$

#separador()

$
  z^3+x^5+y^7+z=x y:\
  z=z(x,y);\
  u=u(x,y,z)=-z^3-x^5-y^7-z+x y\
  z_x=(diff z)/(diff x)=(diff z)/(diff u) (diff u)/(diff x)=z_u (-5x^4+y)\
  (diff u)/(diff z)=-3z^2-1\
  (diff z)/(diff u)=1/((diff u)/(diff z))=1/(-3z^2-1)\
  z_x=(-5x^4+y)/(-3z^2-1) quad qed
$

#separador()

$
  z^2-x^3 y^2+z=1\
  z=z(z,y)\
  z_(x x)\
  u=u(x,y,z)=z^2-x^3y^2+z-1\
  z_x=(diff z)/(diff u) (diff u)/(diff x)=z_u (-3x^2y^2)\
  (diff u)/(diff z)=2z+1\
  (diff z)/(diff u)=1/(2z+1)\
  z_x=(-3x^2y^2)/(2z+1)\
  z_(x x)=((-6x y^2)(2z+1)-(-3x^2y^2)((-6x y^2)/(2z+1)))/(2z+1)^2 quad qed
$

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

=== Ejercicios.
$
  f(x,y)=x^2+2y^2-2x-8y+12\
  (diff f)/(diff x)=2x-2\
  (diff f)/(diff y)=4y-8
$
$
  "Punto crítico:"\
  x=1, y=2\
  x^2+2y^2-2x-8y+12arrow 1+8-2-16+12=3\
  "Hessiano:"\
  Delta=det2x2(2,0,0,4)=8 gt 0 quad "existe un máximo o mínimo relativo"
$
$
  "Segunda derivada:"\
  f_(x,x)=2 \
  2(1,2)=2 gt 0 \
  (1,2,3) "es un punto crítico mínimo relativo" quad qed
$

#separador()

$
  f(x,y)=x^3-12x y+8y^3 \
  (diff f)/(diff x)=3x^2-12y=0\
  (diff f)/(diff y)=-12x+24y^2=0\
  x^2-4y=0\
  x-2y^2=0 arrow x=2y^2
$
$
  "Reemplazando" x " en" x^2-4y=0:\
  (2y^2)^2-4y=0=4y^4-4y=4y(y^3-1)=0\
  4y=0 arrow y=0\
  y^3-1=0 arrow y^3=1 arrow y=1
$
$
  "Reemplazando" y "en" x^2-4y=0:\
  y=0 arrow x^2=0 arrow x=0\
  y=1 arrow x^2-4=0 arrow x^2=4 arrow x= plus.minus 2
$
$
  f(0,0)=0\
  f(2,1)=-8\
  f(-2,1)=24\
$
Candidatos a puntos críticos:
$
  (0,0,0)\
  (2,1,-8)\
  (-2,1,24)\
$
$
  Delta = det2x2(6x,-12,-12,48y)= 288 x y-144\
  "con" x=y=0:\
  Delta=-144 lt 0 arrow "es un punto silla"
$
$
  "con" x=2,y=1:\
  Delta=576-144 =432 gt 0 arrow "existe un punto máximo o mínimo"
$
$
  "con" x=-2,y=1:\
  Delta=-576 -144=-720 lt 0 arrow "es un punto silla"
$
$
  f_(x x)=6x\
  6x (2,1,-8)=12 gt 0 arrow "es un punto mínimo"
$
Punto mínimo relativo: $(2,1,-8) quad qed $\
Puntos silla: $(0,0,0); (-2,1,24) quad qed$ 

// 8

#separador()

$
  f(x,y)=e^(-x^2-y^2)\
  (diff f)/(diff x)=e^(-x^2-y^2)(-2x)\
  (diff f)/(diff y)=e^(-x^2-y^2)(-2y)\
  x=0, y=0\
  f(0,0)=1
$
Candidato a punto crítico: $(0,0,1)$

$
  Delta=det2x2(e^(-x^2-y^2)(4x^2-2),4 x y e^(-x^2-y^2),4 x y e^(-x^2-y^2),e^(-x^2-y^2)(4y^2-2))=det2x2(-2,0,0,-2)=4\
  Delta=4 gt 0 arrow "existe un mínimo o máximo"\
$
$
  f_(x x)(0,0,1)\
  =(e^(-x^2-y^2)(4x^2-2))(0,0,1)=-2lt 0
$
$(0,0,1)$ es un punto máximo $quad qed$

== Optimización
Para establecer un modelo matemático, en los puntos de optimización se sugiere seguir los siguientes pasos:
+ Establecer con claridad si se desea maximizar o minimizar el modelo.
+ Elaborar un esquema o gráfico que nos permita orientar nuestro trabajo.
+ Establecer la función a maximizar o minimizar la cual debe cubrir a todas las variables.
+ Eliminar variables extras que se vayan a generar (variables auxiliares).

=== Ejercicio.
Hallar tres números cuya suma sea 21 y su producto sea máximo.
$
  p=p(a,b,c)=a b c\
  a+b+c=21\ //sujeto a, es el auxiliar
  // se despeja una variable del auxiliar
  c=21-a-b\ // reemplazar esto en la funcion objetivo
  p=a b(21-a-b)\
  p=21a b-a^2 b-a b^2
$
$
  // encontrar los puntos criticos de esa funcion de p dependiente de solo dos variables
  // derivar p respecto a a y b
  (diff p)/(diff a)=21b-2a b-b^2=0\
  (diff p)/(diff b)=21a-2a b-a^2=0
$
$
  b(21-2a-b)=0\
  a(21-2b-a)=0
$
$
  "si "b=0:\
  a(21-a)=0\
  a=0\
  or\
  a=21
$
$
  "si "b=21-2a:\
  a(21-2(21-2a)-a)=0\
  a(21-42+4a-a)=0\
  a(-21+3a)=0\
  a=0\
  or\
  a=7 arrow b=21-17=7\
$
Posibles puntos críticos:
$
  (0,0)\
  (0,21)\
  (7,7)
$
$
  Delta=det2x2(-2b,21-2a-2b,21-2b-2a,-2a)
$
En $(0,0):$
$
  Delta=det2x2(0,21,21,0)=-441 lt 0 arrow "punto silla"
$
En $(0,21):$
$
  Delta=det2x2(-42,-21,-21,0)=-441 lt 0 arrow "punto silla"
$
En $(7,7):$
$
  Delta=det2x2(14,-7,-7,-14)=196-49=147 gt 0 arrow "existe un mínimo o máximo"
$
$
  c=21-a-b arrow c=21-7-7=7\
  "punto crítico:" (7,7,7) \
  f_(x x)=-2b\
  -2b(7,7,7)=-14 lt 0 arrow "punto máximo"
$
$(7,7,7)$ es un punto máximo.
$
  // como obtienes a y c, lo reemplazas para obtener c
  // a b c es el punto critico, se debe comprobar si es el maximo que se queria
  a+b+c=7+7+7=21\
  // una vez se tenga el valor maximo, se reemplaza en la funcion para encontrar el producto maximo
  "punto máximo: "a b c=7 dot 7 dot 7=343 quad qed
$
