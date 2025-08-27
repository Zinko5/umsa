#set page(
  margin: (x: 2.5cm, y: 2.5cm) //Para trabajos digitales e impresos simples
  // margin: (left: 3.8cm, y: 2.5cm, right: 2.5cm) //Para trabajos impresos a doble cara
)
#set text(lang:"es")
#set text(font: "DejaVu Sans")
#show math.equation: set text(font: "DejaVu Math TeX Gyre")
#set par(justify: true)

#set heading(numbering: "1.")
// #show heading.where(level: 3): set heading(numbering: "1. 1. a)")
// #show heading.where(level: 4): set heading(numbering: none)
// = Título
// == Título
// == Título
// === Título
// ==== Título

// Otros titulos:

// #show heading.where(level: 2): it => [
//     #pad(left: 30pt)[#it]
// ]

// = Título
// == Título
// == Título
// #pad(top: 10pt)[#lorem(120)]

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

Un corpus es una base de datos de textos que nos dará datos linguísticos.