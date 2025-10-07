#set page(
  margin: (x: 2.5cm, y: 2.5cm) //Para trabajos digitales e impresos simples
  // margin: (left: 3.8cm, y: 2.5cm, right: 2.5cm) //Para trabajos impresos a doble cara
)
#set text(lang:"es")
#set text(font: "DejaVu Sans")
#show math.equation: set text(font: "DejaVu Math TeX Gyre")
#set par(justify: true)
#show math.equation:box
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
#let matriz(a, b, c, d, e, f, g, h, i) = {
  $(#grid(
    columns: (auto, auto, auto),
    inset: 3pt,
    [$#a$], [$#b$], [$#c$],
    [$#d$], [$#e$], [$#f$],
    [$#g$], [$#h$], [$#i$]
  ))$
}
#let det2x2(a, b, c, d) = {
  $lr(|#grid(
    columns: (auto, auto),
    inset: 3pt,
    [$#a$], [$#b$],
    [$#c$], [$#d$],
  )|)$
}
#let ejem(..args) = {
  let elements = args.pos()
  let first = elements.map(term => $#term _1$).join(" + ")
  let last = elements.map(term => $#term _n$).join(" + ")
  $ (#first, dots, #last) $
}


DAT 244 - Investigación Operativa.

= Bibliografía.
Hamdy Taha - investigación de operaciones\

winston

= Ponderación.
- Primer parcial: 36 puntos.
- Segundo parcial: 36 puntos.
- Examen final: 28 puntos.
- 10 puntos extras por prácticas y preguntas.
La mejor nota se repite.

#pagebreak()
#set heading(numbering: "1.")

Memorizar las equivalencias de medidas, todas las posibles pero enfocadas en: bytes, kilos, metros.

La investigación operativa consisten en optimizar cosas.

Para hablar de investigación operativa, se necesita primero un problema sobre el cual se creará un proyecto. El proyecto debe ser factible y viable.

Factible.- disponibilidad de recursos.
Viable.- aceptación social, que puede seguir adelante con luz verde.

Si el proyecto es factible y viable, entonces es ejecutable, y si es así, entonces se arma un modelo de investigación operativa. Un modelo es la representación abstracta de un problema real.

Una vez planteado el modelo, tiene que ser resuelto y ser evaluado, validado y contrastado. Después se puede llegar a la implementación.

Problema -> Proyecto -> Ejecutable -> Modelo de investigación operativa -> Resuelto -> Evaluación -> Implementación.

Lo más difícil es plantear el modelo a partir del problema

// examen: 4 preguntas 25% cada una

Si el problema es maximizar y las ecuaciones tienen menor o igual (en todas?), es el modelo más fácil. Es el modelo canónico que se resuelve con el modelo de simples básico. Ejemplo:
1. 
Max Z = $50x_1+18x_2+70x_3$\
$2x_1+5x_2+3x_3 lt.eq 200$\
$7x_1+4x_2-5x_3 lt.eq 70$\
$4x_1+6x_2+8x_3 lt.eq 70$\

Se resuelve con el modelo simplex básico.

Si tan solo una ecuación no es menor o igual (por ejemplo, si una es una igualdad o un mayor o igual) el ejercicio es mucho más difícil. En ese caso se tendría que aplicar el modelo de simplex avanzado. La dificultad avanzada se debe a que no hay una matriz identidad si una ecuación tiene mayor o igual o igual.

Si las ecuaciones son:
$2x_1+5x_2+3x_3 lt.eq 200$\
$7x_1+4x_2-5x_3 lt.eq 70$\
$4x_1+6x_2+8x_3 lt.eq 70$\

Entonces se tiene la matriz de 
$1 0 0$\
$0 1 0$\
$0 0 1$

Pero si las ecuaciones son:
$2x_1+5x_2+3x_3 lt.eq 200$\
$7x_1+4x_2-5x_3 eq 70$\
$4x_1+6x_2+8x_3 lt.eq 70$\

Entonces se tiene la matriz de 
$1 0$\
$0 0$\
$0 1$

La cual no basta para obenter una matriz identidad.

Esto quiere decir que las ecuaciones que tienen menor o igual, dan un vector canónico

En simplex avanzado hay dos técnicas, la técnica de dos fases y la técnica en M. Las dos técnicas sirven para dar la solución, pero es más difícil ya que no se tiene una matriz identidad completa

Un ejercicio en el que se debe encontrar el modelo a partir solo del enunciado, se le llama ejercicios completo.

// = Modelo Simplex

= Investigación operativa.
== Definición
La investigación operativa es una ciencia exacta que tiene como objetivo resolver problemas con modelos que minimicen gastos y maximicen beneficios

Un sistema es una estructura que tiene parámetros de entrada y de salida que están interrelacionados.

Utilidad, ganancia neta y beneficios son sinónimos. La fórmula de la utilidad es $"precio" - "costos"$.

Antes de desarrollar todo un marco teórico, de la programación lineal, es que se dará algunos conceptos importantes del álgebra lineal convexa.

Se avanzará algebra lineal densa, espacios vectoriales densos. En un conjunto de espacios vectoriales no-densos, puede haber una solución que no se puede encontrar.

== Tópicos del álgebra lineal convexa.
El álgebra lineal convexa es como el álgebra lineal, pero con espacios vectoriales densos, es decir, que siempre se podrá llegar a la solución.

=== Combinación lineal convexa.
==== Definición
Sean los vectories $v_1, v_2, dots, v_p$ $n$ dimensionales, se dice que definen a una combinación lineal convexa si y solo si, el vector u se define como :
$
  forall k in RR and v in RR^n
  u := k_1 v_1 + k_2 v_2 + dots + k_p v_p arrow.double.l.r\
  // si y solo si
  0 lt k_i lt 1\
  // 0 lt.eq k_i lt.eq 1\
  sum_(i = 1)^m k_i = 1
$
// donde k es un escalar y v es un vector
// cualquier k_i esta entre 0 y 1
// la sumatoria de los escalares es 1

En la combinación lineal, solo es necesario que los escalares existan.

No todas las combinaciones lineales son convexas.

*Ejemplo:*
$
  1/2 (6, 10) + 1/2 (8, 4) = (7, 7)
$

Es una combinación lineal convexa, ya que $1/2 + 1/2 = 1 $ y $0 lt 1/2 lt 1$.
// Es una combinación lineal convexa, ya que $1/2 + 1/2 = 1 $ y $0 lt.eq 1/2 lt.eq 1$.

=== Vector convexo.
Un vector $x$ define a un vector convexo $crossmark$ si es que este es una combinación de dos vectores de la misma dimesión dado por $crossmark = alpha x_1 + (1 - alpha) x^2$.
// tiene que ser de dos, exlusivamente
$0 lt alpha lt 1$

=== Conjunto convexo.
Un conjunto es convexo dentro de una región $phi$ si para todo par de vectores:
$
  forall x_i, x_j in phi\
  arrow(x_i x_j) in phi
$

La arista  (el vector generado por ambos) o el segmento de lineal pertenece a $phi$.

// $phi$ es el nombre de la región de estudio.

// ver ejemplos con vectores con norma mayor que uno, todos los phy como un triangulo con convexos?

=== Función convexa.
Una función multivariante n dimensional $f(x)$ se dice que es una función convexa dentro de una región $phi arrow.double.l.r f(alpha x_i + (1 - x) x_j) lt.eq alpha f(x_i) + (1 - alpha) f(x_j)$

=== Punto extremo.
Un punto es extremo de una región $phi$, si es que este no se puede escribir como combinación lineal convexa de ningún par de vectores $x_i, x_j$ pertenecientes a $phi$

// y si los vectores son iguales que el punto, con norma 0? solo se cumple si ambos son diferentes que el punto extremo?

El vector que maximiza el modelo, es decir la solución óptima, es un punto extremo.

// El método exhaustivo es un método alternativo para encontrar los puntos extremos.

// El punto extremo siempre está en las esquinas de la región

=== Punto frontera.
Un punto es frontera de una región $phi$ si es que este se encuentra en el contorno de $phi$.

Un punto extremo es un punto frontera, pero un punto frontera no necesariamente es un punto extremo.

= Modelos matemáticos.
En la programación no linal, la solución óptima puede estar en cualquier parte de la región del conjunto solución.

== Modelo de programación matemática.
=== Definición.

Un modelo de programación matemática general se define como optimizar $z = f(x_1, x_2, dots, x_n)$
$
"Sujeto" a: s_a = g_i (x_1, x_2, dots, x_n) gt.lt.eq b_i\
forall x in RR^n\
i = 1, 2, dots, m\
y = 1, 2, dots, n\
$ 
// el sujeto a puede ser solo > o <? es decir, sin el igual
$m$ es el número de restricciones.
$n$ es el número de variables de restricción.

Nota: para aplicar a problemas reales, se cumple la condición de no-negatividad $x gt 0$.

Cada $g_i$ es una restricción.

La región de factibilidad es el conjunto solución (del modelo), y está delimitada por las restricciones.

Donde tanto la función objetivo como las restricciones son funciones matemáticas continuas, lineales o no lineales.

== Modelo de programación lineal.
=== Definición.
Un modelo de programación lineal se define como: optimizar Z,
$
  "opt"(z) = c_1 x_1, c_2 x_2, dots, c_n x_n\
  s_a: \
  a_11 x_1 + a_12 x_2 + dots + a_(1 n) x_n gt.lt.eq b_1\
  a_21 x_1 + a_22 x_2 + dots + a_(2 n) x_n gt.lt.eq b_2\
  dots\
  a_(m 1) x_1 + a_(m 2) x_2 + dots + a_(m n) x_n gt.lt.eq b_m\
  x gt.eq 0
$

Un modelo de programación lineal es un caso particular de un modelo de programación matemática, donde tanto la función objetivo como las restricciones son funciones matemáticas lineales.

Si todas las ecuaciones del sujeto a tienen menor o igual $lt.eq$, (y $x gt.eq 0$), se aplica el modelo canónico, que se resuelve con el modelo simplex básico.

Un modelo canónico se aplica cuando el problema es de maximizar.

El simplex básico es fácil de resolver porque se tiene una matriz canónica.

// eso de que sea más fácil, solo se aplica con una maximización? o tambien con min o opt? Respuesta: solo maximizar
Un modelo de programación lineal:

+ Posee una función objetivo matematica de tipo lineal.
+ Contiene restricciones definidas por funciones matematicas lineales.
+ Contiene variables y parámetros.

=== Formas de equivalencia.
Cualquier ejercicio dado, primero debe ser estandarizado para ser resuelto.

Existen cinco leyes de equivalencia que sirven para estandarizar un modelo.

Con las cinco leyes se puede estandarizar cualquier modelo lineal o no lineal. Las leyes permiten pasar *cualquier* modelo a una estructura o forma estándar inicial de solución.

*Primera forma de equivalencia*.
- Maximizar $z$ es equivalente a minimizar $-z$
- Minimizar $z$ es equivalente a maximizar $-z$

// En el primer parcial no se permite aplicar la primera forma de equivalencia.

$
  "Min" Z = 2x_1 - 6x_2\
  "Suejto a"\
  3x_1 + 4x_2 lt.eq 0\
  x_1 + 6x_2 gt.eq 8\
  arrow 
  "Maz" -Z = -2x_1 + 6x_2\
  "Suejto a"\
  dots
$

*Segunda forma de equivalencia*.
Toda restricción de tipo inecuación puede ser cambiada de sentido siempre que se multiplique por un escalar negativo.
$
  a x lt.eq b eq -a x gt.eq -b
$

*Tercera forma de equivalencia*.
Toda restricción de tipo ecuación puede ser convertida en dos inecuaciones simultáneas.
$
  a x = b arrow cases(
    a x lt.eq b\
    a x gt.eq b
  )
$

*Cuarta forma de equivalencia*.
Toda restricción de tipo inecuación puede ser convertida en ecuación siempre que se sume o se reste un vector $s$ n-dimensionalde la siguiente manera.
$
  a x lt.eq b arrow a x + s = b\
  forall S in RR^n: s gt.eq 0
$
Donde $s$ se denomina vector holgura. // o vector de holgura

$
  a x gt.eq b arrow a x -s = b
  forall S in RR^n: s gt.eq 0
$
Donde $s$ se denomina vector superfluo.

El vector $s$ es de dimensión $m times 1$

*Quinta forma de equivalencia*.
Toda variable de desición que pueda tomar valores positivos, negativos o nulos se denomina irrestricta en signo o no restringida en signo (NRS). Esta siempre se podrá descomponer como la diferencia de dos variables positivos.

$
  X_j I S\
  arrow\
  X_j = X_j^+ - X_j^-\
  X_j lt 0 arrow.double.l.r X_j^+ lt X_j^-\
  X_j = 0 arrow.double.l.r X_j^+ = X_j^-\
  X_j gt 0 arrow.double.l.r X_j^+ gt X_j^-\
$

Es importante aplicar la quinta forma de equivalencia porque en los modelos, las variables no pueden ser negativas.

== Estructura canónica.
=== Definición.
La forma canónica de un modelo de programación lineal se define como:
$
  "max" z = c x\
  "s a"\
  a x lt.eq b\
  x gt.eq 0
$

Tiene las siguientes características:
+ La función objetivo de tipo maximización.
+ Todas las restricciones son de la forma mayor o igual.
+ El vector $b$ de recursos o disponibilidades dimensión $m times 1$ es no negativo.
+ El vector $x$ de variables de desición es no negativo.

$
  b = ejem(b) gt.eq 0
$

*Tarea.* Encontrar la inversa de la matriz por dos métodos distintos.

#matriz(3, "M", 4, 6, 5, 2, 0, $1/2$, 7)

Hacer la prueba de que la inversa está bien multiplicando $A dot A^-1 = I$

== Forma o estructura estándar.
=== Definición.
La estructura estándar de un modelo de programación lineal tiene las siguietne características:

+ La función onbjetivo de tipo maximización o minimización.
+ Todas las restricciones son ecuaciones (no inecuaciones) usando la cuarta ley de equivalencia.
+ El vector $b$ de recursos o disponibilidades es no negativo
+ El vector $x$ de variables de desición es no negativo.

Todo problema de minimización se resuelve con el simplex avanzado.

== Forma matricial de un modelo de programación lineal.
=== Definición.
Dada la forma canónica, el modelo es maximizar $z$.
$
  "max" z = c x\
  "s a"\
  a x lt.eq b\
  x gt.eq 0
$

Donde a $z$ se la llama función objetivo y es una función escalar se llama función escalar porque es un mapeo de $RR^n arrow R$

$
A = 
#grid(
  inset: 4pt,
  columns: (auto, auto, auto, auto),
  [a_11], [a_12], [dots], [a_1n],
  [a_21], [a_22], [dots], [a_2n],
  [dots], [dots], [dots], [dots],
  [a_m1], [a_m2], [dots], [a_mn],
)
$

Donde $A$ es de tamaño $m times n$ y se llama matriz de coeficientes tecnológicos.
Donde $C$ es de tamaño $1 times n$ y se llama vector de costos, precios o beneficios.
Donde $B$ es de tamaño $m times 1$ y se llama vector de recursos o disponibilidades.
Donde $X$ es de tamaño $n times 1$ y se llama vector de variables de desición.

= Simplex básico.

= Simplex Avanzado.
De existir restricciones de tipo ecuación o de mayor o igual $gt.eq$, no se tendrá una base canónica completa, por lo que deberá utilizarse varaibles artificiales $R$s necesaria para completar la base canónica completa, existen dos técnicas denominadas:
- Técnica en M.
- Técnica de dos fases.

Donde ambas metodologías arrojan los mismos resultados o conclusiones para cada problema específico.

== Técnica en M.
LLamada también método de penalizaciones, permite resolver modelos de programación lineal (PL) con cualquier tipo de restricción, haciendo uso de variables artificiales $R$s por no existir una base canónica completa (no se tiene la matriz identidad). Los pasos a seguir son los siguientes:

1. Colocar el modelo en su forma estándar, de la siguiente manera: 
  - A todas las restricciones de la forma menor o igual $lt.eq$, sumar una variable de holgura $s$. Así, queda una ecuación.
  - A cada restricción de la forma mayor o igual $gt.eq$, restar una variable superflua $s$ y sumar una variable artifical $R$ simultáneamente. Así, queda una ecuación.
  - A restricciones de tipo ecuación $=$, solamente sumar una variable artifical $R$.
Todas las variables $s$, sean de holguras o superfluas, se adicionan en la función objetivo con coeficiente cero $0$; y las variables artificales $R$s, con coeficiente de menos m $-m$ para el caso de maximización, y positivo m $m$ para el caso de minimización.



// Los valores de $R$, como son inventados, serán cero $0$
// Las columnas de la matriz identidad son las $R$s?
// Los subindices de las $R$ y $s$ deben ser de acuerdo al número de ecuación, no a la cantidad de variables.
// Las columnas de la matriz identidad son las $R$, por eso si ya hay un menor o igual $lt.eq$, no se añade una $R$ porque ya se tiene esa columna.

$
  "max"Z = 10x_1 + 12 x _2 + 24 x_3\
  2x_1 + 6x_2 + x_3 = 60\
  5x_1 + 8x_2 + 4x_3 lt.eq 18\
  2x_1 + x_2 + 2x_3 gt.eq 100\
  arrow\
  "max"Z = 10x_1 + 12 x _2 + 24 x_3 + 0 S_2 + 0 S _3 - M R_1 - M R_3\
  2x_1 + 6x_2 + x_3 + R_1 = 60\
  5x_1 + 8x_2 + 4x_3 + S_2 = 18\
  2x_1 + x_2 + 2x_3 - S_3 + R_3 = 100\
$

#separador()

$
  "min"Z = 10x_1 + 12 x _2 + 24 x_3\
  2x_1 + 6x_2 + x_3 = 60\
  5x_1 + 8x_2 + 4x_3 lt.eq 18\
  2x_1 + x_2 + 2x_3 gt.eq 100\
  arrow\
  "max"Z = 10x_1 + 12 x _2 + 24 x_3 + 0 s_2 + 0 s _3 - M R_1 - M R_3\
  2x_1 + 6x_2 + x_3 + R_1 = 60\
  5x_1 + 8x_2 + 4x_3 + S_2 = 18\
  2x_1 + x_2 + 2x_3 - S_3 + R_3 = 100\
  "min"Z = 10x_1 + 12 x _2 + 24 x_3 + 0 S_2 + 0 S _3 + M R_1 + M R_3\
$

Donde $M$ se denomina penalización, el cual es un costo inmensamente grande positivo

2. Introducir el modelo estandar a una tabla tipo simplex normalmente. Normalmente significa que la cabeza de la función objetivo entra con signo cambiado. La cabeza es la función objetivo. Mientras que las restricciones no cambian de signo, tal como quedaron estandarizadas.

3. Condición de optimidad: La variable de entrada es aquella variable no básica con coeficiente mas negativo en la función objetivo para el caso de maximización, y con coeficiente mas positivo en la función objetivo para el caso de minimización. En caso de empates, considerar importantes entre varaibles de entrada.

// 4. Condición de factibilidad: La variable de entrada es aquella variable no básica que se rige de la siguiente manera: 
//   - Realizar los cocientes entre dos coeficientes del vector $b$ de recursos o disponibilidades dividido por el vector de coeficientes tecnológicos correspondientes a la variable de entrada, no existiendo división entre ceros ni negativos.

4. Condición de factibilidad: La variable de salida es la variable básica que se elige de la siguiente manera:
  - Realizar los cocientes entre los coeficientes del vector $b$ de recuersos o disponibilidades dividido el vector de coeficiente tecnológicos correspondientes a la variable de entrada, no existiendo división entre ceros ni negativos.

La variable de salida, es aquella correspondientes al menor cociente, en caso de empates, considerar importancia entre variables de salida.

5. Una vez reconocidas las variables de entrada y salida (primero entrada y luego salida), la casilla de intersección de columna y fila se pivotiza (volver uno $1$) aplicando el inverso multiplicativo. Y se logra un vector canónico columna aplicando inversos aditivos. De esta forma se logra una nueva solución.

6. Repetir los pasos 3. 4. 5. hasta conseguir una solución óptima y factible. Esto se logrará siempre que se tenga una tabla óptima, es decir, cuando se tenga puros coeficientes positivos o nulos en la función objetivo para el caso de maximización. Para el caso de minimización, puro negativos o nulos en la función objetivo (la cabeza).

Si en la solución óptima aparece alguna variable artificial $R$ con valor distinto de cero, no tiene solución.

== Técnica de dos fases.
La primera fase consiste en crear, 'inventar' un nuevo modelo. relacionado al original, cuya función objetivo es de tipo minimización de sumatoria de variables artificiales a utilizar. Sujeta a las restricciones de la técnica en M. (Hacer la misma parametrización que en la técnica en M).

En la primera fase siempre se minimiza, da igual que el problema sea de maximización. Si se pide maximizar un $Z$, se minimiza un $Z^*$.

Se debe llegar a una tabla óptima. Si aparece alguna variable artificial $R$ con un valor distinto de cero, no hay solución. Si en la primera fase la minimización de $Z^*$ no da cero, no hay solución.

$
  "max"Z = 10x_1 + 12 x _2 + 24 x_3\
  2x_1 + 6x_2 + x_3 = 60\
  5x_1 + 8x_2 + 4x_3 lt.eq 18\
  2x_1 + x_2 + 2x_3 gt.eq 100\
  arrow\
  "min"Z^* = R_1 + R_3\
  2x_1 + 6x_2 + x_3 + R_1 = 60\
  5x_1 + 8x_2 + 4x_3 + S_2 = 18\
  2x_1 + x_2 + 2x_3 - S_3 + R_3 = 100\
$

En forma similar a la técnica en M, resuelve el modelo de programación lineal con cualquier tipo de restricción, haciendo uso de varias artificales $R$s, esto se debe a que no se tiene una base canónica completa; para aplicar esta técnica se deben realizar las siguientes fases:

// 1. Crearse un nuevo modelo de programación lineal cuya función objetivo es de tipo minimización de sumatoria de cvaraibles artificales a utilizar. 

=== Primera fase.
Crearse un nuevo modelo de programación lineal, cuya función objetivo es de tipo minimización de sumatoria de variables artificiales a utilizar, sujeta a las restricciones de la técnica en M. Dicho modelo se introduce normalmente a una tabla tipo simplex, se repone la base canónica de forma inmediata y aplicar los siguientes pasos del simplex normalmente.
// Si no se puede encontrar la base canónica, no se puede resolver.

A la reestructuración de un sistema se le llama reingeniería.

El valor óptimo de la función objetivo, el mínimo de $Z^*$, debería ser cero $0$ para que el modelo original tenga solución y se pueda realizar la segunda fase.

Si en la primera fase el óptimo no es cero, el modelo original no tiene solución y no se debe seguir con la segunda fase, solo se puede ir a la segunda fase si da exactamente cero.
$
  "Min" Z^* = sum R_i = 0
$

=== Segunda fase.
Se debe eliminar de la tabla óptima todas las columnas de las variables artificiales; así, quedará una tabla más pequeña en la cual se debe ingresar la cabeza de forma normal (con signo cambiado).

Reemplazar la función objetivo en el modelo original con signo cambiado. con la tabla pequeña, aplicar lo que diga el modelo original.

De la tabla óptima de la primera fase, eliminar todas las columnas correspondientes a las varaibles artificales $R$. Así, quedará una tabla más pequeña a la cual se le debe introducir la cabeza con signo cambiado.

Reponer la base canónica en forma inmediata mediante operaciones elementales y aplicar los siguientes pasos del simplex normalmente, si el modelo original es del tipo maximización, en la segunda fase se maximiza. Si el modelo orignial fuese de tipo minimización, la tabla reducida se minimiza.

= Importancia de variables de entrada.
En entrada, se da prioridad a variables de desición $x_j$, $S$ y $R$ en ese orden de importancia. Si tiene que entrar una variable, entran primero las más importantes. Empates entre variables con importancia equivalente, romper arbitrariamente.

// Superfluo significa por demás.

En el caso de salida, se hace el procedimiento al revés, deben salir con prioridad las variables menos importantes. Es decir, la prioridad de salida es: $R_i$, $S_i$ y $x_j$. Empates entre variables con importancia equivalente, romper arbitrariamente.

= Problema de ejemplo:
Una fábrica produce carteras para damas de uso diario y de fiesta, una cartera de uso diario tiene un precio de 250 bolivianos y un costo de fabricación de 130 bolivianos. En cambio, una cartera de fiesta tiene un precio de 450 bolivianos y un costo de fabricación de 200 bolivianos.

La fábrica tiene experiencias en la demanda de carteras, la demanda mínima de carteras de uso diario por mes es de 500 unidades y la demanda de carteras de fiesta se encuentra en un rango de 200 a 800 unidades al mes. La empresa tiene recursos limitados humanos y tecnológicos, capaces de producir hasta 1500 carteras de uso diario, pero también se sabe que producir una cartera de fiesta requiere del doble de tiempo y recursos con relación a una cartera de uso diario.

Formula el modelo de programación lineal.

$x_1$ = número de carteras de uso diario a producir por mes.

$x_2$ = número de carteras de fiesta a producir por mes.

// es necesario especificar la cobertura temporal

Se busca maximizar la utilidad (ganancias netas, precio - costo).
$
  "max" Z = 120x_1 + 250x_2 \
  "sa:"\
  x_1 lt.eq 500\
  200 lt.eq x_2 lt.eq 800\
  x_1 + 2 x_2 lt.eq 1500
  // x gt.eq 0
$

Dichos productos, estimados en 25 bolivianos por hora de trabajo.

Se tiene una ganancia del $10%$ total.

Un refrigerador tiene un precio de 8600 bolivianos, y requiere de dos horas de trabajo aproximadamente; en entrega, instalación, capacitación y manejo. La probabilidad de hacer una venta a un cliente interesado es de $0.5$.

Una cocina tiene un precio de 3400 bolivianos y requiere de 50 minutos de trabajo en entrega, capacitación y enseñanza. La probabilidad de hacer una venta es de $0.8$.

El trabajador le dedica a esta actividad hasta 100 horas al mes, ya que desempeña otras actividades ajenas a esta.

EL gerente de la empresa obliga al trabajador a vender mayor o igual número de cocinas que refrigeradores; por el otro lado, también se sabe que la demanda de refrigeradores se encuentra en un rango de 10 a 30 unidades por mes.

Formule el modelo de programación linel.

$x_1$: Número de refrigeradores a vender por mes 

// las probabilidades son a posteriori casi siempre, es decir, con conocimiento de causa

$x_2$: Número de ofrecimientos/visitas a realizar a clientes de cocinas por mes

#grid(
  stroke: black,
  inset: 6pt,
  columns: (auto, auto, auto, auto),
  [Variable], [Horas de trabajo], [Unidades vendidas], [Ingresos],
  [$x_1$], [$2x_1$], [$0.5 x_1$], [$8600 "Bs" (0.5x_1) = 4300x_1$],
  [$x_2$], [$5/6x_2$], [$0.8 x_2$], [$3400 "Bs" (0.8x_2) = 2720x_2$],
)

Ingreso total: $4300 x_1 + 2720 x_2$.

$"Max" Z = "porcentaje recibido" - "gastos" = "utilidades"$

$(4300x_1 + 2720 x_2) 0.1 = 430x_1 + 272x_2$\
$"Gastos" ("horas de trabajo") = (2x_1 + 7 x_2) 25 "Bs" = 50 x_1 + 20.833 x_2$

// Tarea 2: Hacer 100 planteos para el examen (tarea 1: medidas de conversion) para el dia del examen

// sacar planteos del libro de jiaom/xiaom/chiaom/xaio - richard brondson

// otro libro: raford lecard? de peru, cuatro libros - operativa 1, programación lineal



#separador()

Una fábrica produce repuestos de computadoras, los cuales son entregados al finalizar el día a empresas ensambladoras de computadoras, la demanda mínima de repuestos por todas las empresas ensambladoras es de al menos 80000 unidades por día.

El departamento de control de calidad de dicha empresa va a contratar personal revisor de artículos terminados, especializados y técnicos.

De experiencias anteriores se sabe que un personal especializado gana 400 bolivianos por día y realiza su labor a una taza de intensidad de 120 repuestos por hora, con un rendimiento efectivo de un 98%.

Un personal técnico gana 250 bolivianos por día, y realiza su trabajo a una taza de intensidad de 80 repuestos por hora, con un rendimiento efectivo de un 95% de confiabilidad.

Las empresas ensambladoras aplican una multa de 20 bolivianos por daños y perjuicios por la entrega de un repuesto defectuoso.

Si se sabe que la jornada diaria de trabajo es de 8 horas. En el departamento de control de calidad el gerente de la empresa obliga al jefe de personal a contratar especialistas mayor o igual al número de técnicos como política de la empresa.

Formule el modelo de programación lineal.

// las tazas usadas son quasonianas por lo general

$x_1$: Número de especialistas contratados por día\
$x_2$: Número técnicos contratados por día\
$"Min" Z = ("Salarios") + ("Multas")$\
$"Salarios" = 400 x_1 + 250 x_2$\
$"Multas" = 120 (8) x_1 + 80 (8) x_2$

#separador()

Un molino agrícola produce alimentos para ganado vacuno, porcino y pollos, estos productos se componen de tres ingredientes que son: Maíz, afrecho y harina de pescar. Los ingredientes tienen dos tipos de nutrientes que son proteínas y calcio.

En la siguiente tabla se dan los contenidos de nutrientes por libra en porcentajes de cada ingrediente.

#grid(
  inset:6pt,
  stroke: black,
  columns: (auto, auto, auto, auto),
  [],
  grid.cell(
    colspan: 3,
    [Ingredientes]
  ),
  [Nutriente], [Maíz], [Afrecho], [Harina de Pescar],
  [Proteína], [10], [15], [55],
  [Calcio], [35], [10], [40],
)

