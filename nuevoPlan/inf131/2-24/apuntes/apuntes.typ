#import "@preview/fletcher:0.5.2" as fletcher: diagram, node, edge, shapes
#import "@preview/cetz:0.3.1": canvas, draw, tree

#set page(
 margin: (x: 40pt, y: 40pt),
)
#set text(lang:"es")
#set text(font: "DejaVu Sans")
#show math.equation: set text(font: "DejaVu Math TeX Gyre")
#set heading(numbering: "1.")
#show heading.where(level: 3): set heading(numbering: "1. 1. a)")
#show heading.where(level: 4): set heading(numbering: none)

#set grid(gutter: 20pt, rows: auto)
#show grid: set par(leading: 5pt, spacing: 30pt)
#show grid: set text(size: 10pt)
#show raw : set text(size: 1.25em)
#show heading.where(level: 3) : set block(below: 1em)
= Complejidad
== Análisis de frecuencia
=== Caso base bucles for
#grid(
    columns: (auto, auto, auto, auto),
    [```java
    for(int i = 0; i < n; i++) {
      System.out.println(i);
    }
    ```],
    [#text(fill: rgb("#276ef1"))[
      $n+1$ \
      $n$
    ]],
    [#text(fill: rgb("#24a540"))[
      \ Dentro del bucle se resta $-1$
    ]],
    [#text(fill: rgb("#a53324"))[
      \ Se ejecuta n veces
    ]]
)

==== Variaciones
#grid(
    columns: (auto, auto, auto),
    [```java
    for(int i = 0; i <= n; i++) {
      System.out.println(i);
    }
    ```],
    [#text(fill: rgb("#276ef1"))[
      $n+2$ \
      $n+1$
    ]],
    [#text(fill: rgb("#24a540"))[
      Debido al `<=`, se suma $+1$
    ]]
)

#grid(
    columns: (auto, auto, auto),
    [```java
    for(int i = 1; i < n; i++) {
      System.out.println(i);
    }
    ```],
    [#text(fill: rgb("#276ef1"))[
      $n$ \
      $n-1$
    ]],
    [#text(fill: rgb("#24a540"))[
      Debido a que empieza en 1, se resta $-1$
    ]]
)

#grid(
    columns: (auto, auto, auto),
    [```java
    for(int i = 5; i < n; i++) {
      System.out.println(i);
    }
    ```],
    [#text(fill: rgb("#276ef1"))[
      $n-4$ \
      $n-5$
    ]],
    [#text(fill: rgb("#24a540"))[
      Debido a que empieza en 5, se resta $-5$
    ]]
)
  
#grid(
    columns: (auto, auto, auto),
    [```java
    for(int i = 0; i < n + 2; i++) {
      System.out.println(i);
    }
    ```],
    [#text(fill: rgb("#276ef1"))[
      $n+3$ \
      $n+2$
    ]],
    [#text(fill: rgb("#24a540"))[
      Debido al que itera hasta $n+2$, se suma $+2$
    ]]
)

=== Caso base bucle while
#grid(
    columns: (auto, auto, auto, auto),
    [```java
    while (n > 0) {
        System.out.println(n);
        n--;
    }
    ```],
    [#text(fill: rgb("#276ef1"))[
      $n+1$ \
      $n$ \
      $n$
    ]],
    [#text(fill: rgb("#24a540"))[
      \ Dentro del bucle se resta $-1$
    ]],
    [#text(fill: rgb("#a53324"))[
      \ Se ejecuta n veces
    ]]
)

==== Variaciones
#grid(
    columns: (auto, auto, auto),
    [```java
    while (n >= 0) {
        System.out.println(n);
        n = n - 2;
    }
    ```],
    [#text(fill: rgb("#276ef1"))[
      $n+2$ \
      $n+1$ \
      $n+1$
    ]],
    [#text(fill: rgb("#24a540"))[
    Debido al `>=`, se suma $+1$
    ]]
)

#grid(
    columns: (auto, auto, auto),
    [```java
    while (n > 2) {
        System.out.println(n);
        n--;
    }
    ```],
    [#text(fill: rgb("#276ef1"))[
      $n-1$ \
      $n-2$ \
      $n-2$
    ]],
    [#text(fill: rgb("#24a540"))[
      Debido al `n > 2`, se resta $-2$
    ]]
)

