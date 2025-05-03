#set text(lang:"es")
#set text(font: "DejaVu Sans")
#show math.equation: set text(font: "DejaVu Math TeX Gyre")

#let fechaEntrega = datetime(year: 2025, month: 4, day: 2)

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
        *CouchDB*
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
      *Dupla:*
    ]
    #text(size: 14pt)[ #pad(left: 20pt, top: -5pt)[
23    ]]
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

= 1. Hacer una consulta para devolver todos los nodos etiquetados como Entre