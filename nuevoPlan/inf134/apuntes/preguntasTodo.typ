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
#show heading: set text(size: 11pt)

// Para grid:
// #grid(
//     columns: (auto, auto, auto),
//     inset: 0.5em,
//     stroke: 0.1em + black,
//     [1], [2], [3],
//     [1], [2], [3],
//     [1], [2], [3],
//     [1], [2], [3],
// )

// Aparece en p1sol1 - exam1 - question 1
= Para los números 12, 17, 15, 10, 10, 10, 8, 10. Marque en caso de que la afirmación sea verdadera

- a. La media es 4.5\
- b. La mediana es 10\
- c. La media es 11.5
- d. La desviación estándar es 0.2629318
- e. La desviación estándar es 3.0237158

== Respuesta:
La media $overline(x)$ es la suma de todos los números $x_i$ dividida entre la cantidad de números $n$.
$
  overline(x)=(sum x_i)/n=92/8=11.5
$
La mediana $tilde(x)$ es el valor central cuando los números están ordenados.\
$
  8, 10, 10, 10, 10, 12, 15, 17", valor central: "tilde(x)= 10
$
La desviación estándar de una muestra $s$ se calcula:
$
  s=sqrt((sum (x_i-overline(x))^2)/(n-1)) = sqrt(64/7) approx 3.0237158
$

*Marcar: b. c. y e.*

#pagebreak()

// Aparece en:
// p1sol1 - exam1 - question 2
// Similar:
// p1sol9 - exam9 - question 2
// p1sol10 - exam10 - question 2
= Se tienen los salarios de un grupo de 20 trabajadores para el tiempo t, distribuidos como:

Grupo 1: n= 10
#grid(
    columns: (auto, auto, auto),
    inset: 0.5em,
    stroke: 0.1em + black,
    [1501], [1642], [2502],
    [1896], [1927], [2768],
    [2320], [1609], [2427],
    [2837]
)
Grupo 2: n = 6
#grid(
    columns: (auto, auto, auto),
    inset: 0.5em,
    stroke: 0.1em + black,
    [5329], [5233], [5135],
    [4432], [4561], [3310],
)
Grupo 3: n= 4
#grid(
    columns: (auto, auto, auto, auto),
    inset: 0.5em,
    stroke: 0.1em + black,
    [8093], [8019], [7636], [8731]
)

== Si se decide hacer un incremento para el $t+1$ de 400Bs a todos y además incrementar al salario $t$ en 22.39 %. ¿Cuál es el promedio esperado para $t+1$ de estos 20 trabajadores?

- a. 4495.4
- b. 5012.36006
- c. 4095.4
- d. 5412.36006
- e. 20

== Respuesta:
Se saca la media $overline(x)$ de todos los salarios.
$
  overline(x)=(sum x_i)/(n)=4095.4
$
Se incrementa la media en $22.39%$.
$
  overline(x)dot 1.2239=4095.4 dot 1.2239=5012.36006
$
Se incrementan los 400 Bs.
$
  5012.36006+400=5412.36006
$

*Marcar d.*

#line(length: 100%)
_Caso alterno:_

== En una empresa donde los salarios tienen un promedio de 3434 Bs. al mes y una desviación estándar 584, el sindicato solicita un incremento del 50% al salario junto con un bono mensual de 300 Bs. \ \ El director acepta parcialmente la petición rebajando un 27% la propuesta total del sindicato. A partir del nuevo salario, la media y desviación estándar son:

- a. $overline(y)= 3979.23, S_y= 639.48$
- b. $overline(y)= 4775.076, S_y= 0$
- c. $overline(y)= 1989.615, S_y= 319.74$
- d. $overline(y)= 3979.23, S_y= 767.376$
- e. $overline(y)= 3581.307, S_y= 639.48$

== Respuesta:
Se incrementa la media (promedio) en $50%$:
$
  overline(y)_i dot 1.5=3434 dot 1.5=5151
$
Se incrementan los 300 Bs:
$
  5151+300=5451
$
Se reduce un 27%:
$
  overline(y)=5451 dot (1-0.27)=3979.23
$
Calcular la desviación multiplicando la desviación estándar inicial por los porcentajes:
$
  S_y=(584)(1.5)(1-0.27)=639.48
$

*Marcar a.*

#pagebreak()

// Aparece en p1sol1 - exam1 - question 3
= Una urna A contiene 4 bolas rojas y 3 negras, mientras que en la urna B contiene 4 bolas rojas y 6 negras. Si una bola es extraida aleatoriamente de cada urna, ¿cuál es la probabilidad de que las bolas sean del mismo color?

- a. 12/70
- b. 28/70
- c. 4/10
- d. 1/2
- e. 1/5

== Respuesta:
Calcular total de bolas en la urna A: $4+3=7$.\
Calcular total de bolas en la urna B: $4+6=10$.\
Calcular la probabilidad de que ambas sean rojas:
$
  4/7 times 4/10=16/70
$
Calcular la probabilidad de que ambas sean negras:
$
  3/7 times 6/10=18/70
$
Sumas las probabilidades: $16/70+18/70=34/70=17/35$\
El inciso que más se acerca a la respuesta es b) $28/70 approx 34/70$\
*Marcar b.*

#pagebreak()

// Aparece en:
// p1sol1 - exam1 - question 4
// p1sol10 - exam10 - question 4
= Un número es seleccionado al azar entre los numeros 2 al 20. Sean los eventos:

- A: El número es par
- B: El número es primo
- C: El número elegido es múltiplo de 5

== Marque en caso de que sean verdaderas las siguientes afirmaciones:

- a. $A union B=1,2,3,4,5,6,7,8,10,11,12,13,14,16,17,18,19,20$
- b. $(A union B) inter C^c=5,10$
- c. $A inter B=2$
- d. $A^c inter B^c=emptyset$
- e. $A^c inter B=3,5,7,11,13,17,19$

== Respuesta:
Anotar explícitamente los conjuntos:\
- Números del 2 al 20:

#grid(
  inset: 0.5em,
  stroke: 0.1em + black,
  columns: (24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt),
  [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12], [13], [14], [15], [16], [17], [18], [19], [20]
)
  
- A (Pares):

#grid(
  inset: 0.5em,
  stroke: 0.1em + black,
  columns: (24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt),
  [2], [], [4], [], [6], [], [8], [], [10], [], [12], [], [14], [], [16], [], [18], [], [20]
)

- B (Primos):

#grid(
  inset: 0.5em,
  stroke: 0.1em + black,
  columns: (24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt),
  [2], [3], [ ], [5], [], [7], [], [], [], [11], [], [13], [], [], [], [17], [], [19], []
)

- C (Múltiplos de 5):

#grid(
  inset: 0.5em,
  stroke: 0.1em + black,
  columns: (24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt),
  [], [], [], [5], [], [], [], [], [10], [], [], [], [], [15], [], [], [], [], [20]
)

Verificar acada afirmación:\
- $A union B$:

#grid(
  inset: 0.5em,
  stroke: 0.1em + black,
  columns: (24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt),
  [2], [], [4], [], [6], [], [8], [], [10], [], [12], [], [14], [], [16], [], [18], [], [20]
)

$
  union
$

#grid(
  inset: 0.5em,
  stroke: 0.1em + black,
  columns: (24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt),
  [2], [3], [ ], [5], [], [7], [], [], [], [11], [], [13], [], [], [], [17], [], [19], []
)

$
  eq
$

#grid(
  inset: 0.5em,
  stroke: 0.1em + black,
  columns: (24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt),
  [2], [3], [4], [5], [6], [7], [8], [], [10], [11], [12], [13], [14], [], [16], [17], [18], [19], [20]
)

*Así que a. está mal, le falta el 9, el 15 y le sobra el 1.*\
- $(A union B) inter C^c$\
\
\
\

#grid(
  inset: 0.5em,
  stroke: 0.1em + black,
  columns: (24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt),
  [2], [3], [4], [5], [6], [7], [8], [], [10], [11], [12], [13], [14], [], [16], [17], [18], [19], [20]
)

$
  inter
$

#grid(
  inset: 0.5em,
  stroke: 0.1em + black,
  columns: (24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt),
  [2], [3], [4], [], [6], [7], [8], [9], [], [11], [12], [13], [14], [], [16], [17], [18], [19], []
)

$
  eq
$

#grid(
  inset: 0.5em,
  stroke: 0.1em + black,
  columns: (24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt),
  [2], [3], [4], [], [6], [7], [8], [], [], [11], [12], [13], [14], [], [16], [17], [18], [19], []
)

