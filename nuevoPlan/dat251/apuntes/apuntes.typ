#set page(
  margin: (x: 2.5cm, y: 2.5cm) //Para trabajos digitales e impresos simples
  // margin: (left: 3.8cm, y: 2.5cm, right: 2.5cm) //Para trabajos impresos a doble cara
)
#set text(lang:"es")
#set text(font: "DejaVu Sans")
#show math.equation: set text(font: "DejaVu Math TeX Gyre")
#set par(justify: true)

= DAT 251 - Base de datos 3
= Ponderación
30
30
30
10
#grid(
    columns: (auto, auto),
    inset: 0.5em,
    stroke: 0.1em + black,
    [Aplicación en aula], [30 puntos],
    [Participación en aula], [30 puntos],
    [Proyecto], [30 puntos],
    [Exposición], [10 puntos],
)

- Grupos de 5 para proyecto
- Grupos de 2 para trabajos en clases

= Temario 
- Bases de datos NoSQL
 - MongoDB
 - Redis
- Data Ware House
 - Pentaho

 #text(red)[*Traer laptopr con el instalador de Pentaho, puede ser en máquina virtual, y Python*]

 En clases se realizará la instalación, pero si se trae ya instalado debe haber capturas de pantalla, como un tutorial

= Proyecto
Hacer dataware house con metodologia efesto

#pagebreak()
== Clase 1
Crear un ETL con Pentaho, pedir a una IA crear ~1000 registros de TC y conectar con pentaho

+ Instalar java
+ Configurar variables de entorno
+ Instalar pentaho
+ Conectar pentaho con una base de datos a elección

== Clase 2
Hacer ejercicios con pentahoo

== Clase 3
Hacer el ejercicio creando tres dimensiones, crear 3 tablas