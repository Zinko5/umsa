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


= 4. FUNCIONES VECTORIALES DE VARIABLE VECTORIAL
== Funciones de $RR ^n$ en $RR ^m$
=== 2. Sea $F(x, y) = 1 + sqrt(4-y^2)$.
#ejercicio(
  [
    a) Evalúe $F(3, 1)$.\
    b) Determine y trace el dominio de $F$.\
    c) Determine el rango de $F$.
  ],
  [$
    "a)" F(3,1) = 1 + sqrt(4 - 1^2) = 1 + sqrt(3) \
    "b)" -2 <= y <= 2 \
    "c)" [1, 3] qed
  $]
)
== Limites y continuidad
=== 10. Determine el límite, si existe, o demuestre que no existe.
#ejercicio(
  [
    a) $lim_((x,y)->(1,2)) (5x^3 - x^2 y^2)$ \
    b) $lim_((x,y)->(2,1)) frac(4-x y, x^2 + 3y^2)$ \
    c) $lim_((x,y)->(0,0)) frac(x^4 - 4y^4, x^2 + 2y^2)$ \
    d) $lim_((x,y)->(0,0)) frac(y^2 sin^2 x, x^4 + y^4)$ \
    e) $lim_((x,y)->(0,0)) frac(x y, sqrt(x^2 + y^2))$ \
    f) $lim_((x,y)->(0,0)) frac(x^2 y e^y, x^4 + 4y^2)$ \
    g) $lim_((x,y)->(0,0)) frac(x^2 + y^2, sqrt(x^2 + y^2 + 1) - 1)$ \
    h) $lim_((x,y,z)->(pi,0,1/3)) e^(y^2) tan(x z)$ \
    i) $lim_((x,y,z)->(0,0,0)) frac(x y + y z^2 + x z^2, x^2 + y^2 + z^4)$
  ],
  [$
    "a)" 5(1)^3 - (1)^2 (2)^2 = 5 - 4 = 1 \
    "b)" frac(4 - (2)(1), (2)^2 + 3(1)^2) = frac(4 - 2, 4 + 3) = frac(2, 7) \
    "c)" "No existe" \
    "d)" 0 \
    "e)" 0 \
    "f)" 0 \
    "g)" 2 \
    "h)" e^(0^2) tan(pi dot 1/3) = tan(pi/3) = sqrt(3) \
    "i)" "No existe" qed
  $]
)
=== 12. Determine el conjunto de puntos en los cuales la función es continua.
#ejercicio(
  [
    a) $F(x, y) = cos sqrt(1 + x - y)$ \
    b) $H(x, y) = frac(e^x + e^y, e^(x y) - 1)$ \
    c) $G(x, y) = tan^(-1) ((x + y)^(-2))$ \
    d) $f(x, y, z) = sqrt(y - x^2 ln z)$ \
    e) $f(x, y) = cases(
      frac(x y, x^2 + x y + y^2) "si" (x, y) != (0,0),
      0 "si" (x, y) = (0,0)
    )$
  ],
  [$
    "a)" RR^2 \
    "b)" {(x, y) in RR^2 | e^(x y) != 1} \
    "c)" {(x, y) in RR^2 | x + y != 0} \
    "d)" {(x, y, z) in RR^3 | y - x^2 ln z >= 0, z > 0} \
    "e)" RR^2 qed
  $]
)
== Derivadas parciales
=== 16. Calcule las primeras derivadas parciales de la función.
#ejercicio(
  [
    a) $f(x, y) = x^4 y^3 + 8x^2 y$ \
    b) $f(x,t) = sqrt(x) ln t$ \
    c) $z = tan x y$ \
    d) $f(x, y) = frac(x, (x + y)^2)$ \
    e) $w = frac(e^v, u + v^2)$ \
    f) $u(r, theta) = sin(r cos theta)$ \
    g) $f(x, y) = x^y$ \
    h) $F(alpha, beta) = integral_alpha^beta sqrt(t^3 + 1) d t$ \
    i) $f(x, y, z) = x sin(y - z)$ \
    j) $w = z e^(x y z)$ \
    k) $u = frac(x, y / z)$ \
    l) $phi(x, y, z, t) = frac(alpha x + beta y^2, gamma z + delta t^2)$ \
    m) $u = sin(x_1 + 2x_2 + dots.c + n x_n)$
  ],
  [$
    "a)" f_x = 4 x^3 y^3 + 16 x y \
    f_y = 3 x^4 y^2 + 8 x^2 \
    "b)" f_x = frac(1, 2 sqrt(x)) ln t \
    f_t = frac(sqrt(x), t) \
    "c)" z_x = y sec^2 (x y) \
    z_y = x sec^2 (x y) \
    "d)" f_x = frac(x + y^2, (x + y)^3) \
    f_y = frac(-2 x, (x + y)^3) \
    "e)" w_u = frac(-e^v, (u + v^2)^2) \
    w_v = frac(e^v (u - v^2), (u + v^2)^2) \
    "f)" u_r = cos(r cos theta) cos theta \
    u_theta = -r sin(r cos theta) sin theta \
    
  $]
)
$
"g)" f_x = y x^(y-1) \
    f_y = x^y ln x \
    "h)" F_alpha = -sqrt(alpha^3 + 1) \
    F_beta = sqrt(beta^3 + 1) \
      "i)" f_x = sin(y - z) \
    f_y = x cos(y - z) \
    f_z = -x cos(y - z) \
    "j)" w_x = y z^2 e^(x y z) \
    w_y = x z^2 e^(x y z) \
    w_z = e^(x y z) + x y z e^(x y z) \
    "k)" u_x = frac(y, z) \
    u_y = frac(x, z) \
    u_z = -frac(x y, z^2) \
    "l)" phi_x = frac(alpha, gamma z + delta t^2) \
    phi_y = frac(2 beta y, gamma z + delta t^2) \
    phi_z = frac(-(alpha x + beta y^2) gamma, (gamma z + delta t^2)^2) \
    phi_t = frac(-2 (alpha x + beta y^2) delta t, (gamma z + delta t^2)^2) \
    "m)" u_(x_k) = k cos(x_1 + 2x_2 + dots.c + n x_n), quad k = 1, 2, dots.c, n qed
