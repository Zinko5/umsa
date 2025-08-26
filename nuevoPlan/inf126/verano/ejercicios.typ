// mamani david
// 85 nota p1
#set page(
  margin: (x: 2.5cm, y: 2.5cm) //Para trabajos digitales e impresos simples
  // margin: (left: 3.8cm, y: 2.5cm, right: 2.5cm) //Para trabajos impresos a doble cara
)
#set text(lang:"es")
#set text(font: "DejaVu Sans")
#show math.equation: set text(font: "DejaVu Math TeX Gyre")
#set par(justify: true)
#show math.equation:box
#set heading(numbering: "1.")
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
#let det2x2(a, b, c, d) = {
  $lr(|#grid(
    columns: (auto, auto),
    inset: 3pt,
    [$#a$], [$#b$],
    [$#c$], [$#d$],
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

#outline()

= Vectores.
== Demostraciones.
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

== Producto vectorial.
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

== Preguntas de exámen
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

= Geometría sólida.

== Ejercicios
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

#separador()

== Ejercicios
Hallar la ecuación del plano que pasa por el punto $(1,3,4), N=(2,4,3)$
$
  // (p-(1,3,4))(2,4,3)=0\
  // 2(x-1)-4(y-3)-3()=0
  (p-(1,3,4))(2,4,3)=0\
  p=(x,y,z)\
  (x-1,y-3,z-4)(2,4,3)=0\
  2(x-1)+4(y-3)+3(z-4)=0\
  2x-2+4y-12+3z-12=0\
  2x+4y+3z-26=0\
  2x+4y+3z=26 quad qed
$

#separador()

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

== Ejercicios
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

// producto vectorial de las normales

// practica en papel tamaño carta

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

// #separador()

// Hallar la ecuación del plano bisector del ángulo formado por los planos $p_1:3x+4y-6=0, p_2=6x-6y+7z+16=0$
// $
//   N_1=(3,4,0)\
//   N_2=(6,-6,7)\
//   (p-p_0)dot N=0\
//   "Si" y_0=0:\
//   3x-6=0arrow x=2 arrow.double p_0=(2,0,0)\
//   "Si" y=1:\
//   3x+4-6=0 =3x-2 arrow x=2/3 arrow.double (2/3,1,0)\
//   (2/3,1,0)-(2,0,0)=(-4/3,1,0)=v_1\
//   "Para el otro plano:"
//   "Si" y_0=z_0=0:\
//   6x+16=0arrow x=-8/3 arrow.double p_0=(8/3,0,0)\
//   "Si" y=1=z:\
//   6x-6+7+16=0=6x+17arrow x=-17/6 arrow.double (-17/6,1,1)\
//   cos theta=((8/3,0,0) dot (-17/6,1,1))/(nor((8/3,0,0))nor((-17/6,1,1)))=(-68/3)/(8/3 dot 19/6)=(-68/3)/(152/18)=-51/19\
//   theta=arccos(-51/19)=

// $

// #separador()

// Hallar la ecuación de la esfera que sea tangente al plano $2x+y-2z$ en el punto $p=(-2,2,5)$ y tiene su centro en la recta $L_0=cases(2y-z-7=0,2x-3y+8=0)$
// $
// 2y-z-7=0\
// 2x-3y+8=0\

//   (x-x_0)^2+(y-y_0)^2+(z-z_0)^2=r^2
// $
// $
//   (#grid(inset:5pt, columns: (auto, auto, auto,auto),
//     [$0$],[2],[-1], [-7],
//     [2],[-3],[0],[8]
//   ))
//   =
//   (#grid(inset:5pt, columns: (auto, auto, auto,auto),
//     [2],[-3],[0],[8],
//     [$0$],[2],[-1], [-7],
//   ))
//   =
//   (#grid(inset:5pt, columns: (auto, auto, auto,auto),
//     [1],[$-3/2$],[0],[4],
//     [$0$],[2],[-1], [-7],
//   ))
//   =
//   (#grid(inset:5pt, columns: (auto, auto, auto,auto),
//     [1],[$-3/2$],[0],[4],
//     [$0$],[1],[$-1/2$], [$-7/2$],
//   ))\
//   =
//     (#grid(inset:5pt, columns: (auto, auto, auto,auto),
//     [1],[$0$],[$-3/4$],[$-5/4$],
//     [$0$],[1],[$-1/2$], [$-7/2$],
//   ))
// $
// $
//   x=3/4z-5/4\
//   y=1/2z-7/2\
//   z in RR
// $
// $
//   r=()
// $

// === Work in class
= Límites en varias variables.
== Dominios de funciones en varias variables.
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

// EL dominio de toda funcion polinomial es todos los reales

#separador()

$
  f(x,y)=(1/(x y)+e^(8x^2+8y^2-25))/x\
  x, y eq.not 0\
  D_f={(x,y) in RR^2:x,y eq.not 0} quad qed
$

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

= Derivadas
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

#separador()

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
  // u=u(x,y)=x^2y\
  // x dot f_x =2y dot f_y arrow x dot (diff f)/(diff x) =2y dot (diff f)/(diff y)\
  // (diff f)/(diff x)=(diff f)/(diff u) (diff u)/(diff x)=f_u 2 x y \
  // (diff f)/(diff y)=(diff f)/(diff u) (diff u)/(diff y)=f_u  x^2 \
  // x f_u 2x y= 2y f_u x^2\
  // 1=1 quad qed\
  // (diff f)/(diff x)=(diff f)/(diff u) (diff u)/(diff x)+(diff f)/(diff u) (diff u)/(diff x)
  // comparar con definicion de cadena
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

// "si se pide llegar a un resultado con +-, se aplica la formula cuadratica"

#separador()

// Determinar el jacoviano de:
// $
//   x=r sin(theta) dot cos(phi)\
//   y=r sin(theta) dot sin (phi)\
//   z=r cos (theta)\
// $
// Demostrar el jacoviano es $r^2 sin(theta)$
// $
//   r, theta, phi\
//   det(x_r,x_theta,x_phi,y_r,y_theta,y_phi,z_r,z_theta,"")\
//   x(r,theta,phi)\
//   y(r,theta,phi)\
//   z(r,theta)\
// $

// #separador()

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

// #separador()

// $
//   f(x,y,z)=x^2+2y^2+z^2-2x y - 6x-2z+21\
//   (diff f)/(diff x)=2x-2y-6=0  quad arrow.long x=(2y+6)/2\
//   (diff f)/(diff y)=4y-2x=0 arrow y=x/2\
//   (diff f)/(diff z)=2z-2=0 quad arrow.long z=1\
//   "p.c:" ()
// $

== Optimización
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

== Lagrange

Sea $f=f(x,y)=x^2+y^2$\
sujeto a:$x+y=2$\
Optimizar

$
  g(x,y)=x+y-2=0\
  F(x,y,lambda)=f(x,y)+ lambda g(x,y)\
  F(x,y,lambda)=x^2+y^2+ lambda (x+y-2)
$
$
  (diff F)/(diff x)=2x+lambda = 0 arrow x=-lambda/2\
  (diff F)/(diff y)=2y+lambda = 0 arrow y=- lambda/2\
  (diff F)/(diff lambda)=x+y-2 = 0\
$
$
  g(x,y)=-lambda /2-lambda/2-2=0\
  -lambda=2 arrow lambda=-2\
$
$
  x=-lambda/2 arrow x=1\
  y=-lambda/2 arrow y=1\
  "p.c:" (1,1)\
  z=f_(x x)
  // z=2, por que?
$

#separador()

$
  f(x,y)=25-x^2-y^2\
  x dot y=9 arrow x y-9=0
$
$
  g(x,y)=x y-9\
  F(x,y,z)=25-x^2-y^2+lambda(x y -9)\
  =25-x^2-y^2-9 lambda + lambda x y\
  (diff F)/(diff x)=-2x+lambda y =0arrow x=(lambda y)/2\
  (diff F)/(diff y)=-2y+lambda x=0 arrow y=(lambda x)/2\
  (diff F)/(diff lambda)=-9+x y=0
$
$
  (lambda y)/2 (lambda x)/2-9=0\
  (lambda y)/2 (lambda x)/2=9\
  (lambda y lambda x)/4=9\
  lambda y lambda x=36\
  lambda (y x)=36\
  lambda=36/(x y)
$
$
  // x=(36/(x y) y)/(2)=(36/(x ))/(2/1)=36/(2x)=18/x\
  -2x+36/(x)=0\
  (-2x dot x)/x+36/(x)=0\
  (-2x^2 +36)/(x)=0\
  -2x^2 +36=0\
  x= plus.minus 3 sqrt(2)
$

#separador()

Hallar tres números positivos cuya suma sea 21 y su producto sea máximo
$
  p(a,b,c)=a b c\
  g(a,b.c)=a+b+c-21\
  F(a,b,c, lambda)=a b c + lambda (a+b+c-21)\
  =a b c + lambda a + lambda b + lambda c - 21 lambda 
$
$
  (diff F)/(diff a)=c b + lambda=0\
  (diff F)/(diff b)=a c + lambda=0\
  (diff F)/(diff c)=a b + lambda=0\
  (diff F)/(diff lambda)=a+b+c-21=0\
$
Puntos críticos:
$
  (7,7,7)\
  (0,0,21)
$
$
  Delta=det(0,c,b,c,0,a,b,a,0)
$

#separador()

Hallar las dimensiones de un cuadrado de área máxima que pueda ser inscrita en una circunferencia de radio $r=10$\
// $
//   a(x,y)=x y\
//   g(x,y)=x^2+y^2-100\
//   A(x,y,lambda)=x y+lambda(x^2+y^2-100)\
//   A(x,y,lambda)=x y+ lambda x^2+ lambda y^2-100 lambda\
// $
// $
//   (diff A)/(diff x)= y+2 lambda x=0 arrow y=-2 lambda x\
//   (diff A)/(diff y)= x+2 lambda y=0 arrow x=-2 lambda y\
//   (diff A)/(diff lambda)= 2 lambda x+2 lambda y-100=0
// $
// $
//   x=-2 lambda (-2 lambda x)\
//   x=4 lambda ^2x
// $
// $
// $
// $
//   // d=(x y)/2\
//   // r=((x y)/2)/(2/1)=(x y)/ 4=10\
//   // g(x,y)=(x y)/4-10\
//   // F(x,y,lambda)=x y +lambda((x y)/4-10)\
//   \ \ \ \ \ \ \ \ \ 
//   // A(x,y,lambda)=2 x y + lambda (x^2+y^2-r^2)\
//   // A=2x 2y\
//   // A=4x y
// $
$
  x^2=y^2\
  x=y\
  x^2+x^2=100\
  x^2=50\
  x=sqrt(50)\
  "área:" 2 sqrt(50) sqrt(50)=100 quad qed
$

#separador()

Calcular el área de la region $f(x)=(x+2)^2+3$ entre $-1,5$
$
  integral^5_(-1) ((x+2)^2+3) d x\
  integral^5_(-1) ((x+2)^2) d x +integral^5_(-1) (3) d x\
  lr(((x+2)^3/3+ 3) |)_(-1)^5

$
// $
//   lr(x/y|)_0^1 
// $

#separador()

Calcular la doble integral sobre r de $3x y^2 d y d x$ donde r es la región $r:x=2, y=0, y=x^2$
$
  integral_0^2 integral _0^x^2(3x^2 y d y d x)=integral_0^2 3 x^2 dot lr(y^2/2 |)_0^x^2 d x= integral_0^2 3/2x^2(x^4-0)d x= integral_0^2 3/2 x^6 d x\
  =3/2 lr(x^7/7|)_0^2=3/2 128/7=384/14 quad qed
$

#separador()

Calcular la doble integral sobre la region r
$
  r=x y d y d x\
  r:y=x^2, y=2-x
$
$
  integral _(-2)^1 (integral_(x^2)^(2-x) x y d y )d x\
  lr(x/2 y^2 |)_(x^2)^(2-x)
$