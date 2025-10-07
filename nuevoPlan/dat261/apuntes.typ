#set page(
  margin: (x: 2.5cm, y: 2.5cm) //Para trabajos digitales e impresos simples
  // margin: (left: 3.8cm, y: 2.5cm, right: 2.5cm) //Para trabajos impresos a doble cara
)
#set text(lang:"es")
#set text(font: "DejaVu Sans")
#show math.equation: set text(font: "DejaVu Math TeX Gyre")
#set par(justify: true)

#import "@preview/cetz:0.3.4": canvas, draw, tree

#set heading(numbering: "1.")
// #show heading.where(level: 3): set heading(outlined: false)
// #show heading.where(level: 3): set heading(numbering: none)
// #show heading.where(level: 4): set heading(outlined: false)

#let separador() = align(center)[#line(length: 100%)]

DAT 261 - Procesamiento del lenguaje natural.

= Introducción
== Contenido 
+ Introducción
+ Expresiones regulares
+ N-gramas
+ Clasificación de textos
+ Vectores semánticos
+ LLM'scale

== Bibliografía
Speech and Language Processing - D. Jurafsky & G. Martin

== Evaluación
#grid(
  inset: 5pt,
  stroke: black,
  columns: (auto, auto, auto),
  [P1], [25 + 5], [30],
  [P2], [25 + 5], [30],
  [P3], [25 + 5], [30],
  [Prácticas], [], [10],
)

#pagebreak()
#outline()
#pagebreak()

== Normas
- No dejar basura.
- Llegar a la hora.

== El lenguaje natural.
En la vida cotidiana nos comunicamos a través del lenguaje natural, no transmitimos información de forma estructurada

A #sym.arrow S\
B #sym.arrow T\
C #sym.arrow U\
D #sym.arrow V\
E #sym.arrow W\
F #sym.arrow X\
G #sym.arrow Y\
H #sym.arrow Z\
I #sym.arrow A\
J #sym.arrow B\
K #sym.arrow C\
L #sym.arrow D\
M #sym.arrow E\
N #sym.arrow F\
O #sym.arrow G\
P #sym.arrow H\
Q #sym.arrow I\
R #sym.arrow J\
S #sym.arrow K\
T #sym.arrow L\
U #sym.arrow M\
V #sym.arrow N\
W #sym.arrow O\
X #sym.arrow P\
Y #sym.arrow Q\
Z #sym.arrow R\

// TI TCH LM TJ TCVJ JZQTTI VIA YCM TI VQMJTJ

TI TCH LM TI TCVI JZQTTI UIA YCM TI VQMJTI

Desplazamiento: -8

LA LUZ DE LA LUNA BRILLA MAS QUE LA NIEBLA

== Las expresiones regulares.
Las expresiones regulares sirven para la validación de datos.

=== Metacaracteres para las expresiones regulares.
- *.*: Sirve como comodín para un caracter.
- *\\*: Sirve para indicar que un caracter se usa de forma literal y no como parte de la sintaxis 
- *|*: Sirve como un `OR` para indicar dos opciones.

=== Clases de caracteres.
// - *\d*: Dígito decimal entre cero y nueve.
// - *\d+*: Uno o más dígitos decimales.
// - *\D*: Empareja con cualquier caracter que no sea dígito decimal.
// - *\D+*: Empareja con cualquier conjunto de caracteres que no sean dígitos decimales.
// - *[0 - 9]*: Empareja con cualquier caracter de cero a nueve.
// - *[^ 0 - 9]*: Empareja con cualquier caracter que no sea uno de cero a nueve.
// - *\s*: Empareja con un espacio en blanco.
// - *\S*: Empareja con un caracter que no sea un espacio en blanco.
// - *\w*: Empareja con cualquier caracter de una palabra, equivale a [a - z A - Z].
// - *\W*: Empareja con cualquier caracter que no sea parte de una palabra,.
// - *[a]*: Empareja exactamente con el caracter `a`.
// - *[a - d [m - p]]* #sym.arrow [a - d m - p]: Unión.
// - *[a - z && [d - f]]* #sym.arrow [d - f]: Intersección.
// - *[[: alnum :]]*: Empareja con cualquier caracter alfanumérico.
// - *[[: alpha :]]*: Empareja con cualquier caracter que sea una letra.
// - *[[: digit :]]*: Empareja con cualquier caracter que sea un decimal.
// - *[[: space :]]*: Empareja con un espacio en blanco, tabulador o salto de línea.
// - *\**: Empareja con la cantidad de concurrencias del caracter, empezando por cero.
// - *+*: Empareja con la cantidad de concurrencias del caracter, empezando por uno.
// - *?*: Empareja con un caracter cero o más veces.
// - *a {3}*: Empareja con tres caracteres de `a`.
// - *a {3, 5}*: Empareja con de tres a cinco caracteres de `a`.
// - *x {n, }*: Empareja con de `n` a cualquier rango de caracteres de `a`.
- `[abc]`: Empareja con cualquier caracter entre los corchetes, en el ejemplo, `a`, `b` o `c`.
- `[a - c]`: Empareja con cualquier caracter entre el rango especificado en los corchetes, en el ejemplo, `a`, `b` o `c`.
- `[^abc]`: Empareja con cualquier caracter que no esté entre los corchetes, en el ejemplo, `a`, `b` o `c`.
- `[^a - c]`: Empareja con cualquier caracter que no esté entre el rango especificado en los corchetes, en el ejemplo, `a`, `b` o `c`.
- `.`: Empareja con cualquier caracter menos un salto de línea.
- `\d`: Empareja con cualquier caracter numérico.
- `\D`: Empareja con cualquier caracter que no sea numérico.
- `\w`: Empareja con cualquier caracter alphanumérico del alfabeto latino.
- `\W`: Empareja con cualquier caracter que no sea alphanumérico del alfabeto latino.
- `\s`: Empareja con cualquier caracter de espacio en blanco.
- `\S`: Empareja con cualquier caracter que no sea un espacio en blanco.
- 

\d + (? = \$)

\+591 \s? \d {8}

[\@]

Práctica #1:
+ Encontrar la forma más eficiente de encontrar un número de whatsapp de Bolivia con expresiones regulares.

+ Encontrar la forma más eficiente de encontrar un correo electrónico con expresiones regulares.

+ ¿Dónde y qué uso se puede dar a las expresiones regulares en la informática?

`\+?\s?591\s?\d{8}`

`@gmail\.com$`

`@`

En la informática, se puede dar uso de las expresiones regulares al buscar caracteres de interés en un código, por ejemplo, puede darse un caso en el que interese buscar todos los `if` en donde se verifique el valor de `x`, lo que se lograría buscando `if\(x=.+\)`. Otro ejemplo sería al buscar distintos tipos de archivos, por ejemplo, para hacer un programa que busque archivos que empiecen por `log` y terminen con `.txt`, la busqueda con expresiones regulares sería: `^log.*\.txt$`.

En general, es útil para encontrar distintos patrones en los caracteres que escribamos según requerimientos específicos que podamos tener.

Primero se prepara el texto antes de procesarlo.

== Tokenización.
La tokenización es dividir textos en unidades llamadas tokens, los tokens pueden ser palabras, sílabas, caracteres, números, etc.

// ^[-w.-]+@([\w-]+\.)+[\w-]{2,4}$

`\S+`

`[á-úÁ-Ú\?!¿¡\w\.]+`

Escribir una expresión regular para que un token agrupe también a los signos de puntuación.

Práctica #2:
Escribir con redex una forma de tokenizar por sílabas.

Diversidad léxica: tipos / tokens.

Los tipos son los tokens sin repeticiones.

Práctica #3:
1. Considera el texto: Rosa blanca: Los alemanes que intentaron derrocar a Hitler disponible en: www.bbc.com/news/magazine-21521060
2. Tokenizar las palabras con NLTK
3. Tokenizar las palabras con spaCy
4. Determinar la diversidad léxica
5. Comparación: Analiza las diferencias. ¿Cómo operan NLTK y SpaCy?

