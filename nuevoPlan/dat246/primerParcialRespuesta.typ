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

Para analizar la distribución de los datos, se calcularon los intervalos de las variables independientes $x_1$ (longitud, en cm) y $x_2$ (diámetro, en cm). 

=== Longitud ($x_1$)

La longitud varía entre 10 cm y 300 cm. Se definieron 5 intervalos de amplitud 58 cm:

#grid(
  inset: 5pt,
  stroke: black,
  columns: (auto, auto),
  [Intervalo (cm)], [Frecuencia],
  [$[10, 68)$], [15],
  [$[68, 126)$], [13],
  [$[126, 184)$], [3],
  [$[184, 242)$], [0],
  [$[242, 300]$], [1],
)

=== Diámetro ($x_2$)

El diámetro presenta valores discretos: 0.001 cm, 0.0129 cm, 0.0163 cm y 0.0326 cm. Las frecuencias son:

#grid(
  inset: 5pt,
  stroke: black,
  columns: (auto, auto),
  [Valor (cm)], [Frecuencia],
  [0.001], [2],
  [0.0129], [15],
  [0.0163], [6],
  [0.0326], [7],
)

Se observa que $x_1$ tiene mayor variabilidad, pero $x_2$ está concentrado en pocos valores, especialmente 0.0129 cm y 0.0326 cm. Además, se detectaron valores repetidos en $y$ (por ejemplo, $y=2.0$ en 7 observaciones) y $x_1$ (por ejemplo, 50 cm en 3 observaciones). La observación 1 ($x_1=300$, $y=5.8$) podría ser un valor atípico. No se modificaron los datos en esta etapa, ya que la linealidad y la necesidad de ajustes se verificarán en los cálculos posteriores (modelo de regresión y análisis de residuos).

== Gráfica de los puntos en tres dimensiones

Se grafican los 30 puntos de la muestra en un espacio tridimensional, con $x_1$ (longitud, en cm) en el eje $X$, $x_2$ (diámetro, en cm) en el eje $Z$, y $y$ (resistencia, en ohmios) en el eje $Y$. Los puntos son:

#grid(
  inset: 5pt,
  stroke: black,
  columns: (auto, auto, auto, auto),
  [Número], [$y$ (ohmios)], [$x_1$ (cm)], [$x_2$ (cm)],
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

Para graficar manualmente, se recomienda escalar los ejes: por ejemplo, 1 cm en papel = 50 cm para $x_1$, 1 cm = 1 ohmio para $y$, y 1 cm = 0.01 cm para $x_2$. Los puntos se trazan en un sistema de coordenadas 3D, usando proyección isométrica.

== Gráfica de los regresores de manera individual

Se grafican los puntos de la muestra para analizar la relación de la resistencia ($y$) con cada regresor por separado: $y = f(x_1)$ (resistencia vs. longitud) y $y = f(x_2)$ (resistencia vs. diámetro).

=== Resistencia vs. Longitud ($y = f(x_1)$)

Los puntos $(x_(i 1), y_i)$ se grafican en un plano 2D, con $x_1$ (longitud, en cm) en el eje $X$ y $y$ (resistencia, en ohmios) en el eje $Y$. Se distinguen los puntos según el valor de $x_2$:

#grid(
  inset: 5pt,
  stroke: black,
  columns: (auto, auto, auto, auto),
  [Número], [$y$ (ohmios)], [$x_1$ (cm)], [$x_2$ (cm)],
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

Para graficar manualmente, usa una escala de 1 cm = 50 cm para $x_1$ y 1 cm = 1 ohmio para $y$. Usa símbolos distintos (por ejemplo, círculos para $x_2 = 0.0163$, cruces para $x_2 = 0.0326$, triángulos para $x_2 = 0.0129$, cuadrados para $x_2 = 0.001$).

=== Resistencia vs. Diámetro ($y = f(x_2)$)