$
=== 18. Mediante derivación implícita determine $partial z / partial x$ y $partial z / partial y$.
#ejercicio(
  [
    a) $x^2 + 2y^2 + 3z^2 = 1$ \
    b) $e^z = x y z$ \
    c) $y z + x ln y = z^2$
  ],
  [$
    "a)" partial z / partial x = frac(-x, 3z) \
    partial z / partial y = frac(-2y, 3z) \
    "b)" partial z / partial x = frac(z, x z - x y) \
    partial z / partial y = frac(z, y z - x y) \
    "c)" partial z / partial x = frac(-ln y, y - 2z) \
    partial z / partial y = frac(z - x / y, y - 2z) qed
  $]
)
=== 20. Determine las segundas derivadas parciales.
#ejercicio(
  [
    a) $f(x, y) = sin^2 (m x + n y)$ \
    b) $v = frac(x y, x - y)$ \
    c) $v = e^x e^y$
  ],
  [$
    "a)" f_(x x) = -2 m^2 sin^2 (m x + n y) + 2 m^2 cos^2 (m x + n y) \
    f_(x y) = 2 m n cos^2 (m x + n y) - 2 m n sin^2 (m x + n y) \
    f_(y y) = -2 n^2 sin^2 (m x + n y) + 2 n^2 cos^2 (m x + n y) \
    "b)" v_(x x) = frac(2 y^2, (x - y)^3) \
    v_(x y) = frac(-x (x + y), (x - y)^3) \
    v_(y y) = frac(2 x^2, (x - y)^3) \
    "c)" v_(x x) = e^x e^y \
    v_(x y) = e^x e^y \
    v_(y y) = e^x e^y qed
  $]
)
=== 22. Encuentre la derivada parcial indicada.
#ejercicio(
  [
    a) $f(x, y) = x^4 y^2 - x^3 y$; $f_(x x x)$, $f_(x y x)$ \
    b) $f(x, y, z) = e^(x y z^2)$; $f_(x y z)$ \
    c) $u = e^(r theta) sin theta$; $diff^3 u / (diff r^2 diff theta)$ \
    d) $w = frac(x, y + 2z)$; $diff^3 w / (diff z diff y diff x)$, $diff^3 w / (diff x^2 diff y)$
  ],
  [$
    "a)" f_(x x x) = 24 x y^2 - 6 y \
    f_(x y x) = 8 x y - 3 \
    "b)" f_(x y z) = e^(x y z^2) (2 x y z + z^2 (x y z^2 + 1)) \
    "c)" diff^3 u / (diff r^2 diff theta) = e^(r theta) (r^2 sin theta + 2 r cos theta) \
    "d)" diff^3 w / (diff z diff y diff x) = frac(2, (y + 2z)^3) \
    diff^3 w / (diff x^2 diff y) = 0 qed
  $]
)
=== 24. Determine si cada una de las funciones siguientes es una solución de la ecuación de Laplace $u_(x x) + u_(y y) = 0$.
#ejercicio(
  [
    a) $u = x^2 - y^2$ \
    b) $u = ln sqrt(x^2 + y^2)$ \
    c) $u = e^(-x) cos y - e^(-y) cos x$
  ],
  [$
    "a)" u_(x x) = 2 \
    u_(y y) = -2 \
    u_(x x) + u_(y y) = 0 quad "Solución" \
    "b)" u_(x x) = -frac(1, x^2 + y^2) \
    u_(y y) = -frac(1, x^2 + y^2) \
    u_(x x) + u_(y y) = -frac(2, x^2 + y^2) quad "No es solución" \
    "c)" u_(x x) = e^(-x) cos y \
    u_(y y) = -e^(-x) cos y \
    u_(x x) + u_(y y) = 0 quad "Solución" qed
  $]
)
=== 26. Si $f(x, y) = sqrt(x^3 + y^3)^3$, determine $f_x (0, 0)$.
#ejercicio(
  [],
  [$
    f_x (0, 0) = 0 qed
  $]
)
== Regla de la cadena
=== 28. Mediante la regla de la cadena encuentre $partial z / partial s$ y $partial z / partial t$.
#ejercicio(
  [
    a) $z = arcsin(x - y)$, $x = s^2 + t^2$, $y = 1 - 2 s t$ \
    b) $z = e^(x + 2y)$, $x = s / t$, $y = t / s$ \
    c) $tan(u/v)$, $u = 2s + 3t$, $v = 3s - 2t$
  ],
  [$
    "a)" partial z / partial s = frac(2 s + 2 t, sqrt(1 - (s^2 + t^2 - 1 + 2 s t)^2)) \
    partial z / partial t = frac(2 t + 2 s, sqrt(1 - (s^2 + t^2 - 1 + 2 s t)^2)) \
    "b)" partial z / partial s = e^(s/t + 2 t/s) (1/t + 2 t/s^2) \
    partial z / partial t = e^(s/t + 2 t/s) (-s/t^2 + 2/s) \
    "c)" partial z / partial s = frac(2 v + 3 u, v^2 + u^2) \
    partial z / partial t = frac(3 v - 2 u, v^2 + u^2) qed
  $]
)
=== 30. Use la regla de la cadena para calcular las derivadas parciales que se indican.
#ejercicio(
  [
    a) $z = x^4 + x^2 y$, $x = s + 2t - u$, $y = s t u^2$; $partial z / partial s$, $partial z / partial t$, $partial z / partial u$ donde $s = 4$, $t = 2$, $u = 1$ \
    b) $w = x y + y z + z x$, $x = r cos theta$, $y = r sin theta$, $z = r theta$; $partial w / partial r$, $partial w / partial theta$ donde $r = 2$, $theta = pi/2$ \
    c) $N = frac(p + q, p + r)$, $p = u + v w$, $q = v + u w$, $r = w + u v$; $partial N / partial u$, $partial N / partial v$, $partial N / partial w$ donde $u = 2$, $v = 3$, $w = 4$
  ],
  [$
    "a)" partial z / partial s = 4 x^3 + 2 x y + x^2 t u^2 = 2500 \
    partial z / partial t = 8 x^3 + 2 x s u^2 = 2056 \
    partial z / partial u = -4 x^3 + 2 x s t u = -1992 \
    "b)" partial w / partial r = y + z + x theta + y theta + z = 2 pi \
    partial w / partial theta = -r x + r y + r x + r y = 4 \
    "c)" partial N / partial u = frac(w (r - q) + v (q - r) + (p + q), (p + r)^2) = -frac(1, 42) \
    partial N / partial v = frac(u (r - q) + (p + q), (p + r)^2) = frac(5, 42) \
    partial N / partial w = frac(u (q - r), (p + r)^2) = -frac(2, 21) qed
  $]
)
== Diferenciabilidad de una función de varias variables
=== 32. Dado que $f$ es una función diferenciable con $f(2, 5) = 6$, $f_x (2, 5) = 1$, y $f_y (2, 5) = -1$, utilice una aproximación lineal para estimar $f(2.2, 4.9)$.
#ejercicio(
  [],
  [$
    f(2.2, 4.9) approx 6 + 1 (0.2) + (-1) (-0.1) = 6.3 qed
  $]
)
=== 34. Calcule la aproximación lineal de la función $f(x, y, z) = sqrt(x^2 + y^2 + z^2)$ y con ella aproxime el número $sqrt((3.02)^2 + (1.97)^2 + (5.99)^2)$.
#ejercicio(
  [],
  [$
    L(x, y, z) = 7 + frac(3, 7) (x - 3) + frac(2, 7) (y - 2) + frac(6, 7) (z - 6) \
    f(3.02, 1.97, 5.99) approx 7 + frac(3, 7) (0.02) + frac(2, 7) (-0.03) + frac{6, 7} (-0.01) = 6.989 qed
  $]
)
=== 36. Si $z = 5x^2 + y^2$ y $(x, y)$ cambia de $(1, 2)$ a $(1.05, 2.1)$, compare los valores de $Delta z$ y $d z$.
#ejercicio(
  [],
  [$
    Delta z = 5 (1.05)^2 + (2.1)^2 - (5 (1)^2 + (2)^2) = 0.5525 \
    d z = 10 x d x + 2 y d y = 10 (1) (0.05) + 2 (2) (0.1) = 0.9 qed
  $]
)
=== 38. Use diferenciales para estimar la cantidad de metal en una lata cilíndriffra cerrada que mide 10 cm de altura y 4 cm de diámetro. El metal para la parte superior y el fondo es de 0.1 cm de grueso y el metal de los lados tiene 0.05 cm de espesor.
#ejercicio(
  [],
  [$
    V = 2 pi r^2 h + 2 pi r t_1 h + 4 pi r^2 t_2 \
    d V = (4 pi r h + 4 pi t_1 h + 8 pi r t_2) d r \
    d V = (4 pi (2) (10) + 4 pi (0.05) (10) + 8 pi (2) (0.1)) (0.05) approx 4.084 " cm"^3 qed
  $]
)
== Vector gradiente
=== 40. Determine la derivada direccional de $f$ en el punto dado en la dirección que indica el ángulo $theta$.
#ejercicio(
  [
    a) $f(x, y) = x^3 y^4 + x^4 y^3$, $(1, 1)$, $theta = pi/6$ \
    b) $f(x, y) = e^x cos y$, $(0, 0)$, $theta = pi/4$
  ],
  [$
    "a)" nabla f = vec(3 x^2 y^4 + 4 x^3 y^3, 4 x^3 y^3 + 3 x^4 y^2) \
    nabla f(1, 1) = vec(7, 7) \
    u = vec(cos(pi/6), sin(pi/6)) = vec(sqrt(3)/2, 1/2) \
    D_u f(1, 1) = 7 sqrt(3)/2 + 7/2 = frac(7 (sqrt(3) + 1), 2) \
    "b)" nabla f = vec(e^x cos y, -e^x sin y) \
    nabla f(0, 0) = vec(1, 0) \
    u = vec(cos(pi/4), sin(pi/4)) = vec(sqrt(2)/2, sqrt(2)/2) \
    D_u f(0, 0) = 1 dot sqrt(2)/2 = sqrt(2)/2 qed
  $]
)
=== 42. Calcule la derivada direccional de la función en el punto dado en la dirección del vector $v$.
#ejercicio(
  [
    a) $f(x, y) = e^x sin y$, $(0, pi/3)$, $v = vec(-6, 8)$ \
    b) $g(p, q) = p^4 - p^2 q^3$, $(2, 1)$, $v = vec(1, 3)$ \
    c) $f(x, y, z) = x e^y + y e^z + z e^x$, $(0, 0, 0)$, $v = vec(5, 1, -2)$ \
    d) $h(r, s, t) = ln(3r + 6s + 9t)$, $(1, 1, 1)$, $v = vec(4, 12, 6)$
  ],
  [$
    "a)" nabla f = vec(e^x sin y, e^x cos y) \
    nabla f(0, pi/3) = vec(sqrt(3)/2, 1/2) \
    u = frac(vec(-6, 8), sqrt(100)) = vec(-3/5, 4/5) \
    D_u f = sqrt(3)/2 (-3/5) + 1/2 (4/5) = frac(-3 sqrt(3) + 4, 10) \
    "b)" nabla g = vec(4 p^3 - 2 p q^3, -3 p^2 q^2) \
    nabla g(2, 1) = vec(30, -12) \
    u = frac(vec(1, 3), sqrt(10)) \
    D_u g = frac(30 - 36, sqrt(10)) = -frac(6, sqrt(10)) \
    "c)" nabla f = vec(e^y + z e^x, x e^y + e^z, y e^z + e^x) \
    nabla f(0, 0, 0) = vec(1, 1, 1) \
    u = frac(vec(5, 1, -2), sqrt(30)) \
    D_u f = frac(5 + 1 - 2, sqrt(30)) = frac(4, sqrt(30)) \
    "d)" nabla h = vec(frac(3, 3r + 6s + 9t), frac(6, 3r + 6s + 9t), frac(9, 3r + 6s + 9t)) \
    nabla h(1, 1, 1) = vec(1/6, 1/3, 1/2) \
    u = frac(vec(4, 12, 6), sqrt(196)) = vec(2/7, 6/7, 3/7) \
    D_u h = frac(1/6 dot 2/7 + 1/3 dot 6/7 + 1/2 dot 3/7, 7) = frac(43/6, 7) = 43/42 qed
  $]
)
=== 44. Encuentre la derivada direccional de $f(x, y, z) = x y + y z + z x$ en $P(1, -1, 3)$ en la dirección de $Q(2, 4, 5)$.
#ejercicio(
  [],
  [$
    nabla f = vec(y + z, x + z, x + y) \
    nabla f(1, -1, 3) = vec(2, 4, 0) \
    v = vec(1, 5, 2) \
    u = frac(vec(1, 5, 2), sqrt(30)) \
    D_u f = vec(2, 4, 0) dot frac(vec(1, 5, 2), sqrt(30)) = frac(2 + 20, sqrt(30)) = frac(22, sqrt(30)) qed
  $]
)
== Matriz Jacobiana
=== 48. Halla la matriz Jacobiana en el punto $(0, -2)$ de la siguiente función vectorial con 2 variables: $f(x, y) = (e^(x y) + y, y^2 x)$.
#ejercicio(
  [],
  [$
    J = mat(
      y e^(x y), e^(x y) + 1;
      y^2, 2 x y
    ) \
    J(0, -2) = mat(
      -2, 2;
      4, 0
    ) qed
  $]
)
=== 50. Determina la matriz Jacobiana en el punto $(2, -2, 2)$ de la siguiente función con 3 variables: $f(x, y, z) = (z tan(x^2 - y^2), x y ln (z^2))$.
#ejercicio(
  [],
  [$
    J = mat(
      2 x z sec^2 (x^2 - y^2), 2 y z sec^2 (x^2 - y^2), tan(x^2 - y^2);
      y ln (z^2), x ln (z^2), 2 x y / z
    ) \
    J(2, -2, 2) = mat(
      4 z sec^2 (8), -4 z sec^2 (8), tan(8);
      -2 ln 4, 2 ln 4, -2
    ) qed
  $]
)
=== 52. Determina la matriz Jacobiana en el punto $(3,0, pi)$ de la siguiente función con 3 variables: $f(x, y, z) = (x e^(2y) cos(-z), (y + 2)^3 sin (z/2), e^(2y) ln (x^3))$.
#ejercicio(
  [],
  [$
    J = mat(
      e^(2y) cos(-z), 2 x e^(2y) cos(-z), x e^(2y) sin(-z);
      0, 3 (y + 2)^2 sin(z/2), 1/2 (y + 2)^3 cos(z/2);
      3/x, 2 e^(2y) ln (x^3), 0
    ) \
    J(3, 0, pi) = mat(
      -3, -6, 0;
      0, 24, 0;
      1, 0, 0
    ) qed
  $]
)
=== 54. Encuentra la matriz Hessiana en el punto $(1,1)$ de la siguiente función con 2 variables: $f(x, y) = e^y ln x$.
#ejercicio(
  [],
  [$
    f_x = frac(e^y, x), quad f_y = e^y ln x \
    f_(x x) = -frac(e^y, x^2), quad f_(x y) = frac(e^y, x), quad f_(y y) = e^y ln x \
    H(1,1) = mat(
      -e, e;
      e, 0
    ) qed
  $]
)
=== 56. Hallar el determinante de la matriz Hessiana de la función $f(x, y) = x^3 + x^2 y + 3 x y + 2$ en el punto $(-1, 2)$.
#ejercicio(
  [],
  [$
    f_x = 3 x^2 + 2 x y + 3 y, quad f_y = x^2 + 3 x \
    f_(x x) = 6 x + 2 y, quad f_(x y) = 2 x + 3, quad f_(y y) = 0 \
    H(-1, 2) = mat(
      -2, -1;
      -1, 0
    ) \
    det(H) = (-2)(0) - (-1)(-1) = -1 qed
  $]
)
== Derivada direccional
=== 58. Calcular la derivada direccional en la dirección de $v$ en el punto que se indica.
#ejercicio(
  [
    a) $f(x, y) = x^2 y^3$, $v = vec(1, 1)$, $P = (-2, 1)$ \
    b) $f(x, y) = sin(x - y)$, $v = vec(1, 1)$, $P = (pi/2, pi/6)$ \
    c) $f(x, y) = e^(x y - y^2)$, $v = vec(12, -5)$, $P = (2,2)$ \
    d) $g(x, y, z) = z^2 - x y^2$, $v = vec(-1, 2, 2)$, $P = (2, 1, 3)$ \
    e) $g(x, y, z) = x ln(y + z)$, $v = vec(2, -1, 1)$, $P = (2, e, e)$
  ],
  [$
    "a)" nabla f = vec(2 x y^3, 3 x^2 y^2), nabla f(-2, 1) = vec(-2, 12) \
    u = frac(vec(1, 1), sqrt(2)) = vec(1/sqrt(2), 1/sqrt(2)) \
    D_u f = (-2)(1/sqrt(2)) + 12 (1/sqrt(2)) = frac{10, sqrt(2)) = 5 sqrt(2) \
    "b)" nabla f = vec(cos(x - y), -cos(x - y)), nabla f(pi/2, pi/6) = vec(1/2, -1/2) \
    u = frac(vec(1, 1), sqrt(2)), D_u f = (1/2)(1/sqrt(2)) + (-1/2)(1/sqrt(2)) = 0 \
    "c)" nabla f = vec(y e^(x y - y^2), (x - 2 y) e^(x y - y^2)), nabla f(2, 2) = vec(2, -2) \
    u = frac(vec(12, -5), sqrt(169)) = vec(12/13, -5/13) \
    D_u f = 2 (12/13) + (-2)(-5/13) = frac{34, 13) \
    "d)" nabla g = vec(-y^2, -2 x y, 2 z), nabla g(2, 1, 3) = vec(-1, -4, 6) \
    u = frac(vec(-1, 2, 2), sqrt(9)) = vec(-1/3, 2/3, 2/3) \
    D_u g = (-1)(-1/3) + (-4)(2/3) + 6 (2/3) = frac{1 - 8 + 12, 3) = 5/3 \
    "e)" nabla g = vec(ln(y + z), x/(y + z), x/(y + z)), nabla g(2, e, e) = vec(ln(2 e), 1/e, 1/e) \
    u = frac(vec(2, -1, 1), sqrt(6)) \
    D_u g = ln(2 e)(2/sqrt(6)) + (1/e)(-1/sqrt(6)) + (1/e)(1/sqrt(6)) = frac{2 ln(2 e), sqrt(6)) qed
  $]
)
=== 60. Hallar la derivada direccional de $f(x, y, z) = x y + z^3$ en $P = (3, -2, -1)$ en la dirección que apunta al origen.
#ejercicio(
  [],
  [$
    nabla f = vec(y, x, 3 z^2), nabla f(3, -2, -1) = vec(-2, 3, 3) \
    v = vec(-3, 2, 1), u = frac(vec(-3, 2, 1), sqrt(14)) \
    D_u f = vec(-2, 3, 3) dot frac(vec(-3, 2, 1), sqrt(14)) = frac{6 + 6 + 3, sqrt(14)) = frac{15, sqrt(14)) qed
  $]
)
=== 62. Sea $f(x, y, z) = sin(x y + z)$ y $P = (0, -1, pi)$. Calcule $D_u f(P)$, donde $u$ es un vector unitario que forma un ángulo de $theta = 30^circle$ con $nabla f_P$.
#ejercicio(
  [],
  [$
    nabla f = vec(y cos(x y + z), x cos(x y + z), cos(x y + z)) \
    nabla f(0, -1, pi) = vec(-cos(-1 + pi), 0, cos(pi)) = vec(-cos(pi - 1), 0, -1) \
    u = cos(30^circle) frac(nabla f, nor(nabla f)) + sin(30^circle) v, quad v " ortogonal a " nabla f, quad nor(v) = 1 \
    D_u f = cos(30^circle) nor(nabla f) = frac(sqrt(3), 2) sqrt(cos^2(pi - 1) + 1) qed
  $]
)