== Normalización.
La normalización del texto sitve para comprender, interpretar y generar lenguaje humano, se transforma un texto 'ruidoso' en un texto estandarizado. Al igual que en las bases de datos, se hace para evitar las redundancias. La normalización consiste en tratar que los textos sin estructura pasen a estar estructurados bajo ciertas normas.

== Técnicas de normalización.

Un corpus es una base de datos de textos que nos dará datos linguísticos.

- El stemming es una técnica de tokenización en la cual se eliminan los prefijos y sufijos de las palabras.

- La lematización es otra técnica para tokenizar, en la cual los textos se normalizan llevando los verbos a su modo infinitivo, los sustantivos a su modo singular y los adjetivos a su forma base.

La ventaja de la lematización es su alta presición, mientras que su desventaja es su baja velocidad.

La ventaja del stemming es su alta velocidad, mientras que su desventaja es su no tan alta presición.

=== Técnicas de estandarización.
- Convertir todo a minúsculas.- no cambia el significado pero hace que no hayan diferencias entre mayúsculas y minúsculas, lo cual puede influir en los cálculos de diversidad léxica. Sin embargo, también se pierde algo de información que aportaban las mayúsuculas, como en `Lima`, que pasa a ser `lima`, lo cual tiene otro significado que el nombre propio de la ciudad.

- Eliminar los signos de puntuación.- sirve o no dependiendo deo objetivo de la búsqueda, pues en ciertas áreas, los signos de puntuación son cruciales para interpretar el significado de una frase.

- Eliminación de números.- en algunos textos, los números no tienen muchos significados, pero no sirve para análisis de series de tiempo, datos financieros o recetas.

- Eliminar los espacios en blanco.- sirve en ocaciones en las que hay espacios, saltos de línea o tabulaciones inconsistentes, por ejemplo, en un texto si hay dos espacios en lugar de uno.

- Eliminar tildes y diacríticos.- dependiendo del idioma, las tildes y otros diacríticos introduce distintas variaciones ortográficas. Sirve para unificar palabras que solo difieren en la acentuación.

Como se pudo observar, siempre hay cierta pérdida de información al momento de normalizar textos, así es clave identificar el objetivo del análisis de texto para decidir cómo estandarizarlo.

=== Otras técnicas de normalización/estandarización.
- estandarización de sinónimos y VL, otra técnica de estandarización que, basándose en un diccionario, encuentra relaciones léxicas entre palabras para encontrar sinónimos o hiponomías. Una hiponomía es cuando se relaciona semánticamente una palabra para encontrar que es una subclase de otra, por ejemplo, de `desayuno` se podría sacar `comida`. 

- Corrección de ortografía y errores tipográficos.- en los textos comunes del día a día, hay errores ortográficos o tipográficos los cuales se corrigen con la correccíón ortografíca, los sistemas de correción ortográfica pueden basarse en reglas, diccionarios o modelos estadísticos y fonéticos para identificar y sugerir correcciones.

- Entidades específicas.- cuando hay entidades específicas como la fecha, la hora o el dinero, hay distintas formas de escribirlas, este método de estandarización permite estandarizar la forma en la que deben estar escritas.

- Estandarización de abreviaturas, acrónimos o jergas.- convierte ciertos textos a sus formas en acrónimos o abreviaturas, por ejemplo: Organización Mundial de la Salud -> OMS.

- Stop Words.- también llamados la poda de lo superfluo, la técnica consiste en eliminar palabras que solo representan ruido, manteniendo solo lo que transmite la información verdaderamente valiosa, además mejora el rendimiento al reducir el tamaño del vocabulario, lo que reduce el uso de memoria y tiempo de procesamiento. Se eliminan artículos, preposiciones, conjunciones, conjunciones y pronombres. También se eliminan palabras de alta frecuentcia como adverbios comunes y otras como `es`, `estar`. Con esta técnica, se puerde cierta cantidad de significado, pero también se gana velocidad y simplicidad.

Al usar las técnicas de estandarización, se debe llegar a un balance para no perder demasiada información vital.

*Tarea 3:* Usar las técnicas de estandarización y normalización para encontrar la diversidad léxica con el texto de la tarea 2.

== Sobre la normalización.
El orden lógico para el pre-procesamiento de textos es:

+ Aplicar técnicas de estandarización (convertir a minúsculas, corregir errores ortográficos y tipográficos, etc.).
+ Tokenización.
+ Eliminar los stop words (opcional).
+ Aplicar normalización (stemming o lematización).

El objetivo de aplicar estos pasos es limpiar y reducir el volúmen del texto para prepararlo para el procesamiento del texto.

= Procesamiento.
== N-gramas.
Un n-grama es un modelo de lenguaje, una distribución de probabilidad de las palabras o de secuencias de palabras cuya función principal es asignar una probabilidad de que una palabra aparezca a continuación de una secuencia de palabras. Ejemplo:

El perro juega.

El `lo más probable después de "el", es que siga un sujeto`.

Perro `lo más probable después del sujeto, es que siga un verbo`.

Juega

Gracias a que la frase empieza con un artículo masculino, se sabe que la probabilidad de que el sujeto sea femenino es cero.

Los n-gramas tienen como principio matemático a las cadenas de Markov.

=== Cadena de Markov 
Las cadenas de Markov analizan las probabilidades de eventos que sucedan eventualmente (de forma seguida), y en cada cadena, solamente se toma en cuenta la probabilidad de una cadena anterior y no más.

La ventaja de usar las cadenas de Markov es que solo se necesita analizar la penúltima palabra para obtener la probabilidad de cuál será la siguiente.

Las cadenas de Markov usan un corpus para conocer las probabilidades de que dos palabras se sucedan, por lo que la probabilidad calculada de que dos palabras se sucedan depende de la cantidad de veces que se suceden en el corpus.

==== Cadena de Markov de primer orden.
Una cadena de Markov de primer orden es cuando el contexto es de una sola palabra.

== Longitud de los n-gramas.
Un n-grama se puede considerar según la longitud de los tipos que toma, por ejemplo, en el corpues:

El perro corre. El gato come.

Los n-grama de longitud uno son:

(El) = 2

(perro) = 1

(come) = 1

(gato) = 1

(duerme) = 1

Los n-gramas de longitud 2 o bi-gramas, son:

(El, perro) = 1

(El, gato) = 1

(perro, come) = 1

(gato, come) = 1

== Probabilidad de máxima verosimilitud.
Para encontrar la estimación de probabilidad ($"MLE"$) se usa la máxima verosimilitud. Para ello se debe contar cuantas veces aparece el item dentro del texto y se divide entre la cantidad de items del corpus. Ejemplo:
Corpus:

el gato duerme. el perro duerme.

Con uni-gramas:

$C("el") = 2$

$C("gato") = 1$

$C("duerme") = 2$

$C("perro") = 1$


$P_"MLE" ("gato") = 1/6$ 

En el caso de los n-gramas con longitud mayor que 1, se cuenta la cantidad de veces que aparece la cadena deseada dividida entre la cantidad de veces que aparece la cadena menos uno.

Usando bi-gramas:

$("el, gato") = 1$

$("el, perro") = 1$

$("gato, duerme") = 1$

$("perro, duerme") = 1$

$P_"MLE" ("gato/el") = C("el,gato")/C("el") = 1/2$

$P_"MLE" ("duerme") = C("gato,duerme")/C("gato") = 1/1 = 1$

La fórmula es el conteo de cada 

== La maldición de la dimensionalidad.
Consiste en el problema que trae que en un corpus extenso, las palabras pueden estar demasiado dispersas provocando que sea dificil o imposible analizar n-gramas con una alta longitud.

=== Técnicas de suavizado.
Se aplican técnicas de suavizado para reducir la dispersión de las palabras.

El procedimiento es reducir cierta probabilidad de máxima verosimilitud de que aparezca una cadena en un número $k$, para aumentar esa probabilidad $k$ a las cadenas que tenían probabilidad nula, es decir, de $0$.