#grid(
    columns: (auto, auto, auto),
    [```java
    while (n > 0) {
        System.out.println(n);
        n = n - 2;
    }
    ```],
    [#text(fill: rgb("#276ef1"))[
      $n-1$ \
      $n-2$ \
      $n-2$
    ]],
    [#text(fill: rgb("#24a540"))[
    \ \ Debido al `n = n - 2`, se resta $-2$
    ]]
)

#grid(
    columns: (auto, auto, auto),
    [```java
    while (n > 0) {
        System.out.println(n);
        n = n * 2;
    }
    ```],
    [#text(fill: rgb("#276ef1"))[
      $log n +1$ \
      $log n$ \
      $log n$
    ]],
    [#text(fill: rgb("#24a540"))[
    \ \ Debido al `n = n * 2`, se aplica $log n$
    ]]
)

#grid(
    columns: (auto, auto, auto),
    [```java
    while (n > 0) {
        System.out.println(n);
        n = n / 2;
    }
    ```],
    [#text(fill: rgb("#276ef1"))[
      $log n +1$ \
      $log n$ \
      $log n$
    ]],
    [#text(fill: rgb("#24a540"))[
    \ \ Debido al `n = n / 2`, se aplica $log n$
    ]]
)
== Algoritmos recursivos
=== Método iterativo
#show grid: set align(center)
#show grid: set par(leading: 1em, spacing: 1em)
#set grid(gutter: 50pt)
$ T(n) = cases(
  4 &quad "si" n=2,
  T(n-5)+11 &quad "si" n>2
) $
Se debe repetir la función hasta encontrar un patrón con $k$
#grid(align: center,
  columns: (auto, auto),
  [$T(n)= T(n-5)+11$\
   $T(n)=T(n-10)+22$\
   $T(n)=T(n-15)+33$
  ],
  [#text(fill: red)[
   $T(n-5)=T(n-10)+11$\
   $T(n-10)=T(n-15)+11$
  ]]
)
El patrón es:
$ T(n) = T(n-5k)+11k $
Si igualamos $T(n-5k)=T(2)$:
#par(leading: 1.3em)[
$ n-5k=2 \
-5k =2-n\
k=-(2-n)/(5) 
$]
Ahora
#par(leading: 1.3em)[
$ T(n) = T(2)+11k \
 T(n) = 4+11 ( -(2-n)/(5) )\
 T(n) = 4 - (22-11n)/5\
 T(n) = (20-(22-11n))/5\
 T(n)=(-2+11n)/5
 $]
 #set math.equation()
 Esto da un orden de complejidad $O(n)$ lineal
 === Teorema máster
 #show grid: set par(spacing: 2em)
 $ T(n)=a T(n/b)+c n^k \
 T(n) in cases(
  O(n^(log_b a)) &quad "si" a>b^k\
  O(n^k log n) &quad "si" a=b^k\
  O(n^k) &quad "si" a<b^k
 )
 $

#pagebreak()
= Segment tree

#let data = (
  [-2], ([0], ([3], [5], [3]), ([0], [0], [7])), ([-1], ([-2], [-2], [4]), ([1], [8], [1]))
  // [A], ([B], [C], ([G], [H]), [D]), ([E], [F])

)

#canvas(length: 1cm, {
  import draw: *

  set-style(content: (padding: .2),
    fill: gray.lighten(70%),
    stroke: black.lighten(10%))

  tree.tree(data, spread: 2.5, grow: 1.5, draw-node: (node, ..) => {
    circle((), radius: .45, stroke: none)
    content((), node.content)
  }, draw-edge: (from, to, ..) => {
    line((a: from, number: .45, b: to),
         (a: to, number: .45, b: from))
  }, name: "tree")

  // Draw a "custom" connection between two nodes
  // let (a, b) = ("tree.0-0-1", "tree.0-1-0",)
  // line((a, .45, b), (b, .45, a))
})

#diagram(
  node-stroke: .1em,
  node-fill: gray.lighten(70%),
  spacing: 0em,
  node((0,0), `5 `),
  node((1,0), `3 `),
  node((2,0), `0 `),
  node((3,0), `7 `),
  node((4,0), `-2`),
  node((5,0), `4 `),
  node((6,0), `8 `),
  node((7,0), `1 `),
)