=== 64. Halle una función $f(x, y, z)$ tal que $nabla f = vec(2x, 1, 2)$.
#ejercicio(
  [],
  [$
    f(x, y, z) = x^2 + y + 2z + C qed
  $]
)
=== 66. Halle una función $f(x, y)$ tal que $nabla f = vec(y, x)$.
#ejercicio(
  [],
  [$
    f(x, y) = x y + C qed
  $]
)
=== 68. Compruebe las relaciones de linealidad para los gradientes:
#ejercicio(
  [
    a) $nabla(f + g) = nabla f + nabla g$ \
    b) $nabla(c f) = c nabla f$
  ],
  [$
    "a)" nabla(f + g) = vec(frac(partial (f+g), partial x), frac(partial (f+g), partial y)) = vec(frac(partial f, partial x) + frac(partial g, partial x), frac(partial f, partial y) + frac(partial g, partial y)) = nabla f + nabla g \
    "b)" nabla(c f) = vec(frac(partial (c f), partial x), frac(partial (c f), partial y)) = vec(c frac(partial f, partial x), c frac(partial f, partial y)) = c nabla f qed
  $]
)
== Plano tangente
=== 70. Halle los puntos sobre la gráfica de $z = 3x^2 - 4y^2$ en los que el vector $n = vec(3, 2, 2)$ es normal al plano tangente.
#ejercicio(
  [],
  [$
    nabla f = vec(6x, -8y, -1), quad vec(6x, -8y, -1) parallel vec(3, 2, 2) \
    6x = 3k, -8y = 2k, -1 = 2k quad => quad k = -1/2, x = -1/4, y = 1/8 \
    z = 3(-1/4)^2 - 4(1/8)^2 = 1/8, quad "Punto" (-1/4, 1/8, 1/8) qed
  $]
)
=== 72. Halle una ecuación del plano tangente a $z = f(x, y)$ en $P(1.2, 10)$ suponiendo que: $f(1, 2) = 10$, $f(1.1, 2.01) = 10.3$, $f(1.04, 2.1) = 9.7$.
#ejercicio(
  [],
  [$
    f_x(1, 2) approx frac(f(1.1, 2) - f(1, 2), 0.1), f_y(1, 2) approx frac(f(1, 2.1) - f(1, 2), 0.1) \
    f_x(1, 2) approx 3, f_y(1, 2) approx -3 \
    z - 10 = 3 (x - 1) - 3 (y - 2) qed
  $]
)
== Derivación implícita
=== 74. Suponga que $z$ está definida implícitamente como función de $x$ y de $y$ mediante la ecuación $F(x, y, z) = x z^2 + y^2 z + x y - 1 = 0$.
#ejercicio(
  [
    a) Calcule $F_x$, $F_y$, $F_z$. \
    b) Use las siguientes ecuaciones para calcular $partial z / partial x$ y $partial z / partial y$: $partial z / partial x = - F_x / F_z$ y $partial z / partial y = - F_y / F_z$.
  ],
  [$
    "a)" F_x = z^2 + y, quad F_y = 2 y z + x, quad F_z = 2 x z + y^2 \
    "b)" partial z / partial x = -frac(z^2 + y, 2 x z + y^2) \
    partial z / partial y = -frac(2 y z + x, 2 x z + y^2) qed
  $]
)
=== 76. Calcular las derivadas parciales usando derivación implícita.
#ejercicio(
  [
    a) $partial z / partial x$, $x^2 y + y^2 z + x z^2 = 10$ \
    b) $partial w / partial z$, $x^2 w + w^3 + w z^2 + 3 y z = 0$ \
    c) $partial w / partial y$, $1/(w^2 + x^2) + 1/(w^2 + y^2) = 1$ en $(x, y, w) = (1, 1, 1)$ \
    d) $partial U / partial T$ y $partial T / partial U$, $(T U - V)^2 ln(W - U V) = 1$ en $(T, U, V, W) = (1, 1, 2, 4)$
  ],
  [$
    "a)" F = x^2 y + y^2 z + x z^2 - 10, quad F_x = 2 x y + z^2, F_z = y^2 + 2 x z \
    partial z / partial x = -frac(2 x y + z^2, y^2 + 2 x z) \
    "b)" F = x^2 w + w^3 + w z^2 + 3 y z, quad F_w = x^2 + 3 w^2 + z^2, F_z = 2 w z + 3 y \
    partial w / partial z = -frac(2 w z + 3 y, x^2 + 3 w^2 + z^2) \
    "c)" F = frac(1, w^2 + x^2) + frac(1, w^2 + y^2) - 1, quad F_w = -frac(2 w, (w^2 + x^2)^2) - frac(2 w, (w^2 + y^2)^2), F_y = -frac(2 y, (w^2 + y^2)^2) \
    partial w / partial y = frac(frac(2 y, (w^2 + y^2)^2), frac(2 w, (w^2 + x^2)^2) + frac(2 w, (w^2 + y^2)^2)) = 1/2 \
    "d)" F = (T U - V)^2 ln(W - U V) - 1, quad F_T = 2 (T U - V) U ln(4 - 2), F_U = 2 (T U - V) T ln(2) - (T U - V)^2 frac(2, 2) \
    partial U / partial T = -frac(2 U ln 2, 2 T ln 2 - 1) = -2, quad partial T / partial U = -frac(2 T ln 2 - 1, 2 U ln 2) = -1/2 qed
  $]
)
=== 78. La presión $P$, volumen $V$, y temperatura $T$ de un gas de van der Waals de $n$ moléculas (n constante) están relacionadas por medio de la ecuación: $(P + a n^2 / V^2) (V - n b) = n R T$ donde $a, b$ y $R$ son constantes. Calcule $partial P / partial T$ y $partial V / partial P$.
#ejercicio(
  [],
  [$
    F = (P + frac(a n^2, V^2))(V - n b) - n R T, quad F_P = V - n b, F_T = -n R, F_V = P + frac(a n^2, V^2) - frac(2 a n^2, V^3)(V - n b) \
    partial P / partial T = -frac(-n R, V - n b) = frac(n R, V - n b) \
    partial V / partial P = -frac(V - n b, P + frac(a n^2, V^2) - frac(2 a n^2, V^3)(V - n b)) qed
  $]
)
== Máximos y Mínimos de Funciones de Varias Variables. Valores Extremos Locales. Valores Extremos Globales
=== 82. Halle los puntos críticos de la función. A continuación, utilice el criterio de la segunda derivada para determinar si se trata de máximos locales, mínimos locales o puntos de silla (o bien establezca que el criterio no decide).
#ejercicio(
  [
    a) $f(x, y) = x^2 + y^2 - x y + x$ \
    b) $f(x, y) = x^3 + 2 x y - 2 y^2 - 10 x$ \
    c) $f(x, y) = 4 x - 3 x^3 - 2 x y^2$ \
    d) $f(x, y) = x^4 + y^4 - 4 x y$ \
    e) $f(x, y) = x y e^(-x^2 - y^2)$ \
    f) $f(x, y) = ln x + 2 ln y - x - 4 y$ \
    g) $f(x, y) = x - y^2 - ln(x + y)$ \
    h) $f(x, y) = (x + 3 y) e^(y - x^2)$
  ],
  [$
    "a)" f_x = 2 x - y + 1, f_y = 2 y - x, quad x = 2/3, y = 1/3, quad D = 4 dot 2 - (-1)^2 = 7 > 0, f_(x x) = 2 > 0 quad => quad "Mínimo" \
    "b)" f_x = 3 x^2 + 2 y - 10, f_y = 2 x - 4 y, quad (4, 1), (-4, -1), quad D(4, 1) = 24 dot (-4) - 2^2 < 0 quad => \
    quad "Silla", quad D(-4, -1) > 0, f_(x x) > 0 quad => quad "Mínimo" \
    "c)" f_x = 4 - 9 x^2 - 2 y^2, f_y = -4 x y, quad (0, 0), (2/sqrt(3), 0), (-2/sqrt(3), 0), quad D(0, 0) < 0 quad => quad "Silla", \
    quad D(p m 2/sqrt(3), 0) > 0, f_(x x) < 0 quad => quad "Máximo" \
    "d)" f_x = 4 x^3 - 4 y, f_y = 4 y^3 - 4 x, quad (0, 0), (1, 1), (-1, -1), quad D(0, 0) < 0 quad => quad "Silla", \
    quad D(1, 1), D(-1, -1) > 0, f_(x x) > 0 quad => quad "Mínimo" \
    "e)" f_x = y e^(-x^2 - y^2) - 2 x^2 y e^(-x^2 - y^2), f_y = x e^(-x^2 - y^2) - 2 x y^2 e^(-x^2 - y^2), \
    quad (0, 0), (1/sqrt(2), 1/sqrt(2)), (-1/sqrt(2), -1/sqrt(2)), quad D(0, 0) = 0, D(p m 1/sqrt(2), p m 1/sqrt(2)) > 0, f_(x x) < 0 quad => quad "Máximo" \
    "f)" f_x = 1/x - 1, f_y = 2/y - 4, quad (1, 1/2), quad D = frac(1, x^2) dot frac(2, y^2) > 0, f_(x x) > 0 quad => quad "Mínimo" \
    "g)" f_x = 1 - 1/(x + y), f_y = -2 y - 1/(x + y), quad (1, -1/2), quad D > 0, f_(x x) > 0 quad => quad "Mínimo" \
    "h)" f_x = e^(y - x^2) - 2 x (x + 3 y) e^(y - x^2), f_y = (x + 3 y) e^(y - x^2) + 3 e^(y - x^2), quad (0, 0), (sqrt(3/2), -1/2), (-sqrt(3/2), -1/2), \
    quad D(0, 0) < 0 quad => quad "Silla", quad D(p m sqrt(3/2), -1/2) > 0, f_(x x) < 0 quad => quad "Máximo" qed
  $]
)
=== 84. Determine los valores extremos globales de la función sobre el conjunto que se indica sin utilizar argumentos de cálculo.
#ejercicio(
  [
    a) $f(x, y) = 2x - y$, $0 <= x <= 1$, $0 <= y <= 3$ \
    b) $f(x, y) = e^(-x^2 - y^2)$, $x^2 + y^2 <= 1$
  ],
  [$
    "a)" f_x = 2, f_y = -1, quad f(0, 3) = -3 " (mínimo)", f(1, 0) = 2 " (máximo)" \
    "b)" f(0, 0) = 1 " (máximo)", f " tiende a " 0 " en la frontera " x^2 + y^2 = 1 " (mínimo)" qed
  $]
)
=== 86. Halle el máximo de $f(x, y) = y^2 + x y - x^2$ sobre el cuadrado $0 <= x <= 2$, $0 <= y <= 2$.
#ejercicio(
  [],
  [$
    f_x = y - 2 x, f_y = 2 y + x, quad x = -2/5, y = -4/5 " (fuera del cuadrado)" \
    y = 0: f(x, 0) = -x^2, "máximo" f(0, 0) = 0; y = 2: f(x, 2) = 4 + 2 x - x^2, x = 1, f(1, 2) = 5 \
    x = 0: f(0, y) = y^2, y = 2, f(0, 2) = 4; x = 2: f(2, y) = y^2 + 2 y - 4, y = -1 " (fuera)", f(2, 2) = 4 \
    "Máximo" = 5 " en " (1, 2) qed
  $]
)
=== 88. Halle el volumen máximo de una caja inscrita en el tetraedro limitado por los planos coordenados y el plano $x + y/2 + z/3 = 1$.
#ejercicio(
  [],
  [$
    V = x y z, quad x, y, z >= 0, quad x + y/2 + z/3 = 1 \
    "Usando Lagrange:" nabla V = vec(y z, x z, x y), nabla g = vec(1, 1/2, 1/3), quad y z = lambda, x z = lambda/2, x y = lambda/3 \
    x = y/2 = z/3, quad x = 1/3, y = 2/3, z = 1, quad V = 1/3 dot 2/3 dot 1 = 2/9 qed
  $]
)
=== 90. Halle el volumen máximo de mayor caja del tipo que se muestra en la figura, con una esquina en el origen y la esquina opuesta en el punto $P = (x, y, z)$ sobre el paraboloide $z = 1 - x^2/4 - y^2/9$ con $x, y, z >= 0$.
#ejercicio(
  [],
  [$
    V = x y z, quad z = 1 - x^2/4 - y^2/9, quad V = x y (1 - x^2/4 - y^2/9) \
    V_x = y (1 - x^2/4 - y^2/9) - x y (x/2), V_y = x (1 - x^2/4 - y^2/9) - x y (2 y/9), quad x = sqrt(2), 0, y = sqrt(3)/2, V = 2 sqrt(6)/3 qed
  $]
)
== Máximos y Mínimos Condicionados (Multiplicadores de Lagrange)
=== 92. Halle los valores mínimo y máximo de la función sujeta a la restricción dada.
#ejercicio(
  [
    a) $f(x, y) = x^2 + y^2$, $2x + 3y = 6$ \
    b) $f(x, y) = x y$, $4x^2 + 9y^2 = 32$ \
    c) $f(x, y) = x^2 + y^2$, $x^4 + y^4 = 1$ \
    d) $f(x, y, z) = 3x + 2y + 4z$, $x^2 + 2y^2 + 6z^2 = 1$ \
    e) $f(x, y, z) = x y + 3x z + 2y z$, $5x + 9y + z = 10$
  ],
  [$
    "a)" nabla f = vec(2 x, 2 y), nabla g = vec(2, 3), quad 2 x = 2 lambda, 2 y = 3 lambda, 2 x + 3 y = 6, quad x = 18/13, y = 12/13, f = 36/13 " (mínimo)" \
    "b)" nabla f = vec(y, x), nabla g = vec(8 x, 18 y), quad y = 8 lambda x, x = 18 lambda y, 4 x^2 + 9 y^2 = 32, quad x = p m 2, y = p m 4/3, f = p m 8/3 \
    "c)" nabla f = vec(2 x, 2 y), nabla g = vec(4 x^3, 4 y^3), quad x = lambda x^3, y = lambda y^3, x^4 + y^4 = 1, \
    quad (p m 1, 0), (0, p m 1), (p m 1/sqrt(2), p m 1/sqrt(2)), f = 1, 1, 2 \
    "d)" nabla f = vec(3, 2, 4), nabla g = vec(2 x, 4 y, 12 z), quad 3 = 2 lambda x, 2 = 4 lambda y, 4 = 12 lambda z, x^2 + 2 y^2 + 6 z^2 = 1, \
    quad x = p m 3/sqrt(29), y = p m 1/sqrt(29), z = p m 2/3 sqrt(29), f = p m sqrt(29) \
    "e)" nabla f = vec(y + 3 z, x + 2 z, 3 x + 2 y), nabla g = vec(5, 9, 1), quad y + 3 z = 5 lambda, x + 2 z = 9 lambda, 3 x + 2 y = lambda, \
    5 x + 9 y + z = 10, quad x = 11/14, y = 5/14, z = 15/14, f = 95/14 " (máximo)", f = -95/14 " (mínimo)" qed
  $]
)
=== 94. El área de un cono circular de radio $r$ y altura $h$ es $S = pi r sqrt(r^2 + h^2)$, y su volumen es $V = 1/3 pi r^2 h$.
#ejercicio(
  [
    a) Determine el cociente $h/r$ para el cono de área dada $S$ y máximo volumen $V$. \
    b) ¿A qué es igual el cociente $h/r$ para un cono de volumen dado $V$ y área mínima $S$? \
    c) ¿Existe un cono de volumen dado $V$ y área máxima?
  ],
  [$
    "a)" V = frac(1, 3) pi r^2 h, g = pi r sqrt(r^2 + h^2) - S, quad nabla V = vec(frac(2, 3) pi r h, frac(1, 3) pi r^2), \
    nabla g = vec(pi sqrt(r^2 + h^2) + frac(pi r^2, sqrt(r^2 + h^2)), frac(pi r h, sqrt(r^2 + h^2))), quad h/r = 2 \
    "b)" S = pi r sqrt(r^2 + h^2), g = frac(1, 3) pi r^2 h - V, quad nabla S = vec(pi sqrt(r^2 + h^2) + frac(pi r^2, sqrt(r^2 + h^2)), \
    frac(pi r h, sqrt(r^2 + h^2))), nabla g = vec(frac(2, 3) pi r h, frac(1, 3) pi r^2), quad h/r = sqrt(2) \
    "c)" "No existe, ya que el área puede crecer indefinidamente." qed
  $]
)
=== 96. Halle el valor máximo de $f(x, y) = x^a y^b$ para $x >= 0$, $y >= 0$ sobre la circunferencia unitaria, donde $a, b > 0$ son constantes.
#ejercicio(
  [],
  [$
    nabla f = vec(a x^(a-1) y^b, b x^a y^(b-1)), nabla g = vec(2 x, 2 y), quad a x^(a-1) y^b = 2 lambda x, b x^a y^(b-1) = 2 lambda y, x^2 + y^2 = 1 \
    x^2 = frac(a, a + b), y^2 = frac(b, a + b), quad f = (frac(a, a + b))^(a/2) (frac(b, a + b))^(b/2) qed
  $]
)
=== 98. El cilindro $x^2 + y^2 = 1$ interseca con el plano $x + z = 1$ formando una elipse. Halle el punto sobre esta elipse que esté más lejos del origen.
#ejercicio(
  [],
  [$
    f = x^2 + y^2 + z^2, g_1 = x^2 + y^2 - 1, g_2 = x + z - 1, quad nabla f = vec(2 x, 2 y, 2 z), nabla g_1 = vec(2 x, 2 y, 0), nabla g_2 = vec(1, 0, 1) \
    2 x = 2 lambda_1 x + lambda_2, 2 y = 2 lambda_1 y, 2 z = lambda_2, x^2 + y^2 = 1, x + z = 1 \
    y = 0, x = p m 1, z = 0, f = 1; x = 1/2, y = p m sqrt(3)/2, z = 1/2, f = 5/4 \
    "Máximo en" (1/2, p m sqrt(3)/2, 1/2) qed
  $]
)
=== 100. Halle el valor mínimo de $f(x, y, z) = x^2 + y^2 + z^2$ sujeta a las dos restricciones $x + 2y + z = 3$ y $x - y = 4$.
#ejercicio(
  [],
  [$
    nabla f = vec(2 x, 2 y, 2 z), nabla g_1 = vec(1, 2, 1), nabla g_2 = vec(1, -1, 0), quad 2 x = lambda_1 + lambda_2, 2 y = 2 lambda_1 - lambda_2, \
    2 z = lambda_1, x + 2 y + z = 3, x - y = 4 \
    x = 41/9, y = 5/9, z = -4/9, f = 378/81 = 42/9 qed
  $]
)