==== Método de descuento de Laplace (add - 1).
$
  P_"Laplace" (w_i \/ w_(i - 1)) = (C(w_(i - 1), w_i) + 1)/(C(w_(i - 1)) + v)
$

Donde $v$ es el tamaño del vocabulario.

*Ejemplo:*

Corpus:
```txt
el gato duerme
el perro juega
```

tokens: 6 = $N$

tipos: 5 = tamaño del vocabulario = $v$

Uni-gramas:

$C("el") = 2$\
$C("gato") = 1$\
$C("duerme") = 1$\
$C("perro") = 1$\
$C("juega") = 1$\

Bi-gramas:

$C("el, gato") = 1$\
$C("gato, duerme") = 1$\
$C("el, perro") = 1$\
$C("perro, juega") = 1$\

$P_"MLE" ("duerme/perro") = emptyset$

$P_"Laplace" ("duerme/perro") = (C("perro, duerme") + 1)/(C("perro") + v) = (emptyset + 1)/(1 + 5) = 1/6$


El valor que se suma al numerador puede no ser $1$, puede ser un $k$ generalizado.

$
  P_"Laplace" (w_i \/ w_(i - 1)) = (C(w_(i - 1), w_i) + k)/(C(w_(i - 1)) + v)
$

==== Método de descuento Back-off.
$
  P_"Boff" (w_i \/ w_(i - 1)) = (C(w_(i - 1), w_i) - d)/(C(w_(i - 1))) + lambda(w_(i - 1)) P_"uni-grama" (w_i)
$

Donde $d = 0.75$ es un valor típico que reduce la probabilidad de máxima verosimilitud y $lambda$ redistribuye la probabilidad a los bi-gramas no existentes en el corpus.

$
  P_"uni-grama" (w_i) = (C (w_i))/N
$

Donde $N = "tokens"$.

*Ejemplo*:

Corpus:
```txt
el gato duerme
el perro juega
```

tokens: 6 = $N$

tipos: 5 = tamaño del vocabulario = $v$

Uni-gramas:

$C("el") = 2$\
$C("gato") = 1$\
$C("duerme") = 1$\
$C("perro") = 1$\
$C("juega") = 1$\

$P_"uni-grama" ("perro") = 1/6$

$P_"uni-grama" ("el") = 2/6 = 1/3$

