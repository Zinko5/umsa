#set page(
  margin: (x: 2.5cm, y: 2.5cm) //Para trabajos digitales e impresos simples
  // margin: (left: 3.8cm, y: 2.5cm, right: 2.5cm) //Para trabajos impresos a doble cara
)
#set text(lang:"es")
#set text(font: "DejaVu Sans") //Sans
// #set text(font: "DejaVu Serif") //Serif
#set par(justify: true)
#show math.equation: set text(font: "DejaVu Math TeX Gyre")
#show math.equation:box
#let separador() = align(center)[#line(length: 100%)]

#set quote(block: true)
#set heading(numbering: "1.")
#show heading.where(level: 3): set heading(numbering: none)
#show heading.where(level: 3): set heading(outlined: false)

#import "@preview/cetz:0.3.4": canvas, draw, tree


DAT 246 - Modelación Estadística

// = La recta.
Primer parcial con dos variables, buscar un ejemplo real para resolver un problema, grupos de a dos.

Hacer gráficas (con tres dimensiones) del modelo de regresión lineal. Dibujos a mano, no en computadora.

$
  y = beta_0 + beta_1 x_1 + beta_2 x_2 + epsilon
$
// así el gráfico del primer parcial, con tres variables.

Universidad Mayor de San Andrés, facultad de ciencias puras y naturales.

Frecuencia: Cuatro horas por semana por cada materia.

Cuarto semestre, 2/2025.

Plan curricular por competencia.

* Competencia de la asignatura.*

Capacidad para integrar conocimientos adecuados en el modelo matemático, cálculo y diseño experimental, aplicando los modelos, métodos y técnicas relevantes en distintas áreas de la estadística matemática, participando en la creación de nuevas tecnologías que contribuyan al desarrollo de la sociedad de la información.

#heading(outlined: false, numbering: none)[Contenido]

#outline()

= Introducción a la modelación.
== Concepto de modelo.
Es la representación de un sistema real de acuerdo al objetivo del problema.

#image("Sin título.png")

Un modelo es una forma de ver, una abstracción de algo real.

Un modelo es la representación de la realidad, por lo tanto no incluye todos los aspectos del problema exacto.

Es una representación del sistema estudiado, para predecir y observar los posibles cambios.

Un modelo científico es una representación de algún objeto sujeto a investigación que pueden ser procesos, acontecimientos, sistemas, etc. Y que se utilizan con fines de predicción y control.

Un modelo científico tiene caracter explicativo mas que descriptivo.

Las ventajas de tener un modelo son:
- Cuando el sistema real no se puede manipular. Ejemplos: astronomia, modelo relacional (base de datos), planos de arquitectura
- Cuando el costo es muy alto. Ejemplos: Ventas, simuladores de conducción, mostrar al usuario sistemas informáticos (modelo entidad relación)

== Clasificación de modelo.
=== Clasificación segun el grado de abstracción
- Modelos icónicos: Representan de forma pictórica o visual ciertos aspectos, además se parece a lo que representa. Ejemplos: Fotografías, juguetes, esculturas, dibujos.

#image("Sin título-1.png")

- Modelos analógicos: Utilizan una serie de propiedades para representar otro conjunto de propiedades que posee el sistema estudiado. Ejemplos: Estructuras geólogicas (se representa por colores de acuerdo a distintas propiedades), diagramas de flujo con programas.

- Modelos simbólicos: Se emplean para asignar las propiedades del sistema por medio de una ecuación matemática.

=== Clasificación de los modelos por el método de solución

Hay dos tipos de modelos, los físicos y los matemáticos, el físico tiene la parte estática y dinámica. El matemática también tiene la parte estático y dinámico. El estático de física se divide en la escala y los icónicos, la parte dinámica solo tiene los analógicos.
El estático de matemática se divide en numérico y analitico, mientras que el dinámico tiene númerico y analítico, numérico tiene simulación de sistemas.


#let data = (
  [Modelos], ([Físicos], ([Estáticos], [Escala], [Icónicos]), ([Dinámicos], [Analógicos])), ([Matemáticos], ([Estáticos], [Numéricos], [Analíticos]), ([Dinámicos], ([Numéricos], [Simulación de sistemas]), [Analíticos]))
)

#canvas({
  import draw: *

  set-style(content: (padding: .2),
    fill: gray.lighten(70%),
    stroke: gray.lighten(70%))

  tree.tree(data, spread: 2.5, grow: 1.7, draw-node: (node, ..) => {
    circle((), radius: .55, stroke: none)
    content((), node.content)
  }, draw-edge: (from, to, ..) => {
    line((a: from, number: .6, b: to),
         (a: to, number: .6, b: from), mark: (end: ">"))
  }, name: "tree")

  // Draw a "custom" connection between two nodes
  // let (a, b) = ("tree.0-0-1", "tree.0-1-0",)
  // line((a, .6, b), (b, .6, a), mark: (end: ">", start: ">"))
})

=== Simulación de sistemas

Es una técnica que utilizan los modelos matemáticos dinámicos.

=== Los modelos físicos

Los atributos de las entidades del sistema se representan mediante medidas físicas, y las actividades del sistema representan las leyes físicas.

Dentro de los modélos físicos estáticos, tenemos los modelos a escala, por ejemplo, un mapa, accidentes de tránsito, estudio de naves acuáticas. 

Los modelos icónicos representan de manera visual/pictórica.

=== Los modelos matemáticos
Las entidades y los atributos de un sistema se representan mediante variables matemáticas. las actividades mediante actividades matemáticas que relacionan las variables. Dentro de ellas tenemos un modelo mateático estático.

El modelo matemático estático (no cambia en el tiempo): Despliega las relaciones entre los atributos del sistema cuando este está equilibrado, se puede resolver numéricamente y analíticamente. Es analítico si tiene solución, sino es numérico.

El modelo matemático dinámico significa que cambia a través del tiempo, permite deducir los cambios a los atributos del sistema en función del tiempo. De acuerdo a la complejidad, se puede resolver de manera analítica o numérica.

=== Proceso de modelación

Es las etapas del proceso de contrucción de un modelo.

Sistema real supuesto.
- Abstracción.
- Validación.

Modelo o modelo conceptual.
- Transformación.
- Validación.

modelo para ordenador.
- Implementación.
- Validación.

Cálculo.
- Experimento.
- Validación.

Sistema real supuesto.

*Abstracción*: Consisten en el aislamiento mental que permite separar las características escenciales y generales de otras propiedades secundarias.

Sea $x$ el número de individuos de una especie $e$,suponemos que no existe otra especie que se alimente de los productos que $e$ consume, también $e$ no sirve de alimento a otra especie. Entonces la taza de crecimiento en función al tiempo $(d x)/(d t)$ donde $x$ es proporcional a una variable $a$, entonces $(d x)/(d t) = a x$

== Repaso de la recta.

La recta se define mediante ecuaciones:
$
  a x + d y + c = 0\
  y - y_1 = m (x - x_1)\
  y = m x + b\
  (y - y_1) / (x - x_1) = (y_2 - y_1) / (x_2 - x_1)\
  x / a + y / b = 1
$

Ejemplo: Sean los puntos $p_1 = (2, 3)$ y $p_2 = (5, 7)$.
$
  (y - 3) / (x - 2) = (7 - 3) / (5 - 2)\
  y = 4/3 (x - 2) + 3\
  y = (4 x)/3 + 1/3\
  m = tan theta\
  tan theta = 4/3\
  arctan (4/3) = 0.927\
  theta = 0.927 dot 180/pi = 53.18 degree.
$

*Práctica nr4: graficar la recta de arriba.*
= Regresión lineal y estimación de parámetros.
El modelo estadístico 'regresión lineal' se puede escribir de dos formas:

a) La variable respuesta o dependiente $y$ se expresa como suma de $beta_0 + delta_1 x_i$ y un error aleatorio $epsilon_i$ que tiene una distribución normal con una media cero y una varianza $sigma^2$. Por lo tanto, el modelo se escribe $y_i = beta_0 + beta_1 x_i + epsilon_i : epsilon ~ N(0, sigma^2)$.

b) La variable respuesta o dependiente $y$ tiene una distribución normal con media que cambia en función de la variable $bar(x)$ pero con varianza constante. Entonces, el modelo se expresa como:
$
  y_i ~ N (mu_i, sigma^2)\
  mu_i = beta_0 + beta_i x_i\
  sigma^2 = "Constante"
$

// Hasta el día jueves, tener los grupos. 
// El lunes, tema con dos variables, lineal, ejemplo: tomates. variables: precio, zona.

En cualquiera de las dos formas, el vector de parámetros del modelo es: $theta = (beta_0, beta_1, sigma)^T$.

Ejemplo:

#image("Proyecto nuevo.png")
$
  overline(x)_i = a + b t\
  beta_0 + beta_i T\
  b = 27,8\
  a = 452,6\
  overline(x)_1 = 452,6 + 27,8 T\
  overline(x)_2 = 452,6 + 27,8 (8)\
  overline(x)_3 = 675
$

De acuerdo con nuestras suposiciones sobre la curva normal de $x_8$, tiene el valor de $700$, es un valor proveniente de una distribución normal, con media de $675$.

$
  x_8 ~ N(675, 36)\
  sigma^2 = 36\
  sigma = 6
$
#image("2Proyecto nuevo.png")

Ejemplo:
#grid(
  inset:5pt,
  stroke: black,
  columns: (auto, auto, auto),
  [Estud.], [Estatura], [Peso],
  [], [x], [y],
  [1], [154], [53],
  [2], [158], [45],
  [3], [162], [56],
  [4], [166], [73],
  [5], [170], [65],
  [6], [174], [88],
  [7], [178], [89],
  [8], [182], [75],
  [9], [190], [90],
)

$
  "Peso" ~ N (mu_i, sigma^2)\
  mu_i = beta_0 + beta_1 "estatura"_i\
  sigma^2 = "constante"\
  \
  hat("Peso")_i ~ N (hat(mu)_i, hat(sigma)^2)\
  hat(mu)_i = -138.0091 + 1.2227 "estatura"_i
$ 

== La recta de regresión.
Una recta de regresión es una línea recta que se ajusta a un conjunto de datos para mostrar la relación entre dos variables. En estadística, se utiliza conmunmente para predecir el valor de una variable en función de otra variable.

Sea una distribución bidimensional $(x, y)$ y una serie de valores observados $(x_i, y_i)$ con una correlación lineal que se representa en plano mediante una nube de puntos; se busca la recta que mejor se ajuste a la nube de puntos y esta recta recibe el nombre de recta de regresión o recta de regresión lineal. Para ello se utiliza el método de mínimos cuadrados que consiste en que la recta cumpla "la suma de los cuadrados de las distancias de todos los puntos a la recta sea mínimos".

#image("MinimosCuadrados_02.png")

La recta de regresión de $y$ sobre $x$ está representado por la ecuación:
$
  y = overline(y) + (S_(x y))/(S_x^2) (x - overline(x))
$
Esta es la ecuación de la recta en forma punto-pendiente. La ecuación representa un modelo para encontrar la recta de regresión.

$
  m = m x y = (S_(x y))/(S_x^2)
$

$S(x y)$ es la covarianza, $S$ es la muestra, $S_x^2$ es la varianza y $sigma$ es la población, $S_x$ es la desviación estándar.

Encontrar el coeficiente re correlación $r$ para saber si es una regresión lineal.

