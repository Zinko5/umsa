#set text(lang:"es")
#set text(font: "DejaVu Sans")
#show math.equation: set text(font: "DejaVu Math TeX Gyre")

#let fechaEntrega = datetime(year: 2025, month: 3, day: 19)

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
        *Creación de colecciones con MongoDB*
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
= Colecciones con MongoDB Compass
== Tema: Actividades de la junta vecinal
Comandos de MongoSH:
```sh
use seguimiento_actividades_junta_vecinal
db.actividades.insertMany([
    {
        "nombre": "Reunión mensual",
        "fecha": ISODate("2025-03-20T19:00:00Z"),
        "descripcion": "Discusión sobre limpieza del barrio",
        "estado": "pendiente",
        "responsable": null 
    },
    {
        "nombre": "Limpieza comunitaria",
        "fecha": ISODate("2025-03-25T09:00:00Z"),
        "descripcion": "Recoger basura en el parque",
        "estado": "pendiente",
        "responsable": null
    },
    {
        "nombre": "Taller de reciclaje",
        "fecha": ISODate("2025-04-01T15:00:00Z"),
        "descripcion": "Enseñar a separar residuos",
        "estado": "planificado",
        "responsable": null
    }
])

db.vecinos.insertMany([
    {
        "nombre": "Juan Pérez",
        "telefono": "555-1234",
        "email": "juan.perez@example.com",
        "rol": "presidente",
        "direccion": "Calle 1 #123"
    },
    {
        "nombre": "María Gómez",
        "telefono": "555-5678",
        "email": "maria.gomez@example.com",
        "rol": "secretaria",
        "direccion": "Calle 2 #456"
    },
    {
        "nombre": "Luis Martínez",
        "telefono": "555-9012",
        "email": "luis.martinez@example.com",
        "rol": "vecino",
        "direccion": "Calle 3 #789"
    }
])

db.recursos.insertMany([
    {
        "nombre": "Escobas",
        "cantidad": 5,
        "disponible": true,
        "actividad_asociada": null  // Lo actualizaremos después
    },
    {
        "nombre": "Bolsas de basura",
        "cantidad": 50,
        "disponible": true,
        "actividad_asociada": null
    },
    {
        "nombre": "Proyector",
        "cantidad": 1,
        "disponible": false,
        "actividad_asociada": null
    }
])

db.actividades.updateOne(
    { "_id": ObjectId("67db2cd7c60a3439be025044") },
    { $set: { "responsable": ObjectId("67db2d0dc60a3439be025047") } }
)

db.actividades.updateOne(
    { "_id": ObjectId("67db2cd7c60a3439be025045") },
    { $set: { "responsable": ObjectId("67db2d0dc60a3439be025048") } }
)

db.actividades.updateOne(
    { "_id": ObjectId("67db2cd7c60a3439be025046") },
    { $set: { "responsable": ObjectId("67db2d0dc60a3439be025049") } }
)

db.actividades.updateOne(
    { "_id": ObjectId("67db2bd73bb47aa8ec3a4e36") },
    { $set: { "responsable": ObjectId("67db2d0dc60a3439be025047") } }
)

db.recursos.updateOne(
    { "_id": ObjectId("67db2d44c60a3439be02504a") },
    { $set: { "actividad_asociada": ObjectId("67db2cd7c60a3439be025045") } }
)

db.recursos.updateOne(
    { "_id": ObjectId("67db2d44c60a3439be02504b") },
    { $set: { "actividad_asociada": ObjectId("67db2cd7c60a3439be025045") } }
)

db.recursos.updateOne(
    { "_id": ObjectId("67db2d44c60a3439be02504c") },
    { $set: { "actividad_asociada": ObjectId("67db2cd7c60a3439be025046") } }
)
```

== Comprobación:
#image("./m1.png")
#image("./m2.png")
#image("./m3.png")

== Vista en MongoDB Compass:
#image("./m4.png")
#image("./m5.png")
#image("./m6.png")
#image("./m7.png")

== Schema:
=== De actividades:
#image("./m8.png")
#image("./m9.png")

=== De recursos:
#image("./m10.png")

=== De vecinos:
#image("./m11.png")