Los puntos $(x_(i 2), y_i)$ se grafican en un plano 2D, con $x_2$ (diámetro, en cm) en el eje $X$ y $y$ (resistencia, en ohmios) en el eje $Y$. Se distinguen los puntos según rangos de $x_1$:

#grid(
  inset: 5pt,
  stroke: black,
  columns: (auto, auto, auto, auto),
  [Número], [$y$ (ohmios)], [$x_2$ (cm)], [$x_1$ (cm)],
  [1], [5.8], [0.0163], [300],
  [2], [2.9], [0.0163], [50],
  [3], [2.8], [0.0163], [40],
  [4], [2.4], [0.0163], [30],
  [5], [2.5], [0.0163], [20],
  [6], [4.2], [0.0163], [10],
  [7], [3.2], [0.0326], [100],
  [8], [2.6], [0.0326], [90],
  [9], [2.2], [0.0326], [80],
  [10], [2.0], [0.0326], [70],
  [11], [2.0], [0.0326], [60],
  [12], [2.0], [0.0326], [50],
  [13], [2.6], [0.0326], [10],
  [14], [2.1], [0.0129], [150],
  [15], [2.2], [0.0129], [140],
  [16], [2.0], [0.0129], [130],
  [17], [2.1], [0.0129], [120],
  [18], [2.0], [0.0129], [110],
  [19], [2.0], [0.0129], [100],
  [20], [2.1], [0.0129], [90],
  [21], [2.4], [0.0129], [80],
  [22], [2.0], [0.0129], [70],
  [23], [2.1], [0.0129], [60],
  [24], [2.0], [0.0129], [50],
  [25], [2.2], [0.0129], [40],
  [26], [2.4], [0.0129], [30],
  [27], [2.6], [0.0129], [20],
  [28], [2.7], [0.0129], [10],
  [29], [2.4], [0.001], [20],
  [30], [2.4], [0.001], [10],
)

Para graficar manualmente, usa una escala de 1 cm = 0.01 cm para $x_2$ y 1 cm = 1 ohmio para $y$. Usa símbolos distintos para rangos de $x_1$ (por ejemplo, $[10, 68)$, $[68, 126)$, $[126, 184)$, $[184, 242)$, $[242, 300]$).

==

== Método de Mínimos Cuadrados

El método de mínimos cuadrados se utiliza para estimar los coeficientes del modelo de regresión lineal múltiple, dado por:

$ y_i = beta_0 + beta_1 x_(i 1) + beta_2 x_(i 2) + epsilon_i, quad i = 1, dots, 30 $

donde $y_i$ es la resistencia eléctrica (en ohmios), $x_(i 1)$ es la longitud (en cm), $x_(i 2)$ es el diámetro (en cm), $beta_0$ es el intercepto, $beta_1$ y $beta_2$ son los coeficientes de las variables independientes, y $epsilon_i$ es el error aleatorio, que se asume con media cero y varianza constante ($sigma^2$).

El objetivo es encontrar los coeficientes $hat(beta)_0$, $hat(beta)_1$, $hat(beta)_2$ que minimicen la suma de los cuadrados de los errores:

$ S = sum_(i=1)^n (y_i - hat(y)_i)^2 = sum_(i=1)^n (y_i - (hat(beta)_0 + hat(beta)_1 x_(i 1) + hat(beta)_2 x_(i 2)))^2 $

donde $hat(y)_i = hat(beta)_0 + hat(beta)_1 x_(i 1) + hat(beta)_2 x_(i 2)$ es el valor predicho para la observación $i$, y $n = 30$ es el tamaño de la muestra.

En notación matricial, el modelo se expresa como:

$ Y = X beta + epsilon $

donde:
- $Y$ es el vector de respuestas ($n times 1$): $Y = (y_1, y_2, dots, y_n)^T$.
- $X$ es la matriz de diseño ($n times 3$):
  $ X = mat(
      1, x_(1 1), x_(1 2);
      1, x_(2 1), x_(2 2);
      dots.v, dots.v, dots.v;
      1, x_(n 1), x_(n 2)
    ) $
