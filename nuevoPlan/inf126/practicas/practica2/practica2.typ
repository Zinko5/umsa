#set text(lang:"es")
#set text(font: "DejaVu Sans")
#show math.equation: set text(font: "DejaVu Math TeX Gyre")

#let fechaEntrega = datetime(year: 2025, month: 5, day: 12)

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
  let dia = str(fecha.day())
  let mes = meses.at(fecha.month() - 1)
  let año = str(fecha.year())
  dia + " de " + mes + " del " + año
}

#page(
  background: overlay(image("/utiles/logos/umsaLogo.png", width: 25em), white.transparentize(30%)),
  margin: (x: 3cm),
  paper: "a4"
)[
  #align(center)[
    #text(size: 16pt)[#pad(top: 0pt)[
      Universidad Mayor de San Andrés\
      Facultad de Ciencias Puras y Naturales
    ]]
    #text(size: 30pt)[#pad(top: -5pt)[
      *Practica 2*
    ]]
    #text(size: 16pt)[#pad(top: -15pt)[
      INF 126 - Cálculo II
    ]]
  ]
  #pad(top: 260pt)[
    #text(size: 16pt)[
      *Docente:*
    ]
    #text(size: 14pt)[ #pad(left: 20pt, top: -5pt)[
      Dra. Daisy Arroyo Fernandez
    ]]
  ]
  #pad(top: 15pt)[
    #text(size: 16pt)[
      *Estudiante:*
    ]
    #text(size: 14pt)[ #pad(left: 20pt, top: -5pt)[
      - Gabriel Muñoz Marcelo Callisaya
    ]]
  ]
  #pad(top: 15pt)[
    #text(size: 16pt)[
      *Fecha de entrega:*
    ]
    #text(size: 14pt)[ #pad(left: 20pt, top: -5pt)[
      #formatFecha(fechaEntrega)
    ]]
  ]
  #place(bottom + center)[
    #text(size: 13pt)[
      *La Paz - Bolivia*
    ]
  ]
]
#set page(
  margin: (x: 2.5cm, y: 2.5cm)
)
#set par(justify: true)
#show heading.where(level: 2): set heading(numbering: none)
#show heading.where(level:3): set heading(numbering: none)
#show heading.where(level:3): set text(weight: "regular")
#set enum(indent: 2em)
#show list: it => enum(
  numbering: "a)",
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
      align(left)[
        #par(leading: 1.4em)[
          #enunciado
        ]
      ]
    }
    #align(center)[#resolucion]
    #if conclusion != none {
      align(left)[#text(size: 0.8em)[#h(1em)#emph[#conclusion]]]
    }
  ])
}


= 3. Funciones vectoriales de variable vectorial
== Funciones de $RR^n$ en $RR^m$
=== 2. Sea $F(x,y)=1+sqrt(4-y^2)$,
#ejercicio(
  [
    *a)* Evalúe F(3,1).
  ],
  [$
     F(3,1)=1+sqrt(3) quad qed
  $]
)
#ejercicio(
  [
    *b)* Determine y trace el dominio de $F$.
  ],
  [$
     4-y^2 gt.eq 0 arrow -y^2 gt.eq -4 arrow y^2 lt.eq 4\
     -2 lt.eq y lt.eq 2 quad qed
   $]
)
#ejercicio(
  [
    *c)* Determine el rango de $F$.
  ],
  [$
     "Cuando "y=-2:\
     1+sqrt(4-4)=1\
     "Cuando "y=2:\
     1+sqrt(4-4)=1\
     "Cuando "y=0:\
     1+sqrt(4)=3\
     R in [0,3] quad qed
   $]
)

== Límites y continuidad.
=== 9. Explique por qué cada una de las funciones es continua o discontinua.
#ejercicio(
  [
    *a)* La temperatura en el exterior como función de la longitud, latitud y tiempo\
    R: La función es continua porque la temperatura en todo momento existe y cambia progresivamente, no repentinamente\
    *b)* Elevación (altura sobre el nivel del mar) en función de la longitud, latitud y tiempo.\
    R: La función es discontinua porque la altura puede cambiar repentinamente, por ejemplo en un acantilado\
    *c)* El costo de un viaje en taxi en función de la distancia recorrida y el tiempo.
    La función es discontinua porque el costo en pesos cambia repentinamente
  ]
)

