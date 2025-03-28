#set text(lang:"es")
#set text(font: "DejaVu Sans")
#show math.equation: set text(font: "DejaVu Math TeX Gyre")

#let fechaEntrega = datetime(year: 2025, month: 3, day: 12)

#let overlay(img, color, width: auto, height: auto) = layout(bounds => {
  let size = measure(img, width: width, height: height)
  img
  place(top + left, rect(width: 100%, height: 100%, fill: color))
})

#let formatFecha(fecha) = {
  let meses = (
    "enero", "febrero", "marzo", "abril", "mayo", "junio",
    "julio", "agosto", "septiembre", "octubre", "noviembre", "diciembre"
  )
  let dia = str(fecha.day()) // Convertimos el día a cadena
  let mes = meses.at(fecha.month() - 1)
  let año = str(fecha.year()) // Convertimos el año a cadena
  dia + " de " + mes + " del " + año
}

#page(
  background: overlay(image("/utiles/logos/umsaLogo.png", width: 25em), white.transparentize(30%)), 
  margin: (x: 3cm),
  paper: "a4"
  )[
    #align(center)[
      #text(size: 16pt)[#pad(top: 0pt)[
      // #text(size: 16pt, stroke: 0.1mm + white)[#pad(top: 100pt)[
        Universidad Mayor de San Andrés\
        Facultad de Ciencias Puras y Naturales
      ]]
      #text(size: 30pt)[#pad(top: -5pt)[
        *Informe \#1 DW con metodología Hefesto*
      ]]
      #text(size: 16pt)[#pad(top: -15pt)[
        DAT 251 - Base de datos 3
      ]]
    ]
  #pad(top: 260pt)[
    #text(size: 16pt)[
      *Docente:*
    ]
    #text(size: 14pt)[ #pad(left: 20pt, top: -5pt)[
      Lic. Celia Elena Tarquino Peralta
    ]]
  ]
  #pad(top: 15pt)[
    #text(size: 16pt)[
      *Estudiantes:*
    ]
    #text(size: 14pt)[ #pad(left: 20pt, top: -5pt)[
      - 
      - 
      -
    ]]
  ]
  #pad(top: 15pt)[
    #text(size: 16pt)[
      *Fecha de entrega:*
    ]
    #text(size: 14pt)[ #pad(left: 20pt, top: -5pt)[
      #formatFecha(fechaEntrega)
      // #fechaEntrega.display()
    ]]
  ]
#place(bottom + center)[
    #text(size: 13pt)[
    *La Paz - Bolivia*
  ]
]
]

#show grid:box
#set heading(numbering: "H1.")
#show heading.where(level: 2): set heading(numbering: none)
#set par(justify: true)

= Identificación del problema
== Problema identificado
En una fábrica, se observan ineficiencias en los procesos de producción que generan desperdicio de materiales y elevan los costos de fabricación. Estas ineficiencias no están claramente identificadas ni cuantificadas, lo que dificulta la toma de decisiones para optimizar los recursos.

== Objetivo del proyecto
Diseñar un data warehouse que permita analizar los datos de producción y desperdicio para identificar procesos ineficientes, reducir costos y minimizar el desperdicio de materiales.

== Justificación
La falta de un sistema analítico impide a la fábrica responder preguntas clave sobre el rendimiento de máquinas, operarios y productos, lo que afecta su competitividad y rentabilidad.

= Análisis de requerimientos

== Requerimientos funcionales

- Analizar la cantidad producida, el desperdicio y los costos de fabricación por producto, máquina, operario y período de tiempo.
- Permitir la comparación de eficiencia entre máquinas y turnos.
- Identificar patrones de desperdicio por categoría de producto o nivel de experiencia del operario.

== Preguntas estratégicas:
- ¿Qué productos generan mayor desperdicio y en qué períodos?
- ¿Qué máquinas presentan menor eficiencia y cómo impactan los costos?
- ¿Cómo varía la productividad según el turno y la experiencia del operario?
- ¿En qué meses se registran mayores costos de producción y por qué?

== Requerimientos no funcionales:
- El sistema debe ser escalable para incorporar más datos en el futuro.
- Los reportes deben generarse de forma rápida y visualmente clara para los tomadores de decisiones.

= Diseño conceptual
Modelo estrella:
 - Tabla de hechos y sus atributos:
  - *Producción*: Cantidad_Producida, Desperdicio,  Costos_Fabricacion
- Tablas de dimensiones y sus atributos:
 - *Producto*: Tipo, Categoría, Costo_Unitario
 - *Tiempo*: Día, Mes, Año
 - *Máquina*: Tipo, Modelo, Eficiencia
 - *Operario*: Turno, Experiencia, Productividad