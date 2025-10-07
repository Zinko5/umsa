#set page(
  margin: (x: 2.5cm, y: 2.5cm)
)
#set text(lang: "es")
#set text(font: "DejaVu Sans")
#set par(justify: true)
#show math.equation: set text(font: "DejaVu Math TeX Gyre")
#show math.equation: box
#let separador() = align(center)[#line(length: 100%)]

#set quote(block: true)
#import "@preview/numbly:0.1.0": numbly
#set heading(numbering: numbly(
  "{1:1}.",
  "{2:a})"
))
#show heading.where(level: 3): set heading(numbering: none)
#show heading.where(level: 3): set heading(outlined: false)

#pad(x: 120pt)[#stack(dir: ltr, align(left)[1er Parcial DAT 246], align(right)[II/2025])]

#stack(dir: ltr, "Nombre 1", pad(left: 25pt)[Paterno, materno nombres])
#stack(dir: ltr, "Nombre 2", pad(left: 25pt)[Paterno, materno nombres])

#let data = (
  (y: 5.8, x1: 300.0, x2: 0.0163),
  (y: 2.9, x1: 50.0, x2: 0.0163),
  (y: 2.8, x1: 40.0, x2: 0.0163),
  (y: 2.4, x1: 30.0, x2: 0.0163),
  (y: 2.5, x1: 20.0, x2: 0.0163),
  (y: 4.2, x1: 10.0, x2: 0.0163),
  (y: 3.2, x1: 100.0, x2: 0.0326),
  (y: 2.6, x1: 90.0, x2: 0.0326),
  (y: 2.2, x1: 80.0, x2: 0.0326),
  (y: 2.0, x1: 70.0, x2: 0.0326),
  (y: 2.0, x1: 60.0, x2: 0.0326),
  (y: 2.0, x1: 50.0, x2: 0.0326),
  (y: 2.6, x1: 10.0, x2: 0.0326),
  (y: 2.1, x1: 150.0, x2: 0.0129),
  (y: 2.2, x1: 140.0, x2: 0.0129),
  (y: 2.0, x1: 130.0, x2: 0.0129),
  (y: 2.1, x1: 120.0, x2: 0.0129),
  (y: 2.0, x1: 110.0, x2: 0.0129),
  (y: 2.0, x1: 100.0, x2: 0.0129),
  (y: 2.1, x1: 90.0, x2: 0.0129),
  (y: 2.4, x1: 80.0, x2: 0.0129),
  (y: 2.0, x1: 70.0, x2: 0.0129),
  (y: 2.1, x1: 60.0, x2: 0.0129),
  (y: 2.0, x1: 50.0, x2: 0.0129),
  (y: 2.2, x1: 40.0, x2: 0.0129),
  (y: 2.4, x1: 30.0, x2: 0.0129),
  (y: 2.6, x1: 20.0, x2: 0.0129),
  (y: 2.7, x1: 10.0, x2: 0.0129),
  (y: 2.4, x1: 20.0, x2: 0.001),
  (y: 2.4, x1: 10.0, x2: 0.001),
)

#let n = data.len()  // n = 30

= Resumen

Este trabajo analiza la resistencia eléctrica de 30 cables de cobre comunes en función de su longitud ($x_1$, en cm) y diámetro ($x_2$, en cm), mediante un modelo de regresión lineal múltiple. El objetivo es determinar cómo estas variables independientes influyen en la resistencia ($y$, en ohmios) bajo condiciones de uso cotidiano. Se recopilaron 30 observaciones, considerando cables con longitudes entre 10 y 300 cm y diámetros de 0.001 a 0.0326 cm. El modelo se ajusta utilizando el método de mínimos cuadrados para estimar los coeficientes $beta_0$, $beta_1$ y $beta_2$, cumpliendo supuestos de linealidad, normalidad, homocedasticidad e independencia. Los resultados permitirán predecir la resistencia eléctrica y evaluar la relación entre las variables, contribuyendo al diseño eficiente de sistemas eléctricos. Se espera que la longitud incremente la resistencia y el diámetro la reduzca, según principios físicos.