Según un experto en zootecnia, el contenido de proteína y de calcio en el alimento para ganado vacuno, debe estar entre 20 a un 30 porciento y al menos 20% respectivamente.

El contenido de proteína y calcio en el alimento para ganado porcino debe estar en los rangos de 20 a 25 % y de 6 a 10 %.

El contenido de proteínas y calcio en el alimento para pollos debe estar en un rango de 20 a 25 % y de 4 a 8 %.

#grid(
  inset: 6pt,
  stroke: black,
  columns: (auto, auto, auto),
  [], [Proteína], [Calcio],
  [Ganado vacuno], [$20 % - 30 %$], [$gt.eq 20 %$],
  [Ganado porcino], [$20 % - 25 %$], [$6 % - 10 %$],
  [Pollos], [$20 % - 25 %$], [$4 % - 8 %$],
)

Suponga que se dispone de 38 000, 20 000 y 12 000 libras de maiz, afrecho y harina de pescado, y supóngase también que se requiere producir al menos 18 000, al menos 15 000 y a lo sumo 10 000 libras de cada alimento respectivamente.

// Como dice se dispone, significa que es una ecuacion, con simbolo de igual. al menos sifnifica mayor o igual.  A lo sumo significa menor o igual

Los costos de adquisición o de compra de los ingredientes por libra de maíz, afrecho y harina de pescado son de 5 bolivianos, 10 bolivianos y 20 bolivianos respectivamente.

