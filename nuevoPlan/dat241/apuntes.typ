#set page(
  margin: (x: 2.5cm, y: 2.5cm) //Para trabajos digitales e impresos simples
  // margin: (left: 3.8cm, y: 2.5cm, right: 2.5cm) //Para trabajos impresos a doble cara
)
#set text(lang:"es")
#set text(font: "DejaVu Sans")
#show math.equation: set text(font: "DejaVu Math TeX Gyre")
#set par(justify: true)


DAT 241 - Programación paralelo y distribuida.

= Bibliografía.

= Temario.
+ Introducción.
+ Herramientas de programación.
// python, c, c++, c#, R
+ Aplicaciones paralelas y distribuidas.
// Fibonacci, series, movimientos.
+ Memoria y procesamiento.
// GPU
+ Bases de datos distribuidas.
// Particionamiento, agentes, transformaciones ETL, dataware house DW

= Ponderación.
#grid(
  inset: 5pt,
  columns: (auto, auto),
  [Primer parcial], [20],
  [Primer parcial], [20],
  [Exámen final (proyecto con defensa)], [30],
  [Trabajos prácticos], [30],
  [Puntos extas], [15],
)

-------

Primer trabajo: Traer el nombre de un software que de indicaciones del las características de la pc, como memoria, nucleos, etc.

Segundo trabajo: Instalar team viewer con otro compañero, con y sin control total de la sesión. Terminal simple con acceso exclusivo y terminal simple con acceso diferenciado. Trabajo para el 25/08

#pagebreak()
// #set heading(numbering: "1.")

La programación paralela y distribuida no son paradigmas excluyentes entre sí. 

// Programación distribuida.- 

// Programación paralela.-

La computación distribuida es opuesta a la computación centralizada.

== Computación centralizada.
La computación centralizada ofrece una gran seguridad debido a que los datos no se comparten en varios lugares,  pero también presenta un costo elevado.

== Computación distribuida.
La computación distribuida aplica procesos que se ejecutan de forma simultánea es una infraestructura computacional que se ubica en una única ubicación física. Usa mecanismos de memoria distribuida para comunicarse y sincronizarse.

Instalar vistual box para máquinas virtuales, debian.

Investigar cómo cambiar la version de anaconda que utiliza C para la que utiliza mingw