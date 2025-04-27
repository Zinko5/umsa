#set text(lang:"es")
#set text(font: "DejaVu Sans")
#show math.equation: set text(font: "DejaVu Math TeX Gyre")

#let fechaEntrega = datetime(year: 2025, month: 4, day: 14)

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
        *Ejercicios Redis*
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

// == Comandos dentro de redis-cli:
// ```redis-cli
// set nombre rafael

// set apellido "Martin"

// get nombre

// get apellido

// append apellido " Martin"

// get apellido

// strlen apellido

// set contador 0

// get contador

// incr contador

// incrby contador 5

// decr contador

// decrby contador 2

// keys *

// keys n*

// keys *or

// keys *1*

// keys [^a]

// set salario 33500.50

// keys *

// rename salario salario_anual

// keys*

// set salario2 2579.0

// renamenx salario2 salario_anual

// del contador

// del nombre apellido

// exists apellido

// flushdb

// set nombre Rafael EX 60

// set apellido Martin PX 5500

// set nombre Rafael

// expire nombre 60

// set apellido Martin

// expire apellido 120

// set salario_anual 33500.50

// type salario_anual

// rpsuh lista 1 2 3 4 5 

// type lista
// ```

// == Estructuras de datos: Listas

// ```redis-cli
// rpush alimnos Manuel Teresa Juan Maria

// lrange alumnos 0 -1

// rpush alumnos "Manuel"

// lpush alumnos Miguel Rafael Maria

// lrange alumnos 0 -1

// rpop alumnos

// lpop alumnos

// lrange 0 -1

// sort alumnos ASC ALPHA

// linsert alumnos BEFORE Manuel Abel

// lrange 0 -1

// lset alumnos -1 Marta

// lrange alumnos -3 -1

// llen alumnos

// lrange alumnos 0 -1

// lindex alumnos 2

// lrem alumnos 0 Abel

// lrange alumnos 0 -1

// ltrim alumnos 2 3

// lrange alumnos 0 -1
// ```
// == Estructuras de datos: Conjuntos ordenados
// ```redis-cli
// zcard
// zrange
// zdiscord
// zadd
// ```
// // == Estructuras de datos: Hashes
// ```redis-cli
// hget
// hgetall
// hset
// himplementby
// hstrlen
// ```
// // // == Estructuras de datos: geoespaciales
// ```redis-cli
// geoadd
// geolist
// ```


#pagebreak()
= 1. Capturas de pantalla
#image("{EE54C907-A931-4603-9E75-A356BD6D72A6}.png")
#image("{42807CAE-3AC8-4A6F-9466-1DC0665B4585}.png")
#image("{F0B4CBE0-E433-4488-8551-E58EE4D1E830}.png")
#image("{12EBB059-4023-4137-A1E2-78734BDE13FC}.png")
= 2. Captura de confirmación
#image("{231FA7A6-573D-4260-97C4-011EAB5A07FC}.png")
= 3 . Comandos usados
=== Comandos iniciales
```redis-cli
set nombre rafael
set apellido "Martin"
get nombre
get apellido
append apellido " Martin"
get apellido
strlen apellido
set contador 0
get contador
incr contador
incrby contador 5
decr contador
decrby contador 2
keys *
keys n*
keys *or
keys *1*
keys [^a]
set salario 33500.50
keys *
rename salario salario_anual
keys *
set salario2 2579.0
renamenx salario2 salario_anual
del contador
del nombre apellido
exists apellido
flushdb
set nombre Rafael EX 60
set apellido Martin PX 5500
set nombre Rafael
expire nombre 60
set apellido Martin
expire apellido 120
set salario_anual 33500.50
type salario_anual
rpush lista 1 2 3 4 5
type lista
```
=== Estructuras de datos: Listas

```redis-cli
rpush alumnos Manuel Teresa Juan Maria
lrange alumnos 0 -1
rpush alumnos "Manuel"
lpush alumnos Miguel Rafael Maria
lrange alumnos 0 -1
rpop alumnos
lpop alumnos
lrange alumnos 0 -1
sort alumnos ALPHA
linsert alumnos BEFORE Manuel Abel
lrange alumnos 0 -1
lset alumnos -1 Marta
lrange alumnos -3 -1
llen alumnos
lrange alumnos 0 -1
lindex alumnos 2
lrem alumnos 0 Abel
lrange alumnos 0 -1
ltrim alumnos 2 3
lrange alumnos 0 -1
del alumnos
keys alumnos
```
=== Estructuras de datos: Conjuntos

```redis-cli
sadd frutas naranja manzana pera naranja pera
smembers frutas
spop frutas
smembers frutas
sadd frutas pera sandia higo
srandmember frutas 2
```
