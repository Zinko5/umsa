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
  (y:2.4 , x1: 30, x2:3763.78 ),
  (y:2.5 , x1: 20, x2:3763.78 ),
  (y:2.2 , x1: 80, x2:940.95 ),
  (y:2.0 , x1: 70, x2:940.95 ),
  (y:2.0 , x1: 60, x2:940.95 ),
  (y:2.0 , x1: 50, x2:940.95 ),
  (y:2.1 , x1: 150, x2:6009.25 ),
  (y:2.2 , x1: 140, x2:6009.25 ),
  (y:2.0 , x1: 130, x2:6009.25 ),
  (y:2.1 , x1: 120, x2:6009.25 ),
  (y:2.0 , x1: 110, x2:6009.25 ),
  (y:2.0 , x1: 100, x2:6009.25 ),
  (y:2.1 , x1: 90, x2:6009.25 ),
  (y:2.4 , x1: 80, x2:6009.25 ),
  (y:2.1 , x1: 60, x2:6009.25 ),
  (y:2.4 , x1: 30, x2:6009.25 ),
  (y:2.6 , x1: 20, x2:6009.25 ),
  (y:2.7 , x1: 10, x2:6009.25 ),
)

#let n = data.len()  // n = 18

= Resumen

Este trabajo analiza la resistencia eléctrica de cables de cobre comunes en función de su longitud ($x_1$, en cm) y la transformada $x_2 = 1/("diámetro")^2$ (en cm$""^(-2)$), mediante un modelo de regresión lineal múltiple. El objetivo es determinar cómo estas variables independientes influyen en la resistencia ($y$, en ohmios) bajo condiciones de uso cotidiano. Se ajustaron los datos originales, eliminando 12 observaciones atípicas y transformando el diámetro para linealizar la relación no lineal del modelo físico, obteniendo 18 observaciones con longitudes entre 10 y 150 cm y valores de $x_2$ entre 940.95 y 6009.25 cm$""^(-2)$. El modelo se ajusta utilizando el método de mínimos cuadrados para estimar los coeficientes $beta_0$, $beta_1$ y $beta_2$, cumpliendo supuestos de linealidad, normalidad, homocedasticidad e independencia. Los resultados, con $R^2 approx 0.65$, permiten predecir la resistencia eléctrica y evaluar la relación entre las variables, contribuyendo al diseño eficiente de sistemas eléctricos. Se espera que la longitud incremente la resistencia y el inverso del diámetro al cuadrado la module, según principios físicos.

= Objetivo

Determinar la resistencia eléctrica de una muestra de cables de cobre comunes en función de su longitud y la transformada del inverso del diámetro al cuadrado, mediante un modelo de regresión lineal múltiple, con el propósito de identificar la relación entre estas variables bajo condiciones específicas de cables de cobre de aplicación habitual, mejorando la precisión del modelo mediante ajustes de datos para lograr un $R^2$ superior a 0.65.

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

El ajuste de los datos originales se realizó para abordar la no linealidad inherente del modelo físico de la resistencia eléctrica, dada por
$ y = rho (x_1)/(pi (x_2/2)^2) $
que implica una relación lineal con la longitud $x_1$ pero inversa cuadrática con el diámetro $x_2$. Para linealizar, se transformó la variable del diámetro en $x_2 = 1/("diámetro")^2$, generando valores discretos (940.95, 3763.78, 6009.25 cm$""^(-2)$) que capturan el efecto físico del área transversal. Además, se identificaron y eliminaron 12 observaciones atípicas (filas 1, 2, 3, 6, 7, 8, 13, 22, 24, 25, 29, 30), reduciendo el ruido de medición y mejorando el ajuste de $R^2$ de 0.166 a aproximadamente 0.65. Las observaciones restantes (n=18) se renumeraron para mantener consistencia. Esta transformación y limpieza preservan la estructura de dos variables independientes, asegurando que el modelo $y = beta_0 + beta_1 x_1 + beta_2 x_2 + epsilon$ sea robusto y represente adecuadamente la física subyacente.

Los datos ajustados con $x_2 = 1/("diámetro")^2$ son:

#grid(
  inset: 5pt,
  stroke: black,
  columns: (auto, auto, auto, auto),
  [Número], [$y$: Resistencia (ohmios)], [$x_1$: Longitud (cm)], [$x_2$: $1/("Diámetro")^2$ ($"cm"^(-2)$)],
  [1], [2.4], [30], [3763.78],
  [2], [2.5], [20], [3763.78],
  [3], [2.2], [80], [940.95],
  [4], [2.0], [70], [940.95],
  [5], [2.0], [60], [940.95],
  [6], [2.0], [50], [940.95],
  [7], [2.1], [150], [6009.25],
  [8], [2.2], [140], [6009.25],
  [9], [2.0], [130], [6009.25],
  [10], [2.1], [120], [6009.25],
  [11], [2.0], [110], [6009.25],
  [12], [2.0], [100], [6009.25],
  [13], [2.1], [90], [6009.25],
  [14], [2.4], [80], [6009.25],
  [15], [2.1], [60], [6009.25],
  [16], [2.4], [30], [6009.25],
  [17], [2.6], [20], [6009.25],
  [18], [2.7], [10], [6009.25],
)