$
  -1 lt.eq r lt.eq 1\
  r = (S_(x y))/(S_x S_y)
$

$r$ es para una variable, $R$ (mayúscula) es para dos variables.

// Primera pregunta del examen: Tema y grupos de a dos. Hasta el martes. Vale 10% del examen.

La varianza es una medida de dispersión que representa la variabilidad de una serie de datos con respecto a su media. Formalmente se calcula como la suma de los cuadrados de los residuos dividida por las observaciones totales. Es decir la varianza es el promedio de los cuadrados de las desviaciones medidas al rededor de la media.

#grid(
  inset: 10pt,
  columns: (auto, auto, auto, auto),
  stroke: black,
  [], [Varianza], [Desviación estándar], [Media],
  [Población], [$sigma^2 = (sum x_i - mu)^2/N = (sum x_i)/N -mu^2$], [$ sigma = sqrt(sigma ^2)$], [$mu = (sum x_i)/N$],
  [Muestra], [$S^2 = (sum x_i - overline(x))^2/(n-1) = \
  (sum x_i^2 - (sum x_i^2)/n)/(n - 1)$], [$S = sqrt(S^2)$], [$sum x_i/n$],
)

La covarianza es una medida descriptiva que permite el tipo de asociación lineal entre dos variables, se obtiene mediante la ecuación:
$
  "Cov"(x, y) = S_(x y) = (sum (x_i - overline(x))(y_i - overline(y)))/(n-1)\
  S_(x y) = (sum (x_i - overline(x)) (y_i - overline(y)))/(n - 1)\
  S_(x y) cases(=0 "; no existe relación entre las variables"\
   lt 0 ";existe una relación inversa entre las variables"\
  gt 0 "hay una relación directa entre las variables"
  )
$

*Práctica 5, 6 y 7*: Se tienen los datos de la muestra de un grupo de estudiantes de la variable estatura $x$ y peso $y$. Encontrar la recta de regresión de $y$ sobre $x$ o modelo de regresión.

#grid(
  inset:5pt,
  stroke: black,
  columns: (auto, auto, auto),
  [Estud.], [Estatura], [Peso],
  [], [x], [y],
  [1], [175], [88],
  [2], [182], [82],
  [3], [187], [89],
  [4], [190], [90],
  [5], [162], [56],
  [6], [154], [53],
  [7], [189], [68],
  [8], [158], [45],
  [9], [155], [58],
  [10], [168], [75],
)

Ejemplo (similar a la práctica):

#grid(
  inset:5pt,
  stroke: black,
  columns: (auto, auto, auto),
  [Estud.], [Estatura], [Peso],
  [], [x], [y],
  [1], [154], [33],
  [2], [158], [45],
  [3], [162], [56],
  [4], [166], [73],
  [5], [170], [65],
  [6], [174], [88],
  [7], [178], [89],
  [8], [182], [75],
  [9], [186], [89],
  [10], [190], [90],
)

$
  y = overline(y) + (S_(x y))/(S_x^2) (x - overline(x))
$

Se necesita la media, $overline(x) = 172$ $overline(y) = 72.3$.

#grid(
  inset:5pt,
  stroke: black,
  columns: (auto, auto, auto, auto, auto, auto, auto, auto),
  [Estud.], [Estatura], [Peso], [Varianza], [Varianza], [Covarianza], [Covarianza], [Covarianza],
  [], [x], [y], [$(x_i - overline(x))^2$], [$(y_i - overline(y))^2$], [$x_1 - overline(x)$], [$y_i - overline(y)$], [$(x_1 - overline(x)) dot (y_i - overline(y))$],
  [1], [154], [33], [324], [372.49], [-18], [-19.3], [347.4],
  [2], [158], [45], [196], [745.29], [-14], [-27.3], [382.2],
  [3], [162], [56], [100], [265.69], [], [], [163],
  [4], [166], [73], [36], [0.49], [], [], [-4.2],
  [5], [170], [65], [4], [53.29], [], [], [14.6],
  [6], [174], [88], [4], [246.49], [], [], [31.6],
  [7], [178], [89], [36], [278.89], [], [], [100.2],
  [8], [182], [75], [100], [7.29], [], [], [27],
  [9], [186], [89], [196], [278.89], [], [16.7], [233.8],
  [10], [190], [90], [324], [313.24], [18], [17.7], [318.6],
  [], [], [], [1320], [2562.8], [], [], [1614],
)

$
  S_x^2 = 1320/9 = 146.67\
  S_x = sqrt(146.67) = 12.11\
  S_y^2 = 2562.5/9 = 284.68\
  S_x = sqrt(284.68) = 16.87\
  v = (S_(x y))/(S_x S_y) = 179.33/(12.11 dot 16.87) = 0.877\
  y = overline(y) + (S_(x y))/(S_x^2) (x - overline(x)) = 72.3 + (179.33)/ 146.77 (x - 172)\
  y = -138.01 + 1.12227 x qed
$

#separador()

*Resolución de la práctica 5, 6 y 7*:

#grid(
  inset: 5pt,
  stroke: black,
  columns: (auto, auto, auto),
  [Estud.], [Estatura], [Peso],
  [], [\( x \)], [\( y \)],
  [1], [175], [88],
  [2], [182], [82],
  [3], [187], [89],
  [4], [190], [90],
  [5], [162], [56],
  [6], [154], [53],
  [7], [189], [68],
  [8], [158], [45],
  [9], [155], [58],
  [10], [168], [75],
)

Se calcula la media de las variables:

$
  overline(x) = (175 + 182 + 187 + 190 + 162 + 154 + 189 + 158 + 155 + 168)/10 = 1720/10 = 172
$

$
  overline(y) = (88 + 82 + 89 + 90 + 56 + 53 + 68 + 45 + 58 + 75)/10 = 704/10 = 70.4
$

A continuación, se construye la tabla para calcular las varianzas y la covarianza:

#grid(
  inset: 5pt,
  stroke: black,
  columns: (auto, auto, auto, auto, auto, auto, auto, auto),
  [Estud.], [Estatura], [Peso], [Varianza], [Varianza], [Covarianza], [Covarianza], [Covarianza],
  [], [$x_i$], [$y_i$], [($x_i - overline(x))^2$], [$(y_i - overline(y))^2$], [$x_i - overline(x)$], [$y_i - overline(y)$], [$(x_i - overline(x)) dot (y_i - overline(y))$)],
  [1], [175], [88], [9], [309.76], [3], [17.6], [52.8],
  [2], [182], [82], [100], [134.56], [10], [11.6], [116],
  [3], [187], [89], [225], [345.96], [15], [18.6], [279],
  [4], [190], [90], [324], [384.16], [18], [19.6], [352.8],
  [5], [162], [56], [100], [207.36], [-10], [-14.4], [144],
  [6], [154], [53], [324], [302.76], [-18], [-17.4], [313.2],
  [7], [189], [68], [289], [5.76], [17], [-2.4], [-40.8],
  [8], [158], [45], [196], [645.16], [-14], [-25.4], [355.6],
  [9], [155], [58], [289], [153.76], [-17], [-12.4], [210.8],
  [10], [168], [75], [16], [21.16], [-4], [4.6], [-18.4],
  [], [], [], [1872], [2510.4], [], [], [1755.2],
)

Se calculan las varianzas y la covarianza:

$
  S_x^2 = 1872/9 = 208
$

$
  S_y^2 = 2510.4/9 = 278.933
$

$
  S_x = sqrt(208) approx 14.422
$

$
  S_y = sqrt(278.933) approx 16.701
$

$
  S_(x y) = 1755.2/9 approx 195.022
$

El coeficiente de correlación es:

$
  v = (S_(x y))/(S_x S_y) = 195.022/(14.422 dot 16.701) approx 0.810
$

La recta de regresión es:

$
  y = overline(y) + (S_(x y))/(S_x^2) (x - overline(x)) = 70.4 + 195.022/208 (x - 172)
$

$
  y = 70.4 + 0.9376 (x - 172) = 70.4 + 0.9376 x - 161.2672 approx -90.867 + 0.9376 x quad qed
$

#separador()

*Práctica 8, 9, 10*: Hacer la gráfica de $y = -138.01 + 1.12227 x$ y sacar la conclusión de la relación entre variables con:
$
  S_(x y) cases(=0 "; no existe relación entre las variables"\
   lt 0 ";existe una relación inversa entre las variables"\
  gt 0 "hay una relación directa entre las variables"
  )
$
// Debe pasar por x/2 y y/2

Para el proyecto, usar 30 observaciones (datos).

$
  y = overline(y) + (S_(x y)) / (S^2_x) (x - overline(x))\
  r = (S_(x y))/(S_x S_y)\
  y = overline(y) + (sum (x_i - overline(x))(y_i - overline(y)))/(sum (x_i - overline(x))^2) (x - overline(x))
$

// si y = -a + b c por que es negativo -a

El análisis de regresión es una técnica estadística para modelar y investigar la relación entre dos o más variables. En general, hay una sola variable o respuesta $y$ que se relaciona con $k$ variables independientes o regresivas $x_1, x_2, dots, x_k$.

La variable de respuesta $y$ es una variable aleatoria, en tanto que las variables regresivas $x_1, x_2, dots, x_k$ miden con error especial.

// Es una recta que tiene una distribución normal.

Las variables se llaman también variables matemáticas, y con frecuencia son controladas por el experimentador. La relación de $y$ con $x_1, x_2, dots, x_k$ se caracteriza por medio de un modelo matemático llamado ecuación de regresión.

El valor esperado de $y$ para cada valor de $x$ es la esperanza de $y$ dado $x$, $E(y|x) = beta_0 + b_1 x$.

$y = beta_0 + beta_1 x + epsilon$.

$epsilon: "error".\
y: "variable de respuesta."\
x: "variable predictoria o matemática."$

Donde el error $epsilon$ es aleatorio.$epsilon ~ N(0, sigma^2)$.

Los ${epsilon}$ (el conjunto de todos los errores) son variables aleatorias pero son no correlacionales

== Mínimos cuadrados.
El procedimiento de optimización es el de mínimos cuadrados. Optimizar significa encontrar los valores máximos o mínimos. Funciona con algoritmos iterativos. Esto se estima $beta_0$ y $beta_1$ de manera que la suma de los cuadrados de las desviaciones entre las observaciones y la línea de regresión deben tener valores mínimos.

$
  y_i = beta_0 + beta_i x_i + epsilon_i quad; i = 1, dots, n\
  epsilon_i = y_i - beta_0 - beta_i x_i
$

La suma de cuadrados de las desviaciones de las observaciones respecto a la línea de regresión verdadera es:

$
  L = sum_(i = 1)^(n) epsilon_i^2 = sum_(i = 1)^(n)(y_"observado"_i - y_"modelo"_i)^2 = sum_(i = 1)^n (y_i - hat(y)_i)
$

$y$ son los valores observados, $hat(y)$ son los valores del modelo de regresión lineal. La diferencia entre cada $y$ y su respectivo $hat(y)$ es el error.

$
  L = sum_(i = 1)^n (y_i - beta_0 - beta_i x_i)^2
$

Los estimadores de mínimos cuadrados de $beta_0$ y $beta_1$ es $hat(beta)_0$ y $hat(beta)_1$. Es el estimador de la recta del modelo.

$
  sum y_i - sum hat(beta)_0 - sum hat(beta)_1 x_i = 0\
  sum y_i x_i - sum hat(beta)_0 x_i - sum hat(beta)_1 x_i^2 = 0\
