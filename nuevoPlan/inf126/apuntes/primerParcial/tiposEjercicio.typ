#set page(
  margin: (x: 2.5cm, y: 2.5cm) //Para trabajos digitales e impresos simples
  // margin: (left: 3.8cm, y: 2.5cm, right: 2.5cm) //Para trabajos impresos a doble cara
)
#set text(lang:"es")
#set text(font: "DejaVu Sans")
#show math.equation: set text(font: "DejaVu Math TeX Gyre")
// #show math.equation: set text(size: 1.1em)
#set par(justify: true)
#show math.equation:box
#set grid(inset: 0.6em)
#show grid: g => align(center, g)

- Determinar el vector de norma 4 que forma un angulo de $pi/4$ con el eje x positivo
#grid(
    columns: (auto, auto),
    align: (right + horizon, left + horizon),
    [Si la norma es], [$||v||=4$],
    [], [$arrow(v)=4[cos pi/4, sin pi/4]$],
    [], [$arrow(v)=4[sqrt(2)/2, sqrt(2)/2]$],
    [], [$arrow(v)=[2sqrt(2), 2sqrt(2)]$],
)

- Determinar el vector de norma $x$ que forma un angulo de $theta$ con el eje x positivo
#grid(
    columns: (auto, auto),
    align: (right + horizon, left + horizon),
    [Si la norma es], [$||v||=x$],
    [], [$arrow(v)=x[cos theta, sin theta]$],
    [], [$arrow(v)=[x dot cos theta, x dot sin theta]$],
)

- Demostrar que $arrow(v) dot arrow(v) gt.eq 0$
#grid(
    columns: (auto, auto),
    align: (right + horizon, left + horizon),
    [Sea], [$arrow(v)=[v_1, v_2]$],
    [El producto escalar es], [$arrow(v) dot arrow(v) = v_1 v_1 + v_2 + v_2$],
    [], [$=v_1^2 + v_2^2$],
    [Dado que], [$x^2 gt.eq 0$],
    [Entonces], [$v_1^2 + v_2^2 gt.eq 0+0$]
)