- $beta$ es el vector de coeficientes ($3 times 1$): $beta = (beta_0, beta_1, beta_2)^T$.
- $epsilon$ es el vector de errores ($n times 1$): $epsilon = (epsilon_1, epsilon_2, dots, epsilon_n)^T$.

La solución de mínimos cuadrados se obtiene minimizando $S = ||Y - X beta||^2$. Derivando con respecto a $beta$ e igualando a cero, se obtiene la ecuación normal:

$ X^T X hat(beta) = X^T Y $

Resolviendo para $hat(beta)$:

$ hat(beta) = (X^T X)^(-1) X^T Y $

Esta solución proporciona los coeficientes estimados $hat(beta)_0$, $hat(beta)_1$, $hat(beta)_2$. El modelo ajustado es:

$ hat(y)_i = hat(beta)_0 + hat(beta)_1 x_(i 1) + hat(beta)_2 x_(i 2) $

El método asume que:
- La relación entre $y$ y $(x_1, x_2)$ es lineal.
- Los errores $epsilon_i$ son independientes, con media cero y varianza constante ($sigma^2$).
- Los errores siguen una distribución normal (para pruebas de hipótesis).
- La matriz $X^T X$ es invertible (sin multicolinealidad perfecta).

En los siguientes apartados, se calcularán los coeficientes y se verificarán estos supuestos utilizando los datos de la muestra.

== Cálculos del Modelo de Regresión

A continuación, se realizan los cálculos paso a paso para estimar los coeficientes del modelo de regresión lineal múltiple utilizando el método de mínimos cuadrados, con redondeo a tres decimales.

=== Matriz de diseño $X$ y vector $Y$

La matriz de diseño $X$ ($30 times 3$) contiene una columna de 1’s (para el intercepto $beta_0$), una columna con los valores de $x_(i 1)$ (longitud), y una columna con los valores de $x_(i 2)$ (diámetro). El vector $Y$ ($30 times 1$) contiene los valores de $y_i$ (resistencia). Los datos son:

#let Data = (
  (Y: 5.8, X1: 300.0, X2: 0.0163),
  (Y: 2.9, X1: 50.0, X2: 0.0163),
  (Y: 2.8, X1: 40.0, X2: 0.0163),
  (Y: 2.4, X1: 30.0, X2: 0.0163),
  (Y: 2.5, X1: 20.0, X2: 0.0163),
  (Y: 4.2, X1: 10.0, X2: 0.0163),
  (Y: 3.2, X1: 100.0, X2: 0.0326),
  (Y: 2.6, X1: 90.0, X2: 0.0326),
  (Y: 2.2, X1: 80.0, X2: 0.0326),
  (Y: 2.0, X1: 70.0, X2: 0.0326),
  (Y: 2.0, X1: 60.0, X2: 0.0326),
  (Y: 2.0, X1: 50.0, X2: 0.0326),
  (Y: 2.6, X1: 10.0, X2: 0.0326),
  (Y: 2.1, X1: 150.0, X2: 0.0129),
  (Y: 2.2, X1: 140.0, X2: 0.0129),
  (Y: 2.0, X1: 130.0, X2: 0.0129),
  (Y: 2.1, X1: 120.0, X2: 0.0129),
  (Y: 2.0, X1: 110.0, X2: 0.0129),
  (Y: 2.0, X1: 100.0, X2: 0.0129),
  (Y: 2.1, X1: 90.0, X2: 0.0129),
  (Y: 2.4, X1: 80.0, X2: 0.0129),
  (Y: 2.0, X1: 70.0, X2: 0.0129),
  (Y: 2.1, X1: 60.0, X2: 0.0129),
  (Y: 2.0, X1: 50.0, X2: 0.0129),
  (Y: 2.2, X1: 40.0, X2: 0.0129),
  (Y: 2.4, X1: 30.0, X2: 0.0129),
  (Y: 2.6, X1: 20.0, X2: 0.0129),
  (Y: 2.7, X1: 10.0, X2: 0.0129),
  (Y: 2.4, X1: 20.0, X2: 0.0010),
  (Y: 2.4, X1: 10.0, X2: 0.0010),
)