$

#separador()

$
  sum y_i sum x_i - n hat(beta)_0 sum x_i - hat(beta)_1 (sum x_i)^2 = 0\
  -n sum y_i x_i + n hat(beta)_0 sum x_i + n hat(beta)_1 sum x_i^2 = 0\
$

#separador()

$
  sum y_i sum x_i - n sum y_i x_i = hat(beta)_1 ((sum x_i)^2 - n sum x^2)\
  hat(beta)_1 = (sum y_i  x_i - n sum y_i sum x_i)/( n sum x_i^2 - (sum x_i)^2)\
  hat(beta)_1 = (sum y_i x_i - (sum y_i sum x_i)/(n))/(sum x_i^2 - (sum x_i)^2/(n)) qed
$

#separador()

$
  n hat(beta)_0 = sum y_i - beta_1 sum x_i\
  hat(beta)_0 = (sum y_i)/n - beta_1 (sum x_i)/n\
  hat(beta)_0 = overline(y) - hat(beta)_1 overline(x) qed
$

Para el experimento del parcial 1, el muestreo de datos vale 20 puntos y los cálculos, 70. El tamaño del muestreo debe de ser 30.

Dados $beta_0$ y $beta_1$, se deben encontrar $hat(beta_0)$ y $hat(beta_1)$,si lo hacemos, hemos encontrado el modelo de regresión.

$
  hat(y)_i = hat(beta)_0 + hat(beta)_1 x_i\
  hat(y)_i = overline(y) - hat(beta)_1 overline(x) + hat(beta)_1 x_i\
  hat(y)_i = overline(y) + hat(beta)_1 (x_i - overline(x))\
  hat(beta)_1 = ((sum y_i x_i)/n - (sum y_i)/n (sum x_i)/n)/((sum x_i^2)/(n)-(sum x_i)^2/(n^2))\
  hat(beta)_1 = ((sum y_i x_i)/n - overline(y) overline(x))/((sum x_i^2)/(n)- overline(x)^2)\
  hat(beta)_1 = (S_(x y))/S_x^2\
  hat(y) = overline(y) + (S_(x y))/S_x^2 (x_i - overline(x)) qed
$

== Supuestos del modelo de regresión lineal.
Para que un modelo sea de regresión lineal, debe cumplir con:
+ Linealidad
+ Normalidad
+ Homocelasticidad
+ Independencia.

=== Linealidad

La relación entre las variables independientes y la variable dependiente debe ser lineal. Se puede medir con $r$.

=== Normalidad

Los errores de la regresión deben seguir una distribución normal. Si la normalidad no se cumple (si la suma de los errores no da cero), los intérvalos de confianza y las pruebas de hipótesis pueden verse afectados, lo que puede conducir a conclusiones erróneas.

=== Homocelasticidad

La varianza de los errores debe ser constante en todos los niveles de las variables predictorias. Caso contrario, se produce heterocelasticidad, lo que significa que la dispersión de los errores varía en diferentes rangos de las variables predictorias.

=== Independencia

Indica que los errores de la regresión no deben estar correlacionados entre sí. Los errores o residuos de un modelo de regresión deben distribuirse de manera aleatoria, con distribución aleatoria normal, media cero y varianza constante.

#separador()

Calcular $epsilon_i$ y $sigma^2$.

#grid(
  inset:5pt,
  stroke: black,
  columns: (auto, auto, auto),
  [Estud.], [Estatura], [Peso],
  [], [x], [y],
  [1], [154], [53],
  [2], [158], [45],
  [3], [162], [56],
  [4], [166], [73],
  [5], [170], [65],
  [6], [174], [88],
  [7], [178], [89],
  [8], [182], [75],
  [9], [190], [90],
)


$
  "Peso" ~ N (mu_i, sigma^2)\
  mu_i = beta_0 + beta_1 "estatura"_i\
  sigma^2 = "constante"\
  \
  hat("Peso")_i ~ N (hat(mu)_i, hat(sigma)^2)\
  hat(mu)_i = -138.0091 + 1.2227 "estatura"_i\
  hat(y)_i = -138.0091 + 1.2227 "estatura"_i
$ 

#grid(
  inset: 5pt,
  stroke: black,
  columns: (auto, auto, auto, auto, auto, auto),
  [Estud.], [Estatura], [Peso], [Regresión], [Residuales], [Varianza residual],
  [], [x], [y], [$hat(y)$], [$hat(e)_i = y_i - hat(y)_i$], [$(x_i - overline(x))^2$],
  [1], [154], [53], [50.29], [2.71], [7.34],
  [2], [158], [45], [55.18], [-10.18], [103.67],
  [3], [162], [56], [60.07], [-4.07], [15.56],
  [4], [166], [73], [64.96], [8.04], [64.64],
  [5], [170], [65], [69.85], [-4.85], [23.52],
  [6], [174], [88], [74.74], [13.26], [175.82],
  [7], [178], [89], [79.63], [9.37], [87.79],
  [8], [182], [75], [84.52], [-9.52], [90.63],
  [9], [186], [89], [89.42], [-0.42], [0.17],
  [10], [190], [90], [94.30], [-4.30], [18.49],
  [], [], [], [], [$overline(x) approx 0$], [$sum (x_i - overline(x))^2 = 588.62$],
)

$
  S^2 = (sum (x_i - overline(x))^2)/(n - 1)\
  hat(S)^2 = = 588.62/9 approx 65.40\
  hat(S) = sqrt(65.40) approx 0.087 qed
$

Como el error promedio da cero, es válido como regresión lineal.



== Aproximación polinomial.
== Regresión lineal múltiple. // <- Este es el examen.
== Dilema del sesgo y varianza.

En estadística y aprendizaje automático, el dilema entre sesgo y varianza describe la relación entre la complejidad de un modelo, la exactitud de supervisiones y su capacidad para realizar predicciones sobre datos no-observados previamente que no se utilizaron para entrenar al modelo. El sesgo y la varianza dependen de la complejidad del modelo

=== La complejidad del modelo

La complejidad del modelo se refiere al tipo y número de parámetros, entidades e interacciones que el modelo utiliza para aprender de los datos.

// 

Un modelo complejo puede capturar más matices y patrones en los datos, pero también puede ser más propenso al sobreajuste, lo que significa que aprende demasiado del ruido, que no generaliza nuevos datos.

Un modelo simple puede ser más robusto y eficiente, pero también puede ser más propenso a la inadaptación, por lo que pierde relaciones importantes.

Comprender como las diferentes fuentes de error generan sesgo y varianza ayudará a mejorar el proceso de ajuste de datos.

El error de precicción estadísitca o cualquier algoritmo de aprendizaje automático se pueden dividir en tres partes

- Error de sesgo.
- Error de varianza.
- Error inverosimil.

El error reducible no se puede reducir, independientemente de qué algoritmo se use. También se lo conoce como 'ruido' y por lo general proviene de factores como variables desconocidos que influyen en el mapeo de las variables de entrada a la variable de salida.

#image("1_k_D4-U7c3Tf8hJRpaOZoBQ.png")

El sesgo frente a la varianza se refiere a la presición frente a la consistencia de los modelos entrenados por un algoritmo.

- *Baja varianza - Alto sesgo*: Los algoritmos de baja varianza/alto sesgo tienden a ser menos complejos, con una estructura subyacente simple o rígida. Su fortaleza es la consistencia.
- *Bajo sesgo - Alta varianza*: Los algoritmos de bajo sesgo/alta varianza tienden a ser más complejos, con estructura subyacente flexible.

*Error total*. Comprender el sesgo y la varianza es fundamental para comprender el comportamiento de los modelos de predicción. El punto ideal para cualquier modelo es el nivel de complejidad en el que el aumento en el sesgo es equivalente a la reducción de la varianza.

#image("0_4wwUExhVW14sqS8V.png")

El punto de equilibrio es cuando la función de la varianza intersecta con la del sesgo.

Por lo tanto, el dilema sesgo-varianza es: La idea inicial es reducir tanto el sesgo como la varianza, porque los dos son los componentes del error de predicción sobre los datos nuevos, pero esto no va a ser posible porque el dilema es: Si se quiere reducir el riesgo va a ser a costa de aumentar la varianza, y si se quiere reducir la varianza va a ser a costa de subir el sesgos.

=== Sobreajuste (overfitting) y subajuste (underfitting)

Cuando se tiene un data-set o conjunto de datos, sirve para predecir o clasificar de acuerdo al problema, la idea es encontrar la presición con la implementación de un modelo con el conjunto de datos de entrenamiento y posteriormente con el conjunto de datos de pruebas. 

// Convencionalmente, lo que se hace es agarrar el 70% del data-set para entrenar al modelo y con el otro 30%, hacer la prueba

Si la predicción  es satifactoria, tendemos a aumentar la presición de la predicción con el conjunto de datos, ya sea aumentando o reduciendo la selección de las características o con la modificación de las condiciones del modelo de machine learning.

El pobre rendimiento del modelo puede ser porque es demasiado simple para describir el objetivo o por el contrario, que el modelo sea demasiado complejo para expresar el objetivo.

#image("6360ef2568a0381c60b26049_overfitting-and-underfitting-in-machine-learning-1.png")

En el primer diagrama (underfitting) se muestra que la línea no cubre todos los puntos que se muestran en el gráfico, este modelo tiende a causar un ajuste insuficiente de los datos, se denomina también 'alto sesgo'. 

En el segundo diagrama (overfitting), la línea cubre todos los puntos del gráfico; en tal condición, se puede pensar que es algo bueno, ya que cubre todos los puntos, pero eso no es cierto en realidad, porque la línea en el gráfico cubre también los puntos que son ruido y los valores atípicos. Este modelo es responsable de predecir resultados deficientes debido a su complejidad. A esto también se lo denomina 'alta varianza'.

// Pregunta de examen: si en un modelo con dos variables (x ,y), todas las variables x tienen el mismo valor, generar un gráfico que es una línea recta, en ese caso, el modelo tiene un subajuste. Tarea: graficar, inventar datos que den sobreajuste y subajuste.

#image("overfitting_2.png", width: 100%)

Un modelo con un ajuste apropiado cubre la mayoría de los puntos, es decir, mantiene el equilibrio entre el sesgo y la varianza.

=== Subajuste

Se refiere a un modelo que no puede modelar los datos de entrenamiento o generalizar nuevos datos. Esto es porque el modelo es muy simple. El ajuste insuficiente destruye la presición del modelo en máquinas de aprendizaje o machine-learning. Su aparición simplemente significa que el modelo o el algoritmo no se ajusta a los datos suficientemente bien. Suele suceder cuando se tienen pocos datos para predecir el modelo o también cuando se intenta construir un modelo no lineal con datos lineales.

=== Sobreajuste

Se refiere a un modelo que modela los datos de entrenamiento demasiado bien. Esto ocurre cuando un modelo aprende el detalle incluyendo el ruido en los datos de entrenamiento. Esto significa que el ruido o las fluctuaciones aleatorias en los datos de entrenamiento son recogidos y aprendidos por el modelo.

// Convencionalmente, un tamaño apropiado para no caer en el subajuste es de mínimo 30 datos.

// 10 puntos por poner el tema del proyecto, 5 puntos por el objetivo hasta la siguiente clase (martes).