$
  lambda (w_i - 1) = d dot (\#"palabras distintas que siguen después de la palabra analizada")/(C(w_i - 1))
$

$
  P_"Boff" (w_i \/ w_(i - 1)) = cases(
    (C(w_(i - 1), w_i) - d)/(C(w_(i - 1))) + lambda(w_(i - 1)) P_"uni-grama" (w_i) quad quad "Si" quad  (C(w_(i - 1), w_i) - d)/C(w_(i - 1)) gt 0\
    lambda(w_(i - 1)) P_"uni-grama" (w_i) quad quad quad quad quad quad quad quad quad quad "Si" quad  (C(w_(i - 1), w_i) - d)/C(w_(i - 1)) lt.eq 0 
  )
$

Se llama back-off porque retrocede en el tamaño de n-grama.

$P_"Boff" ("el, gato")$:

$
  (C(w_(i - 1), w_i) - d)/(C(w_(i - 1))) = (C("el, gato") - d)/(C("el")) = (1 - 0.75)/2 = 0.125 arrow 0.125 gt 0\
  lambda("el") P_"uni-grama" ("gato"):\
  lambda("el") = 0.75 dot 2/2 = 0.75\
  P_"uni-grama" ("gato") = 1/6 approx 1.667\
  lambda("el") P_"uni-grama" ("gato") = 0.75 dot 1.667 approx 0.125\
  (C(w_(i - 1), w_i) - d)/(C(w_(i - 1))) + lambda(w_(i - 1)) P_"uni-grama" (w_i) = 0.125 + 0.125 = 0.25
$
// preguntar grok

#separador()

$P_"Boff" ("perro, duerme")$:

$
  (C(w_(i - 1), w_i) - d)/(C(w_(i - 1))) = (C("perro, duerme") - d)/(C("el")) = (emptyset - 0.75)/1 = -0.75 arrow -0.75 lt.eq 0,"no se toma en cuenta "\
  lambda(w_(i - 1)) P_"uni-grama" (w_i) = (0.75  times 1)/1 = 0.75 dot 0.167 = 0.125
$

==== Método de descuento de Kneser-Ney.

$P_"cont" (w_i) = (\#"de contextos distintos que preceden a " w_i "en los que aparece el " w_i)/( \#"bi-gramas totales")$

$
  P_"kn" (w_i \/ w_(i - 1)) = (C(w_(i - 1), w_i) - d)/(C(w_(i - 1))) + lambda(w_(i - 1)) P_"cont" (w_i)
$

$
  lambda (w_i - 1) = d dot (\#"palabras distintas que siguen después de la palabra analizada")/(C(w_i - 1))
$

$
  P_"kn" (w_i \/ w_(i - 1)) = cases(
    (C(w_(i - 1), w_i) - d)/(C(w_(i - 1))) + lambda(w_(i - 1)) P_"ont" (w_i) quad quad "Si" quad  (C(w_(i - 1), w_i) - d)/C(w_(i - 1)) gt 0\
    lambda(w_(i - 1)) P_"cont" (w_i) quad quad quad quad quad quad quad quad quad quad "Si" quad  (C(w_(i - 1), w_i) - d)/C(w_(i - 1)) lt.eq 0 
  )
$

*Ejemplo*:

Corpus:
```txt
el gato duerme
el perro juega
```

tokens: 6 = $N$

tipos: 5 = tamaño del vocabulario = $v$

Uni-gramas:

$C("el") = 2$\
$C("gato") = 1$\
$C("duerme") = 1$\
$C("perro") = 1$\
$C("juega") = 1$\

$
  P_"kn" ("perro, duerme"):\
  (C("perro, duerme") - d)/(C("perro")) = (0 - 0.75)/1 = -0.75 arrow -0.75 lt.eq 0\
  lambda("perro") P_"cont" ("duerme")\
  lambda = 0.75 dot 1/1 = 0.75\
  P_"cont" ("perro") = 1/4 = 0.25\
  lambda("perro") P_"cont" ("duerme") = 0.75 dot 0.25 = 0.1875
$

Kneser-Ney es la mejor técnica frente a todas las otras.

// cuándo usar bi-gramas, tri-gramas, etc

== Entropía y perplejidad.

La perplejidad y entropía tratan de medir el grado de incertidumbre del modelo.

=== La entropía.

Para calcular la entropía $H$:

Corpus:
```txt
el gato duerme
el perro juega
```

*Conteo de bi-gramas:*

$C ("el", "gato") = 1$\
$C ("gato", "duerme") = 1$\
$C ("el", "perro") = 1$\
$C ("perro", "juega") = 1$\

*Frecuencia de tipos:*

$"frec"("el") = 2$\
$"frec"("gato") = 1$\
$"frec"("duerme") = 1$\
$"frec"("perro") = 1$\
$"frec"("juega") = 1$\

*Fórmula de entropía para palabras*:

$
  H (w_i \/ w_(i - 1)) = - sum p(w_i \/ w_(i - 1)) log_2 p (w_i \/w_(i - 1))
$

*Probabilidades condicionales*:

$
  p ("perro" \/ "el") "frec"("el, perro")/"frec"("el") = 1/2\
  p ("juega" \/ "perro") "frec"("perro, juega")/"frec"("perro") = 1\
$

#separador()

$
  H("el") = - (p("perro" \/ "el") log_w p("perro" \/ "el") + p("gato" \/ "el") log_2 p("gato" \/ "el"))\
  = -(0.5 log_2(0.5) + 0.5 log(0.5))\
  = 1 "bit"
$

Representa que hay una desición. Hay que decidir si sigue 'perro' o 'gato'.

#separador()

$
  H("perro") = - (p("juega" \/ "perro") log_2 p("juega" \/ "perro"))\
  = - (1 log_2(1)) = 0 "bit".
$

Representa que no hay ninguna desición, es decir, a 'perro' le seguirá sí o sí la palabra 'juega'.

*Fórmula de entropía del modelo*.

$
  H_"modelo" = 1/("N-gramas") sum_w_i "frec" (w_i - 1) H_"bi-grama"
$

En el corpus con cuatro palabras:

$
  H_"corpus ejemplo" = 1/4 (2 dot 1) + (1 dot 0) = 1/2
$

Es preferible tener un modelo con baja entropía para tener menor incertidumbre.

=== Perplejidad.

Para calcular la perplejidad, se calcula la secuencia de palabras de todo el corpus.

*El producto*:

$
  "Producto" = 1/(P("condicional" b_1)) dot 1/(P("condicional" b_2)) dots dot 1/(P("condicional" b_n)) 
$

#separador()

En el ejemplo:

$
  "Producto" = 1/0.5 dot 1/1 dot 1/0.5 dot 1/1 = 4
$

*Fórmula de la perplejidad*:

$
  "Perplejidad" = ("Producto")^(1/n)
$

Donde $n$ es la cantidad de bi-gramas.

#separador()

En el ejemplo:

$
  "Perplejidad" = ("Producto")^(1/n) = 4^(1/4) approx 1.41
$

== Etiquetado gramatical y el análisis sintáctico.

=== Etiquetado gramatical.

El etiquetado gramatical POS tagging es reconocer la categoría gramatical a la que pertenecen las palabras del corpus.

El etiquetado es importante porque ayuda a identificar relaciones sintácticas entre las palabras.

Para etiquetar palabras con el POS taggind se aplican distintos métodos que son:
- Se siguen reglas gramaticales.
- Se usan diccionarios.
- Se siguen modelos estadísticos.

Las principales herramientas de software para el etiquetado gramatical en español son librerías de Python, y son:
- NLTK.
- spaCy.
- Stanza.

Las partes de una oración son:
- Sujeto.
- Predicado.
- Verbo.
- Adjetivo.
- Adverbio.
- Artículo.
- Preposición.
- Determinante.

*Ejemplo*:

```txt Pedro llama a su amigo por teléfono```

- Pedro: Sujeto.
- llama: Verbo.
- a: Preposición.
- su: Determinante.
- amigo: Sustantivo.
- por: Preposición.
- teléfono: Sustantivo.

#separador()

```txt El sol ilumina la ciudad desde temprano```

- El: Determinante.
- sol: Sustantivo.
- ilumina: Verbo.
- la: Determinante.
- ciudad: Sustantivo.
- desde: Preposición.
- temprano: Adverbio.

Hay algunas *palabras que cambian de categoría según el contexto*, como al pasar de ser adverbio a ser adjetivo, en el caso en el que se describa a un verbo o a un sujeto.

=== Análisis sintáctico (parsing).

Es el proceso de analizar toda la oración para identificar su estructura, se usan sintagmas, que pueden ser más básicas o más profundas, las básicas son:

- Sujeto.
- Predicado.
- Objeto directo.

En el parsing profundo distintas formas de analizar oraciones, con grafos, árboles, categorías jerárquicas, etc.

// Parsing superficial (shallow parsing /chunking)

El análisis sintáctico puede realizarse basado en:
- Gramática forma.
- Estadística/aprendizaje.
- Aprendizaje profundo.

*Ejercicio*:

Dibujar el árbol de dependencias de la siguiente oración:

```txt La casa grande de la esquina es muy bonita.```
- La casa grande
  - de la esquina
  - es muy bonita

- casa
  - La
  - grande
  - de
    - la
      - esquina
  - es
    - muy
      - bonita

#let data = (
  [Casa], ([La]), ([Grande]),  ([De], ([La], [Esquina])), ([Es], ([Muy], [Bonita]))
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
})

Dentro del análisis sintáctico, también se puede evaluar el sentimiento de una oración, si tiene un sentimiento positivo o negativo.

*Proyecto*:

Trabajar en un proyectosobre la aplicación del análisis de sentimientos (a parte del marketing).

Ejemplo: En una sesión terapeutica, para saber si un paciente está avanzando en su terapia, se puede analizar las palabras con las que se expresa el paciente a través del análisis de sentimientos.

*Examen*: ¿En qué escenario o situación se puede aplicar el análisis de sentimientos? (La respuesta debe ser inovadora e ingeniosa, no algo muy común o general).

Hay una semana para resolver el examen.

// Ideas: clasificación de noticias, clasificación de música (genero, emociones, bpm), recomendaciones en redes sociales (el feed, que publicaciones saldrán en qué momento y después y antes de cuales), sistema de reporte en un juego ((league) (para dar baneos por el chat, emotes, acciones, emotes, pings). Análisis de programas electorales.

Se debe resolver el proyecto o examen a partir del poss tagging, analisis sintático y el análisis de la polaridad de las palabras. Se debe presentar el proyecto en un informe con un corpus, librerías, con un resultado. No solo se debe ingeniar la idea, se debe aplicar el análisis, con un corpus real y usando las librerías. Presentar resultados, opcionalmente diapositivas.

= Representaciones vectoriales

Los datos deben transformarse a una representación numérica, llamada representación vectorial.

== $"TF"$, $"IDF"$ y $"TF-IDF"$

$
  "TF"(t, d) = ("Número de veces que aparece el término " t " en el documento " d)/("Total de términos en el documento " d)
$

El $"TF"$ no aplica en todo el corpus, sino en un documento específico.

$
  "IDF"(t) = log (N / (1 + "df"(t)))
$

Donde $N$ es el múmero total de documentos del corpus, $"df"(t)$ es el número de documentos que contienen el término $t$.

El $"IDF"$ sí aplica a todo el corpus.

$
  "TF-IDF"(t, d) = "TF"(t, d) times "IDF"(t)
$

Mientras más se repita una palabra, tendrá un $"TF-IDF"$ más alto.

=== EJemplo

Corpus:

- $D_1$: el gato come pescado
- $D_1$: el perro come carne
- $D_1$: el gato duerme

Vocabulario:

`el, gato, come, pescado, perro, carne, duerme`

$"TF"("el", D_1) = 1/4$
$"TF"("el", D_2) = 1/4$
$"TF"("el", D_3) = 1/3$

$"IDF"("gato") = log (3/(3)) = log 1 = 0$

$"IDF"("duerme") = log (3/(1 + 1)) = log (3/2) = 0.18$

$"TF-IDF"("duerme", D_1) = 0 times 0.18 = 0$ 

#separador()

Es recomendable estandarizar el texto antes de encontrar los índices $"TF"$, $"IDF"$ y $"TF-IDF"$

En un mapa de calor de valores $"TF-IDF"$, se puede observar que la mayoría son valores de $0$ o cercanos al cero.

== Implementación de $"TF-IDF"$

El índice $"TF-IDF"$ se puede obtener con bibliotecas de python como `scikit-learn` a través de `tfidfvectorizer`.

== Embeddings

Otra forma de representar palabras en formato numérico es con el embedding.

Los word embedding son representaciones de palabras en un espacio vectorial con distancia y dirección entre los vectores de palabras.

Los embeddings codifican el significado de las palabras, lo cual les da una ventaja frente a $"TF-IDF"$, donde aunque dos palabras sean sinónimos, se le pueden asignar valores distintos.

=== Coordenadas

A través de la técnica $"PSA"$ se pueden encontrar las coordenadas de palabras con word embedding, a través de una matriz de concurrencia llamada bag of words.

==== Ejemplo

Corpus:

- El perro ladra
- El gato maulla
- El niño juega con el perro
- El gato duerme

Bag of words:

#grid(
  inset: 5pt,
  columns: (auto, auto, auto, auto, auto, auto, auto),
  [], [Perro], [Gato], [Niño], [Juega], [Duerme], [Maulla],
  [Perro], [0], [0], [1], [1], [0], [0],
  [Gato], [0], [0], [0], [0], [1], [1],
  [Niño], [1], [0], [0], [1], [0], [0],
  [Juega], [1], [0], [1], [0], [0], [0],
  [Duerme], [0], [1], [0], [0], [0], [0],
  [Maulla], [0], [1], [0], [0], [0], [0],
)

