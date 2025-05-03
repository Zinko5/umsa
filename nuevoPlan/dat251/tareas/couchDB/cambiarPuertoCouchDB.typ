#set text(lang:"es")
#set text(font: "DejaVu Sans")
#show math.equation: set text(font: "DejaVu Math TeX Gyre")

#show raw: set block(
  fill: luma(240),
  stroke: 1pt + luma(200),
  inset: 8pt,
  radius: 4pt,
  width: 100%
)

#show raw: set text(
  fill: rgb(0, 115, 0),
   size: 9pt,
)

CouchDB usa el puerto 5984 por defecto, pero se puede cambiar a otro puerto si es necesario, por ejemplo, si otro servicio ya está usando ese puerto.

Si la instalación predeterminada se realizo sin problemas, no es necesario cambiar el puerto y se puede ignorar esta sección.

Para cambiar el puerto de CouchDB, sigue estos pasos:
1. Abre una terminal CMD como administrador y detén el servicio de CouchDB con el siguiente comando:
```bash
net stop CouchDB
```
2. Abre el archivo de configuración de CouchDB, que se encuentra en la ruta `C:\Program Files\Apache CouchDB\etc\couchdb\` y se llama `local.ini`. Ábrelo con un editor de texto como el Bloc de notas, Notepad++ o Visual Studio Code.
#image("{EB166AB9-CDCA-42BC-B18B-C854E282A013}.png")
3. Busca la sección `[chttpd]` y cambia la línea que dice `;port = 5984` a `port = 9548` (o el puerto que desees usar).
#image("{3681B698-E759-4803-A58B-C7DC5BDE36CC}.png")

Recalcar que se debe borrar el ';' al inicio de la línea para que el cambio surta efecto. 
4. Guarda los cambios y cierra el archivo.
5. Vuelve a abrir la terminal CMD como administrador y inicia el servicio de CouchDB con el siguiente comando:
```bash
net start CouchDB
```
6. Abre el navegador y escribe `http://localhost:9548/_utils/` en la barra de direcciones para acceder a la interfaz de Fauxton.

Tomar en cuenta que para seguir los pasos del uso de CouchDB, se debe cambiar el puerto en los comandos de la CLI y en la URL de Fauxton por el nuevo puerto que se ha configurado.