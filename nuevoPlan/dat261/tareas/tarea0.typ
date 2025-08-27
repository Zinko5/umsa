#set page(
  margin: (x: 2.5cm, y: 2.5cm) //Para trabajos digitales e impresos simples
  // margin: (left: 3.8cm, y: 2.5cm, right: 2.5cm) //Para trabajos impresos a doble cara
)
#set text(lang:"es")
#set text(font: "DejaVu Sans")
#show math.equation: set text(font: "DejaVu Math TeX Gyre")
#set par(justify: true)
#show raw: set text(size: 1.2em)

Nombre: Gabriel Muñoz Marcelo Callisaya\
CI: 9873103\
= DAT 261 - Procesamiento del lenguaje natural
= Práctica 1.

*1. Encontrar la forma más eficiente de encontrar un número de whatsapp de Bolivia con expresiones regulares.*

#box(stroke: black, radius: 5pt ,inset: 5pt, fill: rgb("#bdbdbd5e"))[
```regex
\+?\s?591\s?\d{8}
```
]

Es eficiente debido a que es resiliente a distintas formas de escribir el número (con el + al inicio, con espacio, etc) y usa el cuantificador `{8}` para controlar la cantidad de dígitos.

*2. Encontrar la forma más eficiente de encontrar un correo electrónico con expresiones regulares.*

#box(stroke: black, radius: 5pt ,inset: 5pt, fill: rgb("#bdbdbd5e"))[
```regex
\w+([\.\w]+?)*@\w+([\.\w]+?)*\.\w+([\.\w]+?)*
```
]

*3. ¿Dónde y qué uso se puede dar a las expresiones regulares en la informática?*

En la informática, se puede dar uso de las expresiones regulares al buscar caracteres de interés en un código, por ejemplo, puede darse un caso en el que interese buscar todos los `if` en donde se verifique el valor de `x`, lo que se lograría buscando `if\(x=.+\)`. Otro ejemplo sería al buscar distintos tipos de archivos, por ejemplo, para hacer un programa que busque archivos que empiecen por `log` y terminen con `.txt`, la busqueda con expresiones regulares sería: `^log.*\.txt$`.

En general, es útil para encontrar distintos patrones en los caracteres que escribamos según requerimientos específicos que podamos tener, para seleccionar y encontrar cadenas de texto que sería difícil, tedioso o practicamente imposible de hacer manualmente.