Al igual que con el $"TF-IDF"$, primero se debe normalizar el texto.

Dada la matriz bag of words, se pueden llegar a las coordenadas a través de distintas técnicas.

// $mu_j = 1/N sum mu_(k j)$

#grid(
  inset: 5pt,
  columns: (auto, auto, auto, auto, auto, auto, auto),
  [],       [Perro],   [Gato],  [Niño],  [Juega], [Duerme], [Maulla],
  [Perro],      [0],     [0],     [1],     [1],     [0],      [0],
  [Gato],       [0],     [0],     [0],     [0],     [1],      [1],
  [Niño],       [1],     [0],     [0],     [1],     [0],      [0],
  [Juega],      [1],     [0],     [1],     [0],     [0],      [0],
  [Duerme],     [0],     [1],     [0],     [0],     [0],      [0],
  [Maulla],     [0],     [1],     [0],     [0],     [0],      [0],
  [$n_1/n_0$], [$1/3$], [$1/3$], [$1/3$], [$1/3$], [$1/6$], [$1/6$],
)

#separador()

Matriz centrada:

#grid(
  inset: 7pt,
  stroke: black,
  columns: (auto, auto, auto, auto, auto, auto, auto),
  [],       [Perro],   [Gato],   [Niño],  [Juega],   [Duerme],   [Maulla],
  [Perro],  [$-1/3$],  [$-1/3$], [$2/3$],  [$2/3$],  [$-1/6$],   [$-1/6$],
  [Gato],   [$-1/3$],  [$-1/3$], [$-1/3$], [$-1/3$], [$5/6$],    [$5/6$],
  [Niño],   [$2/3$],   [$-1/3$], [$-1/3$], [$2/3$],  [$-1/6$],   [$-1/6$],
  [Juega],  [$2/3$],   [$-1/3$], [$2/3$],  [$-1/3$], [$-1/6$],   [$-1/6$],
  [Duerme], [$-1/3$],  [$2/3$],  [$-1/3$], [$-1/3$], [$-1/6$],   [$-1/6$],
  [Maulla], [$-1/3$],  [$2/3$],  [$-1/3$], [$-1/3$], [$-1/6$],   [$-1/6$],
)

La matriz centrada se encuentra al restar el valor de cada celda con el valor del promedio de la columna

// encontrar lambdas y PC_i, valores propios, autovalores; lambda_1 = 0.6, kamba_2 = 0.4, ... lambda_6 = 0 PC_i=lambda_i/(sum x_i)

== Análisis de componentes principales paciente

Parte de la matriz de concurrencia

#grid(
  inset: 5pt,
  columns: (auto, auto, auto, auto, auto, auto, auto),
  [],       [Perro],   [Gato],  [Niño],  [Juega], [Duerme], [Maulla],
  [Perro],      [0],     [0],     [1],     [1],     [0],      [0],
  [Gato],       [0],     [0],     [0],     [0],     [1],      [1],
  [Niño],       [1],     [0],     [0],     [1],     [0],      [0],
  [Juega],      [1],     [0],     [1],     [0],     [0],      [0],
  [Duerme],     [0],     [1],     [0],     [0],     [0],      [0],
  [Maulla],     [0],     [1],     [0],     [0],     [0],      [0],
  [$n_1/n_0$], [$1/3$], [$1/3$], [$1/3$], [$1/3$], [$1/6$], [$1/6$],
)

Matriz centrada:

#grid(
  inset: 7pt,
  stroke: black,
  columns: (auto, auto, auto, auto, auto, auto, auto),
  [],       [Perro],   [Gato],   [Niño],  [Juega],   [Duerme],   [Maulla],
  [Perro],  [$-1/3$],  [$-1/3$], [$2/3$],  [$2/3$],  [$-1/6$],   [$-1/6$],
  [Gato],   [$-1/3$],  [$-1/3$], [$-1/3$], [$-1/3$], [$5/6$],    [$5/6$],
  [Niño],   [$2/3$],   [$-1/3$], [$-1/3$], [$2/3$],  [$-1/6$],   [$-1/6$],
  [Juega],  [$2/3$],   [$-1/3$], [$2/3$],  [$-1/3$], [$-1/6$],   [$-1/6$],
  [Duerme], [$-1/3$],  [$2/3$],  [$-1/3$], [$-1/3$], [$-1/6$],   [$-1/6$],
  [Maulla], [$-1/3$],  [$2/3$],  [$-1/3$], [$-1/3$], [$-1/6$],   [$-1/6$],
)

Se encuentra la matriz de la covarianza.

$C = 1/(n - 1) sum x_c dot x_c$\
$C_(i j) = 1/(n - 1) sum x_(c k , 1) x _(c k, j)$

#grid(
  inset: 7pt,
  stroke: black,
  columns: (auto, auto, auto, auto, auto, auto, auto),
  [],       [Perro],   [Gato],   [Niño],  [Juega],   [Duerme],   [Maulla],
  [Perro],  [$4/15$],  [$-2/15$], [$1/15$],  [$1/15$],  [$-1/15$],   [$-1/15$],
  [Gato],   [$-2/15$], [$4/15$], [$-2/15$], [$-2/15$], [$-1/15$], [$-1/15$],
  [Niño],   [$1/15$], [$-2/15$], [$4/15$], [$1/15$], [$-1/15$], [$-1/15$],
  [Juega],  [$1/15$], [$-2/15$], [$1/15$], [$4/15$], [$-1/15$], [$-1/15$],
  [Duerme], [$-1/15$], [$-1/15$], [$-1/15$], [$-1/15$], [$1/6$], [$1/6$],
  [Maulla], [$-1/15$], [$-1/15$], [$-1/15$], [$-1/15$], [$1/6$], [$1/6$],
)

Perro y duerme:

$
  (-1/3) (-1/6) = 1/18\
  (-1/3) (5/6) = -5/18\
  (2/3) (-1/6) = -1/9\
  (2/3) (-1/6) = -1/9\
  (-1/3) (-1/6) = 1/18\
  (-1/3) (-1/6) = 1/18\
  sum = -1/3\
  -1/15
$

=== Autovalores

$lambda_1 = 3/5 \ lambda_2 = 2/5$

Se resta la diagonal por $lambda_1$.

#grid(
  inset: 7pt,
  stroke: black,
  columns: (auto, auto, auto, auto, auto, auto, auto),
  [],       [Perro],   [Gato],   [Niño],  [Juega],   [Duerme],   [Maulla],
  [Perro],  [$-1/3$],  [$-2/15$], [$1/15$],  [$1/15$],  [$-1/15$],   [$-1/15$],
  [Gato],   [$-2/15$], [$-1/3$], [$-2/15$], [$-2/15$], [$-1/15$], [$-1/15$],
  [Niño],   [$1/15$], [$-2/15$], [$-1/3$], [$1/15$], [$-1/15$], [$-1/15$],
  [Juega],  [$1/15$], [$-2/15$], [$1/15$], [$-1/3$], [$-1/15$], [$-1/15$],
  [Duerme], [$-1/15$], [$-1/15$], [$-1/15$], [$-1/15$], [$-13/30$], [$1/6$],
  [Maulla], [$-1/15$], [$-1/15$], [$-1/15$], [$-1/15$], [$1/6$], [$-13/30$],
)

Se multiplica por el mayor denominador (30) para obtener la matriz solo de enteros.