Hallar el modelo de programación lineal.

#grid(
  inset: 6pt,
  stroke: black,
  columns: (auto, auto),
  [1. Maíz], [1. Ganado vacuno],
  [2. Afrecho], [2. Ganado porcino],
  [3. Harina de pescado], [3. Pollos],
)

$x_(i j) quad quad i = 1, 2, 3 quad quad j = 1, 2, 3$

$
  "Min" Z = 5 (x_11 + x_12 + x_13) + 10 (x_21 + x_22 + x_23) + 20 (x_31 + x_32 + x_33)\
  x_11 + x_12 + x_13 = 38 000\
  x_21 + x_22 + x_23 = 20 000\
  x_31 + x_32 + x_33 = 12 000\
  \
  x_11 + x_21 + x_31 gt.eq 18 000\
  x_12 + x_22 + x_32 gt.eq 15 000\
  x_13 + x_23 + x_32 lt.eq 10 000\
  \
  0.20 lt.eq (0.10 x_11 + 0.25 x_21 + 0.55 x_31)/(x_11 + x_21 + x_31) lt.eq 0.30\
$

#separador()

Un inversionista desea invertir 10 000 000 de dólares en tres proyectos, $A, B, C$.

El proyecto $A$ es de menor riesgo y tiene un interés anual de un cinco por ciento del capital invertido.

