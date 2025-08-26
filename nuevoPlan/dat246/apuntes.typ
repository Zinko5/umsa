#import "@preview/cetz:0.3.4": canvas, draw, tree
#set page(
  margin: (x: 2.5cm, y: 2.5cm) //Para trabajos digitales e impresos simples
  // margin: (left: 3.8cm, y: 2.5cm, right: 2.5cm) //Para trabajos impresos a doble cara
)
#set text(lang:"es")
#set text(font: "DejaVu Sans")
#show math.equation: set text(font: "DejaVu Math TeX Gyre")
#let separador() = align(center)[#line(length: 100%)]
#set par(justify: true)

#set quote(block: true)

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

DAT 246 - Modelación Estadística

// = La recta.
Primer parcial con dos variables, buscar un ejemplo real para resolver un problema, grupos de a dos.

Hacer gráficas (con tres dimensiones) del modelo de regresión lineal. Dibujos a mano, no en computadora.

$
  y = beta_0 + beta_1 x_1 + beta_2 x_2 + epsilon
$

Universidad Mayor de San Andrés, facultad de ciencias puras y naturales.

Frecuencia: Cuatro horas por semana por cada materia.

Cuarto semestre, 2/2025.

Plan curricular por competencia.

* Competencia de la asignatura.*

Capacidad para integrar conocimientos adecuados en el modelo matemático, cálculo y diseño experimental, aplicando los modelos, métodos y técnicas relevantes en distintas áreas de la estadística matemática, participando en la creación de nuevas tecnologías que contribuyan al desarrollo de la sociedad de la información.

#outline()

= Contenido.
#set heading(numbering: "1.")

= Introducción a la modelación.
== Concepto de modelo.
Es la representación de un sistema real de acuerdo al objetivo del problema.

#image("Sin título.png")

Un modelo es una forma de ver, una abstracción de algo real.

Un modelo es la representación de la realidad, por lo tanto no incluye todos los aspectos del problema exacto.

Es una representación del sistema estudiado, para predecir y observar los posibles cambios.

Un modelo científico es una representación de algún objeto sujeto a investigación que pueden ser procesos, acontecimientos, sistemas, etc. Y que se utilizan con fines de predicción y control.

Un modelo científico tiene caracter explicativo mas que descriptivo.

Las ventajas de tener un modelo son:
- Cuando el sistema real no se puede manipular. Ejemplos: astronomia, modelo relacional (base de datos), planos de arquitectura
- Cuando el costo es muy alto. Ejemplos: Ventas, simuladores de conducción, mostrar al usuario sistemas informáticos (modelo entidad relación)

== Clasificación de modelo.
*Clasificación segun el grado de abstracción*
- Modelos icónicos: Representan de forma pictórica o visual ciertos aspectos, además se parece a lo que representa. Ejemplos: Fotografías, juguetes, esculturas, dibujos.

#image("Sin título-1.png")

- Modelos analógicos: Utilizan una serie de propiedades para representar otro conjunto de propiedades que posee el sistema estudiado. Ejemplos: Estructuras geólogicas (se representa por colores de acuerdo a distintas propiedades), diagramas de flujo con programas.

- Modelos simbólicos: Se emplean para asignar las propiedades del sistema por medio de una ecuación matemática.

*Clasificación de los modelos por el método de solución*.

Hay dos tipos de modelos, los físicos y los matemáticos, el físico tiene la parte estática y dinámica. El matemática también tiene la parte estático y dinámico. El estático de física se divide en la escala y los icónicos, la parte dinámica solo tiene los analógicos.
El estático de matemática se divide en numérico y analitico, mientras que el dinámico tiene númerico y analítico, numérico tiene simulación de sistemas.


#let data = (
  [Modelos], ([Físicos], ([Estáticos], [Escala], [Icónicos]), ([Dinámicos], [Analógicos])), ([Matemáticos], ([Estáticos], [Numéricos], [Analíticos]), ([Dinámicos], ([Numéricos], [Simulación de sistemas]), [Analíticos]))
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

  // Draw a "custom" connection between two nodes
  // let (a, b) = ("tree.0-0-1", "tree.0-1-0",)
  // line((a, .6, b), (b, .6, a), mark: (end: ">", start: ">"))
})

*Simulación de sistemas*.

Es una técnica que utilizan los modelos matemáticos dinámicos.

*Los modelos físicos*.

Los atributos de las entidades del sistema se representan mediante medidas físicas, y las actividades del sistema representan las leyes físicas.