=== 10. Determine el límite, si existe, o demuestre que no existe.
#ejercicio(
  [*a)* $lim _((x,y)arrow (1,2))(5x^3-x^2y^2)$],
  [$
     lim _((x,y)arrow (1,2))(5x^3-x^2y^2) = 5-4=1 quad qed
   $]
)
#ejercicio(
  [*b)* $lim _((x,y)arrow (2,1))(4-x y)/(x^2+3y^2)$],
  [$
     lim _((x,y)arrow (2,1))(4-x y)/(x^2+3y^2) = (4-2)/(4+3)=2/7 quad qed
   $]
)
#ejercicio(
  [*c)* $lim _((x,y)arrow (0,0))(x^4-4y^4)/(x^2+2y^2)$],
  [$
     lim _((x,y)arrow (0,0))(x^4-4y^4)/(x^2+2y^2) = 0/0\
     "Reemplazando por coordenadas polares:"\
     x=r cos theta , y=r sin theta \
     lim_(r arrow 0) ((r cos theta )^4-4(r sin theta)^4)/((r cos theta)^2+2(r sin theta)^2)=(r^4 cos ^4 theta -4r^4 sin ^4 theta)/(r^2 cos^2 theta +2r^2sin^2 theta)=(r^4(cos^4 theta-4sin^4 theta))/(r^2(cos^2 theta + 2 sin^2 theta))\
     =r^2(cos^4 theta - 4 sin^4 theta)/(cos^2 theta + 2 sin^2 theta)\
     "Evaluando la expresión dependiente de "theta:\
     "Si "theta" = "0":"\
     (cos^4 theta - 4 sin^4 theta)/(cos^2 theta + 2 sin^2 theta)=(1)/(1)=r^2 dot 1\
     "Si "theta" = "pi/2":"\
     (cos^4 theta - 4 sin^4 theta)/(cos^2 theta + 2 sin^2 theta)=(-4)/(2)=r^2 dot -2\
     "Como la función está entre -2 y 1, la expresión está acotada"\
     lim_(r arrow 0) r^2(cos^4 theta - 4 sin^4 theta)/(cos^2 theta + 2 sin^2 theta) = 0 quad qed
   $]
)
#ejercicio(
  [*d)* $lim _((x,y)arrow (0,0))(y^2 sin^2 x)/(x^4+y^4)$],
  [$
     lim _((x,y)arrow (0,0))(y^2 sin^2 x)/(x^4+y^4)=0/0\
      "Reemplazando por coordenadas polares:"\
      x = r cos theta, y= r sin theta\
      lim_(r arrow 0)((r sin theta)^2 sin^2(r cos theta))/((r cos theta)^4+(r sin theta)^4)=(r^2 sin^2 theta sin^2(r cos theta))/(r^4 cos^4 theta +r^4 sin^4 theta)approx (r^2 sin^2 theta (r^2 cos theta^2))/(r^4(cos^4 theta + sin^4 theta))\
      = (r^4sin^2 theta cos^2theta)/(r^4(cos^4 theta + sin^4 theta))=(sin^2 theta cos^2 theta)/(cos^4 theta + sin^4 theta)\
      "Probando caminos:"\
      "Si "x=0:\
      (y^2 sin^2 x)/(x^4+y^4)=0\
      "Si "y=0:\
      (y^2 sin^2 x)/(x^4+y^4)=0\
      "Si "y=x:\
      (y^2 sin^2 y)/(2y^4)=(sin^2y)/(2y^2)\
      lim_(y arrow 0) (sin^2 y)/(2y^2)= y^2/(2y^2)=1/2\
      "Como los caminos son distintos, el límite no existe" quad qed\
   $]
)
#ejercicio(
  [*e)* $lim _((x,y)arrow (0,0))(x y)/(sqrt(x^2+y^2))$]
)
#ejercicio(
  [*f)* $lim _((x,y)arrow (0,0))(x^2 y e ^y)/(x^4+4y^2)$]
)
#ejercicio(
  [*g)* $lim _((x,y)arrow (0,0))(x^2+y^2)/(sqrt(x^2+y^2+1)-1)$]
)
#ejercicio(
  [*h)* $lim _((x,y,z)arrow (pi, 0, 1/3))(e^y^2 tan(x z))$]
)
#ejercicio(
  [*i)* $lim _((x,y,z)arrow (0,0,0))(x y+y z^2+x z^2)/(x^2+y^2+z^4)$]
)

=== Examen 2.1 ej 1. Determine el limite.
#ejercicio(
  [$
     lim_((x,y)arrow (0,0))x^3/(x^2+y^2)\
     =0/0\
     "Reemplazando por coordenadas polares:"\
     x=r cos theta, y= r sin theta\
     lim_(r arrow 0)((r cos theta)^3)/((r cos theta)^2+(r sin theta)^2)=(r^3 cos^3 theta)/(r^2 cos ^2 theta+r^2sin^2theta)=(r^3cos^3 theta)/(r^2(cos^2 theta+sin^2 theta))=r (cos^3 theta)/(cos^2 theta + sin ^2 theta)\
     =r cos^3 theta\
     "La expresión depende de "r\
     lim_(r arrow 0)r cos^3 theta=0 quad qed
   $]

)
=== Examen 2.2 ej 2. Determine el límite.
#ejercicio(
  [$
     lim_((x,y)arrow (0,0))(y^2 sin^2 x)/(x^4+y^4)\
     =0/0\
     "Reemplazando por coordenadas polares:"\
     x=r cos theta, y= r sin theta\
     lim_(r arrow 0)((r sin theta)^2sin^2(r cos theta))/((r cos theta)^4+(r sin theta)^4)=(r^2 sin^2 theta (r^2 cos^2 theta))/(r^4 cos^4 theta + r^4 sin^4 theta)=(r^4sin^2theta cos^2 theta)/(r^4(cos^4theta + sin^4 theta))\
     =(sin^2theta cos^2 theta)/(cos^4theta + sin^4 theta)\
     "Como la expresión depende de "theta", el límite no existe." quad qed
   $]
)
