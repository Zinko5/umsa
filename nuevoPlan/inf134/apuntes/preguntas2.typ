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

// Aparece en:
// p2sol1 - exam1 - question 1
// p2sol4 - exam4 - question 1
=== Entre los métodos de momentos y máxima verosimilitud cúal de ellos emplea un proceso de optimización para en encontrar la estimación

- a. Momentos
- b. Depende
- c. Ninguno
- d. Maxima Verosimilitud
- e. Ambos

=== Respuesta:
El método de máxima verosimilitud.

*Marcar d.*

#pagebreak()

// Aparece en:
// p2sol1 - exam1 - question 2
// p2sol3 - exam3 - question 2
=== Entre los métodos de momentos y máxima verosimilitud cúal de ellos emplea un proceso basada en comparar las esperanzas con sus equivalentes de la muestra según sus potencias, para en encontrar la estimación

- a. Momentos
- b. Ninguno
- c. Ambos
- d. Depende
- e. Maxima Verosimilitud

=== Respuesta:
El método de momentos.

*Marcar a.*

#pagebreak()

// Aparece en:
// p2sol1 - exam1 - question 3
// p2sol2 - exam2 - question 3
// p2sol3 - exam3 - question 3
// p2sol4 - exam4 - question 3
=== La media muestral de una muestra tomada de una población normal con desviación estándar de 29, siempre es: (Seleccione una o más de una)

- a. Todas
- b. Un estimador sesgado de la media muestral
- c. Un estimador insesgado de la media poblacional
- d. Un estimador sesgado de la media poblacional
- e. Un estimador insesgado de la media muestral

=== Respuesta:
Un estimador insesgado de la media poblacional.

*Marcar c.*

#pagebreak()

// Aparece en:
// p2sol1 - exam1 - question 4
// Similar:
// p2sol2 - exam2 - question 4
// p2sol3 - exam3 - question 4
// p2sol4 - exam4 - question 4
=== Una muestra aleatoria de tamaño $56$ de una población normal tiene media $overline(X)= 604.29$ y una varianza muestral de $hat(S)^2= 68.11$. Encuentre un intervalo de confianza al 99% de confiabilidad

- a. $602.128439, 606.451561$
- b. $601.4446799, 607.1353201$
- c. Falta información
- d. $602.4813469, 606.0986531$
- e. Ninguna

=== Respuesta:
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
=== Se extraen muestras aleatorias de tamaños $n_1=n_2= 63$ de dos poblaciones normales independientes. Las varianzas muestrales son $hat(S)_1^2= 13.75$ y $hat(S)_2^2= 50.09$. Construye un intervalo de confianza de dos lados del 95% respecto al cociente de las varianzas de las poblaciones $sigma_1^2\/sigma_2^2$. Use como $F_(1-alpha \/2, n_2-1, n_1-1)=0.6050539$ y $F_(alpha \/2, n_2-1, n_1-1)=1.6527452$
\
- a. $0.1660909, 0.4536883$
- b. Ninguna
- c. $0.0332182, 0.0907377$
- d. $0.3660909, 0.6536883$
- e. Falta información

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
=== Se lleva a cabo un estudio para determinar el porcentaje de propietarios de casa que poseen al menos dos aparatos de televisión. ¿Qué tan grande debe ser la muestra si se desea tener una confianza del 95% de que el error al estimar está cantidad sea menor que 0.07? (asuma máxima varianza)

- a. Falta información
- b. $16577$
- c. $196$
- d. $24$
- e. $340$

=== Respuesta:
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
=== El voltaje de salida de dos tipos diferentes de transformadores se está investigando. 29 transformadores de cada tipo se seleccionan al azar y se mide el voltaje. Las medias de muestras son 10.7 y 10.4 volts respectivamente. Sabemos que las varianzas del voltaje de salida para los dos tipos de transformadores son 0.2 y 0.1 respectivamente, Construya un intervalo de confianza de dos lados del 95% respecto la diferencia en el voltaje medio.

- a. $0.1006493, 0.4993507$
- b. $0.1331964, 0.4668036$
- c. Falta información
- d. Ninguna
- e. $0.0375894, 0.5624106$

=== Respuesta:
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
=== Se está estudiando el rendimiento de un proceso químico. De la experiencia previa se sabe que la varianza del rendimiento con este proceso es 5. Los últimos seis días de operación de la planta han dado como resultado los siguientes rendimientos (en porcentajes):
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

=== ¿Hay razón para creer que el rendimiento es menor al 90%? (asuma un error de tipo I del 1%)