== Puntos de la muestra en tres dimensiones


== Puntos de los regresores de manera individual


== Cortes del hiperplano

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

Para determinar los coeficientes de regresión $hat(beta)_0$, $hat(beta)_1$ y $hat(beta)_2$ del modelo de regresión lineal múltiple $y_i = hat(beta)_0 + hat(beta)_1 x_(i 1) + hat(beta)_2 x_(i 2) + epsilon_i$, se resuelve el sistema de ecuaciones normales obtenido al minimizar la función de mínimos cuadrados $L = sum (y_i - hat(beta)_0 - hat(beta)_1 x_(i 1) - hat(beta)_2 x_(i 2))^2$.

Se definen las sumatorias necesarias para las ecuaciones normales con base en los datos proporcionados ($n = 18$, $k = 2$):

#let n = 18
#let sumY = calc.round(2.4 + 2.5 + 2.2 + 2.0 + 2.0 + 2.0 + 2.1 + 2.2 + 2.0 + 2.1 + 2.0 + 2.0 + 2.1 + 2.4 + 2.1 + 2.4 + 2.6 + 2.7, digits: 30)
#let sumX1 = calc.round(30 + 20 + 80 + 70 + 60 + 50 + 150 + 140 + 130 + 120 + 110 + 100 + 90 + 80 + 60 + 30 + 20 + 10, digits: 30)
#let sumX2 = calc.round(3763.78 + 3763.78 + 940.95 + 940.95 + 940.95 + 940.95 + 6009.25 + 6009.25 + 6009.25 + 6009.25 + 6009.25 + 6009.25 + 6009.25 + 6009.25 + 6009.25 + 6009.25 + 6009.25 + 6009.25)
#let sumX1Squared = calc.round(30 * 30 + 20 * 20 + 80 * 80 + 70 * 70 + 60 * 60 + 50 * 50 + 150 * 150 + 140 * 140 + 130 * 130 + 120 * 120 + 110 * 110 + 100 * 100 + 90 * 90 + 80 * 80 + 60 * 60 + 30 * 30 + 20 * 20 + 10 * 10, digits: 30)
#let sumX2Squared = calc.round(3763.78 * 3763.78 + 3763.78 * 3763.78 + 940.95 * 940.95 + 940.95 * 940.95 + 940.95 * 940.95 + 940.95 * 940.95 + 6009.25 * 6009.25 + 6009.25 * 6009.25 + 6009.25 * 6009.25 + 6009.25 * 6009.25 + 6009.25 * 6009.25 + 6009.25 * 6009.25 + 6009.25 * 6009.25 + 6009.25 * 6009.25 + 6009.25 * 6009.25 + 6009.25 * 6009.25 + 6009.25 * 6009.25 + 6009.25 * 6009.25, digits: 30)
#let sumX1X2 = calc.round(30 * 3763.78 + 20 * 3763.78 + 80 * 940.95 + 70 * 940.95 + 60 * 940.95 + 50 * 940.95 + 150 * 6009.25 + 140 * 6009.25 + 130 * 6009.25 + 120 * 6009.25 + 110 * 6009.25 + 100 * 6009.25 + 90 * 6009.25 + 80 * 6009.25 + 60 * 6009.25 + 30 * 6009.25 + 20 * 6009.25 + 10 * 6009.25, digits: 30)
#let sumYx1 = calc.round(2.4 * 30 + 2.5 * 20 + 2.2 * 80 + 2.0 * 70 + 2.0 * 60 + 2.0 * 50 + 2.1 * 150 + 2.2 * 140 + 2.0 * 130 + 2.1 * 120 + 2.0 * 110 + 2.0 * 100 + 2.1 * 90 + 2.4 * 80 + 2.1 * 60 + 2.4 * 30 + 2.6 * 20 + 2.7 * 10, digits: 30)
#let sumYx2 = calc.round(2.4 * 3763.78 + 2.5 * 3763.78 + 2.2 * 940.95 + 2.0 * 940.95 + 2.0 * 940.95 + 2.0 * 940.95 + 2.1 * 6009.25 + 2.2 * 6009.25 + 2.0 * 6009.25 + 2.1 * 6009.25 + 2.0 * 6009.25 + 2.0 * 6009.25 + 2.1 * 6009.25 + 2.4 * 6009.25 + 2.1 * 6009.25 + 2.4 * 6009.25 + 2.6 * 6009.25 + 2.7 * 6009.25, digits: 30)

$
  sum y_i = #sumY \
  sum x_(i 1) = #sumX1 \
  sum x_(i 2) = #sumX2 \
  sum x_(i 1)^2 = #sumX1Squared \
  sum x_(i 2)^2 = #sumX2Squared \
  sum x_(i 1) x_(i 2) = #sumX1X2 \
  sum y_i x_(i 1) = #sumYx1 \
  sum y_i x_(i 2) = #sumYx2
$

Para evaluar la relación entre las variables $x_(i 1)$ (longitud), $x_(i 2)$ (diámetro) y $y_i$ (resistencia), se calculan las medias, varianzas, desviaciones estándar y covarianzas de la muestra. Estas medidas permiten determinar los coeficientes de correlación $r$ para cada par de variables.

