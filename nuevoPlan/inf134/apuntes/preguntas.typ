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

=== Para los números 12, 17, 15, 10, 10, 10, 8, 10. Marque en caso de que la afirmación sea verdadera
// Aparece en p1sol1 - exam1 - question 1

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

=== Se tienen los salarios de un grupo de 20 trabajadores para el tiempo t, distribuidos como:
// Aparece en p1sol1 - exam1 - question 2

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
  overline(x)=(sum x_i)/(n)
$