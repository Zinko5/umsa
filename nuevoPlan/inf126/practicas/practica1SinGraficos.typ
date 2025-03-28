#set page(
  margin: (x: 2.5cm, y: 2.5cm) //Para trabajos digitales e impresos simples
  // margin: (left: 3.8cm, y: 2.5cm, right: 2.5cm) //Para trabajos impresos a doble cara
)
#set text(lang:"es")
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
#import "@preview/cetz:0.3.2"
#import cetz.draw: *
#let ejercicio(..args) = {
  let (enunciado, resolucion) = if args.pos().len() == 1 {
    (none, args.pos().at(0))
  } else {
    (args.pos().at(0), args.pos().at(1))
  }

  block(width: 100%, breakable: false, [
    #if enunciado != none {
      align(left)[#h(1em)#enunciado]
    }
    #align(center)[#h(1em)#resolucion]
  ])
}

// #let  = $angle.l$
// #let  = $angle.r$
// #let nor = $bar.v.double$

#let vec(a, b) = $lr(angle.l #a, #b angle.r)$
#let nor(a) = $lr(bar.v.double #a bar.v.double)$

= Vectores
== Vectores en dos y tres dimensiones
=== 2. Calcular cada uno de los múltiplos escalares de $v=vec(-1,5)$

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

=== 5. Encontrar la magnitud del vector $v= -10i+3j$
#ejercicio(
  [$
    v=-10i+3j=vec(-10,3)\
    nor(v)= sqrt((10)^2+3^2)\
    =sqrt(100+9)=sqrt(109) qed
   $]
)

=== 8. Hallar $nor(frac(u+v,nor(u+ v)))$ si $u=vec(2,4)$ y $v=vec(5,5)$
#ejercicio(
  [$
     u+v=vec(2+5,4+5)=vec(7,9)\
     nor(u+v)=sqrt(7^2+9^2)=sqrt(49+81)=sqrt(130)\
     frac(u+v,nor(u+v))=vec(7/sqrt(130),9/sqrt(130))\
     nor(frac(u+v,nor(u+v)))=sqrt((7/sqrt(130))^2+(9/sqrt(130))^2)=sqrt(49/130+81/130)=sqrt(130/130)=sqrt(1)=1 qed
   $]
)