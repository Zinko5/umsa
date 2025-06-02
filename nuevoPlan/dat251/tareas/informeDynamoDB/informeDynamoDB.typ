#set text(lang: "es")
#set text(font: "DejaVu Sans")
#show math.equation: set text(font: "DejaVu Math TeX Gyre")

#let fechaEntrega = datetime(year: 2025, month: 5, day: 12)

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
  let dia = str(fecha.day())
  let mes = meses.at(fecha.month() - 1)
  let año = str(fecha.year())
  dia + " de " + mes + " del " + año
}

#page(
  background: overlay(image("/utiles/logos/umsaLogo.png", width: 25em), white.transparentize(30%)),
  margin: (x: 3cm),
  paper: "a4"
)[
  #align(center)[
    #text(size: 16pt)[#pad(top: 0pt)[
      Universidad Mayor de San Andrés\
      Facultad de Ciencias Puras y Naturales
    ]]
    #text(size: 30pt)[#pad(top: -5pt)[
      *Diario del explorador - DynamoDB*
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
      23
    ]]
  ]
  #pad(top: 15pt)[
    #text(size: 16pt)[
      *Fecha de entrega:*
    ]
    #text(size: 14pt)[ #pad(left: 20pt, top: -5pt)[
      #formatFecha(fechaEntrega)
    ]]
  ]
  #place(bottom + center)[
    #text(size: 13pt)[
      *La Paz - Bolivia*
    ]
  ]
]

#set page(margin: 2cm)
#set heading(numbering: "1.")
#show heading: set text(size: 14pt, weight: "bold")

= Introducción

Este informe detalla el desarrollo de la tarea "Diario del Explorador" utilizando DynamoDB. La tarea consistió en gestionar un diario de un explorador que viaja por diferentes países, almacenando y consultando entradas mediante una base de datos NoSQL. Se creó una tabla en DynamoDB, se cargaron datos desde un archivo CSV, se diseñaron consultas para obtener información específica, y se actualizaron los datos con un nuevo conjunto de registros.

A continuación, se describe el procedimiento realizado, los comandos utilizados, y se incluyen capturas de pantalla para ilustrar los resultados.

= Procedimiento

== Creación de la tabla en DynamoDB

Se creó una tabla llamada `diario_explorador` en DynamoDB con la siguiente estructura:

- *Clave de partición*: `explorer_id` (identificador del explorador, tipo String).
- *Clave de ordenación*: `fecha` (fecha de la entrada en formato ISO 8601, tipo String).
- *Índices secundarios globales*:
  - `pais-fecha-index`: Para consultar entradas por país.
  - `mes-count-index`: Para contar entradas por mes.

El script Python `create_table_diario_explorador.py` se ejecutó con el siguiente comando:

```bash
python3 create_table_diario_explorador.py
```

#image("{D4F601DF-E41E-4A9F-862F-23D104E9CC80}.png")

== Carga inicial de datos desde CSV

Se preparó un archivo `diario.csv` con 4 entradas iniciales, representando registros del diario con campos: `explorer_id`, `fecha`, `ubicacion`, `pais`, `evento`, `reflexiones`, y `mes`. El script `upload_csv_to_dynamodb.py` se usó para cargar los datos:

```bash
python3 upload_csv_to_dynamodb.py
```

#image("{AB3E5ED3-14C4-46FC-943C-0BF8A4F74DEF}.png")

== Confirmación en NoSQL Workbench
Se verificó la carga de datos en la tabla `diario_explorador` utilizando NoSQL Workbench.

#image("{07E7D0F7-8C7E-45E5-AE92-5A3A600DB628}.png")

== Consultas diseñadas

Se implementaron cuatro consultas para analizar los datos:

1. *Listar todas las entradas en orden cronológico*:
   - Script: `query_chronological.py`
   - Comando:
     ```bash
     python3 query_chronological.py
     ```
#image("{DDFF2EE0-C227-47A9-B464-98B9CD80F41F}.png")

2. *Mostrar entradas por país específico* (ejemplo con "Perú"):
   - Script: `query_by_country.py`
   - Comando:
     ```bash
     python3 query_by_country.py
     ```

#image("{152F7A10-D859-4695-9F45-607B7FDBD121}.png")

3. *Contar entradas por mes*:
   - Script: `count_by_month.py`
   - Comando:
     ```bash
     python3 count_by_month.py
     ```

#image("{A3DEE5EE-BF24-4B1E-B10D-DAB8FC25E682}.png")

4. *Filtrar eventos felices* (evento: "feliz"):
   - Script: `filter_happy_events.py`
   - Comando:
     ```bash
     python3 filter_happy_events.py
     ```
#image("{D065BB90-9643-49F8-AA34-A828CEDA87C1}.png")

// #figure(
//   image("captura_queries.png", width: 80%),
//   caption: [Ejemplo de resultados de las consultas (cronológica y por país).]
// )

*Instrucción para captura*: Ejecuta `python3 query_chronological.py` y `python3 query_by_country.py`, captura la terminal mostrando las salidas de ambas consultas.

= Conclusiones

La tarea se completó exitosamente, demostrando el uso de DynamoDB para gestionar un diario de explorador. Se creó una tabla con índices secundarios, se cargaron datos desde CSV, y se diseñaron consultas para cumplir con los requisitos. La actualización a 20 registros permitió probar las consultas con un conjunto de datos más robusto. Los comandos y scripts utilizados son reutilizables y eficientes para este tipo de tareas en bases de datos NoSQL.