*Así que b. está mal*\

- $A inter B=2$

#grid(
  inset: 0.5em,
  stroke: 0.1em + black,
  columns: (24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt),
  [2], [], [4], [], [6], [], [8], [], [10], [], [12], [], [14], [], [16], [], [18], [], [20]
)

$
  inter
$

#grid(
  inset: 0.5em,
  stroke: 0.1em + black,
  columns: (24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt),
  [2], [3], [ ], [5], [], [7], [], [], [], [11], [], [13], [], [], [], [17], [], [19], []
)

$
  eq
$

#grid(
  inset: 0.5em,
  stroke: 0.1em + black,
  columns: (24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt),
  [2], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], []
)

*Así que c. está bien*\

- $A^c inter B^c$
#grid(
  inset: 0.5em,
  stroke: 0.1em + black,
  columns: (24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt),
  [], [3], [], [5], [], [7], [], [9], [], [11], [], [13], [], [15], [], [17], [], [19], []
)

$
  inter
$

#grid(
  inset: 0.5em,
  stroke: 0.1em + black,
  columns: (24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt),
  [], [], [4], [], [6], [], [8], [9], [10], [], [12], [], [14], [15], [16], [], [18], [], [20]
)

$
  eq
$

#grid(
  inset: 0.5em,
  stroke: 0.1em + black,
  columns: (24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt),
  [], [], [], [], [], [], [], [9], [], [], [], [], [], [15], [], [], [], [], []
)

*Así que d. está mal*

- $A^c inter B$

#grid(
  inset: 0.5em,
  stroke: 0.1em + black,
  columns: (24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt),
  [], [3], [], [5], [], [7], [], [9], [], [11], [], [13], [], [15], [], [17], [], [19], []
)

$
  inter
$

#grid(
  inset: 0.5em,
  stroke: 0.1em + black,
  columns: (24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt),
  [2], [3], [ ], [5], [], [7], [], [], [], [11], [], [13], [], [], [], [17], [], [19], []
)

$
  eq
$

#grid(
  inset: 0.5em,
  stroke: 0.1em + black,
  columns: (24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt, 24pt),
  [], [3], [], [5], [], [7], [], [], [], [11], [], [13], [], [], [], [17], [], [19], []
)

*Así que e. está bien.*\
*Marcar c. y e.*

#pagebreak()

// Aparece en :
// p1sol1 - exam1 - question 5
= Sea X una v.a. con función de distribución acumulada:
$
  F(x)=x/(x+1); quad x gt.eq 0
$
== La función de densidad es:
- a. $1/(x+1)^2$

- b. $x/(x+1)^2$
- c. $1/(x+1)+1/(x+1)^2$
- d. $x/(x-1)^2$
- e. $1/(x-1)^2$

== Respuesta:
Derivar $F(x)$ con la regla del cociente:
$
  f(x)=("derivada del numerador" times "denominador" - "numerador" times "derivada del denominador")/("denominador")^2
$

Numerador: $x quad quad quad quad arrow d/(dif x) x quad quad quad = 1$\

Denominador: $x+1 quad arrow d/(dif x) x+1 quad = 1$

$
  f(x)=((x+1)-x)/(x+1)^2=1/(x+1)^2
$

*Marcar a.*

#pagebreak()

// Aparece en:
// p1sol1 - exam1 - question 6
// p1sol9 - exam9 - question 6
// p1sol10 - exam10 - question 6
= Sea X una v.a. con función generatriz de momentos:
$
  M_x (t)=1/4(3e^t+e^(-t))
$
La varianza de X esta definida como:
- a. 1/4
- b. 1/2
- c. 2/4
- d. 3/4
- e. 6/7

== Respuesta:
Calcular la esperanza $E[X]$ sacando la primera derivada y evaluando en $t=0$:
$
  E[X]=d/(d t)[1/4(3e^t+e^(-t))]=1/4(3e^t-e^(-t))\
  arrow 1/4(3e^0-e^(-0))=1/4(3-1)=2/4=1/2
$
Calcular la esperanza del cuadrado de X $E[X^2]$ sacando la segunda derivada y evaluando en $t=0$:
$
  E[X^2]=d/(d t)[1/4(3e^t-e^(-t))]=1/4(3e^t+e^(-t))\
  arrow 1/4(3e^0+e^0)=1/4(3+1)=4/4=1
$
Calcular la varianza restando el segundo resultado $(1)$ por el primer resultado $(1/2)$ al cuadrado:
$
  "Var"(x)=E[X^2]-(E[X])^2 =\
  1-(1/2)^2=1-1/4=4/4-1/4=3/4 
$

*Marcar d.*

#pagebreak()

// Aparece en:
// p1sol2 - exam2 - question 1
// p1sol3 - exam3 - question 1
// p1sol11 - exam11 - question 1
// p1sol12 - exam12 - question 1
// recupsol2 - exam2 - question 1
// recupsol4 - exam4 - question 1
= Sea (X,Y) v.a. continuas definidas ambas para los reales positivos, con función de densidad:
$
  f(x,y)=1/4(x+y)x y e^(-x-y)
$
== La marginal $f(x)$ es:
- a. Ninguna.

- b. $f_X (x)=(x^2+2x)/4 e^(x)$
- c. $f_X (x)=(x^2+2x)/4 e^(-x)$
- d. Falta información.
- e. $f_X (x)=(x^2+x)/4 e^(-x)$

== Respuesta:
Integrar desde $0$ hasta $infinity$ con $d y$:
$
  f_X (x)=integral_0^infinity 1/4(x+y)x y e^(-x-y)d y=1/4x e^(-x)integral_0^infinity (x+y)y e ^(-y) d y
$
Dividir la integral en dos partes:
$
  integral_0^infinity (x+y)y e ^(-y) d y=integral_0^infinity (x y e^(-y)+y^2e^(-y))d y=x integral_0^infinity (y e^(-y))d y + integral_0^infinity (y^2 e^(-y))d y
$
Según las integrales gamma:
$
  integral_0^infinity y^k e^(-y)d y=k!
$
Entonces:
$
  integral_0^infinity (x+y)y e ^(-y) d y=x(1!)+(2!)=x+2
$
Multiplicando por el factor externo:
$
  f_X (x)=1/4 x e ^(-x) (x+2)=(x (x+2))/4 e^ (-x)=(x^2 +2x)/4 e^(-x)
$

*Marcar c.*

#pagebreak()

// Aparece en:
// p1sol2 - exam2 - question 2
// Similar: 
// p1sol4 - exam4 - question 2
// p1sol5 - exam5 - question 2
// recupsol3 - exam3 - question 1
= Para la siguiente tabla de probabilidad conjunta, calcule la esperanza de X

#grid(
  inset: 0.5em,
  stroke: 0.1em + black,
  columns: (auto, auto, auto),
  [x], 	[y], 	[Probabilidad],
  [1], 	[1], 	[0.19],
  [2], 	[1], 	[0.23],
  [3], 	[1], 	[0.24],
  [1], 	[2], 	[0.05],
  [2], 	[2], 	[0.06],
  [3], 	[2], 	[0.04],
  [1], 	[3], 	[0.03],
  [2], 	[3], 	[0.02],
  [3], 	[3], 	[0.02],
  [1], 	[4], 	[0.03],
  [2], 	[4], 	[0.05],
  [3], 	[4], 	[0.04]
)

- a. 1.65
- b. 1
- c. 2.04
- d. Falta información
- e. Ninguna o la información dada es incorrecta

== Respuesta:

Sumar las probabilidades para cada valor de x:
- Para $x=1: 0.19+0.05+0.03+0.03=0.30$
- Para $x=2: 0.23+0.06+0.02+0.05=0.36$
- Para $x=3: 0.24+0.04+0.02+0.04=0.34$
Multiplicar cada suma con el valor de x correspondiente y hacer la suma de productos:
$
  E[X]=(1 times 0.30)+(2 times 0.36)+(3 times 0.34)=0.30+0.72+1.02=2.04
$

*Marcar c.*

#pagebreak()

// Aparece en:
// p1sol2 - exam2 - question 3
// Similar: 
// p1sol3 - exam3 - question 3
// p1sol4 - exam4 - question 3
// p1sol5 - exam5 - question 3
// p1sol4 - exam4 - question 1
// p1sol5 - exam5 - question 1
// p1sol13 - exam13 - question 1
= Sean dos variables aleatorias $X, Y$, con $E[X]= 7$, $E[Y]= 6$, $E[X,Y]= 45$, la covarianza es:

