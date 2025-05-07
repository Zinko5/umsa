#set page(
  margin: (x: 2.5cm, y: 2.5cm) //Para trabajos digitales e impresos simples
  // margin: (left: 3.8cm, y: 2.5cm, right: 2.5cm) //Para trabajos impresos a doble cara
)
#set text(lang:"es")
#set text(font: "DejaVu Sans")
#show math.equation: set text(font: "DejaVu Math TeX Gyre")
#set par(justify: true)
#set heading(numbering: "1.")
#show heading.where(level: 2): set heading(numbering: none)
// #show heading.where(level: 3): it => block[
//   #set text(weight: "regular")
//   #h(1em)
//   #counter(heading.where(level: 3)).step()
//   #let count = counter(heading.where(level: 3)).get().first()
//   #(str((count) * 2 + 2) + ". " + it.body)
// ]
#show heading.where(level:3): set heading(numbering: none)
#show heading.where(level:3): set text(weight: "regular")
#set enum(indent: 2em)
#show list: it => enum(
  numbering: "a)",
  // numbering: n => strong(numbering("a)", n)),
  ..it.children.map(item => enum.item()[#item.body]),
)
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

= Vectores.
== Vectores en dos y tres dimensiones.
=== 2. Calcular cada uno de los múltiplos escalares de $v=vec(-1,5)$.

- $4v$\  
- $-frac(1,2)$\
- $0v$\
- $-6v$\

#ejercicio(
  [*a)* $4v$],
  [
    $
      4 v=4vec(-1,5)\
      =vec((4)(-1),(4)(5))\
      =vec(-4,20) qed
    $
  ]
)

#ejercicio(
  [*b)* $-1/2v$],
  [
    $
      -1/2v=-1/2 vec(-1,5)\
      =vec((-1/2)(-1),(-1/2)(5))\
      =vec(1/2,-5/2) qed
    $
  ]
)

#ejercicio(
  [*c) *$0v$],
  [$
     0v=0 vec(-1,5)\
     =vec((0)(-1),(0)(5))\
     =vec(0,0) qed
   $]
)

#ejercicio(
  [*d)* $-6v$],
  [$
     -6v= -6 vec(-1,5)\
     =vec((-6)(-1),(-6)(5))\
     =vec(6,-30) qed
   $]
)

=== 4. Hallar el vector $v=5u-3w$ donde $u= 2,-1 $y $w= 1,2 $.
#ejercicio(
  [$
    v=5u-3w
    \
    =5 vec(2,-1) - 3 vec(1,2)\
    =vec(10,-5) - vec(3,6)\
    =vec(10-3,-5-6)\
    =vec(7,-11) qed
   $]
)

=== 5. Encontrar la magnitud del vector $v= -10i+3j$.
#ejercicio(
  [$
    v=-10i+3j=vec(-10,3)\
    nor(v)= sqrt((10)^2+3^2)\
    =sqrt(100+9)=sqrt(109) qed
   $]
)

=== 8. Hallar $nor(frac(u+v,nor(u+ v)))$ si $u=vec(2,4)$ y $v=vec(5,5)$.
#ejercicio(
  [$
     u+v=vec(2+5,4+5)=vec(7,9)\
     nor(u+v)=sqrt(7^2+9^2)=sqrt(49+81)=sqrt(130)\
     frac(u+v,nor(u+v))=vec(7/sqrt(130),9/sqrt(130))\
     nor(frac(u+v,nor(u+v)))=sqrt((7/sqrt(130))^2+(9/sqrt(130))^2)=sqrt(49/130+81/130)=sqrt(130/130)=sqrt(1)=1 qed
   $]
)

=== 9. Demostrar la desigualdad del triángulo si $u= vec(-3,2)$ y $v= vec(1,-2).$
#ejercicio(
  [$
     nor(u+v)^2 lt.eq nor(u)^2+nor(v)^2\
     nor(u+v)^2=nor(vec(-2,0))^2=(sqrt(4))^2=4\
     nor(u)^2+nor(v)^2=(sqrt(9+4))^2+(sqrt(1+4))^2=13+5=18\
     4lt.eq 18 qed
    $]
)