Dentro de los modélos físicos estáticos, tenemos los modelos a escala, por ejemplo, un mapa, accidentes de tránsito, estudio de naves acuáticas. 

Los modelos icónicos representan de manera visual/pictórica.

*Los modelos matemáticos*.
Las entidades y los atributos de un sistema se representan mediante variables matemáticas. las actividades mediante actividades matemáticas que relacionan las variables. Dentro de ellas tenemos un modelo mateático estático.

El modelo matemático estático (no cambia en el tiempo): Despliega las relaciones entre los atributos del sistema cuando este está equilibrado, se puede resolver numéricamente y analíticamente. Es analítico si tiene solución, sino es numérico.

El modelo matemático dinámico significa que cambia a través del tiempo, permite deducir los cambios a los atributos del sistema en función del tiempo. De acuerdo a la complejidad, se puede resolver de manera analítica o numérica.

*Proceso de modelación*.

Es las etapas del proceso de contrucción de un modelo.

Sistema real supuesto.
- Abstracción.
- Validación.

Modelo o modelo conceptual.
- Transformación.
- Validación.

modelo para ordenador.
- Implementación.
- Validación.

Cálculo.
- Experimento.
- Validación.

Sistema real supuesto.

*Abstracción*: Consisten en el aislamiento mental que permite separar las características escenciales y generales de otras propiedades secundarias.

Sea $x$ el número de individuos de una especie $e$,suponemos que no existe otra especie que se alimente de los productos que $e$ consume, también $e$ no sirve de alimento a otra especie. Entonces la taza de crecimiento en función al tiempo $(d x)/(d t)$ donde $x$ es proporcional a una variable $a$, entonces $(d x)/(d t) = a x$

== Repaso de la recta.
= Regresión lineal y estimación de parámetros.
== La recta de regresión.
== Mínimos cuadrados.
== Supuestos del modelo de regresión lineal.
== Aproximación polinomial.
== Regresión lineal múltiple. // <- Este es el examen.
== Dilema del sesgo y varianza.
= Máxima Verosimilitud.
== Estimación de parámetros.
== Estimación de máxima verosimilitud.
= Estadística bayesiana.
== Repaso del teorema de Bayes.
== Descripción a priori y a posteriori.
== Inferencia bayesiana.
== Clasificador bayesiano ingenuo. // pregunta del segundo parcial.
== Estimación MAP (estimador máximo a posteriori).
== Teoría de desición bayesiana.
== Regresión lineal bayesiana. // Si alcanza el tiempo
= Métodos basados en árboles.
== Árboles de regresión. // pregunta de examen.
== Árboles de clasificación. // Si alcanza el tiempo

= Bibliografía.
- Germán A., Carolin J., Donald. Bayesian Data Analysis.
- Murphy - Machine Learning: A Probabilistic Perspective.
Mas cualquier libro de estadística.

// *Lema:*
// #align(center)[Piensa como un bayesiano, preocúpare como un frecuentista.]
// - Beadley Efron.

\

#quote(attribution: [Beadley Efron])[
  Piensa como un bayesiano, preocúpate como un frecuentista.
]

#separador()

#grid(
  inset: 5pt,
  stroke: black,
  columns: (auto, auto),
  [Primer parcial.], [30 puntos.],
  [Segundo parcial.], [25 puntos.],
  [Examen Final.], [30 puntos.],
  [Prácticas y participación en clases.], [15 puntos.],
  [Asistencia.], [5 puntos extra.],
)

// Formación de grupos hasta la siguiente semana, prerparación del tema hasta la subsiguiente.

Para las prácticas en clase se hará una tarjeta de 12 cm #sym.times 10 cm con:

#align(center)[#block[
  // DAT 246 II/2025
// Paterno, Materno, Nombres.
#grid(
  inset: 5pt,
  stroke: black,
  columns: (auto, auto, 20pt, 50pt, 50pt),
  grid.cell(
    colspan: 5,
    [Dat 246 II/2025]
  ),
  grid.cell(
    colspan: 5,
    [Paterno, materno, nombres.]
  ),
  [Fecha.], [Firma.], [ ], [ ], [ ],
  [ ], [ ], [ ], [ ], [ ],
  [ ], [ ], [ ], [ ], [ ],
  [ ], [ ], [ ], [ ], [ ],
  [ ], [ ], [ ], [ ], [ ],
  [ ], [ ], [ ], [ ], [ ],
  )
]]

Práctica 1: Plan de trabajo.

Práctica 2: Frase de motivación.

Práctica 3: Carátula donde cada uno se compromete a aprobar la materia.