#grid(
  inset: 7pt,
  stroke: black,
  columns: (auto, auto, auto, auto, auto, auto, auto),
  [],       [Perro],   [Gato],   [Niño],  [Juega],   [Duerme],   [Maulla],
  [Perro],  [$-10$],  [$-4$],   [$2$],   [$2$],    [$-2$],    [$-2$],
  [Gato],   [$-4$],   [$-10$],  [$-4$],  [$-4$],   [$-2$],    [$-2$],
  [Niño],   [$2$],    [$-4$],   [$-10$], [$2$],    [$-2$],    [$-2$],
  [Juega],  [$2$],    [$-4$],   [$2$],   [$-10$],  [$-2$],    [$-2$],
  [Duerme], [$-2$],   [$-2$],   [$-2$],  [$-2$],   [$-13$],    [$5$],
  [Maulla], [$-2$],   [$-2$],   [$-2$],  [$-2$],   [$5$],     [$-13$],
)

Se reescribe cada fila como ecuaciones:

+ $quad -10a - 4b + 2c + 2d - 2e - 2f = 0$\
+ $quad -4a - 10b - 4c - 4d - 2e - 2f = 0$\
+ $quad 2a - 4b - 10c + 2d - 2e - 2f = 0$\
+ $quad 2a - 4b + 2c - 10d - 2e - 2f = 0$\
+ $quad -2a - 2b - 2c - 2d - 13e + 5f = 0$\
+ $quad -2a - 2b - 2c - 2d + 5e - 13f = 0$\

$
mat(
  -10, -4, 2, 2, -2, -2, 0;
  -4, -10, -4, -4, -2, -2, 0;
  2, -4, -10, 2, -2, -2, 0;
  2, -4, 2, -10, -2, -2, 0;
  -2, -2, -2, -2, -13, 5, 0;
  -2, -2, -2, -2, 5, -13, 0
)
~ 
mat(
  2, -4, -10, 2, -2, -2, 0;
  -4, -10, -4, -4, -2, -2, 0;
  -10, -4, 2, 2, -2, -2, 0;
  2, -4, 2, -10, -2, -2, 0;
  -2, -2, -2, -2, -13, 5, 0;
  -2, -2, -2, -2, 5, -13, 0
)
$
$
~ 
mat(
  2, -4, -10, 2, -2, -2, 0;
  0, -18, -24, 0, -6, -6, 0;
  0, -24, -48, 12, -12, -12, 0;
  0, -8, 8, -12, -4, -4, 0;
  0, -6, -12, 0, -15, 3, 0;
  0, -6, -12, 0, 3, -15, 0
)
~ 
mat(
  2, -4, -10, 2, -2, -2, 0;
  0, 3, 4, 0, 1, 1, 0;
  0, -24, -48, 12, -12, -12, 0;
  0, -8, 8, -12, -4, -4, 0;
  0, -6, -12, 0, -15, 3, 0;
  0, -6, -12, 0, 3, -15, 0
)
$
$
~ 
mat(
  2, -4, -10, 2, -2, -2, 0;
  0, 3, 4, 0, 1, 1, 0;
  0, 0, -16, 12, -4, -4, 0;
  0, 0, 40/3, -12, -4/3, -4/3, 0;
  0, 0, -4, 0, -13, 5, 0;
  0, 0, -4, 0, 5, -13, 0
)
~ 
mat(
  2, -4, -10, 2, -2, -2, 0;
  0, 3, 4, 0, 1, 1, 0;
  0, 0, 4, -3, 1, 1, 0;
  0, 0, 40/3, -12, -4/3, -4/3, 0;
  0, 0, -4, 0, -13, 5, 0;
  0, 0, -4, 0, 5, -13, 0
)
$
$
~ 
mat(
  2, -4, -10, 2, -2, -2, 0;
  0, 3, 4, 0, 1, 1, 0;
  0, 0, 4, -3, 1, 1, 0;
  0, 0, 0, -6, -3, -3, 0;
  0, 0, 0, 3, -14, 6, 0;
  0, 0, 0, 3, 6, -14, 0
)
~ 
mat(
  2, -4, -10, 2, -2, -2, 0;
  0, 3, 4, 0, 1, 1, 0;
  0, 0, 4, -3, 1, 1, 0;
  0, 0, 0, 1, 1/2, 1/2, 0;
  0, 0, 0, 3, -14, 6, 0;
  0, 0, 0, 3, 6, -14, 0
)
$
$
~ 
mat(
  2, -4, -10, 2, -2, -2, 0;
  0, 3, 4, 0, 1, 1, 0;
  0, 0, 4, -3, 1, 1, 0;
  0, 0, 0, 1, 1/2, 1/2, 0;
  0, 0, 0, 0, -31/2, 9/2, 0;
  0, 0, 0, 0, 9/2, -31/2, 0
)
~ 
mat(
  2, -4, -10, 2, -2, -2, 0;
  0, 3, 4, 0, 1, 1, 0;
  0, 0, 4, -3, 1, 1, 0;
  0, 0, 0, 1, 1/2, 1/2, 0;
  0, 0, 0, 0, 1, -9/31, 0;
  0, 0, 0, 0, 0, -400/31, 0
)
$
$
~ 
mat(
  2, -4, -10, 2, -2, -2, 0;
  0, 3, 4, 0, 1, 1, 0;
  0, 0, 4, -3, 1, 1, 0;
  0, 0, 0, 1, 1/2, 1/2, 0;
  0, 0, 0, 0, 1, -9/31, 0;
  0, 0, 0, 0, 0, 1, 0
)
~ 
mat(
  1, -2, -5, 1, -1, -1, 0;
  0, 3, 4, 0, 1, 1, 0;
  0, 0, 4, -3, 1, 1, 0;
  0, 0, 0, 1, 1/2, 1/2, 0;
  0, 0, 0, 0, 1, -9/31, 0;
  0, 0, 0, 0, 0, 1, 0
)
$
$
~ 
mat(
  1, -2, -5, 1, -1, 0, 0;
  0, 3, 4, 0, 1, 0, 0;
  0, 0, 4, -3, 1, 0, 0;
  0, 0, 0, 1, 1/2, 0, 0;
  0, 0, 0, 0, 1, 0, 0;
  0, 0, 0, 0, 0, 1, 0
)
~ 
mat(
  1, -2, -5, 1, 0, 0, 0;
  0, 3, 4, 0, 0, 0, 0;
  0, 0, 4, -3, 0, 0, 0;
  0, 0, 0, 1, 0, 0, 0;
  0, 0, 0, 0, 1, 0, 0;
  0, 0, 0, 0, 0, 1, 0
)
$
$
~ 
mat(
  1, -2, -5, 0, 0, 0, 0;
  0, 3, 4, 0, 0, 0, 0;
  0, 0, 4, 0, 0, 0, 0;
  0, 0, 0, 1, 0, 0, 0;
  0, 0, 0, 0, 1, 0, 0;
  0, 0, 0, 0, 0, 1, 0
)
~ 
mat(
  1, -2, 0, 0, 0, 0, 0;
  0, 3, 0, 0, 0, 0, 0;
  0, 0, 1, 0, 0, 0, 0;
  0, 0, 0, 1, 0, 0, 0;
  0, 0, 0, 0, 1, 0, 0;
  0, 0, 0, 0, 0, 1, 0
)
$
$
~ 
mat(
  1, 0, 0, 0, 0, 0, 0;
  0, 1, 0, 0, 0, 0, 0;
  0, 0, 1, 0, 0, 0, 0;
  0, 0, 0, 1, 0, 0, 0;
  0, 0, 0, 0, 1, 0, 0;
  0, 0, 0, 0, 0, 1, 0
)
$

Por lo tanto, la solución del sistema es:
$
a = 0, quad b = 0, quad c = 0, quad d = 0, quad e = 0, quad f = 0
$

$v_1(a, b, c, d, e, f)$

Se encuentra $||v_1||, |v_1|$, y el autovector es $v_1 / (|v_1|)$

$ ||v_1|| = sqrt(0^2 + 0^2 + 0^2 + 0^2 + 0^2 + 0^2) = 0 $

Como $0/0$ es indefinido, no hay autovectores no tribiales para $lambda = 3.5$

#separador()

Si la solución fuera:

$v_1 = (a, -a, a, a, -a/2, -a/2)$