- a. 87
- b. Falta información
- c. Ninguna o la información dada es incorrecta
- d. 42
- e. 3

== Respuesta:
La fórmula de la covarianza es:
$
  "Cov"(X,Y)=E[X Y]-E[X]dot E[Y]=45-7 dot 6=45-42=3
$

*Marcar e.*

#line(length: 100%)
_Caso alterno:_

== Sean dos variables aleatorias $X, Y$ independientes, con E[X]= 3 , E[Y]= 3, E[X,Y]= 14, la covarianza es:

- a. Falta información
- b. Ninguna o la información dada es incorrecta
- c. 23
- d. -5
- e. 9

== Respuesta:
Si las variables aleatorias son independientes, entonces la covarianza es siempre 0.

*Marcar b.*

#pagebreak()


// Aparece en:
// p1sol2 - exam2 - question 4
// p1sol3 - exam3 - question 4
// p1sol5 - exam5 - question 4
// Similar: 
// p1sol11 - exam11 - question 3
// p1sol12 - exam12 - question 3
// p1sol13 - exam13 - question 3
// p1sol14 - exam14 - question 3
// p1sol15 - exam15 - question 3
// recupsol5 - exam5 - question 1
= Si:
$
  f(x,y)=1/8(6-x-y) quad  0 lt.eq x lt.eq 2 quad 2 lt.eq y lt.eq 6
$
== Encuentre la densidad $f(x)$.

- a. Falta información

- b. $f(x)=6$
- c. Ninguna o la información dada es incorrecta
- d. $f(x)=x^2/3$
- e. $f(x)=x/4+5$

== Respuesta:
Para que la función conjunta sea una densidad de probabilidad válida, no debe tomar valores negativos, sin embargo:\
Si $(x,y)=(2,6)$:
$
  f(x,y)=1/8(6-x-y) arrow f(2,6)=1/8(6-2-6)=1/8(-2)=-2/8=-1/4
$
Como la función toma valores negativos, entonces no es una densidad de probabilidad.

*Marcar c.*

#line(length: 100%)
_Caso alterno:_

== Si:
$
  f(x,y)=1/8(6-x-y); quad 0<x<2, quad 2<y<4
$

== Obtenga $f(x\/y)$
\
- a. $f(x\/y)=(6-x-y)/(10-2y)$

- b. Falta información
- c. $f(x\/y)=(6-x-y)/(6-2x)$
- d. $f(x\/y)=3/4-x/4$
- e. $f(x\/y)=5/4-y/4$

== Respuesta:
Calcular la marginal de y $(f_Y (y))$ integrando respecto a $x$ de 0 a 2:
$
  f_Y (y)=integral_0^2 1/8(6-x-y)d x\
  f_Y (y)=1/8 [6x-x^2/2- x y]^(x=2)_(x=0)=1/8(12-2-2y)=1/8(10-2y)=1/4 (5-y)
$
Calcular $f(x \/y)$:
$
  f(x\/y)=(f(x,y))/(f_Y (y))=(1/8 (6-x-y))/(1/4 (5-y))=(6-x-y)/(2(5-y))=(6-x-y)/(10-2y)
$
*Marcar a.*

#line(length: 100%)
_Caso alterno:_

== Obtenga $f(y\/x)$

== Respuesta:
Calcular la marginal de x $(f_X (x))$ integrando respecto a $y$ de 2 a 4:
$
  f_X (x)=integral_2^4 1/8(6-x-y)d y\
  f_X (x)=1/8 [6y-x y-  y^2/2]^(y=4)_(y=2)=1/8(24-4x-8-12+2x+2)=1/8 (6-2x)=1/4(3-x)
$
Calcular $f(y \/x)$:
$
  f(x\/y)=(f(x,y))/(f_X (x))=(1/8 (6-x-y))/(1/4(3-x))=(6-x-y)/(2(3-x))=(6-x-y)/(6-2x)
$
*Marcar c.*

#pagebreak()

// Aparece en:
// p1sol2 - exam2 - question 5
// p1sol3 - exam3 - question 5
// p1sol5 - exam5 - question 5
// Simliar:
// p1sol4 - exam4 - question 5
// recupsol1 - exam1 - question 1
= Sea X una variable aleatoria con varianza finita. Encuentre la correlación entre X y X

- a. $rho =-1$
- b. $rho=0$
- c. Ninguna o la información dada es incorrecta
- d. Falta información
- e. $rho=1$

== Respuesta:
La fórmula de la correlación es:
$
  rho _(X,Y)=("Cov"(X,Y))/(sigma_X sigma_Y)
$
Como la correlación es entre X y X:
$
  rho _(X,X)=("Cov"(X,X))/(sigma_X sigma_X)="Var"(x)/(sigma_X)^2
$
Se sabe que: 
- $"Cov"(X,X)="Var"(X)$\
- $sigma_X dot sigma_X="Var"(X)$\
Entonces:
$
  rho _(X,X)=("Cov"(X,X))/(sigma_X sigma_X)="Var"(x)/"Var"(x)=1
$

*Marcar e.*

#line(length: 100%)
_Caso alterno:_

== Sea X una variable aleatoria con varianza finita. Encuentre la correlación entre X y -X

== Respuesta:

Se sabe que: 
- $"Cov"(X,-X)=-"Var"(X)$\
- $sigma_X dot sigma_X="Var"(X)$\
Entonces:
$
  rho _(X,X)=("Cov"(X,-X))/(sigma_X sigma_X)=(- "Var"(x))/"Var"(x)=-1
$

*Marcar a.*

#pagebreak()

// Aparece en:
// p1sol2 - exam2 - question 6
// p1sol3 - exam3 - question 6
// p1sol4 - exam4 - question 6
// p1sol5 - exam5 - question 6
// p1sol11 - exam11 - question 4
// p1sol12 - exam12 - question 4
// p1sol13 - exam13 - question 4
// p1sol14 - exam14 - question 4
// p1sol15 - exam15 - question 4

= Sea X una va tal que $X ~ U(a,b)$, Se toma una muestra aleatoria de tamaño $n$, encontrar la función de densidad conjunta de la muestra.

- a. $f(x)=1/(b-a)$

- b. $f(x_1,dots,x_n)=1/(b-a)$
- c. Ninguna
- d. $f(x)=1/(a-b)$
- e. $f(x_1,dots,x_n)=1/(b-a)^n$

== Respuesta:

La función de densidad conjunta es el producto de las densidades individuales, así que cada densidad se multiplicará $n$ veces (el tamañi de la muestra aleatoria), por lo tanto la respuesta es la única que está elevada a la n
$
  1/(b-a)^n=(1/(b-a))^n
$

*Marcar e.*

#pagebreak()

// Aparece en:
// p1sol2 - exam2 - question 7
// Similar:
// p1sol3 - exam3 - question 7
// p1sol4 - exam4 - question 7
// p1sol5 - exam5 - question 7
= Se toma una muestra aleatoria de tamaño 7 de una población finita de tamaño 79, Calcular para el estimador de la media muestral, su varianza. Los datos son: $0, -6, 51, 46, -6, 14, 1$

- a. Ninguna
- b. 14.2857143
- c. Falta información
- d. 592.9047619
- e. 77.1955567

== Respuesta:
Obtener la suma de los datos:
$
  sum x_i= 0 + (-6) + 51 + 46 + (-6) + 14 + 1 = 100
$
Obtener la suma de cuadrados:
$
  sum x_i^2 =0² + (-6)² + 51² + 46² + (-6)² + 14² + 1² \
  = 0 + 36 + 2601 + 2116 + 36 + 196 + 1 = 4986
$
Aplicar la formula de la varianza muestral corregida $s^2$:
$
  s^2=(sum x_i^2-(sum x_i)^2/n)/(n-1)=\
  (100-(4986^2)/7)/6=592.9047619
$
Obtener la varianza:
$
  (s^2/n) dot ((N-n)/N)=\
  592.9/7 dot ((79-7)/79)=77.1949
$

*Marcar e.*

#pagebreak()