El proyecto $B$ es un poco más riesgoso pero tiene un interés de un ocho por ciento.

El proyecto $C$ es el más riesgoso de todos, pero arroja un interés de un doce por ciento anual

// rendimiento academico con horas de estudio, tiene una correlación directa?

Según un experto en economía, se recomienda que la inversión en acciones de $A$ debe ser al menos un 20 % de las otras inversiones, y las inversiones en $B$ debe ser al menos un 25 % del capital invertido, y que la razón de inversiones de $C$ a $A$ debe estar entre los $2/3$ y los $4/5$

$x_1$: Cantidad de dinero a invertir en $A$\
$x_2$: Cantidad de dinero a invertir en $B$\
$x_3$: Cantidad de dinero a invertir en $C$\

$
  "Max" Z = 0.05 x_1 + 0.08 x_2 + 0.12 x_3\
  x_1 + x_2 + x_3 lt.eq 10 000 000\
  x_1 gt.eq x_2 + x_3\
  x_2 gt.eq 2 000 000
$

#separador()

Una fábrica de muebles es especialista en la producción de dos tipos de comedores $A$ y $B$, si estos para su fabricación tienen que pasar por dos departamentos de construcción y pintado; los requerimientos y capacidades de producción diaria se detallan a continuación. El precio de un comedor de tipo $A$ es de 450 dólares y el costo de producción es de 450 dólares. El precio de un comedor de tipo $B$ es de 500 dólares y el costo de producción es de 260 dólares.