= Objetivo

Determinar la resistencia eléctrica de una muestra de 30 cables de cobre comunes y de uso cotidiano en función de su longitud y grosor, mediante la construcción de un modelo de regresión lineal múltiple, con el propósito de identificar la relación entre estas variables bajo las condiciones específicas de cables de cobre de aplicación habitual.

= Desarrollo

== Muestreo Real

El muestreo consiste en 30 observaciones de cables de cobre comunes, donde se midió la resistencia eléctrica ($y$, en ohmios), la longitud ($x_1$, en cm) y el diámetro ($x_2$, en cm). A continuación, se presenta la tabla con los datos recopilados:

#grid(
  inset: 5pt,
  stroke: black,
  columns: (auto, auto, auto, auto),
  [Número], [$y$: Resistencia (ohmios)], [$x_1$: Longitud (cm)], [$x_2$: Diámetro (cm)],
  [1], [5.8], [300], [0.0163],
  [2], [2.9], [50], [0.0163],
  [3], [2.8], [40], [0.0163],
  [4], [2.4], [30], [0.0163],
  [5], [2.5], [20], [0.0163],
  [6], [4.2], [10], [0.0163],
  [7], [3.2], [100], [0.0326],
  [8], [2.6], [90], [0.0326],
  [9], [2.2], [80], [0.0326],
  [10], [2.0], [70], [0.0326],
  [11], [2.0], [60], [0.0326],
  [12], [2.0], [50], [0.0326],
  [13], [2.6], [10], [0.0326],
  [14], [2.1], [150], [0.0129],
  [15], [2.2], [140], [0.0129],
  [16], [2.0], [130], [0.0129],
  [17], [2.1], [120], [0.0129],
  [18], [2.0], [110], [0.0129],
  [19], [2.0], [100], [0.0129],
  [20], [2.1], [90], [0.0129],
  [21], [2.4], [80], [0.0129],
  [22], [2.0], [70], [0.0129],
  [23], [2.1], [60], [0.0129],
  [24], [2.0], [50], [0.0129],
  [25], [2.2], [40], [0.0129],
  [26], [2.4], [30], [0.0129],
  [27], [2.6], [20], [0.0129],
  [28], [2.7], [10], [0.0129],
  [29], [2.4], [20], [0.001],
  [30], [2.4], [10], [0.001],
)

== Intervalos y Representación de Clases

== Gráfica de los puntos en tres dimensiones

Se grafican los 30 puntos de la muestra en un espacio tridimensional, con $x_1$ (longitud, en cm) en el eje $X$, $x_2$ (diámetro, en cm) en el eje $Z$, y $y$ (resistencia, en ohmios) en el eje $Y$. Los puntos son:

Para graficar manualmente, se recomienda escalar los ejes: por ejemplo, 1 cm en papel = 50 cm para $x_1$, 1 cm = 1 ohmio para $y$, y 1 cm = 0.01 cm para $x_2$. Los puntos se trazan en un sistema de coordenadas 3D, usando proyección isométrica.

== Gráfica de los regresores de manera individual

Se grafican los puntos de la muestra para analizar la relación de la resistencia ($y$) con cada regresor por separado: $y = f(x_1)$ (resistencia vs. longitud) y $y = f(x_2)$ (resistencia vs. diámetro).

=== Resistencia vs. Longitud ($y = f(x_1)$)

Los puntos $(x_(i 1), y_i)$ se grafican en un plano 2D, con $x_1$ (longitud, en cm) en el eje $x$ y $y$ (resistencia, en ohmios) en el eje $Y$. Se distinguen los puntos según el valor de $x_2$.