// Aparece en:
// p1sol2 - exam2 - question 8
// Similar:
// p1sol3 - exam3 - question 8
// p1sol4 - exam4 - question 8
// p1sol5 - exam5 - question 8
// p1sol11 - exam11 - question 5
// p1sol13 - exam13 - question 5
// p1sol14 - exam14 - question 5
// recupsol2 - exam2 - question 2
= La cantidad de tiempo que le toma al cajero de un banco con servicio en el automóvil atender a un cliente es una variable aleatoria con una media $mu= 5.28$ minutos y una desviación estándar $sigma= 5.38$ minutos. Si se observa una muestra aleatoria de $58$ clientes, calcule la probabilidad de que el tiempo medio que el cliente pasa en la ventanilla del cajero sea más de $8.7$ minutos;

- a. Información insuficiente
- b. $6.4511315 times 10^(-7)$
- c. Ninguna
- d. $0$
- e. $0.9999994$

== Respuesta:
Obtener el error estándar $sigma_overline(x)$:
$
  sigma_overline(x)=sigma/sqrt(n)=5.38/sqrt(58)approx 0.7067
$
Obtener el Z-score:
$
  Z=(X-mu)/sigma_overline(x)=(8.7-5.28)/0.7067approx 4.838d
$
Calcular $P(Z gt 4.838)$ buscando en la tabla Z (en el área de la derecha) el valor 4.838 (cuando $Z gt 3$, las probabilidades son cercanas a $0$). 
$
  P(Z gt 4.838)approx 6.45 times 10^(-7)
$

*Marcar b.*

En una calculadora de DA normal (probabilidad de distribución acumulada normal), se pueden ingresar los parámetros: 
- Límite inferior: X=8.7
- Límite superior: 1000 (cualquier valor alto)
- $mu=5.28$
- $sigma_overline(x)=0.7067$
$
  D A(8.7,1000,5.28,0.7067)approx 6.511 times 10^(-7)
$

#pagebreak()

// Aparece en:
// p1sol2 - exam2 - question 9
= Una población de fuentes de energía para una computadora personal tiene un voltaje de salida que se distribuye normalmente con media 9 V y desviación estándar de 0.58. Se selecciona una muestra aleatoria de 57 fuentes de energía. ¿Cuál es la distribución de $overline(X)$?

- a. Ninguna
- b. Falta información
- c. $overline(X)~ N( 9, sigma_overline(x)= 0.0101754)$
- d. $overline(X)~ N( 9, sigma_overline(x)= 0.58)$
- e. $overline(X)~ N( 9, sigma_overline(x)= 0.0768229)$

== Respuesta:
Obtener el error estándar $sigma_overline(x)$:
$
  sigma_overline(x)=sigma/sqrt(n)\
  0.58/sqrt(57)approx 0.0768
$

*Marcar e.*

#pagebreak()

// Aparece en:
// p1sol2 - exam2 - question 10
// Similar:
// p1sol3 - exam3 - question 10
// p1sol5 - exam5 - question 10
// p1sol11 - exam11 - question 6
// p1sol13 - exam13 - question 6
// recupsol4 - exam4 - question 2
= Sea $overline(X)$ una v.a. tal que $X~chi^2(v= 14)$. Calcular la probabilidad que X se encuentren entre 6 y 13 (puede usar la aproximación normal)

- a. Falta información
- b. 0.4734764
- c. 0.4899288
- d. Ninguna
- e. 0.0335085

== Respuesta:
Se pide $P(6 lt X lt 13)$\
Usar la tabla chi-cuadrado para encontrar:
- $F(6) approx 1-0.95=0.05$
- $F(13) approx 1-0.5=0.5$
Calcular la probabilidad:
$
  P(6 lt X lt 13)=F(13)-F(6)=0.5-0.005=0.45
$
En la tabla chi cuadrado, hay que buscar los valores que más se aproximen al valor deseado (en este caso, 6 y 13) en la fila de grados de libertad (14) y fijarse en el valor de la cabecera de la columna, después sacar su complemento

*Marcar d.*

#pagebreak()

// Aparece en:
// p1sol3 - exam3 - question 9
// p1sol5 - exam5 - question 9
// p1sol4 - exam4 - question 9
// recupsol3 - exam3 - question 2
// recupsol5 - exam5 - question 2
= Suponga que se toman dos muestras aleatorias independientes de tamaño $n_1$ y $n_2$ de dos poblaciones normales con medias $mu_1$ y $mu_2$ y varianzas $sigma_1^2$ y $sigma_2^2$, respectivamente. Si $overline(X)_1$ y $overline(X)_2$ son las medias de muestra, encuentre la distribución de muestreo de la estadística:

$
  (overline(X)_1-overline(X)_2-(mu_1 -mu_2))/sqrt((sigma_1^2 \/n_1)+(sigma_2^2 \/n_2))
$

- a. $N(0,1)$
- b. $N(mu_1+mu_2,1)$
- c. Falta información
- d. $N(0,sigma_1+sigma_2)$
- e. Ninguna o la información dada es incorrecta

== Respuesta:
Siempre que las poblaciones sean normales, las muestras sean independientes y las varianzas sean conocidas, entonces la expresión siempre sigue una distribución normal estándar
$
  N(0,1)
$

*Marcar a.*

#pagebreak()

// Aparece en:
// p1sol4 - exam4 - question 4
// Similar:
// p1sol3 - exam3 - question 2
// p1sol11 - exam11 - question 2
// p1sol12 - exam12 - question 2
// p1sol13 - exam13 - question 2
// p1sol14 - exam14 - question 2
// p1sol15 - exam15 - question 2
= Si:
$
  f(x,y)=x+y quad 0 lt x lt 1 quad 0 lt y lt 1
$
== Obtenga $E[X]$

- a. $1/3$

- b. Ninguna o la información dada es incorrecta
- c. $7/12$
- d. Falta información
- e. $5/12$

== Respuesta:
Se sabe que la marginal de $f(x,y)$ es:
$
  f_X (x)=x+1/2
$
Calcular la esperanza $E[X]$ integrando el producto de $x$ por la marginal:
$
  E[X]=integral_0^1x(x+1/2) d x=[x^3/3+1/2 dot x^2/2]_0^1=1/3+1/4=7/12
$

*Marcar la c.*

#line(length: 100%)
_Caso alterno:_

== Obtenga $E[X^2]$

== Respuesta:
Se sabe que la marginal de $f(x,y)$ es:
$
  f_X (x)=x+1/2
$
Calcular la esperanza $E[X^2]$ integrando el producto de $x^2$ por la marginal:
$
  E[X]=integral_0^1x^2(x+1/2) d x=[x^4/4+1/2 dot x^
  3/3]_0^1=1/4+1/6=5/12
$

*Marcar la e.*

#line(length: 100%)
_Caso alterno:_

== Obtenga $E[X Y]$

== Respuesta:
$
  E[X Y]=integral_(x=0)^1 integral_(y=0)^1x y(x+y)d y d x=integral_(0)^1(x^2/2+x/3)d x=2/6=1/3
$

*Marcar la a.*

#pagebreak()

// Aparece en:
// p1sol4 - exam4 - question 10
// Similar:
// p1sol12 - exam12 - question 5
// p1sol15 - exam15 - question 5
// recupsol1 - exam1 - question 2
= La distribución de alturas de cierta raza de perros terrier tiene una media de $70.43$ centímetros y una desviación estándar de $13.81$ centímetros; en tanto que la distribución de alturas de cierta raza de poodles tiene una media de $41.28$ centímetros con una desviación estándar de $10.1$ centímetros. Calcule la probabilidad de que la media muestral de una muestra aleatoria de alturas de $67$ terriers exceda la media muestral para una muestra aleatoria de alturas de $42$ poodles a lo sumo $29.55$ centímetros.

- a. Ninguna
- b. $0.5691281$
- c. $0.4308719$
- d. $1.1382563$
- e. Información insuficiente

== Respuesta:
Obtener el error estándar $sigma_overline(x)$:
$
  sigma_overline(x)=sqrt(sigma^2_1/n_1+sigma^2_2/n_2)=sqrt(13.81^2/67+10.1^2/42)approx 2.2970
$
Obtener la diferencia de la media $mu$:
$
  mu=mu_1-mu_2=70.43-41.28=29.15
$
Obtener el Z-score:
$
  Z=(X-mu)/sigma_overline(x)=(29.55-29.15)/2.2970approx 0.1742
$
Calcular $P(Z gt 0.1742)$ buscando en la tabla Z (en el área de la derecha) 0.1742:
$
  P(Z gt 0.1742)approx 0.433 arrow 1-0.433=0.567
$

*Marcar b.*

