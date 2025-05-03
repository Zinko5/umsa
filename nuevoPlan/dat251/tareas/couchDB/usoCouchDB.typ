#set text(lang:"es")
#set text(font: "DejaVu Sans")
#show math.equation: set text(font: "DejaVu Math TeX Gyre")

#show raw: set block(
  fill: luma(240),
  stroke: 1pt + luma(200),
  inset: 8pt,
  radius: 4pt,
  width: 100%,
  breakable: false
)

#show raw: set text(
  fill: rgb(0, 115, 0),
  size: 9pt,
)

Existen dos formas de acceder a CouchDB: a través de la interfaz de línea de comandos (CLI) o mediante la interfaz gráfica de usuario (GUI) llamada Fauxton. 

= Acceso a CouchDB con la interfaz gráfica de usuario (GUI) Fauxton.
Abrir el navegador y escribir #link("http://localhost:5984/_utils/") en la barra de direcciones.

Iniciar sesión con la cuenta de administrador y la contraseña creada durante la instalación.
#image("{6B41C3B9-E475-491A-86F3-48D688E4B4F5}.png")
Se abrirá la interfaz de Fauxton, que es la interfaz gráfica de CouchDB. La primera vez, aparecerá vacía, porque aún no hay bases de datos creadas.
#image("{FBBDC244-6D3F-4CF6-B8F4-B44901D287F5}.png")
Tomar en cuenta que si se está inactivo durante unos minutos, la sesión se cerrará automáticamente y se deberá volver a iniciar sesión recargando la página, esto se puede identificar si sale el siguiente mensaje:
#image("{CCC8A903-A107-48E7-B252-53F73F0EBA3C}.png")
Crearemos una base de datos llamada 'libreria', hacer clic en 'Create Database' en la parte superior derecha de la interfaz, poner el nombre y hacer clic en el botón 'create' (no funcionara si damos directamente Enter).
#image("{73B68244-B41A-4514-A552-4C26CC3AE88D}.png")
Automáticamente se abrirá la base de datos 'libreria'
#image("{B33EA83A-62C7-4B85-8A56-1FB51943D9CB}.png")

Hacer clic en 'Create Document' para crear un nuevo documento, copiar y pegar el siguiente contenido para crear un libro:

#text(size: 8pt, stroke: 0.5pt + red)[Codigo a)]
```json
{
  "_id": "libro_001",
  "titulo": "Cien años de soledad",
  "autor_id": "autor_001",
  "editorial_id": "editorial_001",
  "genero": "Realismo mágico",
  "anio_publicacion": 1967,
  "precio": 19.99
}
```
#text(size: 9pt)[_Todos los codigos/comandos utilizados en este documentos también estarán en "codigos.txt", para facilitar la seleccion del texto y poder copiarlo y pegarlo sin problemas._]

Hacer clic en 'Create Document' para guardar el documento.
// #image("{7EA7A6D6-5250-4416-AFFF-7719227ED75E}.png")
El primer libro se ha creado correctamente. En la pestaña 'Table' se pueden ver distintos atributos del libro.
#image("{B2C2A4F5-1D96-49A9-930F-40B6D5BFAB0D}.png")
= Acceso a CouchDB con la interfaz de línea de comandos (CLI)
Ahora añadiremos un segundo libro utilizando la línea de comandos (CLI).

Abrir una ventana de terminal CMD y escribir el siguiente comando:

#text(size: 8pt, stroke: 0.5pt + red)[Codigo b)]
```couchdb
curl http://127.0.0.1:5984/
```
Saldra un mensaje de bienvenida de CouchDB, indicando que el servidor está funcionando correctamente.

Para ver la lista de bases de datos, escribir el siguiente comando:

#text(size: 8pt, stroke: 0.5pt + red)[Codigo c)]
```couchdb
curl -X GET http://admin:123@127.0.0.1:5984/_all_dbs
```
#text(size: 9pt)[_Si durante la instalación se usó otro nombre de usuario o contraseña, se debe modificar en el comando, poner el usuario en lugar de 'admin' y la contraseña en lugar de '123'._]