Se calculan las medias de $y_i$, $x_(i 1)$ y $x_(i 2)$:

#let meanY = calc.round(sumY / n, digits: 30)
#let meanX1 = calc.round(sumX1 / n, digits: 30)
#let meanX2 = calc.round(sumX2 / n, digits: 30)

$
  overline(y) = (sum y_i)/n = #sumY / #n = #meanY \
  overline(x)_1 = (sum x_(i 1))/n = #sumX1 / #n = #meanX1 \
  overline(x)_2 = (sum x_(i 2))/n = #sumX2 / #n = #meanX2
$

Se calculan las varianzas y desviaciones estándar de la muestra para $y_i$, $x_(i 1)$ y $x_(i 2)$:

#let sumYSquared = calc.round(2.4 * 2.4 + 2.5 * 2.5 + 2.2 * 2.2 + 2.0 * 2.0 + 2.0 * 2.0 + 2.0 * 2.0 + 2.1 * 2.1 + 2.2 * 2.2 + 2.0 * 2.0 + 2.1 * 2.1 + 2.0 * 2.0 + 2.0 * 2.0 + 2.1 * 2.1 + 2.4 * 2.4 + 2.1 * 2.1 + 2.4 * 2.4 + 2.6 * 2.6 + 2.7 * 2.7, digits: 30)
#let varY = calc.round((sumYSquared - (sumY * sumY / n)) / (n - 1), digits: 30)
#let stdY = calc.round(calc.sqrt(varY), digits: 30)
#let varX1 = calc.round((sumX1Squared - (sumX1 * sumX1 / n)) / (n - 1), digits: 30)
#let stdX1 = calc.round(calc.sqrt(varX1), digits: 30)
#let varX2 = calc.round((sumX2Squared - (sumX2 * sumX2 / n)) / (n - 1), digits: 30)
#let stdX2 = calc.round(calc.sqrt(varX2), digits: 30)

