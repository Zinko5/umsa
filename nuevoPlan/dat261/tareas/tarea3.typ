#set page(
  margin: (x: 2.5cm, y: 2.5cm) //Para trabajos digitales e impresos simples
  // margin: (left: 3.8cm, y: 2.5cm, right: 2.5cm) //Para trabajos impresos a doble cara
)
#set text(lang:"es")
#set text(font: "DejaVu Sans")
#show math.equation: set text(font: "DejaVu Math TeX Gyre")
#set par(justify: true)
#show raw: set text(size: 1.2em)
// #show raw: it => box(
//   stroke: black,
//   radius: 5pt,
//   inset: 5pt,
//   fill: rgb("#bdbdbd5e")
// )[#it]
// #let mono(content) = raw(content)
#let cajaCodigo(contenido) = {
  box(
    stroke: black,
    radius: 5pt,
    inset: 5pt,
    fill: rgb("#bdbdbd5e"),
    // Verificar si el contenido es de tipo content y un bloque raw
    if type(contenido) == content and contenido.func() == raw {
      contenido
    } else {
      raw(str(contenido))
    }
  )
}

Nombre: Gabriel Muñoz Marcelo Callisaya\
CI: 9873103\
= DAT 261 - Procesamiento del lenguaje natural
= Tarea 3.

1. Considerar el texto de la tarea nro. 2.- Rosa Blanca: Los alemanes que intentaron derrocar a Hitler disponible en: https://www.bbc.com/news/magazine-21521060
2. Normalizar las palabras con NLTK
3. Normalizar las palabras con spaCy
4. Determinar la diversidad léxica con NLTK y SpaCy, usando técnicas de normalización.
5. Comparar los resultados con la tarea nro. 2.

*Normalización con NLTK*:

Se aplicaron conversión a minúsculas, eliminación de tildes, signos de puntuación, números, espacios redundantes, stop words, stemming y lematización.

#cajaCodigo("Tokens (Stemming):
['seventi', 'year', 'ago', 'today', 'three', 'german', 'student', 'execut', 'munich', 'lead', 'resist', 'movement', 'hitler', 'sinc', 'member', 'white', 'rose', 'group', 'becom', 'german', 'nation', 'hero', 'lilo', 'furstramdohr', 'one', 'world', 'war', 'ii', 'height', 'munich', 'centr', 'nazi', 'power', 'group', 'student', 'start', 'campaign', 'passiv', 'resist', 'liselott', 'furstramdohr', 'alreadi', 'widow', 'age', 'follow', 'husband', 'death', 'russian', 'front', 'introduc', '...']
Tokens (Lematización):
['seventy', 'year', 'ago', 'today', 'three', 'german', 'student', 'executed', 'munich', 'leading', 'resistance', 'movement', 'hitler', 'since', 'member', 'white', 'rose', 'group', 'become', 'german', 'national', 'hero', 'lilo', 'furstramdohr', 'one', 'world', 'war', 'ii', 'height', 'munich', 'centre', 'nazi', 'power', 'group', 'student', 'started', 'campaign', 'passive', 'resistance', 'liselotte', 'furstramdohr', 'already', 'widow', 'age', 'following', 'husband', 'death', 'russian', 'front', 'introduced', '...']")

*Resultados*:

#box(stroke: black, radius: 5pt, inset: 5pt, fill: rgb("#bdbdbd5e"))[
Tipos (Stemming): 308\
Tokens (Stemming): 488\
Diversidad léxica (Stemming): 0.6311\
Tipos (Lematización): 319\
Tokens (Lematización): 488\
Diversidad léxica (Lematización): 0.6537\
]

*Normalización con spaCy (Diversidad léxica)*:

Se aplicaron las mismas técnicas, usando lematización nativa de spaCy y stemming de NLTK.

#cajaCodigo("Tokens (Stemming):
['seventi', 'year', 'ago', 'today', 'three', 'german', 'student', 'execut', 'munich', 'lead', 'resist', 'movement', 'hitler', 'sinc', 'member', 'white', 'rose', 'group', 'becom', 'german', 'nation', 'hero', 'lilo', 'furstramdohr', 'one', 'world', 'war', 'ii', 'height', 'munich', 'centr', 'nazi', 'power', 'group', 'student', 'start', 'campaign', 'passiv', 'resist', 'liselott', 'furstramdohr', 'alreadi', 'widow', 'age', 'follow', 'husband', 'death', 'russian', 'front', 'introduc', '...']
Tokens (Lematización):
seventy
year
ago
today
three
german
...
campaign
passive
resistance
liselotte
furstramdohr
already
widow
age
follow
husband
death
russian
front
introduce
...")

*Resultados*:

#box(stroke: black, radius: 5pt, inset: 5pt, fill: rgb("#bdbdbd5e"))[
Tipos (Stemming): 303\
Tokens (Stemming): 486\
Diversidad léxica (Stemming): 0.6235\
Tipos (Lematización): 296\
Tokens (Lematización): 486\
Diversidad léxica (Lematización): 0.6091\
]

*Comparación con Tarea 2*:

*Comparación con Tarea 2*:

En la Tarea 2, los resultados fueron:

#cajaCodigo("
NLTK: Tipos = 410, Tokens = 1062, Diversidad léxica = 0.3861 (38.61%)
spaCy: Tipos = 412, Tokens = 1098, Diversidad léxica = 0.3752 (37.52%)
")

En la Tarea 3, la normalización cambió bastante las cosas. Al usar técnicas como convertir todo a minúsculas, quitar tildes, signos de puntuación, números, espacios de más y stop words, se redujeron mucho los tokens (488 en NLTK, 486 en spaCy) y los tipos (308-319 en NLTK, 296-303 en spaCy). Esto pasó porque se eliminaron palabras vacías (como "the", "and") y elementos que no aportan al significado, como comas o números.

El stemming y la lematización también ayudaron a unificar palabras. Por ejemplo, "students" se volvió "student" (lematización) o "studen" (stemming), lo que bajó los tipos más que los tokens, aumentando la diversidad léxica. Los resultados fueron:

#cajaCodigo("
NLTK (Stemming): Tipos = 308, Tokens = 488, Diversidad léxica = 0.6311
NLTK (Lematización): Tipos = 319, Tokens = 488, Diversidad léxica = 0.6537
spaCy (Stemming): Tipos = 303, Tokens = 486, Diversidad léxica = 0.6235
spaCy (Lematización): Tipos = 296, Tokens = 486, Diversidad léxica = 0.6091
")

Las diferencias entre NLTK y spaCy siguen ahí, como en la Tarea 2, por cómo tokenizan. Por ejemplo, NLTK toma "furstramdohr" como un solo token, pero spaCy lo separa. Sin embargo, al quitar guiones y otros signos en la normalización, estas diferencias son menos marcadas. La lematización de spaCy es más conservadora, dando menos tipos (296 vs. 319 de NLTK) y una diversidad léxica un poco menor.

En resumen, la normalización limpió el texto de ruido y unificó palabras, haciendo que la diversidad léxica suba bastante comparada con la Tarea 2. Ambas bibliotecas dieron resultados parecidos, mostrando que son efectivas para este tipo de análisis.

// En la Tarea 3, la normalización redujo significativamente los tokens y tipos al eliminar stop words, signos de puntuación, números y espacios redundantes. El stemming y la lematización unificaron palabras relacionadas (por ejemplo, "students" → "student" o "studen"), aumentando la diversidad léxica. Las diferencias entre NLTK y spaCy persisten debido a su tokenización (por ejemplo, manejo de guiones), pero son menos pronunciadas tras la normalización.

// Para la tokenización por palabras con NLTK, se importa la función `word_tokenize` de `nltk.tokenize`. Para manejar mejor el texto, se lo almacena en un archivo `textoBBC.txt` el cual se leerá en el programa de python.

// #cajaCodigo("from nltk.tokenize import word_tokenize

// with open('textoBBC.txt', 'r', encoding='utf-8') as archivo:
//     texto = archivo.read()

// palabras = word_tokenize(texto)
// print(palabras)")

// La ejecución parcial del programa es:

// #box(stroke: black, radius: 5pt ,inset: 5pt, fill: rgb("#bdbdbd5e"))[
// ```regex
// ['Seventy', 'years', 'ago', 'today', ',', 'three', 'German', 'students', 'were', 'executed', 'in', 'Munich', 'for', 'leading', 'a', 'resistance', 'movement', 'against', 'Hitler', '.', 'Since', 'then', ',', 'the', 'members', 'of', 

// ...

// 'up', 'to', 'the', 'age', 'of', '86', '.', 'Her', 'friend', 'Alexander', 'Schmorell', 'was', 'made', 'a', 'saint', 'by', 'the', 'Russian', 'Orthodox', 'church', 'in', '2012', '.', 'He', 'would', 'have', 'laughed', 'out', 'loud', 'if', 'he', "'d", 'known', ',', 'says', 'Furst-Ramdohr', '.', 'He', 'was', "n't", 'a', 'saint', '-', 'he', 'was', 'just', 'a', 'normal', 'person', '.']
// ```
// ]

// Como se puede ver, la función `word_tokenize` también tokeniza símbolos como comas, puntos y guiones, aunque cuando un guión no está separado por espacios, se toma en cuenta como parte de la palabra; también toma por separado las contracciones (wasn't)

// *Tokenización con SpaCy*:

// Para la tokenización con SpaCy, se usa un modelo "blank" en inglés, se lee el mismo archivo `textoBBC.txt`.