Se encuentra la norma:
$ ||v_1|| = sqrt(a^2 + (-a)^2 + a^2 + a^2 + (-a/2)^2 + (-a/2)^2) = sqrt(4a^2 + a^2/4 + a^2/4) = sqrt(9a^2/2) = (3|a|)/sqrt(2) $

La magnitud es:
$ |v_1| = (3|a|)/sqrt(2) $

El autovector normalizado es:
$ v_1 / (||v_1||) = (a, -a, a, a, -a/2, -a/2) / ((3|a|)/sqrt(2)) = (sqrt(2)/3, -sqrt(2)/3, sqrt(2)/3, sqrt(2)/3, -sqrt(2)/6, -sqrt(2)/6) $

$v_2(0, -0.577, 0, 0, 0.577, 0.577)$

#separador()

Coordenadas de perro:

$"PC"1 (x) = x v_1$\
$"PC"2 (x) = x v_2$\
$"Perro"(0.7; 0.0005)$\
$"Gato"()$\
$"Niño"()$\
$"Juega"()$\
$"Duerme"()$\
$"Maulla"()$\


== Word2Vec Glove RN

=== Word2Vec

Propuesto de Mikolov, modelo predictivo, captura relaciones lineales (rey - hombre + mujer = reina), su entrenamiento es sencillo y rápido, funciona bien con grandes corpus no supervisados.

=== Glove

Propuesto por Penningtong, Socher y Manning, usa redes neuronales. Usa información global del corpus completo, no solo locales. Requiere mayor preprocesamiento y memoria para construir la matriz.

#separador()

Word2Vec es un modelo predictivo que representa de forma vectorial las palabras (embedding), su caracteristica es que las palabras que aparecen en contextos similares comparten un contexto semántico.

La arquitectura de Bag of Words toma un contexto y trata de identificar una palabra, mientras que skip-gram hace lo contrario, toma una palabra e identifica su contexto, usando 'ventanas', mide distancia se encuentras las palabras y definir su contexto

== Similitud de cosenos

Mide la semántica de las palabras, mide su 'ángulo' para identificar si van en la misma dirección. Mide cuán parecidos son dos vectores $a, b$:

$
  cos (a,b) = (a dot b)/(||a|| ||b||) = (sum a_i b_i)/(sqrt(sum a_i^2) sqrt(b_i^2)) arrow cases(
    1: "Vectores idénticos es dirección",
    0: "Vectores ortogonales (sin relación directa)",
    -1: "Vectores con dirección opuesta",
  )
$

=== Ejemplo

- $"gato" (-18.931812, -56.702497, -14.919538)$
- $"perro" (397.451068, 1206.181061, 402.479118)$
- $"ladra" (12.139459, 15.276809, 2.611060)$

#let gato = (-18.931812, -56.702497, -14.919538)
#let perro = (397.451068, 1206.181061, 402.479118)
#let ladra = (12.139459, 15.276809, 2.611060)

#let norma(vector) = calc.sqrt(vector.map(x => x * x).sum())

#let producto_punto(a, b) = {
  let suma = 0
  for i in range(0, a.len()) {
    suma += a.at(i) * b.at(i)
  }
  suma
}

#let norma_gato = calc.round(norma(gato), digits: 4)
#let norma_perro = calc.round(norma(perro), digits: 4)
#let norma_ladra = calc.round(norma(ladra), digits: 4)

#let prod_gato_perro = calc.round(producto_punto(gato, perro), digits: 4)
#let prod_gato_ladra = calc.round(producto_punto(gato, ladra), digits: 4)
#let prod_perro_ladra = calc.round(producto_punto(perro, ladra), digits: 4)

#let cos_gato_perro = calc.round(prod_gato_perro / (norma_gato * norma_perro), digits: 4)
#let cos_gato_ladra = calc.round(prod_gato_ladra / (norma_gato * norma_ladra), digits: 4)
#let cos_perro_ladra = calc.round(prod_perro_ladra / (norma_perro * norma_ladra), digits: 4)

$
  || "gato" || = sqrt(sum ("gato"_i^2)) \ 
  = sqrt((-18.931812)^2 + (-56.702497)^2 + (-14.919538)^2) = #norma_gato \
  \ #separador() \
  || "perro" || = sqrt(sum ("perro"_i^2)) \ 
  = sqrt((397.451068)^2 + (1206.181061)^2 + (402.479118)^2) = #norma_perro \ #separador() \
  || "ladra" || = sqrt(sum ("ladra"_i^2)) \
  = sqrt((12.139459)^2 + (15.276809)^2 + (2.611060)^2) = #norma_ladra
  \ #separador() \
$

$
  cos("gato", "perro") = (sum "gato"_i "perro"_i) / (|| "gato" || || "perro" ||) \
  = #prod_gato_perro / (#norma_gato * #norma_perro) = #cos_gato_perro \
  \ #separador() \
  cos("gato", "ladra") = (sum "gato"_i "ladra"_i) / (|| "gato" || || "ladra" ||) \
  = #prod_gato_ladra / (#norma_gato * #norma_ladra) = #cos_gato_ladra \
  \ #separador() \
  cos("perro", "ladra") = (sum "perro"_i "ladra"_i) / (|| "perro" || || "ladra" ||) \
  = #prod_perro_ladra / (#norma_perro * #norma_ladra) = #cos_perro_ladra
$

#separador()

#separador()

- $"hombre" (0.2, 0.8, 0.5)$
- $"mujer" (0.3, 0.7, 0.6)$
- $"rey" (0.9, 0.1, 0.8)$
- $"reina" (1, 0, 0.9)$

$"rey" - "hombre" + "mujer" approx "reina"$

#let hombre = (0.2, 0.8, 0.5)
#let mujer = (0.3, 0.7, 0.6)
#let rey = (0.9, 0.1, 0.8)
#let reina = (1.0, 0.0, 0.9)

#let resultado = (
  calc.round(rey.at(0) - hombre.at(0) + mujer.at(0), digits: 4),
  calc.round(rey.at(1) - hombre.at(1) + mujer.at(1), digits: 4),
  calc.round(rey.at(2) - hombre.at(2) + mujer.at(2), digits: 4)
)

