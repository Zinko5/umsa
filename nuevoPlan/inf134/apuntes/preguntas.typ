#set page(
  margin: (x: 2.5cm, y: 2.5cm) //Para trabajos digitales e impresos simples
  // margin: (left: 3.8cm, y: 2.5cm, right: 2.5cm) //Para trabajos impresos a doble cara
)
#set text(lang:"es")
#set text(font: "DejaVu Sans")
#show math.equation: set text(font: "DejaVu Math TeX Gyre")
#set par(justify: true)

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
=== Para los números 12, 17, 15, 10, 10, 10, 8, 10. Marque en caso de que la afirmación sea verdadera

- a) La media es 4.5\
- b) La mediana es 10\
- c) La media es 11.5
- d) La desviación estándar es 0.2629318
- e) La desviación estándar es 3.0237158

*Respuesta:*\
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

*Marcar: b), c) y e)*

#pagebreak()

// Aparece en p1sol1 - exam1 - question 2
=== Se tienen los salarios de un grupo de 20 trabajadores para el tiempo t, distribuidos como:

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

=== Si se decide hacer un incremento para el $t+1$ de 400Bs a todos y además incrementar al salario $t$ en 22.39 %. ¿Cuál es el promedio esperado para $t+1$ de estos 20 trabajadores?

- a) 4495.4
- b) 5012.36006
- c) 4095.4
- d) 5412.36006
- e) 20

*Respuesta:*\
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

*Marcar d)*

#pagebreak()

// Aparece en p1sol1 - exam1 - question 3
=== Una urna A contiene 4 bolas rojas y 3 negras, mientras que en la urna B contiene 4 bolas rojas y 6 negras. Si una bola es extraida aleatoriamente de cada urna, ¿cuál es la probabilidad de que las bolas sean del mismo color?

- a) 12/70
- b) 28/70
- c) 4/10
- d) 1/2
- e) 1/5

*Respuesta:*\
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
*Marcar b)*

#pagebreak()

// Aparece en p1sol1 - exam1 - question 4
=== Un número es seleccionado al azar entre los numeros 2 al 20. Sean los eventos:

- A: El número es par
- B: El número es primo
- C: El número elegido es múltiplo de 5

=== Marque en caso de que sean verdaderas las siguientes afirmaciones:

- a. $A union B=1,2,3,4,5,6,7,8,10,11,12,13,14,16,17,18,19,20$
- b. $(A union B) inter C^c=5,10$
- c. $A inter B=2$
- d. $A^c inter B^c=emptyset$
- e. $A^c inter B=3,5,7,11,13,17,19$

*Respuesta:*\
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

// Aparece en p1sol1 - exam1 - question 5
=== Sea X una v.a. con función de distribución acumulada:
$
  F(x)=x/(x+1); x gt.eq 0
$
=== La función de densidad es:
- a. $1/(x+1)^2$

- b. $x/(x+1)^2$
- c. $1/(x+1)+1/(x+1)^2$
- d. $x/(x-1)^2$
- e. $1/(x-1)^2$

*Respuesta:*\
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

// Aparece en p1sol1 - exam1 - question 6
=== Sea X una v.a. con función generatriz de momentos:
$
  M_x (t)=1/4(3e^t+e^(-t))
$
La varianza de X esta definida como:
- a. 1/4
- b. 1/2
- c. 2/4
- d. 3/4
- e. 6/7

*Respuesta:*\
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
//  p1sol2 - exam2 - question 1
//  p1sol3 - exam 3 - question 1
=== Sea (X,Y) va continuas definidas ambas para los reales positivos, con función de densidad:
$
  f(x,y)=1/4(x+y)x y e^(-x-y)
$
=== La marginal $f(x)$ es:
- a. Ninguna.

- b. $f_X (x)=(x^2+2x)/4 e^(x)$
- c. $f_X (x)=(x^2+2x)/4 e^(-x)$
- d. Falta información.
- e. $f_X (x)=(x^2+x)/4 e^(-x)$

*Respuesta:*\
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

*Marcar b.*

#pagebreak()

// Aparece en p1sol2 - exam2 - question 2
=== Para la siguiente tabla de probabilidad conjunta, calcule la esperanza de X

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

*Respuesta:*\

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

// Aparece en p1sol2 - exam2 - question 3
=== Sean dos variables aleatorias $X, Y$, con $E[X]= 7$, $E[Y]= 6$, $E[X,Y]= 45$, la covarianza es:

- a. 87
- b. Falta información
- c. Ninguna o la información dada es incorrecta
- d. 42
- e. 3

*Respuesta:*\
La fórmula de la covarianza es:
$
  "Cov"(X,Y)=E[X Y]-E[X]dot E[Y]=45-7 dot 6=45-42=3
$

*Marcar e.*

#pagebreak()

// Aparece en p1sol2 - exam2 - question 4
=== Si:
$
  f(x,y)=1/8(6-x-y) quad  0 lt.eq x lt.eq 2 quad 2 lt.eq y lt.eq 6
$
=== Encuentre la densidad $f(x)$.

- a. Falta información

- b. $f(x)=6$
- c. Ninguna o la información dada es incorrecta
- d. $f(x)=x^2/3$
- e. $f(x)=x/4+5$

*Respuesta:*\
Para que la función conjunta sea una densidad de probabilidad válida, no debe tomar valores negativos, sin embargo:\
Si $(x,y)=(2,6)$:
$
  f(x,y)=1/8(6-x-y) arrow f(2,6)=1/8(6-2-6)=1/8(-2)=-2/8=-1/4
$
Como la función toma valores negativos, entonces no es una densidad de probabilidad.

*Marcar c.*

#pagebreak()

// Aparece en p1sol2 - exam2 - question 5
=== Sea X una variable aleatoria con varianza finita. Encuentre la correlación entre X y X

- a. $rho =-1$
- b. $rho=0$
- c. Ninguna o la información dada es incorrecta
- d. Falta información
- e. $rho=1$

*Respuesta:*\
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

#pagebreak()

// Aparece en p1sol2 - exam2 - question 6
=== Sea X una va tal que $X ~ U(a,b)$, Se toma una muestra aleatoria de tamaño $n$, encontrar la función de densidad conjunta de la muestra.

- a. $f(x)=1/(b-a)$

- b. $f(x_1,dots,x_n)=1/(b-a)$
- c. Ninguna
- d. $f(x)=1/(a-b)$
- e. $f(x_1,dots,x_n)=1/(b-a)^n$

*Respuesta:*\

La función de densidad conjunta es el producto de las densidades individuales, así que cada densidad se multiplicará $n$ veces (el tamañi de la muestra aleatoria), por lo tanto la respuesta es la única que está elevada a la n
$
  1/(b-a)^n=(1/(b-a))^n
$

*Marcar e.*

#pagebreak()

// Aparece en p1sol2 - exam2 - question 7
=== Se toma una muestra aleatoria de tamaño 7 de una población finita de tamaño 79, Calcular para el estimador de la media muestral, su varianza. Los datos son: $0, -6, 51, 46, -6, 14, 1$

- a. Ninguna
- b. 14.2857143
- c. Falta información
- d. 592.9047619
- e. 77.1955567

*Respuesta:*\
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

// Aparece en p1sol2 - exam2 - question 8
=== La cantidad de tiempo que le toma al cajero de un banco con servicio en el automóvil atender a un cliente es una variable aleatoria con una media $mu= 5.28$ minutos y una desviación estándar $sigma= 5.38$ minutos. Si se observa una muestra aleatoria de 58 clientes, calcule la probabilidad de que el tiempo medio que el cliente pasa en la ventanilla del cajero sea más de 8.7 minutos;

- a. Información insuficiente
- b. $6.4511315 times 10^(-7)$
- c. Ninguna
- d. $0$
- e. $0.9999994$

#pagebreak()

// Aparece en p1sol2 - exam2 - question 9
=== Una población de fuentes de energía para una computadora personal tiene un voltaje de salida que se distribuye normalmente con media 9 V y desviación estándar de 0.58. Se selecciona una muestra aleatoria de 57 fuentes de energía. ¿Cuál es la distribución de $overline(X)$?

- a. Ninguna
- b. Falta información
- c. $overline(X)~ N( 9, sigma_overline(x)= 0.0101754)$
- d. $overline(X)~ N( 9, sigma_overline(x)= 0.58)$
- e. $overline(X)~ N( 9, sigma_overline(x)= 0.0768229)$


#pagebreak()

// Aparece en p1sol2 - exam2 - question 10
=== Sea $overline(X)$ una v.a. tal que $X~chi^2(v= 14)$. Calcular la probabilidad que X se encuentren entre 6 y 13 (puede usar la aproximación normal)

- a. Falta información
- b. 0.4734764
- c. 0.4899288
- d. Ninguna
- e. 0.0335085