En una calculadora de DA normal (probabilidad de distribución acumulada normal), se pueden ingresar los parámetros: 
- Límite inferior: -1000 (cualquier valor bajo)
- Límite superior: X= 29.55
- $mu=29.15$
- $sigma_overline(x)=2.2970$
$
  D A(-1000,29.55,29.15,2.2970)approx 0.569122
$



#pagebreak()

// Aparece en:
// p1sol9 - exam9 - question 1
= Identifique las sentencias correctas

- a. El coeficiente de variación es una medida de dispersión relativa
- b. La varianza puede ser negativa
- c. La mediana siempre es mayor a la moda
- d. La media aritmética es un estadístico de tendencia central
- e. El coeficiente de variación es una medida de dispersión absoluta

== Respuesta:

La media aritmética es un estadístico de tendencia central.\
El coeficiente de variación es una medida de dispersión relativa.

*Marcar a. y d.*

#pagebreak()

// Aparece en:
// p1sol9 - exam9 - question 3
// Similar:
// p1sol10 - exam10 - question 3
= La probabilidad de 3 jugadores de que conviertan un penal son respectivamente 0.18, 0.58 y 0.38. Si cada uno cobra una unica vez, ¿Cuál es la probabilidad que solo uno de ellos convierta?

- a. 0.58
- b. 0.18
- c. 0.2233659
- d. 0.472616
- e. 0.38

== Respuesta:

Multiplicar las probabilidades de que cada uno anote y los otros fallen:
- El jugador 1 anota:
$
  (0.18)(1-0.58)(1-0.38)=0.046872
$
- El jugador 2 anota:
$
  (1-0.18)(0.58)(1-0.38)=0.294872
$
- El jugador 3 anota:
$
  (1-0.18)(1-0.58)(0.38)=0.130872
$
Sumar los resultados:
$
  0.046872+0.294872+0.130872=0.472616
$

*Marcar d.*

#pagebreak()

// Aparece en:
// p1sol9 - exam9 - question 4
= En una carrera de la UMSA los estudiantes se dividen en 3 grupos; los académicos (11%), los políticos (45%) y el resto (44%). El próximo año se realiza una elección para la dirección de carrera y se obtuvo mediante una encuesta que para el candidato X el 37% de los académicos lo apoyan, el 7% de los políticos y el 56% del resto de los estudiantes. Según la encuesta, que probabilidad de apoyo se espera que tenga el candidato X

- a. Falta información
- b. Ninguno
- c. 0.101506
- d. 0.3186
- e. 0.6372

== Respuesta:
Multiplicar los porcentajes de cada grupo que lo apoya:
- Académicos:
$
  0.11 times 0.37=0.0407
$
- Políticos:
$
  0.45 times 0.07=0.0315
$
- Resto:
$
  0.44 times 0.56=0.2464
$
Sumar todos los resultados:
$
  0.0407 + 0.0315 + 0.2464 = 0.3186
$

*Marcar d.*

#pagebreak()

// Aparece en:
// p1sol9 - exam9 - question 5
= Sea a, b constantes y X una variable aleatoria. Identifique la veracidad de las siguientes propiedades:
\
- a. $P(|X- mu | gt.eq k)lt.eq ("Var"[X])/k$

- b. $E[a]=0, " con "a=0$
- c. $E[a^2X+b]=a E[X]+b$
- d. $"Var"[X]=E[X^2]-(E[X])^2$
- e. $"Var"[a X-b]=a^2"Var"[X]$

== Respuesta:
Por propiedades:
$
  "Var"[X]=E[X^2]-(E[X])^2\
  "Var"[a X-b]=a^2"Var"[X]\
  "Si "a=0", entonces "E[a]=0
$
En desigualdades, el denominador debe ser $k^2$, no solo $k$.\
Sobre la esperanza, $E[a^2X]eq a^2 E[X]$, no $a E[X]$

*Marcar b. d. y e.*

#pagebreak()

// Aparece en:
// p1sol10 - exam10 - question 1
= De la siguiente serie de números: $11, 10, 12, 14, 9, 10$. Determine el coeficiente de asimetria de Fisher.

- a. 11
- b. 1.0481569
- c. 0.2746582
- d. 0.5240784
- e. 1.7888544

== Respuesta:
Encontrar la media de los números:
$
  overline(x)=(sum x_i)/n=66/6=11
$
Calcular las desviaciones y sumar al cubo:
- $11 - 11 = 0$
- $10 - 11 = -1$
- $12 - 11 = 1$
- $14 - 11 = 3$
- $9 - 11 = -2$
- $10 - 11 = -1$
$
  "Suma de cubos"=0^3 -1^3+ 1^3+ 3^3 -2^3 -1^3=18\
$
Calcular el cubo de la desviación estándar $(s^3)$: 
$
  s^3approx 1.78885^3approx 5.72429
$
Aplicar la fórmula del coeficiente de Fisher:
$
  "Coeficiente de Fisher"="Suma de cubos"/(n dot s^3)=18/(6 dot 5.72429) approx 0.524082
$

*Marcar d.*

#pagebreak()

// Aparece en:
// p1sol10 - exam10 - question 5
= Juan y Maria juegan el siguiente juego. Juan arroja dos dados legales y Maria le paga k bolivianos, donde k es el producto de los dos números que muestran los dados. ¿Cuánto debe pagar Juan a Maria por cada juego para que este sea parejo?

- a. 15
- b. 7
- c. 6
- d. Ninguno
- e. 12.25

== Respuesta:
Sumar la esperanza de lanzar un dado:
$
  E[X]=1/6+2/6+3/6+4/6+5/6+6/6=7/2
$
Como son dos dados, multiplicar la esperanza por dos:
$
  7/2 times 2=14/2=7
$

*Marcar b.*

#pagebreak()

// Aparece en:
// p1sol12 - exam12 - question 6
// Similar:
// p1sol14 - exam14 - question 6
// p1sol15 - exam15 - question 6
// finalsol1 - exam1 - question 2
// finalsol2 - exam2 - question 2
// finalsol3 - exam3 - question 2
// finalsol4 - exam4 - question 2
// finalsol5 - exam5 - question 2
= Un especialista en adquisiciones ha comprado $27$ resistores al vendedor 1 y $44$ al vendedor 2, si las resistencias de los vendedores se distribuyen como normales e independientes con $mu_1= 94.45$ y $mu_2= 91.1$ y $sigma_1= 2.37$ y $sigma_2= 1.42$. Encuentre el error estándar de $overline(X)_1-overline(X)_2$.

- a. Falta información
- b. 9.6685826
- c. Ninguna
- d. 0.3464831
- e. 0.5038458

== Respuesta:
Obtener el error estándar $sigma_overline(x)$:
$
  sigma_overline(x)=sqrt(sigma^2_1/n_1+sigma^2_2/n_2)=sqrt(2.37^2/27+1.42^2/44)approx 0.5038458
$

*Marcar e.*

#pagebreak()

// Aparece en:
// p1sol14 - exam14 - question 1
// p1sol15 - exam15 - question 1
= Debe responder de forma correcta todas las sentencias para que la pregunta sea considerada correcta. Determine la veracidad de las siguientes sentencias:

- a. Para el caso continuo $integral_("Rx")f(x,y)d x=f(y)$

- b. $f(x,y)=f(x)times f(y)$ siempre
- c. Para el caso discreto si la variable $X$ toma 3 valores y la variable $Y$ toma 10 valores, entonces su distribución conjunta tiene 31 combinaciones
- d. Si dos variables aleatorias $X, Y$ son independientes, entonces $"cov"(x,y)=0$
- e. Para el caso continuo $integral_("Rx")f(x,y)d x=f(x)$

== Respuesta:
Para el caso continuo $integral_("Rx")f(x,y)d x=f(y)$.\  
Si dos variables aleatorias $X, Y$ son independientes, entonces $"cov"(x,y)=0$.

*Marcar a. y d.*

#pagebreak()

// Aparece en:
// p2sol1 - exam1 - question 1
// p2sol4 - exam4 - question 1
// recupsol2 - exam2 - question 3
// recupsol4 - exam4 - question 3
= Entre los métodos de momentos y máxima verosimilitud cúal de ellos emplea un proceso de optimización para en encontrar la estimación

- a. Momentos
- b. Depende
- c. Ninguno
- d. Maxima Verosimilitud
- e. Ambos

== Respuesta:
El método de máxima verosimilitud.

*Marcar d.*

#pagebreak()