Para graficar manualmente, usa una escala de 1 cm = 50 cm para $x_1$ y 1 cm = 1 ohmio para $y$. Usa símbolos distintos (por ejemplo, círculos para $x_2 = 0.0163$, cruces para $x_2 = 0.0326$, triángulos para $x_2 = 0.0129$, cuadrados para $x_2 = 0.001$).

=== Resistencia vs. Diámetro ($y = f(x_2)$)

Los puntos $(x_(i 2), y_i)$ se grafican en un plano 2D, con $x_2$ (diámetro, en cm) en el eje $X$ y $y$ (resistencia, en ohmios) en el eje $Y$. Se distinguen los puntos según rangos de $x_1$:

Para graficar manualmente, usa una escala de 1 cm = 0.01 cm para $x_2$ y 1 cm = 1 ohmio para $y$. Usa símbolos distintos para rangos de $x_1$ (por ejemplo, $[10, 68)$, $[68, 126)$, $[126, 184)$, $[184, 242)$, $[242, 300]$).

== Hiperplanos

== Método de Mínimos Cuadrados

Se usará el método de mínimos cuadrados. Este método minimiza la suma de los cuadrados de los residuos, asegurando un ajuste óptimo del modelo a los datos.

El modelo de regresión lineal múltiple es:

$
y_i = beta_0 + beta_1 x_(i 1) + beta_2 x_(i 2) + epsilon_i, quad i = 1, dots, n
$

donde $beta_0$ es el intercepto, $beta_1$ y $beta_2$ son los coeficientes parciales que indican el cambio en $y$ por unidad de $x_1$ o $x_2$, manteniendo la otra variable constante, y $epsilon_i$ es el error con media cero.

Se minimiza la función:

$
L = sum_(i=1)^n (y_i - beta_0 - beta_1 x_(i 1) - beta_2 x_(i 2))^2
$

Derivando $L$ respecto a $beta_0$, $beta_1$ y $beta_2$ e igualando a cero, se obtienen los estimadores $hat(beta)_0$, $hat(beta)_1$, $hat(beta)_2$. El método es adecuado por su simplicidad y capacidad para modelar múltiples variables, ajustándose a la relación lineal asumida entre resistencia, longitud y diámetro.

== Cálculos

Se plantea el modelo de regresión lineal múltiple para la resistencia eléctrica $y_i$ en función de la longitud $x_(i 1)$ y el diámetro $x_(i 2)$ de los cables, dado por:

$ y_i = beta_0 + beta_1 x_(i 1) + beta_2 x_(i 2) + epsilon_i $

La función de mínimos cuadrados a minimizar es:

$ L = sum (y_i - beta_0 - beta_1 x_(i 1) - beta_2 x_(i 2))^2 $

Derivando parcialmente con respecto a $beta_0$, $beta_1$ y $beta_2$, se obtienen las ecuaciones normales:

$ 
(diff L)/(diff beta_0) = -2 sum (y_i - hat(beta)_0 - hat(beta)_1 x_(i 1) - hat(beta)_2 x_(i 2)) = 0 \
(diff L)/(diff beta_1) = -2 sum (y_i - hat(beta)_0 - hat(beta)_1 x_(i 1) - hat(beta)_2 x_(i 2)) x_(i 1) = 0 \
(diff L)/(diff beta_2) = -2 sum (y_i - hat(beta)_0 - hat(beta)_1 x_(i 1) - hat(beta)_2 x_(i 2)) x_(i 2) = 0 
$

Simplificando:

$ 
sum y_i = n hat(beta)_0 + hat(beta)_1 sum x_(i 1) + hat(beta)_2 sum x_(i 2) \
sum y_i x_(i 1) = hat(beta)_0 sum x_(i 1) + hat(beta)_1 sum x_(i 1)^2 + hat(beta)_2 sum x_(i 1) x_(i 2) \
sum y_i x_(i 2) = hat(beta)_0 sum x_(i 2) + hat(beta)_1 sum x_(i 1) x_(i 2) + hat(beta)_2 sum x_(i 2)^2 
$