$
  "rey" - "hombre" + "mujer" = 
  (#rey.at(0), #rey.at(1), #rey.at(2)) - 
  (#hombre.at(0), #hombre.at(1), #hombre.at(2)) + 
  (#mujer.at(0), #mujer.at(1), #mujer.at(2)) = 
  \
  (#resultado.at(0), #resultado.at(1), #resultado.at(2)) approx 
  "reina" = (#reina.at(0), #reina.at(1), #reina.at(2))
$

#let norma_hombre = calc.round(norma(hombre), digits: 4)
#let norma_mujer = calc.round(norma(mujer), digits: 4)
#let norma_rey = calc.round(norma(rey), digits: 4)
#let norma_reina = calc.round(norma(reina), digits: 4)

#let prod_hombre_mujer = calc.round(producto_punto(hombre, mujer), digits: 4)
#let prod_hombre_rey = calc.round(producto_punto(hombre, rey), digits: 4)
#let prod_hombre_reina = calc.round(producto_punto(hombre, reina), digits: 4)
#let prod_mujer_rey = calc.round(producto_punto(mujer, rey), digits: 4)
#let prod_mujer_reina = calc.round(producto_punto(mujer, reina), digits: 4)
#let prod_rey_reina = calc.round(producto_punto(rey, reina), digits: 4)
#let prod_reina_reina = calc.round(producto_punto(reina, reina), digits: 4)

#let cos_hombre_mujer = calc.round(prod_hombre_mujer / (norma_hombre * norma_mujer), digits: 4)
#let cos_hombre_rey = calc.round(prod_hombre_rey / (norma_hombre * norma_rey), digits: 4)
#let cos_hombre_reina = calc.round(prod_hombre_reina / (norma_hombre * norma_reina), digits: 4)
#let cos_mujer_rey = calc.round(prod_mujer_rey / (norma_mujer * norma_rey), digits: 4)
#let cos_mujer_reina = calc.round(prod_mujer_reina / (norma_mujer * norma_reina), digits: 4)
#let cos_rey_reina = calc.round(prod_rey_reina / (norma_rey * norma_reina), digits: 4)
#let cos_reina_reina = calc.round(prod_reina_reina / (norma_reina * norma_reina), digits: 4)

$
  || "hombre" || = sqrt(sum ("hombre"_i^2)) = \
  sqrt((0.2)^2 + (0.8)^2 + (0.5)^2) = #norma_hombre
  \ #separador() \
  || "mujer" || = sqrt(sum ("mujer"_i^2)) = \
  sqrt((0.3)^2 + (0.7)^2 + (0.6)^2) = #norma_mujer
  \ #separador() \
  || "rey" || = sqrt(sum ("rey"_i^2)) = sqrt((0.9)^2 + (0.1)^2 + (0.8)^2) = #norma_rey
  \ #separador() \
  || "reina" || = sqrt(sum ("reina"_i^2)) = sqrt((1.0)^2 + (0.0)^2 + (0.9)^2) = #norma_reina
$

#separador()

$
  cos("hombre", "reina") = (sum "hombre"_i "reina"_i) / (|| "hombre" || || "reina" ||) \
  = #prod_hombre_reina / (#norma_hombre * #norma_reina) = #cos_hombre_reina
  \ #separador() \
  cos("mujer", "reina") = (sum "mujer"_i "reina"_i) / (|| "mujer" || || "reina" ||) \
  = #prod_mujer_reina / (#norma_mujer * #norma_reina) = #cos_mujer_reina
  \ #separador() \
  cos("rey", "reina") = (sum "rey"_i "reina"_i) / (|| "rey" || || "reina" ||) \
  = #prod_rey_reina / (#norma_rey * #norma_reina) = #cos_rey_reina
  \ #separador()\ 
  cos("reina", "reina") = (sum "reina"_i "reina"_i) / (|| "reina" || || "reina" ||) \
  = #prod_reina_reina / (#norma_reina * #norma_reina) = #cos_reina_reina
$

#separador()
#separador()

- hombre (-0.190163, -0.139676, 0.073057, 0.078541, 0.112591, 0.058077, -0.063308, 0.151381, -0.139177, 0.079741)
- rey (-0.207662, -0.428249, 0.357902, -0.229203, -0.014487, -0.047241, -0.366219, 0.398698, -0.573777, 0.507776)
- mujer (0.116886, -0.339685, 0.539778, -0.092221, -0.146905, 0.157053, -0.232894, 0.286507, -0.551026, 0.283449)
- reina (-0.20073, -0.189982, 0.096208, -0.102227, -0.038046, -0.006876, -0.109147, 0.158618, -0.15487, 0.115333)

#let hombre = (-0.190163, -0.139676, 0.073057, 0.078541, 0.112591, 0.058077, -0.063308, 0.151381, -0.139177, 0.079741)
#let rey = (-0.207662, -0.428249, 0.357902, -0.229203, -0.014487, -0.047241, -0.366219, 0.398698, -0.573777, 0.507776)
#let mujer = (0.116886, -0.339685, 0.539778, -0.092221, -0.146905, 0.157053, -0.232894, 0.286507, -0.551026, 0.283449)
#let reina = (-0.20073, -0.189982, 0.096208, -0.102227, -0.038046, -0.006876, -0.109147, 0.158618, -0.15487, 0.115333)

#let norma_hombre = calc.round(norma(hombre), digits: 4)
#let norma_rey = calc.round(norma(rey), digits: 4)
#let norma_mujer = calc.round(norma(mujer), digits: 4)
#let norma_reina = calc.round(norma(reina), digits: 4)

#let prod_hombre_rey = calc.round(producto_punto(hombre, rey), digits: 4)
#let prod_hombre_mujer = calc.round(producto_punto(hombre, mujer), digits: 4)
#let prod_hombre_reina = calc.round(producto_punto(hombre, reina), digits: 4)
#let prod_rey_mujer = calc.round(producto_punto(rey, mujer), digits: 4)
#let prod_rey_reina = calc.round(producto_punto(rey, reina), digits: 4)
#let prod_mujer_reina = calc.round(producto_punto(mujer, reina), digits: 4)
#let prod_reina_reina = calc.round(producto_punto(reina, reina), digits: 4)

#let cos_hombre_rey = calc.round(prod_hombre_rey / (norma_hombre * norma_rey), digits: 4)
#let cos_hombre_mujer = calc.round(prod_hombre_mujer / (norma_hombre * norma_mujer), digits: 4)
#let cos_hombre_reina = calc.round(prod_hombre_reina / (norma_hombre * norma_reina), digits: 4)
#let cos_rey_mujer = calc.round(prod_rey_mujer / (norma_rey * norma_mujer), digits: 4)
#let cos_rey_reina = calc.round(prod_rey_reina / (norma_rey * norma_reina), digits: 4)
#let cos_mujer_reina = calc.round(prod_mujer_reina / (norma_mujer * norma_reina), digits: 4)
#let cos_reina_reina = calc.round(prod_reina_reina / (norma_reina * norma_reina), digits: 4)

$
  || "hombre" || = sqrt(sum ("hombre"_i^2)) = #norma_hombre
  \ #separador() \
  || "rey" || = sqrt(sum ("rey"_i^2)) = #norma_rey
  \ #separador() \
  || "mujer" || = sqrt(sum ("mujer"_i^2)) = #norma_mujer
  \ #separador() \
  || "reina" || = sqrt(sum ("reina"_i^2)) = #norma_reina
$

#separador()

$
  cos("hombre", "rey") = (sum "hombre"_i "rey"_i) / (|| "hombre" || || "rey" ||) \
  = #prod_hombre_rey / (#norma_hombre * #norma_rey) = #cos_hombre_rey
  \ #separador() \
  cos("hombre", "mujer") = (sum "hombre"_i "mujer"_i) / (|| "hombre" || || "mujer" ||) \
  = #prod_hombre_mujer / (#norma_hombre * #norma_mujer) = #cos_hombre_mujer
  \ #separador() \
  cos("hombre", "reina") = (sum "hombre"_i "reina"_i) / (|| "hombre" || || "reina" ||) \
  = #prod_hombre_reina / (#norma_hombre * #norma_reina) = #cos_hombre_reina
  \ #separador() \
  cos("rey", "mujer") = (sum "rey"_i "mujer"_i) / (|| "rey" || || "mujer" ||) \
  = #prod_rey_mujer / (#norma_rey * #norma_mujer) = #cos_rey_mujer
  \ #separador() \
  cos("rey", "reina") = (sum "rey"_i "reina"_i) / (|| "rey" || || "reina" ||) \
  = #prod_rey_reina / (#norma_rey * #norma_reina) = #cos_rey_reina
  \ #separador() \
  cos("mujer", "reina") = (sum "mujer"_i "reina"_i) / (|| "mujer" || || "reina" ||) \
  = #prod_mujer_reina / (#norma_mujer * #norma_reina) = #cos_mujer_reina
  \ #separador() \
  cos("reina", "reina") = (sum "reina"_i "reina"_i) / (|| "reina" || || "reina" ||) \
  = #prod_reina_reina / (#norma_reina * #norma_reina) = #cos_reina_reina
$

= Aprendizaje supervisado y clasificación de documentos

Para realizar la calsificación de documentos, se realiza el siguiente procedimiento:
+ Se etiquetan los documentos en positivo o negativo.
+ Se vectorizan.
+ Se los representa en un espacio vectorial.
+ Se encuentra un hiperplano que divida los sectores.

== Máquinas de soporte de vectores SVM

Es una técnica para encontrar el hiperplano, consiste en encontrar dos rectas paralelas, una en un punto con los documentos positivos, otra que marque un documento negativo, a la mitad de esas rectas se encuentra el hiperplano, que también es paralelo a las rectas de soporte.

Esta técnica funciona solo para espacios vectoriales linealmente separables.

$2/(||w||)$

*Tarea*: Ver reseñas del debate, clasificarlas, crear el modelo y determinar si fue positivo o negativo