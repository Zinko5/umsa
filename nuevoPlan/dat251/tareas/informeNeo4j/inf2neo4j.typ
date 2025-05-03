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
        *Ejercicios Neo4J*
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

= 1. Hacer una consulta para devolver todos los nodos etiquetados como Entrenador
```sql
match (e:Entrenador)return e
```
#image("n1.png")

= 2. Hacer una consulta para devolver todos los nodos de la base de datos
```sql
match (e) return e
```
#image("n2.png")

= 3. Mostrar solo el campo Nombre de los nodos etiquetados como Entrenador
mathc (e:Entrendor) return e.nombre
#image("n3.png")

= 4. Devolver los entrenadores con nombre Nick Nurse
```sql
match (e:Entrenador) where e.nombre='Nick Nurse' return e.nombre
```
#image("n4.png")

= 5. Devolver los entrenadores que se llamen Taylor Jenkins o tengan mas de 20 años de experiencia
```sql
match (e:Entrenador) where e.nombre='Taylor Jenkins' or p.años_experiencia>20 return e
```
#image("n5.png")

= 6. Devolver todos los entrenadores cuyos años de experiencia esten entre 5 y 20, se llamen Tyronn Lue y no se llamen Nick Nurse
```sql
match (e:Entrenador) where e.años_experiencia>=5 and e.años_experiencia\<20 and e.nombre = 'Tyronn Lue' and e.nombre <>'Nick Nurse' return e
```
#image("n6.png")

= 7. Retorna entrenadores cuyos años de experiencia sean 6 o 22
```sql
match (e:Entrenador) where e.años_experiencia in [6, 22] return e
```
#image("n7.png")

= 8. Retorna entrenadores cuyo nombre empiece por 'L'
```sql
match (e:Entrenador) where e.nombre starts with "L" return e
```
#image("n8.png")

= 9. Retorna los entrenadores cuyo nombre contiene la secuencia 'as'
```sql
match (e:Entrenador) where e.nombre contains "as" return e
```
#image("n9.png")

= 10. Ordenar de forma ascendente los Entrenadores por nombre
```sql
match (e:Entrenador) return e order by e.nombre asc
```
#image("n10.png")

= 11. Devuelve 1 entrenador
```sql
match(e:Entrenador) return e limit 1
```
#image("n11.png")

= 12. Devolver solo un resultado de entrenadores (sin repetidos)
```sql
match (e:Entrenador) return distinct e 
```
#image("n12.png")

= 13. Usar group by para devolver el número de entrenadores con años de experiencia mayor a 20.
```sql
match (e:Entrenador) where e.años_experiencia>20 return count(\*) as cantidad
```
#image("n13.png")

= 14. Revolver relaciones creadas con anterioridad
```sql
match relation =(e1:Entrenador)-[r:ENTRENADOR_DIRIGE_EQUIPO]->(e2:Equipo) return relation
```
#image("n14.png")

= 15. Limitar la consulta anterior a entrenadores con 6 años de experiencia
```sql
match relation =(e1:Entrenador)-[r:ENTRENADOR_DIRIGE_EQUIPO]->(e2:Equipo) where p1.años_experiencia=15 return relation
```
#image("n15.png")