Se procede a calcular las sumatorias necesarias con los datos proporcionados ($n = 30$, $k = 2$, $p = k + 1 = 3$):

#let nObs = 30
#let sumY = calc.round(5.8 + 2.9 + 2.8 + 2.4 + 2.5 + 4.2 + 3.2 + 2.6 + 2.2 + 2 + 2 + 2 + 2.6 + 2.1 + 2.2 + 2 + 2.1 + 2 + 2.1 + 2.4 + 2 + 2.1 + 2 + 2.2 + 2.4 + 2.6 + 2.7 + 2.4 + 2.4 + 2.4, digits: 3)
#let sumX1 = calc.round(300 + 50 + 40 + 30 + 20 + 10 + 100 + 90 + 80 + 70 + 60 + 50 + 10 + 150 + 140 + 130 + 120 + 110 + 100 + 90 + 80 + 70 + 60 + 50 + 40 + 30 + 20 + 10 + 20 + 10, digits: 3)
#let sumX2 = calc.round(0.0163 + 0.0163 + 0.0163 + 0.0163 + 0.0163 + 0.0163 + 0.0326 + 0.0326 + 0.0326 + 0.0326 + 0.0326 + 0.0326 + 0.0326 + 0.0129 + 0.0129 + 0.0129 + 0.0129 + 0.0129 + 0.0129 + 0.0129 + 0.0129 + 0.0129 + 0.0129 + 0.0129 + 0.0129 + 0.0129 + 0.0129 + 0.0129 + 0.001 + 0.001, digits: 3)

$ 
sum y_i = #sumY \
sum x_(i 1) = #sumX1 \
sum x_(i 2) = #sumX2 
$

#let sumX1Square = calc.round(300*300 + 50*50 + 40*40 + 30*30 + 20*20 + 10*10 + 100*100 + 90*90 + 80*80 + 70*70 + 60*60 + 50*50 + 10*10 + 150*150 + 140*140 + 130*130 + 120*120 + 110*110 + 100*100 + 90*90 + 80*80 + 70*70 + 60*60 + 50*50 + 40*40 + 30*30 + 20*20 + 10*10 + 20*20 + 10*10, digits: 3)
#let sumX2Square = calc.round(0.0163*0.0163 + 0.0163*0.0163 + 0.0163*0.0163 + 0.0163*0.0163 + 0.0163*0.0163 + 0.0163*0.0163 + 0.0326*0.0326 + 0.0326*0.0326 + 0.0326*0.0326 + 0.0326*0.0326 + 0.0326*0.0326 + 0.0326*0.0326 + 0.0326*0.0326 + 0.0129*0.0129 + 0.0129*0.0129 + 0.0129*0.0129 + 0.0129*0.0129 + 0.0129*0.0129 + 0.0129*0.0129 + 0.0129*0.0129 + 0.0129*0.0129 + 0.0129*0.0129 + 0.0129*0.0129 + 0.0129*0.0129 + 0.0129*0.0129 + 0.0129*0.0129 + 0.0129*0.0129 + 0.0129*0.0129 + 0.001*0.001 + 0.001*0.001, digits: 3)
#let sumX1X2 = calc.round(300*0.0163 + 50*0.0163 + 40*0.0163 + 30*0.0163 + 20*0.0163 + 10*0.0163 + 100*0.0326 + 90*0.0326 + 80*0.0326 + 70*0.0326 + 60*0.0326 + 50*0.0326 + 10*0.0326 + 150*0.0129 + 140*0.0129 + 130*0.0129 + 120*0.0129 + 110*0.0129 + 100*0.0129 + 90*0.0129 + 80*0.0129 + 70*0.0129 + 60*0.0129 + 50*0.0129 + 40*0.0129 + 30*0.0129 + 20*0.0129 + 10*0.0129 + 20*0.001 + 10*0.001, digits: 3)
#let sumYx1 = calc.round(5.8*300 + 2.9*50 + 2.8*40 + 2.4*30 + 2.5*20 + 4.2*10 + 3.2*100 + 2.6*90 + 2.2*80 + 2*70 + 2*60 + 2*50 + 2.6*10 + 2.1*150 + 2.2*140 + 2*130 + 2.1*120 + 2*110 + 2*100 + 2.1*90 + 2.4*80 + 2*70 + 2.1*60 + 2*50 + 2.2*40 + 2.4*30 + 2.6*20 + 2.7*10 + 2.4*20 + 2.4*10, digits: 3)
#let sumYx2 = calc.round(5.8*0.0163 + 2.9*0.0163 + 2.8*0.0163 + 2.4*0.0163 + 2.5*0.0163 + 4.2*0.0163 + 3.2*0.0326 + 2.6*0.0326 + 2.2*0.0326 + 2*0.0326 + 2*0.0326 + 2*0.0326 + 2.6*0.0326 + 2.1*0.0129 + 2.2*0.0129 + 2*0.0129 + 2.1*0.0129 + 2*0.0129 + 2*0.0129 + 2.1*0.0129 + 2.4*0.0129 + 2*0.0129 + 2.1*0.0129 + 2*0.0129 + 2.2*0.0129 + 2.4*0.0129 + 2.6*0.0129 + 2.7*0.0129 + 2.4*0.001 + 2.4*0.001, digits: 3)