#let N = Data.len() // N = 30

La matriz $X$ y el vector $Y$ se definen como:

$ X = mat(
  1, x_(1 1), x_(1 2);
  1, x_(2 1), x_(2 2);
  dots.v, dots.v, dots.v;
  1, x_(30 1), x_(30 2)
), quad Y = vec(y_1, y_2, dots.v, y_30)^T $

=== Cálculo de $X^T X$

La matriz $X^T X$ ($3 times 3$) se calcula como:

$ X^T X = mat(
  sum_(i=1)^n 1, sum_(i=1)^n x_(i 1), sum_(i=1)^n x_(i 2);
  sum_(i=1)^n x_(i 1), sum_(i=1)^n x_(i 1)^2, sum_(i=1)^n x_(i 1) x_(i 2);
  sum_(i=1)^n x_(i 2), sum_(i=1)^n x_(i 1) x_(i 2), sum_(i=1)^n x_(i 2)^2
) $

Calculamos cada elemento:

#let SumOnes = calc.round(N, digits: 3) // sum 1 = N
#let SumX1 = calc.round(Data.map(d => d.X1).sum(), digits: 3)
#let SumX2 = calc.round(Data.map(d => d.X2).sum(), digits: 3)
#let SumX1Sq = calc.round(Data.map(d => d.X1 * d.X1).sum(), digits: 3)
#let SumX2Sq = calc.round(Data.map(d => d.X2 * d.X2).sum(), digits: 3)
#let SumX1X2 = calc.round(Data.map(d => d.X1 * d.X2).sum(), digits: 3)

- $sum_(i=1)^n 1 = SumOnes$
- $sum_(i=1)^n x_(i 1) = SumX1$
- $sum_(i=1)^n x_(i 2) = SumX2$
- $sum_(i=1)^n x_(i 1)^2 = SumX1Sq$
- $sum_(i=1)^n x_(i 2)^2 = SumX2Sq$
- $sum_(i=1)^n x_(i 1) x_(i 2) = SumX1X2$

Sustituyendo:

$ X^T X = mat(
  30, 2370, 0.525;
  2370, 267300, 46.209;
  0.525, 46.209, 0.013
) $

=== Inversa de $X^T X$

La inversa $(X^T X)^{-1}$ se calcula para la matriz:

$ X^T X = mat(
  a, b, c;
  b, d, e;
  c, e, f
) $

donde $a = 30$, $b = 2370$, $c = 0.525$, $d = 267300$, $e = 46.209$, $f = 0.013$. El determinante es:

$ det(X^T X) = a(d f - e^2) - b(b f - c e) + c(b e - c d) $

#let DetA = calc.round(30 * (267300 * 0.013 - 46.209 * 46.209) - 2370 * (2370 * 0.013 - 0.525 * 46.209) + 0.525 * (2370 * 46.209 - 0.525 * 267300), digits: 3)

$ det(X^T X) = DetA $

La matriz inversa es:

$ (X^T X)^(-1) = 1 / det(X^T X) dot mat(
  d f - e^2, -(b f - c e), b e - c d;
  -(b f - c e), a f - c^2, -(a e - c b);
  b e - c d, -(a e - c b), a d - b^2
) $

Calculando cada elemento:

#let InvA11 = calc.round((267300 * 0.013 - 46.209 * 46.209) / DetA, digits: 3)
#let InvA12 = calc.round(-(2370 * 0.013 - 0.525 * 46.209) / DetA, digits: 3)
#let InvA13 = calc.round((2370 * 46.209 - 0.525 * 267300) / DetA, digits: 3)
#let InvA22 = calc.round((30 * 0.013 - 0.525 * 0.525) / DetA, digits: 3)
#let InvA23 = calc.round(-(30 * 46.209 - 0.525 * 2370) / DetA, digits: 3)
#let InvA33 = calc.round((30 * 267300 - 2370 * 2370) / DetA, digits: 3)