// El objetivo generalmente empieza por un verbo. Ejemplo: Determinar el [variable y] en función de [variables x_1 x_2] para determinar el modelo de regresión lineal [bajo condiciones específicas, las limitaciones].  En el objetivo también se deben indicar los límites del modelo.

// 20 puntos por obtener la muestra de 30 datos. Desde el 18 hasta el 30 de septiembre. Tener pruebas de cómo se obtuvieron los datos.

// 65 puntos por los cálculos (la siguiente clase se avanzarán) sobre el modelo

=== Error cuadrático medio

$
  sum(y_i - hat(y)_i)^2 = sum epsilon_i^2
$

Se llama suma de errores al cuadrado, error cuadrático medio o media cuadrática.

$
  M S E = (S S E)/(n - p)
$

Donde $n - p$ son los grados de libertad.

$
  hat(sigma)^2 = M S E
$

$
  E(x) = sum x_i P_i = mu\
  sigma^2 = "Var"(x) = E((x - u)^2)\
  = "Var"(x) = E(x^2) - E^2 (x)\
$

$
  "MSE"(hat(theta)) = E(hat(theta) - theta)^2\
  "MSE"(hat(theta)) = E(hat(theta) - E(hat(theta)) + E(hat(theta)) - theta)^2\
  "MSE"(hat(theta)) = "Var"hat(theta) + "Sesgo"(hat(theta), theta)^2
$

Otra alternativa de representar el error cuadrátivo medio es:

$
  E(x^2) = "Var"(x) + E^2(x)\
$

Con un cambio de variable $x = hat(theta) - theta$,

$
  "MSE"(hat(theta)) = E(hat(theta) - theta)^2\
  "MSE"(hat(theta)) = "Var"(hat(theta) - theta) + "Sesgo"^2 (hat(theta) - theta)
$

El MSE mide la varianza y el sesgo.

=== Regresión lineal múltiple

Muchos problemas de regresión involucran más de una variable regresiva. Tales modelos se denominan regresión múltiple. En general, la variable dependiente o respuesta $y$ puede relacionarse con $k$ variables independientes. El modelo es $y = beta_0 + beta_1 x_1 + beta_2 x_2 + dots + beta_k x_k + epsilon$. Donde $beta_j = j = 0, 1, dots, k$ se denominan coeficientes de regresión.


Ecuación 1:

$
  y = beta_0 + beta_1 x_1 + beta_2 x_2 + dots + beta_k x_k + epsilon qed
$

Este modelo describe un hiperplano en el espacio k-dimensional de las variables regresoras $x_j$.

$beta_j$ representa el cambio esperado en la respuesta $y$. Y las variables restantes $x_i: i eq.not j$ se mantienen restantes.

Los parámetros $beta_j$ se denominan algunas veces coeficientes de regresión parciales, porque ellos describen el efecto parcial de una variable independiente cuando las otras variables independientes en el modelo se mantienen constantes. 

Los modelos más complejos en apariencia que la ecuación uno pueden ser analizados mediante técnicas de regresión lineal múltiple.

=== Ejemplos

Se tiene el modelo polinomial cubico en una variable independiente:

$
  y = beta_0 + beta_1 x + beta_2 x^2 + beta_3 x^3 + epsilon\
  "Si" x = x_1, x^2 = x_2, x^3 = x_3:\
  y = beta_0 + beta_1 x_1 + beta_2 x_2 + beta_3 x_3 + epsilon\
$

#separador()

Los modelos que incluyen efectos de interacción también pueden analizarse por medio de métodos de regresión lineal múltiple.

=== Estimación de parámetros.

El método de mínimos cuadrados puede utilizarse para estimar los coeficientes de regresión lineal múltiple.

Se supone que se disponen $n lt k$ observaciones y $k_(i j)$ denota las observaciones $i$ o el nivel de la variable $x_j$

*Regresión lineal*:

#grid(
  stroke: black,
  inset: 6pt,
  columns: (auto, auto, auto),
  [Datos], [$y$], [$x_i$],
  [1], [$y_1$], [$x_11$],
  [2], [$y_2$], [$x_21$],
  [...], [...], [...],
  [n], [$y_n$], [$x_(n 1)$],
)

*Regresión lineal múltiple*:

#grid(
  stroke: black,
  inset: 6pt,
  columns: (auto, auto, auto, auto, auto, auto),
  [Datos], [$y$], [$x_i$], [$x_2$], [...], [$x_k$],
  [1], [$y_1$], [$x_11$], [$x_12$], [...], [$x_(i k)$],
  [2], [$y_2$], [$x_21$], [$x_22$], [...], [$x_(2 k)$],
  [...], [...], [...], [...], [...], [...],
  [n], [$y_n$], [$x_(n 1)$], [$x_(n 2)$], [...], [$x_(n k)$],
)

#separador()

Se supone que el término de error en el modelo tiene $E(epsilon) = 0$ y la varianza del error $V(E) = sigma^2$.

El conjunto de variables del error son variables aleatorias no correlacionadas.

$
  y_i = beta_0 + beta_1 x_(i 1) + beta_k x_(i k) + epsilon_i\
  y_i = beta_0 + sum_(j = 1)^k beta_j x_(i j) + epsilon_i quad : 1 lt.eq i lt.eq n
$

La función de mínimos cuadrados es la sumatoria del error al cuadrado:

$
  L = sum epsilon_i^2\
  L = sum (y_i - beta_0 - sum_(j = 1)^k beta_j x_(i j))^2\
$

// Hay que derivar, igual que se hizo con la regresión lineal simple.

La función $L$ se minimiza con respecto a $beta_0, beta_1, dots, beta_k$

$
  (diff L)/(diff beta_0) | hat(beta)_0 hat(beta)_1, dots, hat(beta)_k = -2 sum(y_i - hat(beta)_0 - sum hat(beta)_j x_(i j)) = 0\
  (diff L)/(diff beta_j) | hat(beta)_0 hat(beta)_1, dots, hat(beta)_k = -2 sum(y_i - hat(beta)_0 - sum hat(beta)_j x_(i j)) x_(i j)= 0 quad : j = 1, 2, dots, k
$

$
  sum y_i - sum hat(beta)_0  - sum hat(beta)_1 x_(i 1) - sum hat(beta)_2 x_(i 2) - dots - sum hat(beta)_k x_(i k) = 0\
  \
  "Para" j = 1, hat(beta)_i\
  sum y_i x_(i 1) - sum hat(beta)_0 x_(i 1)  - sum hat(beta)_1 x_(i 1)^2 - sum hat(beta)_2 x_(i 2) - dots - sum hat(beta)_k x_(i 1) x_(i k) = 0\
  "Para" j = 2, hat(beta)_2\
  sum y_i x_(i 2) - sum hat(beta)_0 x_(i 2)  - sum hat(beta)_1 x_(i 2) - sum hat(beta)_2 x_(i 2)^2 - dots - sum hat(beta)_k x_(i 2) x_(i k) = 0\
  dots\
  "Para" j = k, hat(beta)_k\
  sum y_i x_(i k) - sum hat(beta)_0 x_(i k)  - sum hat(beta)_1 x_(i k) - sum hat(beta)_2 x_(i k) - dots - sum hat(beta)_k x_(i k)^2 = 0\
$

#separador()

$
  n_0 hat(beta)_0 + hat(beta)_1 sum x_(i 1) + hat(beta)_2 sum x_(1 2) + dots + hat(beta)_k sum y_(i k) = sum y_i\
  hat(beta)_0 sum x_(i 1) + hat(beta)_1 sum x^2_(i 1) + hat(beta)_2 sum x_(i 1) x_(1 2)+ dots + hat(beta)_k sum x_(i 1) x_(i k) = sum y_i x_(i 1)\
  dots\
  hat(beta)_0 sum x_(i k) + hat(beta)_1 sum x(i k) + hat(beta)_2 sum x_(i k) x_(1 2)+ dots + hat(beta)_k sum x_(i k)^2 = sum y_i x_(i k)\
$ 

$
  p = k + 1\
  hat(beta)_0, hat(beta)_1, dots, hat(beta)_k
$

La solución de las ecuaciones normales serán los estimadores de mínimos cuadrados de los coeficientes de regresión $hat(beta)_0, hat(beta)_1, dots, hat(beta)_k$

*Práctica 11, 12, 13, 14*: Encontrar $beta_0, beta_1, beta_2$ de manera genérica

// igual que se hizo en la anterior, solo que era con dos ecuaciones, ahora en con 3

Todas estas ecuaciones se pueden resolver de manera matricial.

$
  y_i = beta_0 + sum beta_j x_(i j) + epsilon_i quad :i = 1, dots n
$

$
  y = [#grid(
    inset: 4pt,
    columns: (auto),
    [$y_1$],
    [$y_2$],
    [$dots$],
    [$y_n$],
  )]
$

$
  x = [#grid(
    inset: 4pt,
    columns: (auto, auto, auto, auto),
    [$x_(1 1)$], [$x_(1 2)$], [$dots$], [$x_(1 k)$],
    [$x_(2 1)$], [$x_(2 2)$], [$dots$], [$x_(2 k)$],
    [$dots$], [$dots$], [$dots$], [$dots$],
    [$x_(n 1)$], [$x_(n 2)$], [$dots$], [$x_(n k)$],
  )]
$

$
  beta = [#grid(
    inset: 4pt,
    columns: (auto),
    [$beta_1$],
    [$beta_2$],
    [$dots$],
    [$beta_k$],
  )]
$

$
  epsilon = [#grid(
    inset: 4pt,
    columns: (auto),
    [$epsilon_1$],
    [$epsilon_2$],
    [$dots$],
    [$epsilon_n$],
  )]
$

$
  y = x dot beta + epsilon\
  [#grid(
    inset: 4pt,
    columns: (auto),
    [$y_1$],
    [$y_2$],
    [$dots$],
    [$y_n$],
  )] = 
  [#grid(
    inset: 4pt,
    columns: (auto, auto, auto, auto),
    [$x_(1 1)$], [$x_(1 2)$], [$dots$], [$x_(1 k)$],
    [$x_(2 1)$], [$x_(2 2)$], [$dots$], [$x_(2 k)$],
    [$dots$], [$dots$], [$dots$], [$dots$],
    [$x_(n 1)$], [$x_(n 2)$], [$dots$], [$x_(n k)$],
  )] 
  dot
  [#grid(
    inset: 4pt,
    columns: (auto),
    [$beta_1$],
    [$beta_2$],
    [$dots$],
    [$beta_k$],
  )]
  +
  [#grid(
    inset: 4pt,
    columns: (auto),
    [$epsilon_1$],
    [$epsilon_2$],
    [$dots$],
    [$epsilon_n$],
  )]
$

$
  L = sum_(i = 1)^n epsilon_i^2 = epsilon' epsilon = (y - x beta)' - (y - x beta)\
  = (y' - beta' x') (y - x beta)\
  = y' y - y' x beta - beta' x' y + beta' x' x beta
  L = y' y - 2 beta' y' y + beta' x' x beta\
  (diff L)/(diff beta) = -2x' y + 2x' x hat(beta) = 0\
  hat(beta) = (x' x)^(-1) x' y
$

#align(center)[#rect(inset: 6pt)[$hat(beta) = (x' x)^(-1) x' y qed$]]

=== Ejemplo

$
  x =
  [#grid(
    inset: 4pt,
    columns: (auto, auto, auto),
    [$1$], [$x_(1 1)$], [$x_(1 2)$],
    [$1$], [$x_(2 1)$], [$x_(2 2)$],
    [$1$], [$x_(3 1)$], [$x_(3 2)$],
  )]