=== 10. Hallar las componentes de $v$ dadas su magnitud y el ángulo que forma con el eje x positivo.
#ejercicio(
  [*a)* $nor(v)=3$,$theta=0degree$],
  [$
     v=vec(nor(v)cos theta, nor(v)sin theta)\
     =vec(3cos 0degree,3sin 0degree)\
     =vec(3,0)qed
   $]
)
=== 13. Hallar la distancia entre los puntos:
#ejercicio(
  [*a)* $(-2,3,2)$, $(2,-5,-2)$],
  [$
     v=vec(4,-8,-4)\
     nor(v)=sqrt(16+64+16)=sqrt(96)=4sqrt(6)qed
   $]
)
=== 15. Hallar las coordenadas del punto medio del segmento de recta que une los puntos:
#ejercicio(
  [*a)* $(5,-9,7)$, $(-2,3,3)$],
  [$
     M=(3/2,-6/2,10/2)\
     =(3/2,-3,5)qed
   $]
)
=== 18. Determinar cuáles de los vectores son paralelos a $z=vec(3,2,-5)$.
#ejercicio(
  [*a)* $vec(-6,-4,10)$],
  [$
     vec(-6,-4,10)=2vec(3,2,-5)\
     =2z\
     "Es paralelo a z." qed
   $]
)
=== 20. Usar vecrores para determinar si los puntos son vértices de un paralelogramo.
#ejercicio(
  [*a)* $(2,9,1)$, $(3,11,4)$, $(0,10,2)$, $(1,12,5)$],
  [$
     A=(2,9,1), B=(3,11,4), C=(0,10,2), D=(1,12,5)\
     arrow(A B)=vec(1,2,3)\
     arrow(A C)=vec(-2,1,1)\
     arrow(A D)=vec(-1,3,4)\
     A+arrow(A B)+arrow(A C)=vec(1,12,5)=D qed\
   $]
)
=== 22. Hallar un vector unitario en la dirección de $u=vec(2,-1,2)$ y otro vector en la dirección opuesta de $u$.
#ejercicio(
  [$
     arrow(u)=u/nor(u)\
     nor(u)=sqrt(4+1+4)=sqrt(9)=3\
     arrow(u)=vec(2/3,-1/3,2/3) qed\
     \
     -arrow(u)=vec(-2/3,1/3,-2/3) qed
   $]
)
=== 23. Si $u=vec(4,10)$ y $v=vec(-2,3)$, hallar $u v$.
#ejercicio(
  [$
     u v=-8+30=22 qed
   $]
)
=== 25. Calcular $u dot v$ si $nor(u)=8$, $nor(v)=5$ y el ángulo entre $u$ y $v$ es $pi/3$.
#ejercicio(
  [$
     u v=nor(u)nor(v)cos(pi/3)\
     =40 dot 1/2=20 qed
   $]
)
=== 26. Calcular el ángulo $theta$ entre los vectores $u=vec(2,18)$ y $v=vec(3/2,-1/6)$.
#ejercicio(
  [$
     u v=nor(u)nor(v)cos theta\
     cos theta=frac(u v,nor(u)nor(v))\
     u v=3+(-18/6)=9/3-9/3=0\
     theta=arccos 0=90degree qed
   $]
)
=== 27. Determinar si $u=vec(2,18)$ y $v=vec(3/2,-1/6)$ son ortogonales, paralelos o ninguna de las dos cosas.
#ejercicio(
  [$
     2x=3/2\
     x=3/4\
     3/4vec(2,18)=vec(3/2,27/2)\
     "No son paralelos." qed
   $]
)
#ejercicio(
  [$
     u v=3+(-3)=0\
     "Sí son ortogonales" qed
   $]
)
=== 30. Hallar la componente de $u=vec(9,7)$ que es ortogonal a $v=vec(1,3)$, y $w_1="proj"_v u=vec(3,9)$.
#ejercicio(
  [$
    w_2=u-"proj"_v u\
    =vec(9,7)-vec(3,9)\
    =vec(6,-2) qed
   $]
)
=== 31. Hallar la proyección de $u=vec(2,3)$ en $v=vec(5,1)$.
#ejercicio(
  [$
     "proj"_v u=v frac(u dot v,nor(v)^2)\
     =v 13/nor(v)^2=v 13/((sqrt(25+1))^2)=v 13/26 =vec(65/26,13/26)=vec(5/2,1/2) qed
   $]
)
=== 32. Hallar la componente vectorial de $u=vec(2,-3)$ ortogonal a $v=vec(3,2)$.
#ejercicio(
  [$
     "proj"_v u=v (u dot v)/(nor(v)^2)\
     w_2=u-"proj"_v u\
     "proj"_v u=v (6+-6)/((sqrt(9+4))^2)=v 0/13=vec(0,0)\
     w_2=vec(2,-3)-vec(0,0)=vec(2,-3) qed
   $]
)
=== 37. Calcular $u times v$ si $u=-2i+3j+4k$ y $v=3i+7j+2k$.
#ejercicio(
  [$
     #grid(
      columns: (auto, auto, auto),
      inset: 3pt,
      [i],[j],[k],
      [-2],[3],[4],
      [3],[7],[2]
     )\
     u times v = (6-28)i-(-4-12)j+(-14-9)k=-22i+16j-23k\
     =vec(-22,-16,-23) qed
   $]
)
=== 39. Calcular el area del paralelogramo que tiene los vectores dados como lados adyacentes $u=vec(3,2,-1)$ y $v=vec(1,2,3)$
#ejercicio(
  [$
     A=nor(u times v)\
     "det "(#grid(
      columns: (auto, auto, auto),
      inset: 3pt,
      [i],[j],[k],
      [3],[2],[-1],
      [1],[2],[3],
     ))\
     u times v=(6+2)i-(9+1)j+(6-2)k=vec(8,-10,4)\
     nor(vec(8,-10,4))=sqrt(64+100+16)=sqrt(164+16)=sqrt(180)=6sqrt(5) qed
   $]
)
=== 40. Calcular si los puntos $(1,1,1)$, $(2,3,4)$, $(6,5,2)$ y $(7,7,5)$ son vértices de un paralelogramo y calcular su área.
#ejercicio(
  [$
     A=(1,1,1), B=(2,3,4), C=(6,5,2), D=(7,7,5)\
     arrow(A B)=vec(1,2,3)\
     arrow(A C)=vec(5,4,1)\
     arrow(A D)=vec(6,6,4)\
     A+arrow(A B)+arrow(A C)=A+vec(6,6,3)=vec(7,7,4)=D\
     "Sí es un paralelogramo, con" arrow(A B) " y " arrow(A C) " como lados adyacentes"\
     A=nor(arrow(A B)times arrow(A C))\
     "det "(#grid(
      columns: (auto, auto, auto),
      inset:3pt,
      [i],[j],[k],
      [1],[2],[3],
      [5],[4],[1]
     )) arrow.long (2-12)i-(1-15)j+(4-10)k=vec(-10,14,-6)\
     nor(vec(-10,14,-6))=sqrt(100+196+36)=sqrt(296+36)=sqrt(332)=2sqrt(83) qed
   $]
)
=== 43. Usar el triple producto escalar para encontrar el volumen del paralelepípedo que tiene como aristas adyacentes $u=i+j$, $v=j+k$ y $w=i+k$
#ejercicio(
  [$
     u=vec(1,1,0)\
     v=vec(0,1,1)\
     w=vec(1,0,1)\
     V=u dot (v times w)\
     ="det "(#grid(
      columns: (auto, auto, auto),
      inset: 3pt,
      [1],[1],[0],
      [0],[1],[1],
      [1],[0],[1]
     ))arrow.long (1)1-(-1)1+0=1+1=2 qed
   $]
)
=== 44. Encontrar el volumen del paralelepípedo que tiene los siguientes vertices:
#ejercicio(
  [$
     A=(0,0,0),B=(3,0,0),C=(0,5,1),D=(3,5,1),E=(2,0,5),F=(5,0,5),G=(2,5,6),H=(5,5,6)\
     arrow(A B)=vec(3,0,0)\
     arrow(A C)=vec(0,5,1)\
     arrow(A D)=vec(3,5,1)\
     arrow(A E)=vec(2,0,5)\
     arrow(A F)=vec(5,0,5)\
     arrow(A G)=vec(2,5,6)\
     arrow(A H)=vec(5,5,6)\
     "det "(#grid(
      columns: (auto, auto, auto),
      inset: 3pt,
      [3],[0],[0],
      [0],[5],[1],
      [2],[0],[5]
     ))=3(25)=75 eq.not 0\
     u=arrow(A B), v=arrow(A C), w=arrow(A E)\
     V=u dot (v times w)\
     ="det "(#grid(
      columns: (auto, auto, auto),
      inset: 3pt,
      [3],[0],[0],
      [0],[5],[1],
      [2],[0],[5]
     ))=75 qed
   $]
)
=== 45. Demostrar que $nor(u times v) = nor(u)nor(y)$ si $u$ y $v$ son ortogonales
#ejercicio(
  [$
     nor(u times v)=nor(u) nor(v)sin theta\
     "Como "u" y "v" son ortogonales; son perpendiculares, y el ángulo entre ellos es "theta=90degree.\
     nor(u times v)=nor(u)nor(v)sin 90degree \
     =nor(u times v)=nor(u)nor(v)1 \
     =nor(u times v)=nor(u)nor(v)qed
   $]
)
=== 47. Hallar un conjunto de ecuaciones paramétricas de la recta que pasa por el punto $(-2,0,3)$ y es paralela al vector $v=2i+4j-2k$.
#ejercicio(
  [$
     v=vec(2,4,-2)\
     (-2,0,3)+v t=(-2,0,3)+vec(2,4,-2)t\
     x=-2+2t, y=4t, z=3-2t qed
   $]
)
=== 48. Hallar un conjunto de ecuaciones simétricas de la recta que pasa por el punto $(1,0,1)$ y es paralela a la recta $x=3+3t, y=5-2t, z=-7+t$.
#ejercicio(
  [$
     v=vec(3,-2,1)\
     (1,0,1)+vec(3,-2,1)t\
     x=1+3t arrow.long t=(x-1)/3\
     y=-2t arrow.long t=-(y)/2\
     z=1+t arrow.long t=z-1\
      t=(x-1)/3=-(y)/2=z-1 qed
   $]
)
=== 49. Hallar un conjunro de ecuaciones paramétricas de la recta que pasa por los puntos $(5,-3,-2)$ y $(-2/3,2/3,1)$
#ejercicio(
  [$
     v=vec(-2/3-5,2/3+3,3)=vec(-17/3,11/3,3)\
     (5,-3,-2)+vec(-17/3,11/3,3)\
     x=5-17/3t\
     y=-3+11/3t\
     z=-2+3t
   $]
)
=== 51. Hallar un conjunto de ecuaciones paramétricas de la recta que pasa por el punto $(-4,5,2)$ y es paralela al plano $x y$ y al plano $y z$
#ejercicio(
  [$
     (-4,5,2)+v t\
     "Plano" x y=vec(1,1,0)\
     "Plano" y z=vec(0,1,1)\
     "Restricciones combinadas:" vec(0,1,0)\
     (-4,5,2)+vec(0,1,0) t\
     x=-4+0t\
     y=5+t\
     z=2+0t
   $]
)

