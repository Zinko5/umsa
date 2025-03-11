#set text(lang:"es")
#set text(font: "DejaVu Sans")
#show math.equation: set text(font: "DejaVu Math TeX Gyre")

#let fechaEntrega = datetime(year: 2025, month: 3, day: 6)

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
        *Evaluación de participación 3*
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
      *Estudiante:*
    ]
    #text(size: 14pt)[ #pad(left: 20pt, top: -5pt)[
      Gabriel Muñoz Marcelo Callisaya
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
= Hechos y dimensiones.
Las transformaciones para los hechos y dimensiones de dim_cliente, dim_producto, dim_tiempo y hec_venta:

== dim_cliente
Su archivo es Transformation5-cliente.ktr
#grid(
    columns: (auto, auto),
    inset: 0.5em,
    stroke: 0.4pt+ black,
    [diagrama],[salida],
    [#image("../media/t311.png")], [#image("../media/t312.png", width: 90%)],
)

Y las configuraciones de cada transformación:
#grid(
    columns: (auto, auto, auto),
    inset: 0.5em,
    stroke: 0.4pt+ black,
    [#image("../media/t3101.png")],
    [#image("../media/t3102.png")],
    [#image("../media/t3103.png")],
    [#image("../media/t3104.png")],
    [#image("../media/t3105.png")],
)
== dim_producto
Su archivo es Transformation5-producto.ktr
#grid(
    columns: (auto, auto),
    inset: 0.5em,
    stroke: 0.4pt+ black,
    [diagrama],[salida],
    [#image("../media/t321.png")], [#image("../media/t322.png", width: 90%)],
)

Y las configuraciones de cada transformación:
#grid(
    columns: (auto, auto, auto),
    inset: 0.5em,
    stroke: 0.4pt+ black,
    [#image("../media/t3201.png")],
    [#image("../media/t3202.png")],
    [#image("../media/t3203.png")],
    [#image("../media/t3204.png")],
    [#image("../media/t3205.png")],
)
== dim_tiempo
Su archivo es Transformation5-tiempo.ktr
#grid(
    columns: (auto, auto),
    inset: 0.5em,
    stroke: 0.4pt+ black,
    [diagrama],[salida],
    [#image("../media/t331.png")], [#image("../media/t332.png", width: 90%)],
)

Y las configuraciones de cada transformación:
#grid(
    columns: (auto, auto, auto),
    inset: 0.5em,
    stroke: 0.4pt+ black,
    [#image("../media/t3301.png")],
    [#image("../media/t3302.png")],
    [#image("../media/t3303.png")],
    [#image("../media/t3304.png")],
)
== hec_venta
Su archivo es Transformation5-venta.ktr
#grid(
    columns: (auto, auto),
    inset: 0.5em,
    stroke: 0.4pt+ black,
    [diagrama],[salida],
    [#image("../media/t341.png")], [#image("../media/t342.png", width: 90%)],
)

Y las configuraciones de cada transformación:
#grid(
    columns: (auto, auto, auto),
    inset: 0.5em,
    stroke: 0.4pt+ black,
    [#image("../media/t3401.png")],
    [#image("../media/t3402.png")],
    [#image("../media/t3403.png")],
    [#image("../media/t3404.png")],
    [#image("../media/t3405.png")],
)
= ETLs con jobs
Su archivo es Job1.kjb
#grid(
    columns: (auto, auto),
    inset: 0.5em,
    stroke: 0.4pt+ black,
    [diagrama],[logs],
    [#image("../media/t351.png")], [#image("../media/t352.png", width: 90%)],
)

Y las configuraciones de cada transformación:
#grid(
    columns: (auto, auto, auto),
    inset: 0.5em,
    stroke: 0.4pt+ black,
    [#image("../media/t3501.png")],
    [#image("../media/t3502.png")],
    [#image("../media/t3503.png")],
    [#image("../media/t3504.png")],
    [#image("../media/t3505.png")],
)