$

$
  x' x = [#grid(
    inset: 4pt,
    columns: (auto, auto, auto),
    [$1$], [$1$], [$1$],
    [$x_(1 1)$], [$x_(2 1)$], [$x_(3 1)$],
    [$x_(1 2)$], [$x_(2 2)$], [$x_(3 2)$],
  )]
  dot
  [#grid(
    inset: 4pt,
    columns: (auto, auto, auto),
    [$1$], [$x_(1 1)$], [$x_(1 2)$],
    [$1$], [$x_(2 1)$], [$x_(2 2)$],
    [$1$], [$x_(3 1)$], [$x_(3 2)$],
  )]
  =
  [#grid(
    inset: 7pt,
    columns: (auto, auto, auto),
    [$3$], [$sum_(i = 1)^3 x_(i 1)$], [$sum_(i = 1)^3 x_(i 2)$],
    [$sum_(i = 1)^3 x_(i 1)$], [$sum_(i = 1)^3 x_(i 1)^2$], [$sum_(i = 1)^3 x_(i 2)$],
    [$sum_(i = 1)^3 x_(i 1)$], [$sum_(i = 1)^3 x_(i 2) x_(i 1)$], [$sum_(i = 1)^3 x_(i 2)^2$],
  )]
$

#separador()

De manera general:

$
  [#grid(
    inset: 7pt,
    columns: (auto, auto, auto, auto, auto),
    [$n$], [$sum_(i = 1)^n x_(i 1)$], [$sum_(i = 1)^3 x_(i 2)$], [$dots$], [$sum_(i = 1)^n x_(i k)$],
    [$sum_(i = 1)^n x_(i 1)$], [$sum_(i = 1)^n x_(i 1)^2$], [$sum_(i = 1)^n x_(i 1) x_(i 2)$], [$dots$], [$sum_(i = 1)^n x_(i 1) x_(i k)$],
    [$dots$], [$dots$], [$dots$], [$dots$], [$dots$],
    [$sum_(i = 1)^n x_(i k)$], [$sum_(i = 1)^n x_(i k) x_(i 1)$], [$sum_(i = 1)^n x_(i k) x_(i 2)$], [$dots$], [$sum_(i = 1)^n x_(i k)^2$],
  )]
  dot 
  [#grid(
    inset: 8pt,
    columns: (auto),
    [$hat(beta)_1$],
    [$hat(beta)_2$],
    [$dots$],
    [$hat(beta)_k$],
  )]
  =
  [#grid(
    inset: 8pt,
    columns: (auto),
    [$sum_(i = 1)^n y_i$],
    [$sum_(i = 1)^n x_(i 1) y_i$],
    [$dots$],
    [$sum_(i = 1)^n x_(i k) y_i$],
  )]
$

Para minimizar el error $epsilon$ se usan mínimos cuadrados.

$x' dot x$ es una matriz simétrica de $p dot p$ y $x' dot y$ es $p dot 1$. Entonces $hat(y) = x dot hat(beta)$

=== Ejemplo

Modelado de precios con regresión múltiple: Una tienda analiza las ventas $y$ en función de:

- Gasto en publicidad $(x_1)$.
- Peso del producto $(x_2)$.

#grid(
  columns: (auto, auto, auto, auto),
  inset: 7pt,
  fill: gradient.linear(rgb("#e183835f"), rgb("#eae4e4"), angle: 0deg).sharp(2, smoothness: 80%).repeat(4),
  stroke: black + 2pt,
  [Mes], [Ventas], [Peso $x_1$], [Precio $x_2$],
  [1], [500], [10], [20],
  [2], [550], [15], [18],
  [3], [600], [20], [17],
  [4], [700], [25], [16],
)

Ajustar un modelo de regresión múltiple lineal para aumentar las ventas.

=== Ejemplo

En la clases de DAT 246 se realizó un estudio a doce estudiantes para ver cómo influyen faltar a clases y las notas semifinales en el exámen final. Se ajustará el modelo de regresión múltiple.

#grid(
  columns: (auto, auto, auto, auto),
  inset: 7pt,
  fill: gradient.linear(rgb("#e183835f"), rgb("#eae4e4"), angle: 0deg).sharp(2, smoothness: 80%).repeat(4),
  stroke: black + 2pt,
  [Estudiante], [Examen final $y$], [Nota semifinal $x_1$], [Asistencia $x_2$],
  [1], [80], [65], [1],
  [2], [80], [67], [2],
  [3], [69], [65], [2],
  [4], [67], [58], [4],
  [5], [51], [55], [4],
  [6], [51], [45], [5],
  [7], [40], [47], [6],
  [8], [45], [39], [7],
  [9], [45], [44], [7],
  [10], [30], [29], [8],
  [11], [32], [29], [9],
  [12], [25], [21], [9],
)

$
  y_i = beta_0 + beta_1 x_(i 1) + beta_2 x_(i 2) + epsilon_i quad quad i = 1, dots, 12
$

$
  y = [#grid(
    inset: 4pt,
    columns: (auto),
    [$80$],
    [$80$],
    [$69$],
    [$67$],
    [$51$],
    [$51$],
    [$40$],
    [$45$],
    [$45$],
    [$30$],
    [$32$],
    [$25$],
  )]
  quad quad
  X = [#grid(
    inset: 4pt,
    columns: (auto, auto, auto),
    [$1$], [$65$], [$1$],
    [$1$], [$67$], [$2$],
    [$1$], [$65$], [$2$],
    [$1$], [$58$], [$4$],
    [$1$], [$55$], [$4$],
    [$1$], [$45$], [$5$],
    [$1$], [$47$], [$6$],
    [$1$], [$39$], [$7$],
    [$1$], [$44$], [$7$],
    [$1$], [$29$], [$8$],
    [$1$], [$29$], [$9$],
    [$1$], [$21$], [$9$],
  )]
$

$
  sum y_i = 615 quad quad sum x_(i 1) = 564 quad quad sum x_(i 2) = 64
$

$
  sum x_(i 1)^2 = 29142 quad quad sum x_(i 1) x_(i 2) = 2551 quad quad sum x_(i 2)^2 = 426
$

$
  sum x_(i 1) y_i = 31969 quad quad sum x_(i 2) y_i = 2728
$

$
  X' X = [#grid(
    inset: 4pt,
    columns: (auto, auto, auto),
    [$12$], [$564$], [$64$],
    [$564$], [$29142$], [$2551$],
    [$64$], [$2551$], [$426$],
  )]
$

$
  X' y = [#grid(
    inset: 4pt,
    columns: (auto),
    [$615$],
    [$31969$],
    [$2728$],
  )]
$

$
  hat(beta) = (X' X)^(-1) X' y = [#grid(
    inset: 4pt,
    columns: (auto),
    [$47.736$],
    [$0.505$],
    [$ -3.793$],
  )]
$

$
  hat(y_i) = 47.736 + 0.505 x_(i 1) - 3.793 x_(i 2)
$

#separador()

Calculando los estimadores $hat(y)_i$ para cada estudiante:

Usando el modelo ajustado:

$
hat(y)_i = 47.736 + 0.505 x_(i 1) - 3.793 x_(i 2)
$

Calculamos $hat(y)_i$ para cada estudiante:

- Estudiante 1: $x_1 = 65$, $x_2 = 1$
  $
  hat(y)_1 = 47.736 + 0.505 dot 65 - 3.793 dot 1 = 47.736 + 32.825 - 3.793 = 76.768
  $

- Estudiante 2: $x_1 = 67$, $x_2 = 2$
  $
  hat(y)_2 = 47.736 + 0.505 dot 67 - 3.793 dot 2 = 47.736 + 33.835 - 7.586 = 73.985
  $

- Estudiante 3: $x_1 = 65$, $x_2 = 2$
  $
  hat(y)_3 = 47.736 + 0.505 dot 65 - 3.793 dot 2 = 47.736 + 32.825 - 7.586 = 72.975
  $

- Estudiante 4: $x_1 = 58$, $x_2 = 4$
  $
  hat(y)_4 = 47.736 + 0.505 dot 58 - 3.793 dot 4 = 47.736 + 29.29 - 15.172 = 61.854
  $

- Estudiante 5: $x_1 = 55$, $x_2 = 4$
  $
  hat(y)_5 = 47.736 + 0.505 dot 55 - 3.793 dot 4 = 47.736 + 27.775 - 15.172 = 60.339
  $

- Estudiante 6: $x_1 = 45$, $x_2 = 5$
  $
  hat(y)_6 = 47.736 + 0.505 dot 45 - 3.793 dot 5 = 47.736 + 22.725 - 18.965 = 51.496
  $

- Estudiante 7: $x_1 = 47$, $x_2 = 6$
  $
  hat(y)_7 = 47.736 + 0.505 dot 47 - 3.793 dot 6 = 47.736 + 23.735 - 22.758 = 48.713
  $

- Estudiante 8: $x_1 = 39$, $x_2 = 7$
  $
  hat(y)_8 = 47.736 + 0.505 dot 39 - 3.793 dot 7 = 47.736 + 19.695 - 26.551 = 40.88
  $

- Estudiante 9: $x_1 = 44$, $x_2 = 7$
  $
  hat(y)_9 = 47.736 + 0.505 dot 44 - 3.793 dot 7 = 47.736 + 22.22 - 26.551 = 43.405
  $

- Estudiante 10: $x_1 = 29$, $x_2 = 8$
  $
  hat(y)_10 = 47.736 + 0.505 dot 29 - 3.793 dot 8 = 47.736 + 14.645 - 30.344 = 32.037
  $

- Estudiante 11: $x_1 = 29$, $x_2 = 9$
  $
  hat(y)_11 = 47.736 + 0.505 dot 29 - 3.793 dot 9 = 47.736 + 14.645 - 34.137 = 28.244
  $

- Estudiante 12: $x_1 = 21$, $x_2 = 9$
  $
  hat(y)_12 = 47.736 + 0.505 dot 21 - 3.793 dot 9 = 47.736 + 10.605 - 34.137 = 24.204
  $

#grid(
  columns: (auto, auto, auto, auto, auto, auto),
  inset: 7pt,
  fill: gradient.linear(rgb("#e183835f"), rgb("#eae4e4"), angle: 0deg).sharp(2, smoothness: 80%).repeat(4),
  stroke: black + 2pt,
  [Estudiante], [Examen final $y$], [Nota semifinal $x_1$], [Asistencia $x_2$], [$hat(y)_i$], [$epsilon_i = y - hat(y)_i$],
  [1], [80], [65], [1], [76.768], [3.22],
  [2], [80], [67], [2], [73.985], [6.00],
  [3], [69], [65], [2], [72.975], [-3.98],
  [4], [67], [58], [4], [61.854], [5.13],
  [5], [51], [55], [4], [60.339], [-9.34],
  [6], [51], [45], [5], [51.496], [-0.50],
  [7], [40], [47], [6], [48.713], [-8.72],
  [8], [45], [39], [7], [40.88], [4.4],
  [9], [45], [44], [7], [43.405], [1.58],
  [10], [30], [29], [8], [32.037], [-2.04],
  [11], [32], [29], [9], [28.244], [3.75],
  [12], [25], [21], [9], [24.204], [0.79],
)

== Propiedades estadísticas del estimador.

Las propiedades estadísticas del estimador de mínimos cuadrados $hat(beta)$ pueden demostrarse como:

$
  E(hat(beta)) = E((x' dot x)^(-1) x' dot y)\
  = E((x' dot x)^(-1) x' dot (x dot beta + epsilon))\
  = E((x' dot x)^(-1) x' dot x dot beta + (x' dot x)^(-1) x' dot epsilon)\
  = I beta\
  : E(epsilon) = 0, E(hat(beta)) = beta
$

// Practica anterior: Escoger metodo y hacer matriciales pero con valores internamente.

== Propiedades de la varianza

$
  "Cov"(x, y) = S_(x y) = (sum (x_i - overline(x))(y_i - overline(y)))/(n-1)\
  S_(x y) = (sum (x_i - overline(x)) (y_i - overline(y)))/(n - 1)\
  S_(x y) cases(=0 "; no existe relación entre las variables"\
   lt 0 ";existe una relación inversa entre las variables"\
  gt 0 "hay una relación directa entre las variables"
  )
$

La propiedad de varianza de $hat(beta)$ se expresa mediante la covarianza:

$
  "Cov"(hat(beta)) = E ((hat(beta) - E(hat(beta))) (hat(beta) - E(hat(beta)))')
$

$
  "Cov" (x_i, x_j) = 
  [#grid(
    inset: 8pt,
    columns: (auto, auto, auto, auto),
    [$"Var"(x_1)$], [$"Cov"(x_1, x_2)$], [$dots$], [$"Cov"(x_1, x_n)$],
    [$"Var"(x_2, x_1)$], [$"Var"(x_2)$], [$dots$], [$"Cov"(x_2, x_n)$],
    [$dots$], [$dots$], [$dots$], [$dots$],
    [$"Cov"(x_n, x_j)$], [$"Cov"(x_1, x_2)$], [$dots$], [$"Var"(x_n)$],
  )]
$

$
  "Cov"(x_i, x_j) "es simétrica" \
  "Var"(A X) = A "Var" (X) A^T\ 
  // resolver lo de arriba, debe salir lo de abajo
  "Cov"(hat(beta)) = sigma^2 (x' x)'
$

Es necesario estimar la varianza $sigma^2$ . Para desarrollar este estimador se considera la suma de los cuadrados de los residuos.

Suma de los errores al cuadrado:

$
  sum (y_i - overline(y))^2 = sum epsilon_i^2 = epsilon' epsilon = "SSE"
$

$
  hat(y) = x hat(beta)\
  epsilon = y - hat(y) = y - x hat(beta)\
  "SSE" = (y - x hat(beta))' (y - x hat(beta))\
  = y' y - y' x hat(beta) - hat(beta) ' x' y + hat(beta)' x' \
  = y' y - 2 hat(beta)' x' y + hat(beta)' x' x hat(beta)\
  = y' y - 2 hat(beta)' x' y + beta' x' y
$

El error cuadrático medio es:

$
  M S E = (S S_E)/(n - p) = sigma^2
$

#separador()

$
  y' y = sum y ^2
$

=== Ejemplo

$
y_i = beta_0 + beta_1 x_(i 1) + beta_2 x_(i 2) + epsilon_i, quad i = 1, dots, 12
$

$
y = [#grid(
  inset: 4pt,
  columns: (auto),
  [$80$],
  [$80$],
  [$69$],
  [$67$],
  [$51$],
  [$51$],
  [$40$],
  [$45$],
  [$45$],
  [$30$],
  [$32$],
  [$25$],
)]
quad quad
X = [#grid(
  inset: 4pt,
  columns: (auto, auto, auto),
  [$1$], [$65$], [$1$],
  [$1$], [$67$], [$2$],
  [$1$], [$65$], [$2$],
  [$1$], [$58$], [$4$],
  [$1$], [$55$], [$4$],
  [$1$], [$45$], [$5$],
  [$1$], [$47$], [$6$],
  [$1$], [$39$], [$7$],
  [$1$], [$44$], [$7$],
  [$1$], [$29$], [$8$],
  [$1$], [$29$], [$9$],
  [$1$], [$21$], [$9$],
)]
$

$
sum y_i = 615 quad quad sum x_(i 1) = 564 quad quad sum x_(i 2) = 64
$

$
sum x_(i 1)^2 = 29142 quad quad sum x_(i 1) x_(i 2) = 2551 quad quad sum x_(i 2)^2 = 426
$

$
sum x_(i 1) y_i = 31969 quad quad sum x_(i 2) y_i = 2728
$

$
X' X = [#grid(
  inset: 4pt,
  columns: (auto, auto, auto),
  [$12$], [$564$], [$64$],
  [$564$], [$29142$], [$2551$],
  [$64$], [$2551$], [$426$],
)]
$

$
X' y = [#grid(
  inset: 4pt,
  columns: (auto),
  [$615$],
  [$31969$],
  [$2728$],
)]
$

$
hat(beta) = (X' X)^(-1) X' y = [#grid(
  inset: 4pt,
  columns: (auto),
  [$47.736$],
  [$0.505$],
  [$-3.793$],
)]
$

$
  hat(y) = 47.736 + 0.05 x_1 - 3.793 x_2
$

// este es otro método para encontrar la regresión lineal múltiple, para la práctica/exámen, se puede usar cualquier método

*Práctica 15, 16, 17*: Sacar la inversa de:

$
[#grid(
  inset: 4pt,
  columns: (auto, auto, auto),
  [$12$], [$564$], [$64$],
  [$564$], [$29142$], [$2551$],
  [$64$], [$2551$], [$426$],
)]
$

// Hasta aquí es el primer parcial, esas son las ecuaciones

#separador()

Error estándar:

$
  S_(y, 1, 2, 3, dots, k) = sqrt(("SSE")/(n - (k + 1)))
$

=== Coeficiente de determinación múltiple.

Es el porcentaje de variación de la variable dependiente $y$ explicada por el conjunto de variables independientes $x_i$

$
  R^2 quad quad 0 lt.eq R^2 lt.eq 1
$

Sacar cero indica poca sucesión con el conjunto de varaibles independientes y la variable dependiente, y sacar uno indica una sucesión fuerte.

$
  R^2 = "SCR"/"STC" = (sum(hat(y) - overline(y))^2)/(sum e^2_i + sum (hat(y) - overline(y)))
$

- SCR: Suma de cuadrados de regresión.
- STC: Suma de los cuadrados.

=== Ejemplo:

#let data = (
  (y: 80, y_hat: 76.768),
  (y: 80, y_hat: 73.985),
  (y: 69, y_hat: 72.975),
  (y: 67, y_hat: 61.854),
  (y: 51, y_hat: 60.339),
  (y: 51, y_hat: 51.496),
  (y: 40, y_hat: 48.713),
  (y: 45, y_hat: 40.88),
  (y: 45, y_hat: 43.405),
  (y: 30, y_hat: 32.037),
  (y: 32, y_hat: 28.244),
  (y: 25, y_hat: 24.204),
)

#let n = data.len()
#let sum_y = data.map(d => d.y).sum()
#let y_bar = calc.round(sum_y / n, digits: 3)

// El valor de $overline(y)$ es: #y_bar

#let table_data = data.map(d => (
  d.y,
  d.y_hat,
  calc.round(d.y - d.y_hat, digits: 3),
  calc.round(calc.pow(d.y - d.y_hat, 2), digits: 3),
  calc.round(calc.pow(d.y_hat - y_bar, 2), digits: 3)
))

#grid(
  columns: (auto, auto, auto, auto, auto, auto),
  inset: 7pt,
  stroke: black,
  [Estudiante], [Examen final $y_i$], [$hat(y)_i$], [$epsilon_i = y - hat(y)_i$], [$e_i^2$], [$(hat(y) - overline(y))^2$],
  ..table_data.enumerate().map(((i, row)) => (
    [#(i + 1)], ..row.map(x => [#x])
  )).flatten()
)

#let scr = table_data.map(row => row.at(4)).sum()
#let stc = table_data.map(row => calc.pow(row.at(0) - y_bar, 2)).sum()
#let r_squared = calc.round(scr / stc, digits: 4)

El valor de $R^2$ es: #r_squared

#separador()

El número de variables independientes $x_i$ en una ecuación múltiple aumenta el coeficiente de determinación, hace que las predicciones sean más precisas.

$R^2$ aumenta solo debido al número total de variables independientes y no porque la variable independiente que se agrega sea un buen factor de predicción de la dependiente, por ejemplo, si se agrega una tercera variable $x$ y que este fuera la distancia a la universidad, $R^2$ va a aumentar y esto no quiere decir que la distancia a la universidad sea un buen factor para predecir la nota del examen final, simplemente $R^2$ aumentará porque se ha añadido otra variable independiente.

Para ajustar el valor de $R^2$, se emplea un coeficiente ajustado de determinación múltiple, que es modificado para ajustar el número de variables y el tamaño de la muestra.

$
  R^2 "ajustado" = 1 - (1 - R^2) (n - 1)/(n - k - 1)
$

#let n = 12
#let k = 2
#let r_squared_adjusted = calc.round(1 - (1 - r_squared) * (n - 1) / (n - k - 1), digits: 4)