// #box(stroke: black, radius: 5pt ,inset: 5pt, fill: rgb("#bdbdbd5e"))[
// ```regex
// import spacy
// nlp = spacy.blank("en")

// with open('textoBBC.txt', 'r', encoding='utf-8') as archivo:
//     texto = archivo.read()

// doc = nlp(texto)

// for token in doc:
//     print(token)
// ```
// ]

// La ejecución parcial del programa es:

// #box(stroke: black, radius: 5pt ,inset: 5pt, fill: rgb("#bdbdbd5e"))[
// ```regex
// Seventy
// years
// ago
// today
// ,
// three
// German
// students
// were
// executed
// in
// Munich
// for

// ...

// Ramdohr
// .
// He
// was
// n't
// a
// saint
// -
// he
// was
// just
// a
// normal
// person
// .
// ```
// ]

// `SpaCy` imrpime los tokens en líneas separadas, pero esta es una diferencia únicamente visual. Como con `NLTK`, `SpaCy` reconoce símbolos como comas, puntos y guiones.

// *Diversidad léxica*:

// Para encontrar la diversidad léxica, se sigue la fórmula:
// $
//   "Diversidad léxica" = "Tipos" / "Tokens"
// $

// Donde los tipos son como los tokens pero sin repeticiones y la cantidad de tokens no puede ser cero.

// Se usaron programas de python para determinar la cantidad de tipos, tanto con NLTK como con SpaCY.

// En NLTK:

// #box(stroke: black, radius: 5pt ,inset: 5pt, fill: rgb("#bdbdbd5e"))[
// ```regex
// import nltk
// from nltk.tokenize import word_tokenize

// with open('textoBBC.txt', 'r', encoding='utf-8') as archivo:
//     texto = archivo.read()

// Tokens = word_tokenize(texto.lower())

// tipos = set(Tokens)

// tokens = len(Tokens)

// ttr = len(tipos) / tokens if tokens > 0 else 0

// print(f"Tipos: {len(tipos)}")
// print(f"Tokens: {tokens}")
// print(f"Diversidad léxica: {ttr:.4f}")
// ```
// ]

// Corrida:

// #box(stroke: black, radius: 5pt ,inset: 5pt, fill: rgb("#bdbdbd5e"))[
// ```regex
// Tipos: 410
// Tokens: 1062
// Diversidad léxica: 0.3861
// ```
// ]
 
// En SpaCy:

// #box(stroke: black, radius: 5pt ,inset: 5pt, fill: rgb("#bdbdbd5e"))[
// ```regex
// import spacy

// nlp = spacy.blank("en")

// with open('textoBBC.txt', 'r', encoding='utf-8') as archivo:
//     texto = archivo.read()

// doc = nlp(texto.lower())

// Tokens = [token.text for token in doc if not token.is_space]

// tipos = set(Tokens)

// tokens = len(Tokens)
// ttr = len(tipos) / tokens if tokens > 0 else 0

// print(f"Tipos: {len(tipos)}")
// print(f"Tokens: {tokens}")
// print(f"Diversidad léxica: {ttr:.4f}")
// ```
// ]

// Corrida:

// #box(stroke: black, radius: 5pt ,inset: 5pt, fill: rgb("#bdbdbd5e"))[
// ```regex
// Tipos: 412
// Tokens: 1098
// Diversidad léxica: 0.3752
// ```
// ]

// En porcentajes, los resultados son:
// - `NLTK`: 38.61%
// - `SpaCy`: 37.52%

// *Comparación*:

// Aunque ambas librerías mostraron resultados similares, hubieron algunas diferencias pequeñas en la cantidad de tipos y tokens, lo cual afecto minimamente a la diversidad léxica.

// Las diferencias se deben a la forma de tokenizar los textos por parte de cada librería. En el texto, se habla de Liselotte Furst-Ramdohr, cuyo apellido lleva un guión, en `NLTK`, se considera a su apellido como un solo token, mientras que en `SpaCy`, se consideran como tres ('Furst', '-', 'Ramdohr'). Cuando un guión está rodeado por espacios, ambas librerías lo tratan igual, como un token aparte, pero si no está con espacios, se genera la diferencia entre librerías.

// En el texto aparecen otros guiones sin espacios, como `99-year-old`, `best-known` u `Oscar-nominated`. Estos casos son los responsables de la discrepancia entre la cantidad encontrada de tipos y tokens entre ambas librerías.

// En conclusión, ambas librerías manejan la tokenización de una forma muy similar, aunque con pequeñas diferencias con casos especiales como con los guiones, los resultados al calcular la diversidad léxica son prácticamente iguales.

// \

// El código usado para tokenizar fue adaptado de https://www.geeksforgeeks.org/nlp/tokenization-using-spacy-library/ y https://www.geeksforgeeks.org/nlp/spacy-for-natural-language-processing/