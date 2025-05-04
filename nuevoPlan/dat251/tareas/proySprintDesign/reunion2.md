# Informe del Día 2: Fase de Definir - Sistema de Registro de Votos Electorales

## 1. Desarrollo del Día 2: Fase de Definir (Google Design Sprint)

### 1.1. Preparación del Entorno 

Se organizó el entorno para las actividades del día 2, asignando tareas específicas: priorización de funcionalidades, definición de métricas de éxito, y redacción del informe. Se estableció un espacio colaborativo para documentar decisiones y consolidar aportes, asegurando que el equipo estuviera alineado con los objetivos de la fase "Definir". Se revisaron los resultados del día 1 (casos de uso, requisitos) para guiar las discusiones.

### 1.2. Priorización de Funcionalidades

El equipo revisó los casos de uso del día 1, identificando “Registro de votos por mesa”, “Dashboard público en tiempo real” y “Autenticación de jurados y admins” como las funcionalidades más críticas para abordar los retrasos y la opacidad del proceso electoral. Cada integrante evaluó las funcionalidades según su impacto en la transparencia y viabilidad técnica, seleccionando las tres mencionadas por su capacidad para eliminar el traslado físico de actas y aumentar la confianza ciudadana. La discusión destacó la importancia de un sistema simple pero efectivo para el prototipo académico.

### 1.3. Definición de Métricas de Éxito

Se definieron métricas de éxito basadas en los requisitos no funcionales del día 1: latencia <500 ms para consultas al dashboard, escalabilidad para 35,000 registros de mesas electorales, disponibilidad del 99.9%, y usabilidad con un tiempo de aprendizaje <5 minutos para jurados. El equipo ajustó estas métricas para que fueran medibles con simulaciones de carga para escalabilidad. Se discutió cómo Cassandra y Redis soportan estas métricas, con Redis optimizando consultas al dashboard y Cassandra manejando registros masivos

### 1.4. Consolidación del Enfoque del Prototipo

El equipo consolidó el enfoque del Producto Mínimo Viable (VPM): un sistema web con un  formulario para que los jurados registren votos en una base de datos NoSQL, un dashboard público que muestre resultados cacheados en Redis, y autenticación de jurados y admins vía Firebase Auth. El objetivo del prototipo es demostrar que el sistema elimina retrasos en la publicación de resultados y aumenta la confianza ciudadana.

### 1.5. Fuentes de datos

Además de las fuentes de datos del dia 1, se consultaron los siguientes sitios web para obtener nueva información:

https://cassandra-apache-org.translate.goog/_/index.html?_x_tr_sl=en&_x_tr_tl=es&_x_tr_hl=es&_x_tr_pto=tc 

https://es.wikipedia.org/wiki/Apache_Cassandra 

https://www.instaclustr.com/blog/cassandra-vs-mongodb/ 

https://cassandra.apache.org/doc/latest/cassandra/architecture/guarantees.html 

https://creativecampus.universidadeuropea.com/blog/que-es-prototipo/ 

https://firebase.go