En este caso, deberia devolver 'libreria' como base de datos creada anteriormente.
#image("{CAB236D5-097F-4D26-BD26-A597D6FAF62D}.png")
Copiar el siguiente comando en la terminal para crear el segundo libro:

#text(size: 8pt, stroke: 0.5pt + red)[Codigo d)]
```couchdb
curl -X PUT http://admin:123@127.0.0.1:5984/libreria/libro_002 ^
-H "Content-Type: application/json" -d ^
"{^
  \"_id\": \"libro_002\",^
  \"titulo\": \"El amor en los tiempos del cólera\",^
  \"autor_id\": \"autor_001\",^
  \"editorial_id\": \"editorial_002\",^
  \"genero\": \"Romance\",^
  \"anio_publicacion\": 1985,^
  \"precio\": 15.50^
}"
```
_Si sale un error, verificar el nombre de usuario y la contraseña._
#image("{5A315268-64D8-4492-9E32-40127B49218B}.png")
Saldrá un mensaje que empieza con '{"ok":true', lo que indica que el segundo libro se ha creado correctamente.

Si recargamos la página de Fauxton, veremos que el segundo libro se ha creado correctamente.
#image("{A6FF4D8A-FF0E-438E-A3DA-5F2E6EBD394C}.png")

= Importar el resto de documentos con la CLI
Primero abriremos una terminal en la carpeta de guiaCouchDB, donde se encuentra el archivo 'libreria.json' que contiene el resto de documentos, incluyendo libros, autores y editoriales.

En el explorador de archivos, abrir la carpeta 'guiaCouchDB', hacer clic derecho y hacer clic en 'Open in Terminal' o 'Abrir en Terminal'.
#image("{4075D145-924F-4FF4-8995-9B344A9B98D9}.png")
Se abrirá una ventana de terminal en la carpeta 'guiaCouchDB'.
#image("{736D3998-B522-40F0-9ECC-F522841E7759}.png")
*Alternativa*: Tambien se puede mover a la carpeta 'guiaCouchDB' usando el comando 'cd' en la terminal.
```cmd
cd tuRutaDondeDescargaste\guiaCouchDB
```
#image("{9E3B2909-B774-4A32-BDA3-4F20970BB259}.png")

Una vez con la terminal abierta en el directorio correcto, importar el resto de documentos copiando el siguiente comando:

#text(size: 8pt, stroke: 0.5pt + red)[Codigo e)]
```couchdb
curl -X POST -H "Content-Type: application/json" --data @libreria.json ^
http://admin:123@127.0.0.1:5984/libreria/_bulk_docs
```
#image("{0B74D78D-E007-4EA1-8F53-C400AF881B93}.png")
Saldrá un mensaje que empieza con '{"ok":true', lo que indica que los documentos se han importado correctamente.
Si recargamos la página de Fauxton, veremos que los documentos se han importado correctamente.
#image("{80A1E223-6136-4530-B7D6-09BC00C5092F}.png")
también podemos revisar que se importaron todos los con el siguiente comando en CLI:

#text(size: 8pt, stroke: 0.5pt + red)[Codigo f)]
```cmd
curl -X GET http://admin:123@127.0.0.1:5984/libreria/_all_docs
```
#image("{DD01FB38-F90D-4DF3-AE9A-B6E08015FCFC}.png")
= Hacer consultas
== Consultas con CLI
Las consultas en CLI no son recomendables, ya que debido a su formato en CMD, las salidas no presentan saltos de linea, por lo que son poco legibles.
=== 1. Mostrar el nombre y la nacionalidad del autor del libro 'Cien años de soledad'.