$
  R^2 "ajustado" = 1 - (1 - #r_squared) (12 - 1)/(12 - 2 - 1) = #r_squared_adjusted
$

Tiene una exactitud de predicción del #calc.round(r_squared_adjusted * 100, digits: 2) %

#separador()

Normalidad:

$
  epsilon_i ~ (0, sigma^2)
$

Linealidad:

$
  E(epsilon_i) = 0
$

= Máxima Verosimilitud

== Estimación de parámetros

La inferencia estadística es la utilización de los datos obtenidos para obtener conclusiones acerca de la población sobre la que se seleccionó la muestra.

Las tecnicas de la inferencia estadistica pueden dividirse en dos:
- Estimación de parámetros
- La prueba de hipótesis

Sean las siguientes distribuciones de probabilidad:
- Binomial: $P_x (x) = P(X = x) = binom(n, x) p^x (1 - p)^(n - x)$. Parámetro: $p$.

- Normal: $P(x) = 1/(sigma sqrt(2 pi)) e^(-1/2 ((x - mu)/(sigma))^2)$

// Se llaman parámetros o características de la población.

La estimación estadística es el proceso mediante el cual se aproxima el valor del parámetro de la población a partir de la información de una muestra.

La estimación de un parámetro puede adoptar la forma de un solo punto, es decir, la estimación de un solo valor del parámetro de interés; o de un intérvalo, es decir, la estimación de un rango de valores dentro del cual se espera el valor del parámetro.

=== Estimación por puntos o puntual

Es una selección única para el valor de un parámetro desconocido.

Si $x$ es una variable aleatoria con distribución de probabilidad $f(x)$ caracterizada el parámetro desconocido $theta$, y si $x_1, x_2, dots, x_n$ es una muestra aleatoria de tamaño $n$ de $x$, entonces la estadística $hat(theta) = h(x_1, x_2, dots, x_n)$ correspondientes a $theta$.

La estimación $hat(theta)$ es una variable aleatoria porque está en función de los datos. Donde $hat(theta)$ toma un valor numérico particular llamado estimación por puntos o puntual de $theta$.

=== Ejemplo

Suponemos que la variable aleatoria $x$ está normalmente distribuida con media $mu$ desconocida y varianza $sigma$ conocida. La media de la muestra $overline(x)$ es un estimador puntual de la media desconocida $mu$.

$x_1 = 4.5$
$x_2 = 3$
$x_3 = 2.5$
$x_4 = 1.2$

Entonces, la estimación puntual de $mu$ es $#calc.round((4.5+3+2.5+1.2) / 4, digits: 3)$.

El estimador puntual de la varianza $sigma^2 = s^2$ es $s^2 = 1.85$.

=== Propiedades de los estimadores

Una propiedad deseable de un estimador es que debe estar cerca en cierto sentido al valor verdadero del parámetro desconocido. Formalmente se dice que $hat(theta)$ es un estimador neutral del parámetro $theta$ si la esperanza de $hat(theta) = theta$. Esto es $hat(theta)$ es un estimador neutral de $theta$ si en promedio sus valores son iguales a $theta$, esto equivale a requerir que la media de la distribución de la muestra de $hat(theta)$ sea igual a $theta$.

=== Ejemplo

Suponemos que la variable aleatoria $x$ está normalmente distribuida con media $mu$ desconocida y varianza $sigma^2$ y sea $x_1, x_2, dots, x_n$ una muestra de tamaño $n_x$, demostrar que la media de muestra es $overline(x)$ y la varianza de la muestra es $s^2$ y que son estimadores neutrales de $mu$ y $sigma^2$.

La verosimilitud se puede ver como dada una muestra obtener la función de densidad o los valores de los parámetros de la función de denisdad que son más verosímiles según esa muestra; es decir, que maximice la función de verosimilitud.

Por tanto, podemos representar una función de verosimilitud cono la función que relaciona el parámetro $mu$ poblacional que puede ser la media poblacional con la verosimilitud asociada de una muestra.

== Estimación de máxima verosimilitud.

=== Método de máxima verosimilitud

El principio de máxima verosimilitud, en su aplicación a la obtención de estimadores puntuales consiste en seleccionar aquel estimador que maximice la probabilidad de obtener la muestra realmente observada.


*Definición* Sea $x$ una variable aleatoria cuya función de probabilidad sea $f(x; theta)$ depende del parámetro $theta$. 

Sea $X_1, X_2, dots, X_n$ una muestra aleatoria de $x$ y sean $x_1, x_2, dots, x_n$ los valores observados de la muestra (independientes). La función de verosimilitud de la muestra se define como $f(x_1, x_2, dots, x_n; theta) = f(x_1; theta) f(x_2; theta) dots f(x_n; theta)$

El método de máxima verosimilitud consiste en tomar como valor estimado $theta$ el valor que hace máxima de la función $v(theta)$.

$v(theta) = f(x_1, x_2, dots, x_n; theta) = f(x_1; theta) f(x_2; theta) dot f(x_n; theta)$

$ln v(theta) = sum ln f(x_i; theta)$

$(diff sum ln f(x_i; theta))/(diff theta) = 0$

==== Ejemplo

Obtener el estimador de máxima verosimilitud de la probabilidad de éxito para una variable aleatoria $x$ de Bernoulli.

*Respuesta*: Como $x$ es una variable aleatoria de Bernoulli, entonces la función de distribución de $x$ está dada por $P(x, p) = p^x (1 - p)^(1 - x)$ con $x = 0, 1; 0 lt p lt 1$.

Sea $x_1, x_2, dots, x_n$ una muestra aleatoria de $x$ cuyos valores son $x_1, x_2, dots, x_n$ (es una secuencia de ceros y unos) entonces la probabilidad o la función de probabilidad representada para cada uno es:

$
  P(x_i, p) = p^(x_i) (1 - p)^(1 - x_i) quad; i = 1, n
$

En la función de verosimilitud:
$
  v(p) = P(x_1, x_2, dots, x_n; p) = P(x_1, x_2, dots, x_n; p) = P(x_1; p) P(x_2; p) dot P(x_n; p)\

  v(p) = P^(x_1) (1 - p)^(1 - x_1) P^(x_2) (1 - p)^(1 - x_2 ) dots P^(x_n) (1 - p)^(1 - x_n)\

  v(p) = product_(i = i)^n = product_(i = i)^n p^(x_i) (1 - p)^(1 - x_i)\

  v(p) = p^(sum x_i) (1 - p)^(sum (1 - x_i))\

  ln(v(p)) = ln p^(sum x_i) + ln((1 - p)^(n - sum (x_i)))\
$

Derivando $ln(v(p))$ respecto a $p$:

$
  d/(d p) ln(v(p)) = (sum x_i)/p - (n - sum x_i)/(1 - p) = 0 \

  (sum x_i)/(p) = (n - sum x_i)/(1 - p)\ 

  (sum x_i) (1 - p) = (n - sum x_i) p\ 

  sum x_i - p sum x_i = n p - p sum x_i\ 

  sum x_i = n p\ 

  p = (sum x_i)/n = overline(x)
$

Por lo tanto, el estimador de máxima verosimilitud de $p$ es:

$
  hat(p) = (sum x_i)/n = overline(x)
$

$
  E(hat(p)) = E((sum x_i)/n)\

  = 1/n sum E(x_i)\

  E(x_i) = 0 dot (P(x_i = 0)) + 1 dot (P(x_i = 1))\

  = 0 dot (1 - p) + 1 dot p\
  
  = 0 + p = p\

  E(hat(p)) = 1/n sum p = 1/n dot n dot p = p\

  E(hat(p)) = p
$

==== Ejemplo

Se considera una muestra aleatoria de doce naranjas con pesos $x_1, x_2, dots, x_12$, donde $sum_(i=1)^12 x_i = 180$ y $sum_(i=1)^12 x_i^2 = 2799$. Se asume que los pesos siguen una distribución normal con parámetros $mu$ y $sigma^2$. La densidad de probabilidad es:

$
  f(x; mu, sigma^2) = 1/(sigma sqrt(2 pi)) e^(-(x - mu)^2/(2 sigma^2))
$

La función de verosimilitud para la muestra es:

$
  v(mu, sigma^2) = product_(i=1)^12 1/(sigma sqrt(2 pi)) e^(-(x_i - mu)^2/(2 sigma^2))
$

$
  v(mu, sigma^2) = (1/(sigma sqrt(2 pi)))^12 e^(-sum_(i=1)^12 (x_i - mu)^2/(2 sigma^2))
$

El logaritmo de la verosimilitud es:

$
  ln(v(mu, sigma^2)) = -12 ln(sigma) - 12/2 ln(2 pi) - 1/(2 sigma^2) sum_(i=1)^12 (x_i - mu)^2
$

Derivando con respecto a $mu$:

$
  d/(d mu) ln(v(mu, sigma^2)) = 1/sigma^2 sum_(i=1)^12 (x_i - mu) = 0
$

$
  sum_(i=1)^12 x_i - 12 mu = 0
$

$
  mu = (sum_(i=1)^12 x_i)/12
$

Derivando con respecto a $sigma^2$:

$
  d/(d sigma^2) ln(v(mu, sigma^2)) = -12/(2 sigma^2) + 1/(2 (sigma^2)^2) sum_(i=1)^12 (x_i - mu)^2 = 0
$

$
  -12 sigma^2 + sum_(i=1)^12 (x_i - mu)^2 = 0
$

// hat(sigma^2) = (n - 1)/n s^2, por qué?

$
  sigma^2 = (sum_(i=1)^12 (x_i - mu)^2)/12
$

#let sumXi = 180
#let sumXiSquared = 2799
#let n = 12
#let muHat = calc.round(sumXi / n, digits: 3)

Sustituyendo $sum_(i=1)^12 x_i = 180$ y $n = 12$:

$
  hat(mu) = sumXi/n = #muHat
$

Para $sigma^2$, se calcula $sum_(i=1)^12 (x_i - mu)^2$:

$
  sum_(i=1)^12 (x_i - mu)^2 = sum_(i=1)^12 x_i^2 - 2 mu sum_(i=1)^12 x_i + 12 mu^2
$

#let term1 = sumXiSquared
#let term2 = calc.round(2 * muHat * sumXi, digits: 3)
#let term3 = calc.round(n * muHat * muHat, digits: 3)
#let sumDiffSquared = calc.round(term1 - term2 + term3, digits: 3)

$
  sum_(i=1)^12 (x_i - mu)^2 = #term1 - #term2 + #term3 = #sumDiffSquared
$

#let sigmaHatSquared = calc.round(sumDiffSquared / n, digits: 3)

$
  hat(sigma^2) = #sumDiffSquared/n = #sigmaHatSquared
$

$
  x tilde (muHat, sigmaHatSquared)
$

= Estadística bayesiana.

== Repaso del teorema de Bayes.

$
  overline(A) = v - A\

  |overline(A_i)| = |A| - |A_i|\
  |A| = |A_1 union A_2| + overline(|A_1 union A_2|)\
  overline(|A_1 inter A_2|) = |A| - |A_1| - |A_2| + ||A_1 inter A_2
$

=== Evento

Un evento o suceso es un subconjunto de un espacio muestral. Por ejemplo $A_1$ está asociado al espacio muestral del experimento. El espacio muestral se considera el conjunto universal.

=== Definición de probabilidad

Se define como una función de conjuntos y los elementos del rango son número reales.

Si el evento $A$ es un elemento en el dominio de esta función, entonces la notación funcional es $P(A)$

Si un experimento $E$ tiene un espacio muestral $omega$ y un evento $A$ que está definido en $omega$, entonces $P(A)in RR$ que se denomina la probabilidad del evento $A$

=== Probabilidad condicional

Sea un evento $b$ con $P(b) gt 0$, la probabilidad condicional de que ocurra el evento $a$ se define como:

$
  P(a | b) = P(a inter b)/P(b)
$

=== Regla de la multiplicación

De la división de probabilidad condicional, se obtiene una fórmula para encontrar la probabilidad de la intersección o producto de los eventos $a$ y $b$

$
  P(a|b) = P(a inter b)/P(b); P(b) gt 0\
  P(b|a) = P(b inter a)/P(a); P(a) gt 0\
$

$
  p(a inter b) = p(b) p(a|b) = p(a b)\
  p(b inter a) = p(a) p(b|a) = p(a b)\
$

#separador()

$
  P(a | b) = (P(a inter b))/P(b) = (p(a))/(sum p(a_i) P(b | a_i))\
  P(a | b) = (P(a inter b))/(P(b))\
  P(a | b) = (P(a inter b))/(P(a))\
$

=== Ejemplo

La universidad está considerando construir un edificio a la carrera de informática entre la ciudad de La Paz y la ciudad de El Alto. Un elemento vital en esta consideración es un proyecto que una las dos ciudades con el edificio. Si el gobierno aprueba el teleférico, hay una probabilidad de $0.90$ de que la universidad construya el edificio, en tanto si el teleférico no es aprobado, la probabilidad sólo es de $0.20$. Basándose en la información disponible, el rector de la universidad estima que hay una probabilidad de $0.60$ de que el teleférico sea aprobado.
A) ¿Cuál es la probabilidad de que la univesidad construya el edificio de informática?
B) Dado que el edificio fue construido, ¿cuál es la probabilidad de que el teleférico haya sido aprobado?

#let probTelefericoAprobado = 0.60
#let probEdificioDadoTeleferico = 0.90
#let probEdificioDadoNoTeleferico = 0.20

// Inciso A: Probabilidad de que la universidad construya el edificio
Para calcular la probabilidad de que la universidad construya el edificio de informática, usamos la ley de probabilidad total. Sea $E$ el evento de que se construya el edificio y $T$ el evento de que el teleférico sea aprobado. Entonces:

$ P(E) = P(E|T)P(T) + P(E|T')P(T') $

Sustituyendo los valores:

$ P(E) = (#probEdificioDadoTeleferico) (#probTelefericoAprobado) + (#probEdificioDadoNoTeleferico) (1 - #probTelefericoAprobado) $

$ P(E) = (#calc.round(probEdificioDadoTeleferico * probTelefericoAprobado, digits: 4)) + (#calc.round(probEdificioDadoNoTeleferico * (1 - probTelefericoAprobado), digits: 4)) $

$ P(E) = #calc.round(probEdificioDadoTeleferico * probTelefericoAprobado + probEdificioDadoNoTeleferico * (1 - probTelefericoAprobado), digits: 4) $

Por lo tanto, la probabilidad de que se construya el edificio es $#calc.round(probEdificioDadoTeleferico * probTelefericoAprobado + probEdificioDadoNoTeleferico * (1 - probTelefericoAprobado), digits: 4)$.

#let probEdificio = calc.round(probEdificioDadoTeleferico * probTelefericoAprobado + probEdificioDadoNoTeleferico * (1 - probTelefericoAprobado), digits: 4)

// Inciso B: Probabilidad de que el teleférico sea aprobado dado que el edificio fue construido
Para calcular la probabilidad de que el teleférico haya sido aprobado dado que el edificio fue construido, usamos el teorema de Bayes. Sea $E$ el evento de que se construya el edificio y $T$ el evento de que el teleférico sea aprobado. Entonces:

$ P(T|E) = (P(E|T)P(T)) / P(E) $

Sustituyendo los valores:

$ P(T|E) = ((#probEdificioDadoTeleferico)(#probTelefericoAprobado)) / (#probEdificio) $

$ P(T|E) = #calc.round((probEdificioDadoTeleferico * probTelefericoAprobado) / probEdificio, digits: 4) $

Por lo tanto, la probabilidad de que el teleférico haya sido aprobado dado que el edificio fue construido es $#calc.round((probEdificioDadoTeleferico * probTelefericoAprobado) / probEdificio, digits: 4)$.

=== Ejemplo

El 0.2% de una población está infectado por gripe o influenza y la prueba para detectar la prescencia de la enfermedad da positivo en una persona enferma en 98% de las veces, en una persona sana, el 3% de las veces.

Si una persona dió positivo en la prueba, ¿Cúal es la probabilidad de que tenga gripe?

*Respuesta*:

#let probGripe = 0.002
#let probNoGripe = calc.round(1 - probGripe, digits: 4)
#let probPosDadoGripe = 0.98
#let probPosDadoNoGripe = 0.03

Sea $G$ el evento de que una persona tenga gripe y $P$ el evento de que la prueba dé positivo. Entonces $overline(G)$ es no tener gripe y $N = overline(P)$ es negativo.

Por dato del problema:

$ P(G) = #probGripe $
$ P(overline(G)) = #probNoGripe $
$ P(P | G) = #probPosDadoGripe $
$ P(P | overline(G)) = #probPosDadoNoGripe $

La probabilidad conjunta de positivo y gripe es:

$ P(P inter G) = P(P | G) P(G) = #probPosDadoGripe * #probGripe = #calc.round(probPosDadoGripe * probGripe, digits: 4) $

La probabilidad conjunta de positivo y no gripe es:

$ P(P inter overline(G)) = P(P | overline(G)) P(overline(G)) = #probPosDadoNoGripe * #probNoGripe = #calc.round(probPosDadoNoGripe * probNoGripe, digits: 4) $

La probabilidad total de positivo es:

$ P(P) = P(P inter G) + P(P inter overline(G)) = #calc.round(probPosDadoGripe * probGripe, digits: 4) + #calc.round(probPosDadoNoGripe * probNoGripe, digits: 4) = #calc.round(calc.round(probPosDadoGripe * probGripe, digits: 4) + calc.round(probPosDadoNoGripe * probNoGripe, digits: 4), digits: 4) $

Por el teorema de Bayes, la probabilidad de tener gripe dado positivo es:

$ P(G | P) = (P(P inter G)) / (P(P)) = (#calc.round(probPosDadoGripe * probGripe, digits: 4)) / (#calc.round(calc.round(probPosDadoGripe * probGripe, digits: 4) + calc.round(probPosDadoNoGripe * probNoGripe, digits: 4), digits: 4)) = #calc.round(calc.round(probPosDadoGripe * probGripe, digits: 4) / calc.round(calc.round(probPosDadoGripe * probGripe, digits: 4) + calc.round(probPosDadoNoGripe * probNoGripe, digits: 4), digits: 4), digits: 4) $

#separador()

El teorema de Bayes está hecho para aplicarse varias veces, porque la probabilidad de que tenga gripe era 0.2%, después de aplicar la prueba, subió la probabilidad de tener gripe a 6%


*Práctica 18 y 19*: Demostrar si esto es verdadero o falso:

$
  // P(a | b) = P(b | a)¿?\
  P(a inter b) = P(b) P(a | b)\
  P(a inter b) = P(a) P(b | b)\
  p(a | b) = (p(a) p(b | a))/p(b)\
  p(a | b) = p(a | a)
$


=== Ejemplo

Una fábrica de ensamblaje tiene dos máquinas que elaboran el $30 percent$ y $70 percent$ de ensamblaje de celulares. El porcentaje de celulares defectuosos que elaboran cada máquina es del $2 percent$ y $4 percent$ respectivamente. Si se selecciona al azar un celular, del ensamblaje y este fue defectuoso. ¿Cúal es la probabilidad de que haya sido ensamblado por la máquina uno?

Sea $M_1$ el evento de que el celular sea ensamblado por la máquina 1 y $M_2$ por la máquina 2. Sea $D$ el evento de que el celular sea defectuoso.

$
P(M_1) = 0.3 quad ; quad P(M_2) = 0.7
$

$
P(D | M_1) = 0.02 quad ; quad P(D | M_2) = 0.04
$

Se busca $P(M_1 | D)$.

Por el teorema de Bayes,

$
P(M_1 | D) = (P(D inter M_1)) / P(D)
$

donde $P(D inter M_1) = P(M_1) P(D | M_1)$ y

$
P(D) = P(M_1) P(D | M_1) + P(M_2) P(D | M_2)
$

#let probM1 = 0.3
#let probM2 = 0.7
#let probDM1 = 0.02
#let probDM2 = 0.04

#let interDM1 = calc.round(probM1 * probDM1, digits: 4)
#let interDM2 = calc.round(probM2 * probDM2, digits: 4)
#let probD = calc.round(interDM1 + interDM2, digits: 4)

$
P(D inter M_1) = P(M_1) P(D | M_1) = #probM1 * #probDM1 = #interDM1
$

$
P(D inter M_2) = P(M_2) P(D | M_2) = #probM2 * #probDM2 = #interDM2
$

$
P(D) = #interDM1 + #interDM2 = #probD
$

$
P(M_1 | D) = (#interDM1) / #probD = #calc.round(interDM1 / probD, digits: 4)
$

=== Datos experimentales en decisiones con riesgo

Al desarrollar el criterio de decisiones con riego, se supone que las distrbuciones de probabilidad se conocen o pueden asegurarse, en este aspecto, estas probabilidades se denominan probabilidades a priori.

Algunas veces es posible realizar un experimento acerca del sistema de estudio y dependiendo de los resultados de dicho experimento, modificar las prioridades a priori en el sentido de que se puede incluir información importante al calcular nuevas probabilidades. Estas probabilidades se conocen como *probabilidades a posteriori*.

=== Ejemplo

Suponga que un fabricante elabora un producto en lotes de tamaño fijos. Debido a descomposturas ocacionales en el procedimiento de producción, pueden producirse lotes con un número inaceptable de artículos defectuosos.

La experiencia indica que la probabilidad de producir lotes malos es $0.05$, la probabilidad de producir un lote bueno es de $0.95$

El fabricante sabe que al enviar un lote malo, puede ser penalizado, sin embargo, con base a probabilidades a priori, puede decidir que la probabilidad de elaborar un lote malo es demasiado pequeña, y en consecuencia puede elegir enviar aleatoriamente cualquiera de los lotes disponibles (criterio del futuro más probable).

La desición anterior se hace sin sacar muestras al lote al transportar. Por ejemplo, si el fabricante toma su decisión después de probar una muestra de lote, la información adicional podría afectar a la decision final.

Suponga que decide probar una muestra de los artículos del lote.

Se representa por $z_1$, $z_2$ y $z_3$ los casos de los artículos. 

Debido a que la muestra que se saque de un lote bueno o malo, las probabilidades condicionales $p(z_j | theta_i)$

El último objetivo es utilizar estas probabilidades junto con las probabilidades a priori para calcular las probabilidades a posteriori, las cuales están definidas por: $p(theta_i | z_j)$. Esto es la probabilidad de seleccionar un lote bueno o malo. Estas probabilidades serán la base para tomar una decisión que dependa del resultado de la muestra.

== Descripción a priori y a posteriori.
== Inferencia bayesiana.
== Clasificador bayesiano ingenuo. // pregunta del segundo parcial.
== Estimación MAP (estimador máximo a posteriori).
== Teoría de decisión bayesiana.
== Regresión lineal bayesiana. // Si alcanza el tiempo
= Métodos basados en árboles.
== Árboles de regresión. // pregunta de examen.
== Árboles de clasificación. // Si alcanza el tiempo

= Bibliografía.
- Germán A., Carolin J., Donald. Bayesian Data Analysis.
- Murphy - Machine Learning: A Probabilistic Perspective.
Mas cualquier libro de estadística.

// *Lema:*
// #align(center)[Piensa como un bayesiano, preocúpare como un frecuentista.]
// - Beadley Efron.

// \

// #quote(attribution: [Beadley Efron])[
//   Piensa como un bayesiano, preocúpate como un frecuentista.
// ]

// #separador()

// #grid(
//   inset: 5pt,
//   stroke: black,
//   columns: (auto, auto),
//   [Primer parcial.], [30 puntos.],
//   [Segundo parcial.], [25 puntos.],
//   [Examen Final.], [30 puntos.],
//   [Prácticas y participación en clases.], [15 puntos.],
//   [Asistencia.], [5 puntos extra.],
// )

// // Formación de grupos hasta la siguiente semana, prerparación del tema hasta la subsiguiente.

// Para las prácticas en clase se hará una tarjeta de 12 cm #sym.times 10 cm con:

// #align(center)[#block[
//   // DAT 246 II/2025
// // Paterno, Materno, Nombres.
// #grid(
//   inset: 5pt,
//   stroke: black,
//   columns: (auto, auto, 20pt, 50pt, 50pt),
//   grid.cell(
//     colspan: 5,
//     [Dat 246 II/2025]
//   ),
//   grid.cell(
//     colspan: 5,
//     [Paterno, materno, nombres.]
//   ),
//   [Fecha.], [Firma.], [ ], [ ], [ ],
//   [ ], [ ], [ ], [ ], [ ],
//   [ ], [ ], [ ], [ ], [ ],
//   [ ], [ ], [ ], [ ], [ ],
//   [ ], [ ], [ ], [ ], [ ],
//   [ ], [ ], [ ], [ ], [ ],
//   )
// ]]

// Práctica 1: Plan de trabajo.

// Práctica 2: Frase de motivación.

// Práctica 3: Carátula donde cada uno se compromete a aprobar la materia.