// Aparece en:
// p2sol1 - exam1 - question 2
// p2sol3 - exam3 - question 2
// p2sol5 - exam5 - question 2
// recupsol1 - exam1 - question 3
// recupsol5 - exam5 - question 3
= Entre los métodos de momentos y máxima verosimilitud cúal de ellos emplea un proceso basada en comparar las esperanzas con sus equivalentes de la muestra según sus potencias, para en encontrar la estimación

- a. Momentos
- b. Ninguno
- c. Ambos
- d. Depende
- e. Maxima Verosimilitud

== Respuesta:
El método de momentos.

*Marcar a.*

#pagebreak()

// Aparece en:
// p2sol1 - exam1 - question 3
// p2sol2 - exam2 - question 3
// p2sol3 - exam3 - question 3
// p2sol4 - exam4 - question 3
// p2sol5 - exam5 - question 3
= La media muestral de una muestra tomada de una población normal con desviación estándar de 29, siempre es: (Seleccione una o más de una)

- a. Todas
- b. Un estimador sesgado de la media muestral
- c. Un estimador insesgado de la media poblacional
- d. Un estimador sesgado de la media poblacional
- e. Un estimador insesgado de la media muestral

== Respuesta:
Un estimador insesgado de la media poblacional.

*Marcar c.*

#pagebreak()

// Aparece en:
// p2sol1 - exam1 - question 4
// Similar:
// p2sol2 - exam2 - question 4
// p2sol3 - exam3 - question 4
// p2sol4 - exam4 - question 4
// p2sol5 - exam5 - question 4
// finalsol2 - exam2 - question 4
// finalsol3 - exam3 - question 4
// finalsol4 - exam4 - question 4
= Una muestra aleatoria de tamaño $56$ de una población normal tiene media $overline(X)= 604.29$ y una varianza muestral de $hat(S)^2= 68.11$. Encuentre un intervalo de confianza al 99% de confiabilidad

- a. $602.128439, 606.451561$
- b. $601.4446799, 607.1353201$
- c. Falta información
- d. $602.4813469, 606.0986531$
- e. Ninguna

== Respuesta:
Obtener la desviación estándar muestral:
$
  s=sqrt(hat(S)^2)\
  s=sqrt(68.11)approx 8.2528
$
Obtener el error estándar:
$
  sigma_(overline(X))=s/sqrt(n)\
  sigma_(overline(X))=8.2528/sqrt(56)=1.1028
$
Obtener el valor crítico $z$ para el porcentaje de confianza:
- Obtener el valor que buscar en las tablas:
$
  (1- "Porcentaje de confianza")/2\
  (1- 0.99)/2=0.005
$
- Buscar el valor más cercano en la tabla de distribución normal

$
  "Para "0.005", "z approx 2.575
$

Obtener el margen de error:
$
  "Margen de error"=z times "error estándar"\
  2.575 times 1.1028=2.83971
$
Obtener el límite inferior y superior sumando y restando la media poblacional $overline(X)$ al margen de error:
$
  "Margen inferior"=604.29-2.83971=601.45029\
  "Margen superior"=604.29+2.83971=607.12971
$

*Marcar b.*

#pagebreak()

// Aparece en:
// p2sol1 - exam1 - question 5
// Similar:
// p2sol2 - exam2 - question 5
// p2sol3 - exam3 - question 5
// p2sol4 - exam4 - question 5
// p2sol5 - exam5 - question 5
// recupsol2 - exam2 - question 4
// recupsol3 - exam3 - question 4
// finalsol1 - exam1 - question 4
= Se extraen muestras aleatorias de tamaños $n_1=n_2= 63$ de dos poblaciones normales independientes. Las varianzas muestrales son $hat(S)_1^2= 13.75$ y $hat(S)_2^2= 50.09$. Construye un intervalo de confianza de dos lados del 95% respecto al cociente de las varianzas de las poblaciones $sigma_1^2\/sigma_2^2$. Use como $F_(1-alpha \/2, n_2-1, n_1-1)=0.6050539$ y $F_(alpha \/2, n_2-1, n_1-1)=1.6527452$
\
- a. $0.1660909, 0.4536883$
- b. Ninguna
- c. $0.0332182, 0.0907377$
- d. $0.3660909, 0.6536883$
- e. Falta información

== Respuesta:
Dividir las varianzas muestrales:
$
  hat(S)^2_1/hat(S)^2_2=13.75/50.09approx 0.2745
$
Dividir el resultado obtenido por los valores dados de $F_(1-alpha \/2, n_2-1, n_1-1)=0.6050539$ y $F_(alpha \/2, n_2-1, n_1-1)=1.6527452$:
- Por $F_(alpha \/2, n_2-1, n_1-1)$: 
$
  0.2745/1.6527452approx 0.166087
$
- Por $F_(1-alpha \/2, n_2-1, n_1-1)$: 
$
  0.2745/0.6050539approx 0.453678
$

*Marcar a.*

#pagebreak()

// Aparece en:
// p2sol1 - exam1 - question 6
// Similar:
// p2sol4 - exam4 - question 6
// p2sol5 - exam5 - question 6
// recupsol4 - exam4 - question 4
// recupsol5 - exam5 - question 4
= Se lleva a cabo un estudio para determinar el porcentaje de propietarios de casa que poseen al menos dos aparatos de televisión. ¿Qué tan grande debe ser la muestra si se desea tener una confianza del 95% de que el error al estimar está cantidad sea menor que 0.07? (asuma máxima varianza)

- a. Falta información
- b. $16577$
- c. $196$
- d. $24$
- e. $340$

== Respuesta:
Obtener el valor crítico $z$ para el porcentaje de confianza:
- Obtener el valor que buscar en las tablas:
$
  (1- "Porcentaje de confianza")/2\
  (1- 0.95)/2=0.025
$
- Buscar el valor más cercano en la tabla de distribución normal

$
  "Para "0.025", "z approx 1.96
$
Obtener el tamaño de la muestra usando la fórmula con el error máximo permitido $E=0.07$:
$
  n=(z^2 dot 0.5 dot 0.5)/E^2\
  n=(1.96^2 dot 0.025)/0.07^2=196
$
*Marcar c.*

#pagebreak()

// Aparece en:
// p2sol1 - exam1 - question 7
// Similar:
// p2sol2 - exam2 - question 7
// p2sol3 - exam3 - question 7
// p2sol4 - exam4 - question 7
// p2sol5 - exam5 - question 7
// recupsol1 - exam1 - question 4
// finalsol5 - exam5 - question 4
= El voltaje de salida de dos tipos diferentes de transformadores se está investigando. 29 transformadores de cada tipo se seleccionan al azar y se mide el voltaje. Las medias de muestras son 10.7 y 10.4 volts respectivamente. Sabemos que las varianzas del voltaje de salida para los dos tipos de transformadores son 0.2 y 0.1 respectivamente, Construya un intervalo de confianza de dos lados del 95% respecto la diferencia en el voltaje medio.

- a. $0.1006493, 0.4993507$
- b. $0.1331964, 0.4668036$
- c. Falta información
- d. Ninguna
- e. $0.0375894, 0.5624106$

== Respuesta:
Obtener la diferencia de las medias:
$
  overline(X)_1-overline(X)_2=10.7-10.4=0.3
$
Obtener el error estándar $"SE"$ con la fórmula:
$
  "SE"=sqrt((sigma^2_1+sigma^2_2)/n)\
  "SE"=sqrt((0.2+0.1)/29)approx\ 0.101709
$
Obtener el valor crítico $z$ para el porcentaje de confianza:
- Obtener el valor que buscar en las tablas:
$
  (1- "Porcentaje de confianza")/2\
  (1- 0.95)/2=0.025
$
- Buscar el valor más cercano en la tabla de distribución normal

$
  "Para "0.025", "z approx 1.96
$
Obtener el margen de error $"ME"$ con la fórmula:
$
  "ME"=z times "SE"\
  "ME"=1.96 times 0.101709approx 0.199349
$
Obtener el límite inferior y superior sumando y restando la diferencia de las medias poblacionales ($0.3$) al margen de error:
$
  "Margen inferior"=0.3-0.199349=0.10065036\
  "Margen superior"=0.3+0.199349=0.49934964
$

*Marcar a.*

#pagebreak()