#text(size: 8pt, stroke: 0.5pt + red)[Codigo g)]
```couchdb
curl -X POST http://admin:123@127.0.0.1:5984/libreria/_find ^
-H "Content-Type: application/json" -d ^
"{^
  \"selector\": {^
    \"_id\": \"autor_001\"^
  },^
  \"fields\": [\"nombre\", \"nacionalidad\"]^
}"
```
#image("{78C1B09F-37D4-4BD7-9A97-5F4EAE80F9E1}.png")
#text(size: 9pt)[_En las consultas mediante CLI, saldrá un mensaje de "bookmark" y otro de "warning", pero no son errores, el resultado de la consulta sale arriba de estos mensajes, en este caso el resultado es:
 `{"docs":[
{"nombre":"Gabriel García Márquez","nacionalidad":"Colombiana"}
]`._]

=== 2. Obtener los titulos de los libros publicados por la editorial 'Alfaguara'

#text(size: 8pt, stroke: 0.5pt + red)[Codigo h)]
```couchdb
curl -X POST http://admin:123@127.0.0.1:5984/libreria/_find ^
-H "Content-Type: application/json" -d^
"{^
  \"selector\": {^
    \"editorial_id\": \"editorial_002\"^
  },^
  \"fields\": [\"titulo\"]^
}"
```
#image("{E61D7328-B5FA-4C29-8638-92249F9A1CC1}.png")

== Consultas con Fauxton (Mango Queries)
En la interfaz de Fauxton, hacer clic en 'Run a Query with Mango'.
#image("{0935E627-6100-4E78-9328-F1F843EA587F}.png")
Escribir la consulta en el cuadro de texto y hacer clic en 'Run Query'.

=== 1. Obtener el título, año de publicación, autor y precio de los libros con precio entre 10 y 17

#text(size: 8pt, stroke: 0.5pt + red)[Codigo i)]
```mango
{
  "selector": {
    "precio": {
      "$gte": 10,
      "$lte": 17
    }
  },
  "fields": [
    "titulo",
    "anio_publicacion",
    "autor_id",
    "precio"
  ]
}
```
#image("{2CC4CB2A-610F-4D26-B44C-74F1DCC48DD9}.png")

=== 2. Obtener el título, género, precio y año de publicación de los libros con precio menor a 20 o publicados antes de 1950

#text(size: 8pt, stroke: 0.5pt + red)[Codigo j)]
```mango
{
  "selector": {
    "$or": [
      {
        "precio": {
          "$lt": 20
        }
      },
      {
        "anio_publicacion": {
          "$lt": 1950
        }
      }
    ]
  },
  "fields": [
    "titulo",
    "precio",
    "anio_publicacion",
    "genero"
  ]
}
```
#image("{4CE11853-5BFB-4E77-A96B-3FDB3BA3FC74}.png")
=== 3. Obtener el nombre y país de las editoriales que publicaron al menos un libro con genero: "Romance".
// Aqui se puede ver que no se puede hacer un join, asi que se tiene que hacer un $in de los id de las editoriales

#text(size: 8pt, stroke: 0.5pt + red)[Codigo k)]
```mango
{
  "selector": {
    "tipo": "editorial",
    "_id": {
      "$in": ["editorial_002", "editorial_005", "editorial_009"]
    }
  },
  "fields": ["nombre", "pais"]
}
```
#image("{D2F03263-19DA-45B0-AEF2-55A231EAB7DD}.png")
// {
//   "selector": {
//     "genero": "Romance"
//   }
// }


// curl -X POST http://admin:123@127.0.0.1:5984/libreria/_find -H "Content-Type: application/json" -d "{\"selector\": {\"genero\": \"Romance\"}}"

// ```curl
// curl -X POST http://admin:123@127.0.0.1:5984/libreria/_find -H "Content-Type: application/json" -d "{\"selector\": {\"$and\": [{\"genero\": \"Romance\"}, {\"anio_publicacion\": {\"$gt\": 1800}}]}}"
// ```

// ```
// {
//   "selector": {
//     "tipo": "editorial", "pais": "España"
//     },
//     "fields": ["_id"]
// }
// ```