$ (X^T X)^(-1) = mat(
  InvA11, InvA12, InvA13;
  InvA12, InvA22, InvA23;
  InvA13, InvA23, InvA33
) $

=== Cálculo de $X^T Y$

El vector $X^T Y$ ($3 times 1$) es:

$ X^T Y = vec(
  sum_(i=1)^n y_i,
  sum_(i=1)^n x_(i 1) y_i,
  sum_(i=1)^n x_(i 2) y_i
) $

#let SumY = calc.round(Data.map(d => d.Y).sum(), digits: 3)
#let SumX1Y = calc.round(Data.map(d => d.X1 * d.Y).sum(), digits: 3)
#let SumX2Y = calc.round(Data.map(d => d.X2 * d.Y).sum(), digits: 3)

- $sum_(i=1)^n y_i = SumY$
- $sum_(i=1)^n x_(i 1) y_i = SumX1Y$
- $sum_(i=1)^n x_(i 2) y_i = SumX2Y$

$ X^T Y = (SumY, SumX1Y, SumX2Y) $

=== Coeficientes $hat(beta)$

Los coeficientes se calculan como:

$ hat(beta) = (X^T X)^(-1) X^T Y $

#let Beta0 = calc.round(InvA11 * SumY + InvA12 * SumX1Y + InvA13 * SumX2Y, digits: 3)
#let Beta1 = calc.round(InvA12 * SumY + InvA22 * SumX1Y + InvA23 * SumX2Y, digits: 3)
#let Beta2 = calc.round(InvA13 * SumY + InvA23 * SumX1Y + InvA33 * SumX2Y, digits: 3)

$ hat(beta) = vec(hat(beta)_0, hat(beta)_1, hat(beta)_2) = (Beta0, Beta1, Beta2) $

El modelo ajustado es:

$ hat(y)_i = Beta0 + Beta1 x_(i 1) + Beta2 x_(i 2) $

=== Valores predichos y residuos

Calculamos los valores predichos $hat(y)_i$ y los residuos $e_i = y_i - hat(y)_i$ para cada observación:

#let PredictedY = Data.map(d => calc.round(Beta0 + Beta1 * d.X1 + Beta2 * d.X2, digits: 3))
#let Residuals = Data.enumerate().map(((i, d)) => calc.round(d.Y - PredictedY.at(i), digits: 3))

#grid(
  inset: 5pt,
  stroke: black,
  columns: (auto, auto, auto, auto, auto, auto),
  [Número], [$y_i$], [$x_(i 1)$], [$x_(i 2)$], [$hat(y)_i$], [$e_i$],
  ..Data.enumerate().map(((i, d)) => (str(i + 1), str(d.Y), str(d.X1), str(d.X2), str(PredictedY.at(i)), str(Residuals.at(i)))).flatten()
)

=== Suma de cuadrados y $R^2$

La suma de cuadrados total (SST), de la regresión (SSR) y del error (SSE) se calculan como:

#let MeanY = calc.round(SumY / N, digits: 3)
#let SST = calc.round(Data.map(d => (d.Y - MeanY) * (d.Y - MeanY)).sum(), digits: 3)
#let SSE = calc.round(Residuals.map(e => e * e).sum(), digits: 3)
#let SSR = calc.round(SST - SSE, digits: 3)
#let RSquared = calc.round(SSR / SST, digits: 3)

- $SST = sum_(i=1)^n (y_i - overline(y))^2 = SST$
- $SSE = sum_(i=1)^n (y_i - hat(y)_i)^2 = SSE$
- $SSR = SST - SSE = SSR$
- $R^2 = SSR / SST = RSquared$

El coeficiente de determinación $R^2$ indica la proporción de la variabilidad de $y$ explicada por el modelo.