// Aparece en:
// p2sol1 - exam1 - question 8
// Similar:
// p2sol2 - exam2 - question 8
// p2sol3 - exam3 - question 8
// p2sol4 - exam4 - question 8
// p2sol5 - exam5 - question 8
// p2sol1 - exam1 - question 10
// p2sol2 - exam2 - question 10
// p2sol3 - exam3 - question 10
// p2sol4 - exam4 - question 10
= Se está estudiando el rendimiento de un proceso químico. De la experiencia previa se sabe que la varianza del rendimiento con este proceso es 5. Los últimos seis días de operación de la planta han dado como resultado los siguientes rendimientos (en porcentajes):
#grid(
    columns: (auto),
    inset: 0.5em,
    stroke: 0.1em + black,
    [x],
    [89.49],
    [88.43],
    [90.25],
    [89.35],
    [93.09],
    [91.26]
)

== ¿Hay razón para creer que el rendimiento es menor al 90%? (asuma un error de tipo I del 1%)

- a. Ejercicio mal planteado
- b. Ninguna
- c. No se rechaza $H_0$
- d. Falta información
- e. Se rechaza $H_0$

== Respuesta:
Obtener la media de los datos $overline(x)$:
$
  overline(x)=(sum x_i)/n approx 90.31166
$

Si la media muestral $overline(X)$ es mayor que el valor de prueba (90%), y la hipótesis pregunta si es "menor", automáticamente no se rechaza $H_0$\
Como $90.31166 gt 90$, entonces no se rechaza $H_0$

*Marcar c.*

En otros casos:\
Obtener  $z$ directamente con la fórmula:
$
  z=(overline(x)-mu_0)/(sigma \/sqrt(n))\
  (90.31166-90)/(sqrt(5)\/sqrt(6))approx 0.341406
$
(Donde $mu$ es el valor del porcentaje y $sigma$ es la raiz de la varianza $5$)\
Como se indica que el error es del 1%, obtener el valor crítico para 0.01 buscando el valor más cercano en la tabla de distribución normal

$
  "Para "0.01", "z approx 2.325
$

Multiplicar el valor crítico  por -1 y comparar con el $z$ obtenido en la fórmula, si $z$ es mayor que el punto crítico, $H_0$ no se rechaza
$
  0.341406 gt -2.325
$
Si $z$ fuera menor que el punto crítico, $H_0$ se rechazaría

_*En general, marcar siempre que $H_0$ no se rechaza*_

#line(length: 100%)
_Caso alterno:_

== Se está estudiando el rendimiento de un proceso químico. De la experiencia previa se sabe que la varianza del rendimiento con este proceso es 5. Los últimos diez días de operación de la planta han dado como resultado los siguientes rendimientos (en porcentajes):
$
  86.58, 86.18, 90.49, 91.28, 86.14, 90.39, 89.65, 90.68, 90.62, 90.37, 86.8, 90.09
$
== ¿Hay razón para creer que el rendimiento es menor al 89%? (asuma un error de tipo I del 1%). Trabaje con el estadístico $z_0$.

== Respuesta:
No se rechaza $H_0$.

*Marcar c.*

#pagebreak()

// Aparece en:
// p2sol1 - exam1 - question 9
// Similar:
// p2sol2 - exam2 - question 9
// p2sol4 - exam4 - question 9
// p2sol5 - exam5 - question 9
// recupsol1 - exam1 - question 5
// recupsol2 - exam2 - question 5
= Se están investigando dos métodos para producir gasolina a partir de petróleo crudo. Se supone que el rendimiento de ambos procesos se distribuye normalmente, los siguientes datos se han obtenido de la planta piloto:
Rendimientos
#grid(
    columns: (auto, auto),
    inset: 0.5em,
    stroke: 0.1em + black,
    [$x_1$], [$x_2$],
    [23], [22],
    [27], [25],
    [24], [24],
    [23], [25],
    [25], [23],
    [26], [23],
    [24], [24],
    [26], [24],
    [26], [23],
    [25], [21],
    [24], [22]
)

== Suponer igualdad de varianzas, encontrar el valor de $t_0$

- a. Falta in formación
- b. Ninguna
- c. 2.7872598
- d. 2.5085338
- e. 3.7872598

== Respuesta:
Calcular la media para cada $x$:
- Para $x_1$:
$
  overline(x)_1=(sum x_1_i)/n=273/11approx 24.81818
$
- Para $x_2$:
$
  overline(x)_12=(sum x_2_i)/n=256/11approx 23.27272
$
Calcular la varianza muestral $s^2$ para cada $x$:
- Para $x_1$:
$
  s^2_1=(sum (x_1_i-overline(x)_1)^2)/(n-1)approx 1.76363
$
- Para $x_2$:
$
  s^2_1=(sum (x_1_i-overline(x)_1)^2)/(n-1)approx 1.61818
$
Calcular la raiz de la varianza agrupada $sqrt(s^2_p)$:
$
  s^2_p=((n_1-1)s_1^2+(n_2-1)s_2^2)/(n_1+n_2-2)\
  =(10 dot 1.76363 + 10 dot 1.61818)/20= 33.8181/20approx 1.690905\
  sqrt(s^2_2)=sqrt(1.680905)approx 1.300348
$
Calcular el error estándar:
$
  "SE"=s_p dot sqrt(1/n_1+1/n_2)\
  =1.300348 dot sqrt(2/11)approx 0.55447
$
Calcular $t_0$:
$
  t_0=(overline(x)_1-overline(x)_2)/"SE"\
  =(24.81818-23.27272)/0.55447approx 2.787274
$

*Marcar c.*\
_*En general, siempre marcar la respuesta numérica que esté entre las otras dos*_

#pagebreak()

// Aparece en:
// p2sol2 - exam2 - question 1
// p2sol3 - exam3 - question 1
// p2sol5 - exam5 - question 1
// recupsol3 - exam3 - question 3
= Suponga que $hat(theta)_1$ y $hat(theta)_2$ son estimadores de $theta$. Se sabe que $hat(theta)_1$ es insesgado y que $E[hat(theta)_2]=theta \/2$, suponiendo que $V(hat(theta)_1)=V(hat(theta)_2)$, que estimador logra un menor error cuadrático medio.

- a. Ambos
- b. $hat(theta)_1$
- c. Ninguna
- d. Falta información
- e. $hat(theta)_2$

== Respuesta:
Ya que $E[hat(theta_2)]=theta\/2$, entonces $hat(theta)_1$ es más pequeño.

*Marcar b.*

#pagebreak()

// Aparece en:
// p2sol2 - exam2 - question 2
// p2sol4 - exam4 - question 2
= Supongase que la variable aleatoria X tiene la distribución de probabilidad
$
  f(x)=(gamma +2)X^gamma quad 0 lt X lt 1
$

Sea $X_1,X_2,dots,X_n$ un muestra aleatoria de tamaño n. Obtenga el estimador de máxima verosimilitud de $gamma$

- a. $hat(gamma)=overline(X)$

- b. $hat(gamma)=-1+n/(sum_(i=1)^n ln X_i)$
- c. Ninguno
- d. $hat(gamma)=-1-n/(sum_(i=1)^n ln X_i)$
- e. No es una función de probabilidad

== Respuesta:
Integrar de 0 a 1:
$
  
  integral_0^1(gamma +2)X^gamma d x=(gamma + 2)integral_0^1X^gamma d x =(gamma+2) dot lr(x^(gamma+1)/(gamma+1)|)_0^1 =(gamma+2)dot 1/(gamma+1)=(gamma+2)/(gamma+1)
$
Como $(gamma+2)/(gamma+1) eq.not 1$, la función no es una función de probabilidad.

*Marcar e.*

#pagebreak()

// Aparece en:
// p2sol2 - exam2 - question 6
// Similar:
// p2sol3 - exam3 - question 6
= Una carrera en la universidad esta a punto de elegir a sus autoridades, se busca hacer una encuesta de intención de votos en los estudiantes para el candidato “Z”, se quiere un nivel de confianza del 95%, y no errar en $plus.minus 0.04%$. Calcular el tamaño de muestra, suponiendo “n” máxima.

- a. Falta información
- b. $601$
- c. Ninguna
- d. $811$
- e. $751$

== Respuesta:
Obtener el valor crítico $z$ para el porcentaje de confianza:
- Obtener el valor que buscar en las tablas:
$
  (1- "Porcentaje de confianza")/2\
  (1- 0.95)/2=0.025
$
- Buscar el valor más cercano en la tabla de distribución normal

$
  "Para "0.025", "z approx 1.96