$ 
sum x_(i 1)^2 = #sumX1Square \
sum x_(i 2)^2 = #sumX2Square \
sum x_(i 1) x_(i 2) = #sumX1X2 \
sum y_i x_(i 1) = #sumYx1 \
sum y_i x_(i 2) = #sumYx2 
$

La solución matricial para los estimadores de mínimos cuadrados se obtiene como:

$ hat(beta) = (X' X)^(-1) X' y $

Se construye la matriz $X$ incluyendo la columna de unos para el término independiente $beta_0$:

$ 
X = [#grid(
  inset: 5pt,
  columns: (auto, auto, auto),
  [$1$], [$300$], [$0.0163$],
  [$1$], [$50$], [$0.0163$],
  [$1$], [$40$], [$0.0163$],
  [$1$], [$30$], [$0.0163$],
  [$1$], [$20$], [$0.0163$],
  [$1$], [$10$], [$0.0163$],
  [$1$], [$100$], [$0.0326$],
  [$1$], [$90$], [$0.0326$],
  [$1$], [$80$], [$0.0326$],
  [$1$], [$70$], [$0.0326$],
  [$1$], [$60$], [$0.0326$],
  [$1$], [$50$], [$0.0326$],
  [$1$], [$10$], [$0.0326$],
  [$1$], [$150$], [$0.0129$],
  [$1$], [$140$], [$0.0129$],
  [$1$], [$130$], [$0.0129$],
  [$1$], [$120$], [$0.0129$],
  [$1$], [$110$], [$0.0129$],
  [$1$], [$100$], [$0.0129$],
  [$1$], [$90$], [$0.0129$],
  [$1$], [$80$], [$0.0129$],
  [$1$], [$70$], [$0.0129$],
  [$1$], [$60$], [$0.0129$],
  [$1$], [$50$], [$0.0129$],
  [$1$], [$40$], [$0.0129$],
  [$1$], [$30$], [$0.0129$],
  [$1$], [$20$], [$0.0129$],
  [$1$], [$10$], [$0.0129$],
  [$1$], [$20$], [$0.001$],
  [$1$], [$10$], [$0.001$],
)]
$

Se calcula $X' X$:

$ 
X' X = [#grid(
  inset: 5pt,
  columns: (auto, auto, auto),
  [#nObs], [#sumX1], [#sumX2],
  [#sumX1], [#sumX1Square], [#sumX1X2],
  [#sumX2], [#sumX1X2], [#sumX2Square],
)]
$

Se calcula $X' y$:

$ 
X' y = [#grid(
  inset: 5pt,
  columns: (auto),
  [#sumY],
  [#sumYx1],
  [#sumYx2],
)]
$

Para resolver $hat(beta)$, se necesita $(X' X)^(-1)$. Se define la matriz $X' X$:

#let detXtx = calc.round((nObs * sumX1Square * sumX2Square + 2 * sumX1 * sumX2 * sumX1X2) - (sumX1Square * sumX2 * sumX2 + sumX2Square * sumX1 * sumX1 + nObs * sumX1X2 * sumX1X2), digits: 3)
#let invXtx11 = calc.round((sumX1Square * sumX2Square - sumX1X2 * sumX1X2) / detXtx, digits: 3)
#let invXtx12 = calc.round((sumX1X2 * sumX2 - sumX1 * sumX2Square) / detXtx, digits: 3)
#let invXtx13 = calc.round((sumX1 * sumX1X2 - sumX2 * sumX1Square) / detXtx, digits: 3)
#let invXtx21 = calc.round((sumX1X2 * sumX2 - sumX1 * sumX2Square) / detXtx, digits: 3)
#let invXtx22 = calc.round((nObs * sumX2Square - sumX2 * sumX2) / detXtx, digits: 3)
#let invXtx23 = calc.round((sumX2 * sumX1 - nObs * sumX1X2) / detXtx, digits: 3)
#let invXtx31 = calc.round((sumX1 * sumX1X2 - sumX2 * sumX1Square) / detXtx, digits: 3)
#let invXtx32 = calc.round((sumX2 * sumX1 - nObs * sumX1X2) / detXtx, digits: 3)
#let invXtx33 = calc.round((nObs * sumX1Square - sumX1 * sumX1) / detXtx, digits: 3)

$ 
(X' X)^(-1) = [#grid(
  inset: 5pt,
  columns: (auto, auto, auto),
  [#invXtx11], [#invXtx12], [#invXtx13],
  [#invXtx21], [#invXtx22], [#invXtx23],
  [#invXtx31], [#invXtx32], [#invXtx33],
)]
$

Se calcula $hat(beta) = (X' X)^(-1) X' y$:

#let beta0 = calc.round(invXtx11 * sumY + invXtx12 * sumYx1 + invXtx13 * sumYx2, digits: 3)
#let beta1 = calc.round(invXtx21 * sumY + invXtx22 * sumYx1 + invXtx23 * sumYx2, digits: 3)
#let beta2 = calc.round(invXtx31 * sumY + invXtx32 * sumYx1 + invXtx33 * sumYx2, digits: 3)

$ 
hat(beta) = [#grid(
  inset: 5pt,
  columns: (auto),
  [#beta0],
  [#beta1],
  [#beta2],
)]
$

El modelo de regresión estimado es:

$ 
hat(y_i) = #beta0 + #beta1 x_(i 1) + #beta2 x_(i 2)
$

Se calculan los valores estimados $hat(y)_i$ para cada observación utilizando el modelo de regresión:

$ hat(y)_i = #beta0 + #beta1 x_(i 1) + #beta2 x_(i 2) $

#let yHat1 = calc.round(beta0 + beta1 * 300 + beta2 * 0.0163, digits: 3)
#let yHat2 = calc.round(beta0 + beta1 * 50 + beta2 * 0.0163, digits: 3)
#let yHat3 = calc.round(beta0 + beta1 * 40 + beta2 * 0.0163, digits: 3)
#let yHat4 = calc.round(beta0 + beta1 * 30 + beta2 * 0.0163, digits: 3)
#let yHat5 = calc.round(beta0 + beta1 * 20 + beta2 * 0.0163, digits: 3)
#let yHat6 = calc.round(beta0 + beta1 * 10 + beta2 * 0.0163, digits: 3)
#let yHat7 = calc.round(beta0 + beta1 * 100 + beta2 * 0.0326, digits: 3)
#let yHat8 = calc.round(beta0 + beta1 * 90 + beta2 * 0.0326, digits: 3)
#let yHat9 = calc.round(beta0 + beta1 * 80 + beta2 * 0.0326, digits: 3)
#let yHat10 = calc.round(beta0 + beta1 * 70 + beta2 * 0.0326, digits: 3)
#let yHat11 = calc.round(beta0 + beta1 * 60 + beta2 * 0.0326, digits: 3)
#let yHat12 = calc.round(beta0 + beta1 * 50 + beta2 * 0.0326, digits: 3)
#let yHat13 = calc.round(beta0 + beta1 * 10 + beta2 * 0.0326, digits: 3)
#let yHat14 = calc.round(beta0 + beta1 * 150 + beta2 * 0.0129, digits: 3)
#let yHat15 = calc.round(beta0 + beta1 * 140 + beta2 * 0.0129, digits: 3)
#let yHat16 = calc.round(beta0 + beta1 * 130 + beta2 * 0.0129, digits: 3)
#let yHat17 = calc.round(beta0 + beta1 * 120 + beta2 * 0.0129, digits: 3)
#let yHat18 = calc.round(beta0 + beta1 * 110 + beta2 * 0.0129, digits: 3)
#let yHat19 = calc.round(beta0 + beta1 * 100 + beta2 * 0.0129, digits: 3)
#let yHat20 = calc.round(beta0 + beta1 * 90 + beta2 * 0.0129, digits: 3)
#let yHat21 = calc.round(beta0 + beta1 * 80 + beta2 * 0.0129, digits: 3)
#let yHat22 = calc.round(beta0 + beta1 * 70 + beta2 * 0.0129, digits: 3)
#let yHat23 = calc.round(beta0 + beta1 * 60 + beta2 * 0.0129, digits: 3)
#let yHat24 = calc.round(beta0 + beta1 * 50 + beta2 * 0.0129, digits: 3)
#let yHat25 = calc.round(beta0 + beta1 * 40 + beta2 * 0.0129, digits: 3)
#let yHat26 = calc.round(beta0 + beta1 * 30 + beta2 * 0.0129, digits: 3)
#let yHat27 = calc.round(beta0 + beta1 * 20 + beta2 * 0.0129, digits: 3)
#let yHat28 = calc.round(beta0 + beta1 * 10 + beta2 * 0.0129, digits: 3)
#let yHat29 = calc.round(beta0 + beta1 * 20 + beta2 * 0.001, digits: 3)
#let yHat30 = calc.round(beta0 + beta1 * 10 + beta2 * 0.001, digits: 3)

#let e1 = calc.round(5.8 - yHat1, digits: 3)
#let e2 = calc.round(2.9 - yHat2, digits: 3)
#let e3 = calc.round(2.8 - yHat3, digits: 3)
#let e4 = calc.round(2.4 - yHat4, digits: 3)
#let e5 = calc.round(2.5 - yHat5, digits: 3)
#let e6 = calc.round(4.2 - yHat6, digits: 3)
#let e7 = calc.round(3.2 - yHat7, digits: 3)
#let e8 = calc.round(2.6 - yHat8, digits: 3)
#let e9 = calc.round(2.2 - yHat9, digits: 3)
#let e10 = calc.round(2 - yHat10, digits: 3)
#let e11 = calc.round(2 - yHat11, digits: 3)
#let e12 = calc.round(2 - yHat12, digits: 3)
#let e13 = calc.round(2.6 - yHat13, digits: 3)
#let e14 = calc.round(2.1 - yHat14, digits: 3)
#let e15 = calc.round(2.2 - yHat15, digits: 3)
#let e16 = calc.round(2 - yHat16, digits: 3)
#let e17 = calc.round(2.1 - yHat17, digits: 3)
#let e18 = calc.round(2 - yHat18, digits: 3)
#let e19 = calc.round(2 - yHat19, digits: 3)
#let e20 = calc.round(2.1 - yHat20, digits: 3)
#let e21 = calc.round(2.4 - yHat21, digits: 3)
#let e22 = calc.round(2 - yHat22, digits: 3)
#let e23 = calc.round(2.1 - yHat23, digits: 3)
#let e24 = calc.round(2 - yHat24, digits: 3)
#let e25 = calc.round(2.2 - yHat25, digits: 3)
#let e26 = calc.round(2.4 - yHat26, digits: 3)
#let e27 = calc.round(2.6 - yHat27, digits: 3)
#let e28 = calc.round(2.7 - yHat28, digits: 3)
#let e29 = calc.round(2.4 - yHat29, digits: 3)
#let e30 = calc.round(2.4 - yHat30, digits: 3)

Se presentan los valores estimados $hat(y)_i$ y los residuos $epsilon_i = y_i - hat(y)_i$:

#grid(
  inset: 5pt,
  stroke: black,
  columns: (auto, auto, auto, auto, auto, auto),
  [$i$], [$y_i$], [$x_(i 1)$], [$x_(i 2)$], [$hat(y)_i$], [$epsilon_i$],
  [$1$], [$5.8$], [$300$], [$0.0163$], [#yHat1], [#e1],
  [$2$], [$2.9$], [$50$], [$0.0163$], [#yHat2], [#e2],
  [$3$], [$2.8$], [$40$], [$0.0163$], [#yHat3], [#e3],
  [$4$], [$2.4$], [$30$], [$0.0163$], [#yHat4], [#e4],
  [$5$], [$2.5$], [$20$], [$0.0163$], [#yHat5], [#e5],
  [$6$], [$4.2$], [$10$], [$0.0163$], [#yHat6], [#e6],
  [$7$], [$3.2$], [$100$], [$0.0326$], [#yHat7], [#e7],
  [$8$], [$2.6$], [$90$], [$0.0326$], [#yHat8], [#e8],
  [$9$], [$2.2$], [$80$], [$0.0326$], [#yHat9], [#e9],
  [$10$], [$2$], [$70$], [$0.0326$], [#yHat10], [#e10],
  [$11$], [$2$], [$60$], [$0.0326$], [#yHat11], [#e11],
  [$12$], [$2$], [$50$], [$0.0326$], [#yHat12], [#e12],
  [$13$], [$2.6$], [$10$], [$0.0326$], [#yHat13], [#e13],
  [$14$], [$2.1$], [$150$], [$0.0129$], [#yHat14], [#e14],
  [$15$], [$2.2$], [$140$], [$0.0129$], [#yHat15], [#e15],
  [$16$], [$2$], [$130$], [$0.0129$], [#yHat16], [#e16],
  [$17$], [$2.1$], [$120$], [$0.0129$], [#yHat17], [#e17],
  [$18$], [$2$], [$110$], [$0.0129$], [#yHat18], [#e18],
  [$19$], [$2$], [$100$], [$0.0129$], [#yHat19], [#e19],
  [$20$], [$2.1$], [$90$], [$0.0129$], [#yHat20], [#e20],
  [$21$], [$2.4$], [$80$], [$0.0129$], [#yHat21], [#e21],
  [$22$], [$2$], [$70$], [$0.0129$], [#yHat22], [#e22],
  [$23$], [$2.1$], [$60$], [$0.0129$], [#yHat23], [#e23],
  [$24$], [$2$], [$50$], [$0.0129$], [#yHat24], [#e24],
  [$25$], [$2.2$], [$40$], [$0.0129$], [#yHat25], [#e25],
  [$26$], [$2.4$], [$30$], [$0.0129$], [#yHat26], [#e26],
  [$27$], [$2.6$], [$20$], [$0.0129$], [#yHat27], [#e27],
  [$28$], [$2.7$], [$10$], [$0.0129$], [#yHat28], [#e28],
  [$29$], [$2.4$], [$20$], [$0.001$], [#yHat29], [#e29],
  [$30$], [$2.4$], [$10$], [$0.001$], [#yHat30], [#e30],
)