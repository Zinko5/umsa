#set page(
  margin: (x: 2.5cm, y: 2.5cm) //Para trabajos digitales e impresos simples
  // margin: (left: 3.8cm, y: 2.5cm, right: 2.5cm) //Para trabajos impresos a doble cara
)
#set text(lang:"es")
#set text(font: "DejaVu Sans") //Sans
// #set text(font: "DejaVu Serif") //Serif
#set par(justify: true)
#show math.equation: set text(font: "DejaVu Math TeX Gyre")
#show math.equation:box
#let separador() = align(center)[#line(length: 100%)]

#set quote(block: true)


#import "@preview/numbly:0.1.0": numbly
#set heading(numbering: numbly(
  "{1:1}.",
  "{2:a})", // use {level:format} to specify the format
))

#show heading.where(level: 3): set heading(numbering: none)
#show heading.where(level: 3): set heading(outlined: false)

Formato del parcial:

#separador()

#pad(x: 120pt)[#stack(dir: ltr, align(left)[1er Parcial DAT 246], align(right)[II/2025])]


// #stack(dir: ltr, "Nombre 1 paterno materno nombres")
#stack(dir: ltr, "Nombre 1", pad(left: 25pt)[Paterno, materno nombres])
#stack(dir: ltr, "Nombre 2", pad(left: 25pt)[Paterno, materno nombres])

= Resumen

Longitud: 150 palabras.

= Objetivo

= Desarrollo

==

Mostrar el muestreo Real. El tamaño de la muestra es de 30 datos.

==

Calcular intervalos en las filas, longitud, representación de clases, etc.

// el b) no es obligatorio, depende de los datos, no debe ser forzado, solo cuando es necesario
// si los datos no dan una gráfica recta, modificarlos
// no es tan obligatorio
// observar que en una práctica por qué no se puede graficar de manera lineal, se debían modificar esos datos, se debía modificar *algo*
// si hay datos repetidos, modificar algo, quizas limpieza de datos

==

Graficar los puntos de la muestra, en tres variables (tres dimensiones).

==

Graficar los puntos de los regresores de manera individual.

$
  y = f(x_1)\
  y = f(x_2)\
$

==

Encontrar e interpretar al menos dos hiperplanos, (cortar, hacer cortes) medir los cortes.

// saber graficar en 3d de manera manual

// no hacer en computadora y copiar, sino que calcular todo manualmente

// en el corte, ver los puntos, a donde se acercan

==

Desarrollar de manera formal el método a utilizar (mínimos cuadrados u otros).

==

Realizar los cálculos paso a paso (redondeo con tres decimales).

- matriz inversa.
etc.

// todo lo de los apuntes

==

Encontrar el modelo.

// hay varias formas de representar el modelo
// ecuacion completa, redes
// elegir como se quiere presentar, en que forma 

==

Indicar qué tipo de modelo es, de acuerdo a la clasificacion teórica realizada en clases.

==

Encontrar el error estándar, interprete e identifique.

==

Calcular el coeficiente de determinación múltiple e interpretar.

== 

Calcular $r^2$ ajustado e interpretar.

// comparar con $r^2$ simple

==

Mostrar la homocelasticidad e interpretar.

// hacer dos graficas, comparar
// sobre los errores

== 

Mostrar la normalidad, el error (con distribucion normal de varianza) e interpretar.
// $epsilon_i ~ (0, sigma^2)$

==

Analizar e interpretar el modelo desde un punto de vista del área que estudió (area de estudio, p.ej. medicina, electronica, etc).

= Conclusiones 

Longitud: Cinco lineas.

#separador()

Entrega: el 14 de octubre, todo manuscrito.