=== 52. Hallar un conjunto de ecuaciones paramétricas de la recta que pasa por el punto $(5,-3,-4)$ y es paralela $v=5i-j$.
#ejercicio(
  $
    p=(5,-3,-4)\
    r=p +v t\
    v=5i-j=vec(5,-1,0)\
    (5,-3,-4)+vec(5,-1,0)t\
    x=5+5t\
    y=-3-1t\
    z=-4 qed
  $
)

=== 53. Hallar un conjunto de ecuaciones paramétricas de la recta que pasa por el punto $(2,1,2)$ y es paralela a la recta $x=-t, y=1+t, z=-2+t$.
#ejercicio(
  [$
     p=(2,1,2)\
     r_0=(0,1,-2)+vec(-1,1,1)t\
     r=(2,1,2)+vec(-1,1,1)t\
     x=2-t\
     y=1+t\
     z=2+t qed
   $]
)

=== 54. Determinar si algunas de las rectas son paralelas o idénticas.
#ejercicio(
  [$
     L_1: x=6-3t, y=-2+2t, z=5+4t\
     L_2: x=6t, y=2-4t, z=13-8t\
     L_3: x=10-6t, y=3+4t, z=13+8t\
     L_4: x=-4 + 6t, y=3+4t, z=5-6t\
     "Si los vectores directores son proporcionales, las rectas son paralelas y pueden ser idénticas."\
     v_1=vec(-3,2,4)\
     v_2=vec(6,-4,-8)\
     v_3=vec(-6,4,8)\
     v_4=vec(6,4,-6)\
     v_2=-2v_1\
     v_3=2v_2\
     L_1", "L_2" y "L_3" son paralelas".\
     "Si se pueden encontrar dos puntos en común en dos rectas paralelas, son idénticas."\
     p_1=(6, -2, 5)\
     p_2=(0, 2, 13)\
     p_3=(10, 3, 13)\
     "Para "p_1" y "p_2:\
     6t=0 arrow t=0\
     -2(0)=0 eq.not 2\
     L_1" y "L_2" no son idénticas."\
     "Para "p_1" y "p_3:\
     6t=10 arrow t=5/3\
     -2(5/3)=-10/3 eq.not 3\
     L_1" y "L_3" no son idénticas."\
     L_1", "L_2" y "L_3" son paralelas, pero no idénticas. "L_4" no es paralela a ninguna." qed
   $]
)

=== 55.