#grid(
  stroke: black,
  inset: 6pt,
  columns: (auto, auto, auto, auto),
  [Recursos requeridos para producir una unidad], [A], [B], [Recursos disponibles (capacidad diaria)],
  [Departamento de construcción (Tiempo de construcción en horas)], [6], [12], [120],
  [Departamento de pintado (tiempo de pintado en horas)], [8], [4], [64],
  [Utilidad diaria], [200 dólares], [240 dólares], [],
)

1. Formule el modelo de programación lineal.

$
  "Max" Z = 200 x_1 + 240 x_2\
  6x_1 + 12x_2 lt.eq 120\
  8x_1 + 4x_2 lt.eq 64\
  x gt.eq 0
$

#separador()

2. Resuelva por el método gráfico.

$30x + 4x y = 24$

Se debe asignar un valor arbitrario a $Z$, pero lo más práctico es usar un valor que permita graficar.

$
  Z = 200x_1 + 240x_2 arrow 1200 = 200x_1 + 240x_2
$

Los teoremas fundamentales de la programación lineal son:

+ La región de factibilidad de todo modelo de programación lineal soluble (con solución) es un conjunto convexo.
+ La solucion óptima de todo modelo de programación lineal soluble siempre se encuentra en un punto extremo de la región de factibilidad, es un punto extremo, un vértice.

$
  "Max" Z = 200 (4) + 240 (8)\
  "Max" Z = 2720 "dólares" qed
$

#separador()

3. Resolver por el método simplex.

Ambas restricciones son primarias y activas.

Una solucion basica de generar cumple $a dot b gt.eq x: x gt.eq 0$

Resolver en la notación de Handy Taha