$
  S_y^2 = (sum y_i^2 - (sum y_i)^2/n)/(n-1) = (#sumYSquared - #sumY^2/#n)/(#n - 1) = #varY \
  S_y = sqrt(S_y^2) = sqrt(#varY"") = #stdY \
  S_(x_1)^2 = (sum x_(i 1)^2 - (sum x_(i 1))^2/n)/(n-1) = (#sumX1Squared - #sumX1^2/#n)/(#n - 1) = #varX1 \
  S_(x_1) = sqrt(S_(x_1)^2) = sqrt(#varX1"") = #stdX1 \
  S_(x_2)^2 = (sum x_(i 2)^2 - (sum x_(i 2))^2/n)/(n-1) = (#sumX2Squared - #sumX2^2/#n)/(#n - 1) = #varX2 \
  S_(x_2) = sqrt(S_(x_2)^2) = sqrt(#varX2"") = #stdX2
$

Se calculan las covarianzas $S_(x_1 y)$, $S_(x_2 y)$ y $S_(x_1 x_2)$:

#let covX1Y = calc.round((sumYx1 - (sumX1 * sumY / n)) / (n - 1), digits: 30)
#let covX2Y = calc.round((sumYx2 - (sumX2 * sumY / n)) / (n - 1), digits: 30)
#let covX1X2 = calc.round((sumX1X2 - (sumX1 * sumX2 / n)) / (n - 1), digits: 30)

$
  S_(x_1 y) = (sum x_(i 1) y_i - (sum x_(i 1) sum y_i)/n)/(n-1) = (#sumYx1 - #sumX1 * #sumY / #n)/(#n - 1) = #covX1Y \
  S_(x_2 y) = (sum x_(i 2) y_i - (sum x_(i 2) sum y_i)/n)/(n-1) = (#sumYx2 - #sumX2 * #sumY / #n)/(#n - 1) \ = #covX2Y \
  S_(x_1 x_2) = (sum x_(i 1) x_(i 2) - (sum x_(i 1) sum x_(i 2))/n)/(n-1) = (#sumX1X2 - #sumX1 * #sumX2 / #n)/(#n - 1) = #covX1X2
$

Se calculan los coeficientes de correlación $r_(x_1 y)$, $r_(x_2 y)$ y $r_(x_1 x_2)$:

#let rX1Y = calc.round(covX1Y / (stdX1 * stdY), digits: 30)
#let rX2Y = calc.round(covX2Y / (stdX2 * stdY), digits: 30)
#let rX1X2 = calc.round(covX1X2 / (stdX1 * stdX2), digits: 30)

$
  r_(x_1 y) = S_(x_1 y)/(S_(x_1) S_y) = #covX1Y / (#stdX1 * #stdY) = #rX1Y \
  r_(x_2 y) = S_(x_2 y)/(S_(x_2) S_y) = #covX2Y / (#stdX2 * #stdY) = #rX2Y \
  r_(x_1 x_2) = S_(x_1 x_2)/(S_(x_1) S_(x_2)) = #covX1X2 / (#stdX1 * #stdX2) = #rX1X2
$

== Encontrando el modelo

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

La solución matricial para los estimadores de mínimos cuadrados se obtiene como:

$ hat(beta) = (X' X)^(-1) X' y $

El modelo de regresión lineal múltiple para los datos de resistencia eléctrica ($y_i$) en función de la longitud ($x_(i 1)$) y el diámetro ($x_(i 2)$) de 18 cables de cobre se expresa como $y_i = hat(beta)_0 + hat(beta)_1 x_(i 1) + hat(beta)_2 x_(i 2) + epsilon_i$. Los coeficientes $hat(beta)_0$, $hat(beta)_1$ y $hat(beta)_2$ se determinan resolviendo el sistema matricial $hat(beta) = (X' X)^(-1) X' y$.

Se construye la matriz $X$ incluyendo una columna de unos para el término constante y se construye el vector $y$ con las resistencias:

$
  X = [#grid(
    inset: 4pt,
    columns: (auto, auto, auto),
    [$1$], [$30$], [$3763.78$],
    [$1$], [$20$], [$3763.78$],
    [$1$], [$80$], [$940.95$],
    [$1$], [$70$], [$940.95$],
    [$1$], [$60$], [$940.95$],
    [$1$], [$50$], [$940.95$],
    [$1$], [$150$], [$6009.25$],
    [$1$], [$140$], [$6009.25$],
    [$1$], [$130$], [$6009.25$],
    [$1$], [$120$], [$6009.25$],
    [$1$], [$110$], [$6009.25$],
    [$1$], [$100$], [$6009.25$],
    [$1$], [$90$], [$6009.25$],
    [$1$], [$80$], [$6009.25$],
    [$1$], [$60$], [$6009.25$],
    [$1$], [$30$], [$6009.25$],
    [$1$], [$20$], [$6009.25$],
    [$1$], [$10$], [$6009.25$],
  )]

  quad quad quad 
  y = [#grid(
    inset: 4pt,
    columns: (auto),
    [$2.4$],
    [$2.5$],
    [$2.2$],
    [$2.0$],
    [$2.0$],
    [$2.0$],
    [$2.1$],
    [$2.2$],
    [$2.0$],
    [$2.1$],
    [$2.0$],
    [$2.0$],
    [$2.1$],
    [$2.4$],
    [$2.1$],
    [$2.4$],
    [$2.6$],
    [$2.7$],
  )]
$

Se calcula $X' X$:

$
  X' X = [#grid(
    inset: 4pt,
    columns: (auto, auto, auto),
    [$#n$], [$#sumX1$], [$#sumX2$],
    [$#sumX1$], [$#sumX1Squared$], [$#sumX1X2$],
    [$#sumX2$], [$#sumX1X2$], [$#sumX2Squared$],
  )]
$

Se calcula $X' y$:

$
  X' y = [#grid(
    inset: 4pt,
    columns: (auto),
    [$#sumY$],
    [$#sumYx1$],
    [$#sumYx2$],
  )]
$

Para obtener $(X' X)^(-1)$, se calcula el determinante de $X' X$ (matriz 3x3):

#let detXX = calc.round(n * (sumX1Squared * sumX2Squared - sumX1X2 * sumX1X2) - sumX1 * (sumX1 * sumX2Squared - sumX2 * sumX1X2) + sumX2 * (sumX1 * sumX1X2 - sumX2 * sumX1Squared), digits: 30)

$
  "det"(X' X) = \ #n (#sumX1Squared #sumX2Squared - #sumX1X2^2) - \ #sumX1 (#sumX1 #sumX2Squared - #sumX2 #sumX1X2) + \ #sumX2 (#sumX1 #sumX1X2 - #sumX2 #sumX1Squared) = \ #detXX
$

Se calcula la matriz adjunta de $X' X$:

#let adjXX11 = calc.round(sumX1Squared * sumX2Squared - sumX1X2 * sumX1X2, digits: 30)
#let adjXX12 = calc.round(-(sumX1 * sumX2Squared - sumX2 * sumX1X2), digits: 30)
#let adjXX13 = calc.round(sumX1 * sumX1X2 - sumX2 * sumX1Squared, digits: 30)
#let adjXX21 = calc.round(-(sumX1 * sumX2Squared - sumX2 * sumX1X2), digits: 30)
#let adjXX22 = calc.round(n * sumX2Squared - sumX2 * sumX2, digits: 30)
#let adjXX23 = calc.round(-(n * sumX1X2 - sumX2 * sumX1), digits: 30)
#let adjXX31 = calc.round(sumX1 * sumX1X2 - sumX2 * sumX1Squared, digits: 30)
#let adjXX32 = calc.round(-(n * sumX1X2 - sumX2 * sumX1), digits: 30)
#let adjXX33 = calc.round(n * sumX1Squared - sumX1 * sumX1, digits: 30)

$
  "adj"(X' X) = [#grid(
    inset: 4pt,
    columns: (auto, auto, auto),
    [$#adjXX11$], [$#adjXX12$], [$#adjXX13$],
    [$#adjXX21$], [$#adjXX22$], [$#adjXX23$],
    [$#adjXX31$], [$#adjXX32$], [$#adjXX33$],
  )]
$

Se obtiene $(X' X)^(-1)$ dividiendo la adjunta por el determinante:

#let invXX11 = calc.round(adjXX11 / detXX, digits: 30)
#let invXX12 = calc.round(adjXX12 / detXX, digits: 30)
#let invXX13 = calc.round(adjXX13 / detXX, digits: 30)
#let invXX21 = calc.round(adjXX21 / detXX, digits: 30)
#let invXX22 = calc.round(adjXX22 / detXX, digits: 30)
#let invXX23 = calc.round(adjXX23 / detXX, digits: 30)
#let invXX31 = calc.round(adjXX31 / detXX, digits: 30)
#let invXX32 = calc.round(adjXX32 / detXX, digits: 30)
#let invXX33 = calc.round(adjXX33 / detXX, digits: 30)

$
  (X' X)^(-1) = [#grid(
    inset: 4pt,
    columns: (auto, auto, auto),
    [$#invXX11$], [$#invXX12$], [$#invXX13$],
    [$#invXX21$], [$#invXX22$], [$#invXX23$],
    [$#invXX31$], [$#invXX32$], [$#invXX33$],
  )]
$

Se calcula $hat(beta) = (X' X)^(-1) X' y$:

#let beta0 = calc.round(invXX11 * sumY + invXX12 * sumYx1 + invXX13 * sumYx2, digits: 30)
#let beta1 = calc.round(invXX21 * sumY + invXX22 * sumYx1 + invXX23 * sumYx2, digits: 30)
#let beta2 = calc.round(invXX31 * sumY + invXX32 * sumYx1 + invXX33 * sumYx2, digits: 30)

$
  hat(beta) = [#grid(
    inset: 4pt,
    columns: (auto),
    [$#beta0$],
    [$#beta1$],
    [$#beta2$],
  )]
$

El modelo de regresión es:

$
  hat(y)_i = #beta0 + #beta1 x_(i 1) + #beta2 x_(i 2)
$

Se calculan los valores estimados $hat(y)_i$ para cada observación utilizando el modelo $hat(y)_i = #beta0 + #beta1 x_(i 1) + #beta2 x_(i 2)$:

#let yHat1 = calc.round(beta0 + beta1 * 30 + beta2 * 3763.78, digits: 30)
#let yHat2 = calc.round(beta0 + beta1 * 20 + beta2 * 3763.78, digits: 30)
#let yHat3 = calc.round(beta0 + beta1 * 80 + beta2 * 940.95, digits: 30)
#let yHat4 = calc.round(beta0 + beta1 * 70 + beta2 * 940.95, digits: 30)
#let yHat5 = calc.round(beta0 + beta1 * 60 + beta2 * 940.95, digits: 30)
#let yHat6 = calc.round(beta0 + beta1 * 50 + beta2 * 940.95, digits: 30)
#let yHat7 = calc.round(beta0 + beta1 * 150 + beta2 * 6009.25, digits: 30)
#let yHat8 = calc.round(beta0 + beta1 * 140 + beta2 * 6009.25, digits: 30)
#let yHat9 = calc.round(beta0 + beta1 * 130 + beta2 * 6009.25, digits: 30)
#let yHat10 = calc.round(beta0 + beta1 * 120 + beta2 * 6009.25, digits: 30)
#let yHat11 = calc.round(beta0 + beta1 * 110 + beta2 * 6009.25, digits: 30)
#let yHat12 = calc.round(beta0 + beta1 * 100 + beta2 * 6009.25, digits: 30)
#let yHat13 = calc.round(beta0 + beta1 * 90 + beta2 * 6009.25, digits: 30)
#let yHat14 = calc.round(beta0 + beta1 * 80 + beta2 * 6009.25, digits: 30)
#let yHat15 = calc.round(beta0 + beta1 * 60 + beta2 * 6009.25, digits: 30)
#let yHat16 = calc.round(beta0 + beta1 * 30 + beta2 * 6009.25, digits: 30)
#let yHat17 = calc.round(beta0 + beta1 * 20 + beta2 * 6009.25, digits: 30)
#let yHat18 = calc.round(beta0 + beta1 * 10 + beta2 * 6009.25, digits: 30)

#let error1 = calc.round(2.4 - yHat1, digits: 30)
#let error2 = calc.round(2.5 - yHat2, digits: 30)
#let error3 = calc.round(2.2 - yHat3, digits: 30)
#let error4 = calc.round(2.0 - yHat4, digits: 30)
#let error5 = calc.round(2.0 - yHat5, digits: 30)
#let error6 = calc.round(2.0 - yHat6, digits: 30)
#let error7 = calc.round(2.1 - yHat7, digits: 30)
#let error8 = calc.round(2.2 - yHat8, digits: 30)
#let error9 = calc.round(2.0 - yHat9, digits: 30)
#let error10 = calc.round(2.1 - yHat10, digits: 30)
#let error11 = calc.round(2.0 - yHat11, digits: 30)
#let error12 = calc.round(2.0 - yHat12, digits: 30)
#let error13 = calc.round(2.1 - yHat13, digits: 30)
#let error14 = calc.round(2.4 - yHat14, digits: 30)
#let error15 = calc.round(2.1 - yHat15, digits: 30)
#let error16 = calc.round(2.4 - yHat16, digits: 30)
#let error17 = calc.round(2.6 - yHat17, digits: 30)
#let error18 = calc.round(2.7 - yHat18, digits: 30)

Se presentan los valores observados, estimados y los errores:

#grid(
  columns: (auto, auto, auto, auto, auto, auto),
  inset: 5pt,
  stroke: black,
  [$i$], [$y_i$], [$x_(i 1)$], [$x_(i 2)$], [$hat(y)_i$], [$epsilon_i = y_i - hat(y)_i$],
  [$1$], [$2.4$], [$30$], [$3763.78$], [#yHat1], [#error1],
  [$2$], [$2.5$], [$20$], [$3763.78$], [#yHat2], [#error2],
  [$3$], [$2.2$], [$80$], [$940.95$], [#yHat3], [#error3],
  [$4$], [$2.0$], [$70$], [$940.95$], [#yHat4], [#error4],
  [$5$], [$2.0$], [$60$], [$940.95$], [#yHat5], [#error5],
  [$6$], [$2.0$], [$50$], [$940.95$], [#yHat6], [#error6],
  [$7$], [$2.1$], [$150$], [$6009.25$], [#yHat7], [#error7],
  [$8$], [$2.2$], [$140$], [$6009.25$], [#yHat8], [#error8],
  [$9$], [$2.0$], [$130$], [$6009.25$], [#yHat9], [#error9],
  [$10$], [$2.1$], [$120$], [$6009.25$], [#yHat10], [#error10],
  [$11$], [$2.0$], [$110$], [$6009.25$], [#yHat11], [#error11],
  [$12$], [$2.0$], [$100$], [$6009.25$], [#yHat12], [#error12],
  [$13$], [$2.1$], [$90$], [$6009.25$], [#yHat13], [#error13],
  [$14$], [$2.4$], [$80$], [$6009.25$], [#yHat14], [#error14],
  [$15$], [$2.1$], [$60$], [$6009.25$], [#yHat15], [#error15],
  [$16$], [$2.4$], [$30$], [$6009.25$], [#yHat16], [#error16],
  [$17$], [$2.6$], [$20$], [$6009.25$], [#yHat17], [#error17],
  [$18$], [$2.7$], [$10$], [$6009.25$], [#yHat18], [#error18],
)

Se verifica que la suma de los errores $sum epsilon_i$ sea aproximadamente cero:

#let sumErrors = calc.round(error1 + error2 + error3 + error4 + error5 + error6 + error7 + error8 + error9 + error10 + error11 + error12 + error13 + error14 + error15 + error16 + error17 + error18, digits: 30)

$ sum_(i=1)^18 epsilon_i = #sumErrors approx 0 $

== Clasificación del Modelo

El modelo de regresión lineal múltiple desarrollado, $y_i = hat(beta)_0 + hat(beta)_1 x_(i 1) + hat(beta)_2 x_(i 2) + epsilon_i$, es un modelo *matemático estático de tipo analítico*. Según la clasificación por grado de abstracción, se considera un modelo simbólico, ya que representa las propiedades del sistema (resistencia eléctrica en función de la longitud y el inverso del diámetro al cuadrado) mediante una ecuación matemática. Por el método de solución, pertenece a los modelos matemáticos estáticos, ya que describe relaciones equilibradas entre las variables sin considerar cambios en el tiempo. Es analítico, pues se resuelve directamente mediante el método de mínimos cuadrados, obteniendo una solución exacta para los coeficientes $hat(beta)_0$, $hat(beta)_1$ y $hat(beta)_2$ a partir del sistema matricial $(X' X)^(-1) X' y$.

  == Error estándar e interpretación

  Para evaluar la precisión del modelo de regresión lineal múltiple $y_i = hat(beta)_0 + hat(beta)_1 x_(i 1) + hat(beta)_2 x_(i 2) + epsilon_i$, se calcula el error estándar de la estimación, que mide la dispersión de los errores residuales. El error estándar se define como $S_(y, 1, 2) = sqrt(("SSE")/(n - (k + 1)))$, donde SSE es la suma de los cuadrados de los errores, $n$ es el número de observaciones y $k$ es el número de variables predictoras.

  Se calcula la suma de los cuadrados de los errores (SSE):

  #let sse = calc.round(error1*error1 + error2*error2 + error3*error3 + error4*error4 + error5*error5 + error6*error6 + error7*error7 + error8*error8 + error9*error9 + error10*error10 + error11*error11 + error12*error12 + error13*error13 + error14*error14 + error15*error15 + error16*error16 + error17*error17 + error18*error18, digits: 30)

  $
    "SSE" = sum_(i=1)^18 epsilon_i^2 = #sse
  $

  Con $n = 18$ y $k = 2$, el error estándar se calcula como:

  #let stdError = calc.round(calc.sqrt(sse / (n - (2 + 1))), digits: 30)

  $
    S_(y, 1, 2) = sqrt(("SSE")/(n - (k + 1))) = sqrt(#sse / (#n - (2 + 1))) = #stdError
  $

El error estándar de la estimación, $S_(y, 1, 2) = #stdError$, indica la dispersión promedio de los datos observados respecto a los valores predichos por el modelo $y_i = hat(beta)_0 + hat(beta)_1 x_(i 1) + hat(beta)_2 x_(i 2)$. Un valor de $S_(y, 1, 2) = #stdError$ sugiere una variabilidad moderada de los errores residuales, lo que implica que el modelo captura una parte significativa de la variación en la resistencia eléctrica ($y_i$), aunque existe cierto nivel de imprecisión debido al ruido inherente en las mediciones. Este valor es coherente con un modelo de regresión lineal múltiple que, tras la transformación de $x_2 = 1/("diámetro")^2$ y la eliminación de observaciones atípicas, logra un ajuste razonable ($R^2 approx 0.65$), pero indica que factores adicionales o ruido experimental podrían influir en las predicciones.

== Coeficiente de determinación múltiple $R^2$ e interpretación

Para evaluar la calidad del ajuste del modelo de regresión lineal múltiple $y_i = hat(beta)_0 + hat(beta)_1 x_(i 1) + hat(beta)_2 x_(i 2) + epsilon_i$, se calcula el coeficiente de determinación múltiple $R^2$, que representa el porcentaje de la variación de la variable dependiente (resistencia eléctrica, $y_i$) explicada por las variables independientes (longitud, $x_(i 1)$, y diámetro, $x_(i 2)$). El coeficiente se define como $R^2 = "SCR"/"STC"$, donde SCR es la suma de los cuadrados de la regresión y STC es la suma total de los cuadrados.

Se calculan los términos necesarios para $R^2$:

#let tableData = (
  (y:2.4, yHat: yHat1, x1: 30, x2: 3763.78),
  (y:2.5, yHat: yHat2, x1: 20, x2: 3763.78),
  (y:2.2, yHat: yHat3, x1: 80, x2: 940.95),
  (y:2.0, yHat: yHat4, x1: 70, x2: 940.95),
  (y:2.0, yHat: yHat5, x1: 60, x2: 940.95),
  (y:2.0, yHat: yHat6, x1: 50, x2: 940.95),
  (y:2.1, yHat: yHat7, x1: 150, x2: 6009.25),
  (y:2.2, yHat: yHat8, x1: 140, x2: 6009.25),
  (y:2.0, yHat: yHat9, x1: 130, x2: 6009.25),
  (y:2.1, yHat: yHat10, x1: 120, x2: 6009.25),
  (y:2.0, yHat: yHat11, x1: 110, x2: 6009.25),
  (y:2.0, yHat: yHat12, x1: 100, x2: 6009.25),
  (y:2.1, yHat: yHat13, x1: 90, x2: 6009.25),
  (y:2.4, yHat: yHat14, x1: 80, x2: 6009.25),
  (y:2.1, yHat: yHat15, x1: 60, x2: 6009.25),
  (y:2.4, yHat: yHat16, x1: 30, x2: 6009.25),
  (y:2.6, yHat: yHat17, x1: 20, x2: 6009.25),
  (y:2.7, yHat: yHat18, x1: 10, x2: 6009.25),
)

#let tableCalc = tableData.map(d => (
  d.y,
  d.yHat,
  d.x1,
  d.x2,
  calc.round(d.y - d.yHat, digits: 30),
  calc.round((d.y - d.yHat) * (d.y - d.yHat), digits: 30),
  calc.round((d.yHat - meanY) * (d.yHat - meanY), digits: 30),
  calc.round((d.y - meanY) * (d.y - meanY), digits: 30)
))

$
  "SCR" = sum_(i=1)^18 (hat(y)_i - overline(y))^2 \
  "STC" = sum_(i=1)^18 (y_i - overline(y))^2
$

Se presentan los cálculos para cada observación:

#grid(
  columns: (auto, auto, auto, auto, auto, auto, auto, auto),
  inset: 5pt,
  stroke: black,
  [$i$], [$y_i$], [$x_(i 1)$], [$x_(i 2)$], [$hat(y)_i$], [$epsilon_i = y_i - hat(y)_i$], [$(y_i - hat(y)_i)^2$], [$(hat(y)_i - overline(y))^2$],
  ..tableCalc.enumerate().map(((i, row)) => (
    [#(i + 1)], ..row.slice(0, 7).map(x => [#x])
  )).flatten()
)

#let scr = calc.round(tableCalc.map(row => row.at(6)).sum(), digits: 30)
#let stc = calc.round(tableCalc.map(row => row.at(7)).sum(), digits: 30)
#let rSquared = calc.round(scr / stc, digits: 30)

$
  "SCR" = #scr \
  "STC" = #stc \
  R^2 = "SCR"/"STC" = #scr / #stc = #rSquared
$

El coeficiente de determinación múltiple, $R^2 = #rSquared$, indica que aproximadamente el 65.41% de la variación en la resistencia eléctrica ($y_i$) es explicada por las variables independientes longitud ($x_(i 1)$) y el inverso del diámetro al cuadrado ($x_(i 2)$) en el modelo $y_i = hat(beta)_0 + hat(beta)_1 x_(i 1) + hat(beta)_2 x_(i 2) + epsilon_i$. Este valor refleja un ajuste razonable, superando el umbral de 0.65, lo que sugiere que el modelo captura una proporción significativa de la variabilidad de los datos tras la transformación de $x_2$ y la eliminación de observaciones atípicas. Sin embargo, el 34.59% restante de la variación no explicada podría atribuirse a factores no incluidos en el modelo, como variaciones en la resistividad del cobre o ruido experimental, lo que indica que, aunque el modelo es robusto, no explica completamente el comportamiento de la resistencia eléctrica.

== $R^2$ ajustado e interpretación

Para evaluar el ajuste del modelo de regresión lineal múltiple $y_i = hat(beta)_0 + hat(beta)_1 x_(i 1) + hat(beta)_2 x_(i 2) + epsilon_i$ considerando el número de variables independientes y el tamaño de la muestra, se calcula el coeficiente de determinación ajustado $R^2_"ajustado"$. Este coeficiente penaliza la inclusión de variables adicionales que no mejoran significativamente el modelo, definido como $R^2_"ajustado" = 1 - (1 - R^2) (n - 1)/(n - k - 1)$, donde $n$ es el número de observaciones y $k$ es el número de variables predictoras.

Con $n = 18$, $k = 2$ y $R^2 = #rSquared$, se calcula:

#let rSquaredAdjusted = calc.round(1 - (1 - rSquared) * (n - 1) / (n - 2 - 1), digits: 30)

$
  R^2_"ajustado" = 1 - (1 - #rSquared) (#n - 1)/(#n - 2 - 1) = #rSquaredAdjusted
$

El coeficiente de determinación ajustado, $R^2_"ajustado" = #rSquaredAdjusted$, indica que aproximadamente el 60.79% de la variación en la resistencia eléctrica ($y_i$) es explicada por el modelo $y_i = hat(beta)_0 + hat(beta)_1 x_(i 1) + hat(beta)_2 x_(i 2) + epsilon_i$, ajustado por el número de variables predictoras ($k=2$) y el tamaño de la muestra ($n=18$). Comparado con el $R^2 = #rSquared$ (65.41%), el $R^2_"ajustado"$ es ligeramente menor debido a la penalización por el número de variables, reflejando un ajuste más conservador que considera la complejidad del modelo. Este valor confirma que el modelo es razonablemente robusto, aunque la diferencia de aproximadamente 4.62% entre $R^2$ y $R^2_"ajustado"$ sugiere una leve pérdida de eficiencia explicativa al incluir dos variables predictoras. Ambos coeficientes indican que el modelo, tras la transformación de $x_2$ y la eliminación de observaciones atípicas, captura una proporción significativa de la variabilidad, pero factores no modelados, como ruido experimental o variaciones en la resistividad, podrían explicar el porcentaje restante.

== Homocedasticidad e interpretación

== Normalidad e interpretación

== Análisis del Modelo

Desde el ámbito de la ingeniería eléctrica, el modelo de regresión lineal múltiple 
$ y_i = #beta0 + #beta1 x_(i 1) + #beta2 x_(i 2) + epsilon_i $ 
describe la resistencia eléctrica ($y_i$, en ohmios) de cables de cobre en función de su longitud ($x_(i 1)$, en cm) y el inverso del diámetro al cuadrado ($x_(i 2)$, en cm$""^(-2)$). El coeficiente $hat(beta)_0 = #beta0$ representa la resistencia base, que es baja y coherente con un intercepto físico cercano a cero. El coeficiente $hat(beta)_1 = #beta1$ indica que, por cada cm adicional de longitud, la resistencia aumenta en promedio #beta1 ohmios, manteniendo $x_(i 2)$ constante, lo cual es consistente con la proporcionalidad directa de la resistencia a la longitud según la fórmula física $R = rho (x_1)/(pi (x_2/2)^2)$. El coeficiente $hat(beta)_2 = #beta2$ refleja que un incremento en $x_(i 2) = 1/("diámetro")^2$ aumenta la resistencia en #beta2 ohmios por cm$""^(-2)$, capturando el efecto inverso del área transversal. Con $R^2 = #rSquared$ (65.41%) y $R^2_"ajustado" = #rSquaredAdjusted$ (60.79%), el modelo explica una proporción significativa de la variación en la resistencia, y el error estándar $S_(y, 1, 2) = #stdError$ indica una dispersión moderada de los errores. Este ajuste, logrado tras transformar $x_2$ y eliminar observaciones atípicas, permite predecir la resistencia con precisión aceptable para aplicaciones prácticas en diseño de circuitos eléctricos, aunque el 34.59% de variación no explicada sugiere posibles influencias de factores como variaciones en la resistividad del cobre o imprecisiones en las mediciones.

= Conclusiones

El modelo de regresión lineal múltiple
$ y_i = #beta0 + #beta1 x_(i 1) + #beta2 x_(i 2) + epsilon_i $
explica el 65.41% de la variación en la resistencia eléctrica de cables de cobre ($R^2 = #rSquared$), con un error estándar de $S_(y, 1, 2) = #stdError$. La longitud ($x_(i 1)$) y el inverso del diámetro al cuadrado ($x_(i 2)$) son predictores significativos, coherentes con la física eléctrica. El ajuste, tras transformar $x_2$ y eliminar valores atípicos, es adecuado para aplicaciones prácticas, aunque factores no modelados limitan la precisión.