$
Obtener el tamaño de la muestra usando la fórmula con el error máximo permitido $E=0.04$:
$
  n=(z^2dot 0.5 dot 0.5)/E^2\
  n=(1.96^2dot 0.5 dot 0.5)/0.04^2 approx 600.25\
$
*Marcar b.*

#pagebreak()

// Aparece en:
// p2sol3 - exam3 - question 9
// Similar:
// recupsol3 - exam3 - question 5
// recupsol5 - exam5 - question 5
= Un fabricante de propulsores está investigando la desviación lateral en yardas de cierto tipo de proyectil mortero. Se han observado los siguientes datos:
#grid(
    columns: (auto),
    inset: 0.5em,
    stroke: 0.1em + black,
    [x],
    [-1.673025],
    [-4.885796],
    [-2.698088],
    [10.352116],
    [0.947634],
    [-6.135548],
    [2.923138],
    [-9.472094],
    [7.109478],
    [9.717690],
    [4.470182],
    [10.325810],
    [-7.648696]
)

== Pruebe la hipótesis de que la desviación lateral media de estos proyectiles de mortero es cero. Suponer que los datos son normales. El valor de tablas corresponde a $t_(alpha\/2,n-1)= 2.1788128$

- a. No se rechaza $H_0$
- b. Ejercicio mal planteado
- c. Falta información
- d. Ninguna
- e. Se rechaza $H_0$

== Respuesta:
No se rechaza $H_0$.

*Marcar a.*

#pagebreak()

// Aparece en: 
// p2sol5 - exam5 - question 10
// recupsol4 - exam4 - question 5
= Seleccione los supuestos correctos para la prueba de hipótesis de igualdad de dos varianzas

- a. La estadística de prueba se distribuye como una F de Fisher
- b. El tamaño de muestra de ambas poblaciones son iguales
- c. Las variables de las dos poblaciones se distribuyen como t student
- d. Las variables de las dos poblaciones se distribuyen como normal
- e. Las variables de las dos poblaciones se distribuyen como chi cuadrado

== Respuesta:
La estadística de prueba se distribuye como una F de Fisher\
Las variables de las dos poblaciones se distribuyen como normal

*Marcar a. y d.*

#pagebreak()

// Aparece en: 
// recupsol1 - exam1 - question 6
// Similar:
// recupsol3 - exam3 - question 6
// recupsol4 - exam4 - question 6
// recupsol5 - exam5 - question 6
// finalsol1 - exam1 - question 6
// finalsol2 - exam2 - question 6
// finalsol3 - exam3 - question 6
// finalsol4 - exam4 - question 6
// finalsol5 - exam5 - question 6
= Para la prueba de hipótesis de la media (con dos colas). Si se toma la razon $delta\/sigma=1.05$, un error de tipo I del 5% y un error de tipo II del 10%. ¿Cuál es el tamaño de la muestra?

- a. 7.7
- b. 11
- c. 22
- d. Falta información
- e. Ninguna

== Respuesta:
Se sabe que:
- Para error tipo I del 5%:
$
  z_(alpha\/2)=1.96
$
- Para error tipo II del 10%:
$
  z_(beta)=1.28
$
Aplicar la fórmula:
$
  n=((z_(alpha\/2)+z_beta)/(delta\/sigma))^2\
  =(3.24/1.05)^2approx 9.52163
$

*Marcar e.*

#pagebreak()

// Aparece en: 
// recupsol2 - exam2 - question 6
// Similar:
// finalsol1 - exam1 - question 5
// finalsol2 - exam2 - question 5
// finalsol3 - exam3 - question 5
// finalsol4 - exam4 - question 5
// finalsol5 - exam5 - question 5
= Deseamos que el ancho total del intervalo de confianza respecto a la vida media sea de 9.49 horas. Si se sabe que $sigma= 24.76$. ¿Cuál debe ser el tamaño de muestra? Tome un nivel de confiabilidad del 95%

- a. Falta información
- b. 157.5
- c. Ninguna
- d. 52.5
- e. 105

== Respuesta:
Se sabe que el z-score para 95% de confianza es:
$
  Z=1.96
$
Aplicar la fórmula:
$
  n=((2 dot Z dot sigma)/"ancho")^2=((2 dot 1.96dot 24.76)/9.49)^2approx 104.60224
$

*Marcar e.*

#pagebreak()

// Aparece en: 
// finalsol1 - exam1 - question 1
// Similar:
// finalsol2 - exam2 - question 1
// finalsol3 - exam3 - question 1
// finalsol4 - exam4 - question 1
// finalsol5 - exam5 - question 1
= Dada la siguiente tabla de probabilidades de las variables X e Y, obtenga la covarianza.

#grid(
  inset: 0.5em,
  stroke: 0.1em + black,
  columns: (24pt, 24pt, 35pt, 35pt, 35pt, 35pt),
  [], [y], [1], [2], [3], [4],
  [x],[], [], [], [], [],
  [1],[], [0.05], [0.16], [0.03], [0.00],
  [2],[], [0.00], [0.18], [0.20], [0.11],
  [3],[], [0.00], [0.00], [0.10], [0.16],
)

- a. Falta información
- b. 1.4360656
- c. Ninguna
- d. 0.6759133
- e. 0.48

== Respuesta:
Sumar las probabilidades para cada fila de X:

- $P(X=1) = 0.05 + 0.16 + 0.03 + 0.00 quad = 0.24 $
- $P(X=2) = 0.00 + 0.18 + 0.20 + 0.11 quad = 0.49 $
- $P(X=3) = 0.00 + 0.00 + 0.10 + 0.16 quad = 0.26$
Calcular $E[X]$ multiplicando el valor de x para cada resultado de las sumas y hacer la suma de productos:
$
  E[X]=(1 dot 0.24)+(2 dot 0.49)+(3 dot 0.26)=2
$
Sumar las probabilidades para cada fila de Y:

- $P(Y=1) = 0.05 + 0.00 + 0.00 quad = 0.05$
- $P(Y=2) = 0.16 + 0.18 + 0.00 quad = 0.34$
- $P(Y=3) = 0.03 + 0.20 + 0.10 quad = 0.33$
- $P(Y=4) = 0.00 + 0.11 + 0.16 quad = 0.27$

Calcular $E[Y]$ multiplicando el valor de y para cada resultado de las sumas y hacer la suma de productos:
$
  E[Y]=(1 dot 0.05)+(2 dot 0.34)+(3 dot 0.33)+(4 dot 0.27)=2.8
$
Calcular $E[X Y]$ multiplicando cada valor de $x$, $y$ y el valor que apuntan en la tabla
$
  E[X Y]=\
  (1 dot 1 dot 0.05)+(1 dot 2 dot 0.16)+(1 dot 3 dot 0.03)+(1 dot 4 dot 0.00)\
  +(2 dot 1 dot 0.00)+(2 dot 2 dot 0.18)+(2 dot 3 dot 0.20)+(2 dot 4 dot 0.11)\
  +(3 dot 1 dot 0.00)+(3 dot 2 dot 0.00)+(3 dot 3 dot 0.10)+(3 dot 4 dot 0.16)\
  =0.46+2.8+2.82=6.08
$
Aplicar la fórmula de la covarianza:
$
  "Cov"(X,Y)=E[X Y]-E[X]dot E[Y]=6.08-2 dot 2.8=0.48
$
*Marcar e.*
#pagebreak()

// Aparece en: 
// finalsol1 - exam1 - question 3
// finalsol3 - exam3 - question 3
// finalsol4 - exam4 - question 3
// Similar:
// finalsol2 - exam2 - question 3
// finalsol5 - exam5 - question 3
= Encuentre el estimador de máxima verosimilitud del parámetro $lambda$ de la distribución de Poisson. Basado en una muestra aleatoria de tamaño n

- a. Ninguna
- b. $hat(lambda)=overline(x)^2$
- c. $hat(lambda)=1/overline(x)$
- d. Falta información
- e. $hat(lambda)=overline(x)$

== Respuesta:
Para la distribución de Poisson, el estimador de máxima verosimilitud es:
$
 hat(lambda)=overline(x) 
$

*Marcar e.*

#line(length: 100%)
_Caso alterno:_

== Encuentre el estimador de máxima verosimilitud del parámetro $lambda$ de la distribución exponencial. Basado en una muestra aleatoria de tamaño n

== Respuesta:
Para la distribución exponencial, el estimador de máxima verosimilitud es:
$
 hat(lambda)=1/overline(x) 
$

*Marcar c.*