- a. Ejercicio mal planteado
- b. Ninguna
- c. No se rechaza $H_0$
- d. Falta información
- e. Se rechaza $H_0$

=== Respuesta:
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

_*En general, marcar siempre que $H_0$ no se rechazarespuesta numérica que esté entre las otras dos*_

#pagebreak()

// Aparece en:
// p2sol1 - exam1 - question 9
// Similar:
// p2sol2 - exam2 - question 9
// p2sol4 - exam4 - question 9
=== Se están investigando dos métodos para producir gasolina a partir de petróleo crudo. Se supone que el rendimiento de ambos procesos se distribuye normalmente, los siguientes datos se han obtenido de la planta piloto:
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

=== Suponer igualdad de varianzas, encontrar el valor de $t_0$

- a. Falta in formación
- b. Ninguna
- c. 2.7872598
- d. 2.5085338
- e. 3.7872598

=== Respuesta:
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
// p2sol1 - exam1 - question 10
// Similar:
// p2sol2 - exam2 - question 10
// p2sol3 - exam3 - question 10
// p2sol4 - exam4 - question 10
=== Se está estudiando el rendimiento de un proceso químico. De la experiencia previa se sabe que la varianza del rendimiento con este proceso es 5. Los últimos diez días de operación de la planta han dado como resultado los siguientes rendimientos (en porcentajes):
$
  86.58, 86.18, 90.49, 91.28, 86.14, 90.39, 89.65, 90.68, 90.62, 90.37, 86.8, 90.09
$
=== ¿Hay razón para creer que el rendimiento es menor al 89%? (asuma un error de tipo I del 1%). Trabaje con el estadístico $z_0$.

- a. Falta información
- b. Ninguna
- c. Ejercicio mal planteado
- d. Se rechaza $H_0$
- e. No se rechaza $H_0$

=== Respuesta:
No se rechaza $H_0$.

*Marcar e.*

#pagebreak()

// Aparece en:
// p2sol2 - exam2 - question 1
// p2sol3 - exam3 - question 1
=== Suponga que $hat(theta)_1$ y $hat(theta)_2$ son estimadores de $theta$. Se sabe que $hat(theta)_1$ es insesgado y que $E[hat(theta)_2]=theta \/2$, suponiendo que $V(hat(theta)_1)=V(hat(theta)_2)$, que estimador logra un menor error cuadrático medio.

- a. Ambos
- b. $hat(theta)_1$
- c. Ninguna
- d. Falta información
- e. $hat(theta)_2$

=== Respuesta:
Ya que $E[hat(theta_2)]=theta\/2$, entonces $hat(theta)_1$ es más pequeño.

*Marcar b.*

#pagebreak()

// Aparece en:
// p2sol2 - exam2 - question 2
// p2sol4 - exam4 - question 2
=== Supongase que la variable aleatoria X tiene la distribución de probabilidad
$
  f(x)=(gamma +2)X^gamma quad 0 lt X lt 1
$

Sea $X_1,X_2,dots,X_n$ un muestra aleatoria de tamaño n. Obtenga el estimador de máxima verosimilitud de $gamma$

- a. $hat(gamma)=overline(X)$

- b. $hat(gamma)=-1+n/(sum_(i=1)^n ln X_i)$
- c. Ninguno
- d. $hat(gamma)=-1-n/(sum_(i=1)^n ln X_i)$
- e. No es una función de probabilidad

=== Respuesta:
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
=== Una carrera en la universidad esta a punto de elegir a sus autoridades, se busca hacer una encuesta de intención de votos en los estudiantes para el candidato “Z”, se quiere un nivel de confianza del 95%, y no errar en $plus.minus 0.04%$. Calcular el tamaño de muestra, suponiendo “n” máxima.

- a. Falta información
- b. $601$
- c. Ninguna
- d. $811$
- e. $751$

=== Respuesta:
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
=== Un fabricante de propulsores está investigando la desviación lateral en yardas de cierto tipo de proyectil mortero. Se han observado los siguientes datos:
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

=== Pruebe la hipótesis de que la desviación lateral media de estos proyectiles de mortero es cero. Suponer que los datos son normales. El valor de tablas corresponde a $t_(alpha\/2,n-1)= 2.1788128$

- a. No se rechaza $H_0$
- b. Ejercicio mal planteado
- c. Falta información
- d. Ninguna
- e. Se rechaza $H_0$

=== Respuesta:
No se rechaza $H_0$.

*Marcar e.*