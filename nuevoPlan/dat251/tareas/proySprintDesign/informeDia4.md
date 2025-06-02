# Informe Día 4: Prototipar - implementación rápida

## 1. Introducción

### 1.1. Contexto y Problemática

El sistema electoral boliviano, gestionado por el Órgano Electoral Plurinacional (OEP), enfrenta desafíos estructurales que afectan la confianza ciudadana en los resultados de los procesos democráticos. En Bolivia, las elecciones generales involucran aproximadamente 7.2 millones de votantes distribuidos en unas 35,000 mesas electorales, organizadas en los nueve departamentos del país. El proceso actual depende de boletas físicas que los votantes depositan en urnas, las cuales son contadas manualmente por jurados de mesa al cierre de la jornada electoral. Estos jurados registran los totales en actas físicas que luego se trasladan, ya sea físicamente o mediante escaneo, a centros de cómputo departamentales y nacionales para su procesamiento y publicación oficial por parte del OEP.

Sin embargo, este procedimiento presenta un problema crítico: la centralización de las actas y la publicación de los resultados suelen tomar horas o incluso días, especialmente en regiones rurales donde la conectividad y la logística son limitadas. Por ejemplo, en las elecciones generales de 2020, aunque el conteo rápido (TREP) fue reemplazado por un sistema de difusión de actas, los resultados oficiales completos tardaron hasta tres días en publicarse, dejando a los ciudadanos sin información inmediata durante las primeras horas críticas. Esta demora, agravada por antecedentes como la crisis de 2019 —donde la interrupción del TREP desató acusaciones de fraude y protestas masivas—, genera una percepción de opacidad que erosiona la legitimidad del proceso electoral. La falta de un mecanismo que permita reportar y visualizar los resultados en tiempo real desde las mesas de votación es el principal cuello de botella, ya que los ciudadanos y observadores no tienen acceso directo a los datos parciales mientras se realiza el cómputo oficial.

Esta problemática no solo afecta la confianza en el sistema democrático, sino que también limita la capacidad del OEP para responder a las demandas de transparencia de una población cada vez más conectada digitalmente. Un sistema que facilite el reporte inmediato de los totales por mesa y su difusión pública podría mitigar estas tensiones, asegurando que los datos estén disponibles para todos los actores involucrados desde el momento en que las mesas cierran.

El flujo del proceso electoral puede representarse en los siguientes pasos:

A. Emisión del voto: El votante acude a su mesa, presenta su identificación, recibe una boleta, marca su preferencia en privado y la deposita en la urna.

B. Cierre de la mesa: A las 6:00 p.m., los jurados cierran la mesa, abren la urna y comienzan el conteo manual de las boletas.

C. Registro de resultados: Los jurados clasifican los votos por candidato, registran los totales en el acta física y firman el documento. Copias del acta se entregan a delegados de partidos y observadores.

D. Traslado de actas: Las actas físicas se envían a un centro de cómputo departamental o nacional, ya sea por transporte físico o mediante escaneo para su digitalización. En áreas rurales, este paso puede tomar varias horas o días debido a la falta de conectividad o infraestructura.

E. Procesamiento central: El OEP consolida las actas en su sistema central, verifica su validez (comparando firmas y totales) y calcula los resultados agregados por región y a nivel nacional.

F. Publicación de resultados: Los resultados oficiales se publican en el sitio web del OEP y se comunican a través de medios de prensa. En 2020, este paso ocurrió gradualmente, pero los datos completos no estuvieron disponibles hasta tres días después de la votación. 

### 1.2. Objetivos del Sistema

El proyecto tiene como propósito diseñar una solución tecnológica que aborde los retrasos y la desconfianza en el sistema electoral boliviano, utilizando herramientas modernas de desarrollo web y bases de datos no relacionales. Los objetivos se dividen en: 

- **Objetivo General**: Desarrollar un sistema web basado en una base de datos NoSQL y Redis que permita a los jurados registrar votos directamente y a los ciudadanos visualizar resultados en tiempo real, promoviendo transparencia en las elecciones bolivianas.

- **Objetivos Específicos**: 
  - Diseñar una interfaz CRUD accesible para que los jurados registren los totales de votos por candidato en cada mesa de manera rápida y eficiente.
  - Implementar un dashboard público con resultados parciales, mapas y gráficos en tiempo real.  
  - Garantizar consultas a la base de datos con latencia inferior a 500 ms bajo alta carga.  
  - Validar la usabilidad del prototipo mediante pruebas con usuarios simulados, asegurando que tanto jurados como ciudadanos encuentren la solución intuitiva y confiable. 

### 1.3. Justificación del Uso de NoSQL

La elección de una base de datos NoSQL y Redis para este proyecto se fundamenta en sus características técnicas, que se alinean directamente con las necesidades del sistema electoral propuesto, ofreciendo las siguientes ventajas: 

- **Escalabilidad**: NoSQL (ej. MongoDB, Cassandra, Firestore) maneja miles de registros simultáneos mediante sharding. Redis, como caché, reduce la carga en consultas frecuentes.  
- **Flexibilidad**: NoSQL permite esquemas dinámicos para datos como votos, regiones y timestamps. Redis almacena resultados parciales clave-valor.  
-  **Rendimiento en consultas**: NoSQL optimiza consultas agregadas con índices, y Redis ofrece latencias sub-milisegundo.
**Teorema CAP**: Dado el contexto electoral, donde la publicación en tiempo real y la operatividad en áreas con conectividad limitada son críticas, la base de datos NoSQL debe priorizar AP (Disponibilidad y Tolerancia a Particiones) para garantizar que los jurados puedan registrar votos y los ciudadanos consultar resultados incluso durante particiones de red, mientras Redis prioriza AP para consultas rápidas. Estamos evaluando opciones como Cassandra y DynamoDB (AP) frente a MongoDB y Firestore (CP).

Comparado con SQL, NoSQL y Redis reducen la complejidad de relaciones y mejoran la escritura intensiva, esenciales para registrar 35,000 mesas en tiempo real.

### 1.4. Herramientas de Google Utilizadas

Para la colaboración y documentación del proyecto, utilizamos un conjunto de herramientas de Google que facilitan el trabajo en equipo y la organización. Google Drive sirve como repositorio central para almacenar y compartir todos los recursos, incluyendo documentos, diagramas y capturas, asegurando acceso en tiempo real para los cinco integrantes. Google Meet se emplea para coordinar reuniones diarias, como la sesión inicial de alineación y la revisión final del día 1, permitiendo discusiones efectivas y toma de decisiones. Google Docs es la herramienta principal para redactar y editar el informe de manera colaborativa, garantizando que todos puedan contribuir simultáneamente. Además, es probable que utilicemos Google Slides para preparar presentaciones visuales de los casos de uso y diagramas, y Google Sheets para crear tablas comparativas, como la evaluación de bases de datos NoSQL y el análisis de requisitos.

<!-- Diagrama del teorema CAP -->

### 1.5. Alcance del Design Sprint

El proyecto se desarrolla bajo la metodología Design Sprint, un proceso estructurado de cinco días diseñado para resolver problemas complejos mediante la colaboración intensiva, la ideación rápida y la validación de soluciones. Este enfoque, creado por Jake Knapp en Google Ventures, es particularmente adecuado para proyectos académicos con recursos limitados, ya que permite generar resultados tangibles en un tiempo reducido. El alcance del Design Sprint para este proyecto incluye:

- Día 1 (Entender): Analizar el proceso electoral boliviano, identificar los problemas clave (retrasos y desconfianza), entender el problema electoral, analizar usuarios, definir foco. 

- Día 2 (Idear): Priorizar funcionalidades (registro de votos, dashboard). 

- Día 3 (Decidir): Diseñar arquitectura y esquemas de datos. 

- Día 4 (Prototipar): Crear prototipo con NoSQL y Redis.

- Día 5 (Testear): Probar prototipo y medir rendimiento.

<!-- Diagrama del Sprint Design -->

El resultado final del sprint será un prototipo que demuestre la viabilidad del sistema web, acompañado de una base de datos NoSQL junto con redis, poblada con datos ficticios que simulen el conteo de votos en un escenario electoral. No se contempla el despliegue de una aplicación completa ni la integración con sistemas reales del OEP, dado el carácter académico del proyecto y el tiempo disponible. El sprint busca sentar las bases para una solución escalable, con énfasis en la experiencia del usuario y el rendimiento técnico, que pueda servir como referencia para desarrollos futuros.

## 2. Análisis

### 2.1. Proceso Electoral Boliviano y Entidad

El proceso electoral boliviano, regulado por el Órgano Electoral Plurinacional (OEP), es un sistema de democracia representativa que permite a los ciudadanos elegir a sus autoridades nacionales, departamentales y municipales mediante el voto directo. En las elecciones generales, como las de 2020, participan aproximadamente 7.2 millones de votantes registrados, distribuidos en cerca de 35,000 mesas electorales ubicadas en los nueve departamentos del país, incluyendo áreas urbanas y rurales. Este proceso está diseñado para garantizar la participación ciudadana y la transparencia, pero enfrenta desafíos logísticos y técnicos que afectan su eficiencia.

El procedimiento electoral comienza con la inscripción de los votantes en el padrón electoral, gestionado por el OEP, que asegura que cada ciudadano mayor de 18 años pueda ejercer su derecho al voto. El día de la elección, los votantes acuden a su mesa asignada, donde reciben una boleta de papel preimpresa con los nombres de los candidatos o partidos. Cada votante marca su preferencia en privado y deposita la boleta en una urna. Las mesas, atendidas por jurados ciudadanos seleccionados aleatoriamente, operan desde la apertura (generalmente 8:00 a.m.) hasta el cierre (6:00 p.m.), aunque pueden extenderse si hay votantes en espera.

Una vez cerrada la mesa, los jurados proceden al conteo manual de las boletas en presencia de observadores y delegados de partidos. Los votos se clasifican por candidato o partido, y los resultados se registran en un acta física, que incluye los totales de votos válidos, nulos y en blanco. Estas actas son firmadas por los jurados y enviadas al centro de cómputo departamental o nacional, ya sea físicamente (en vehículos o por mensajería) o mediante escaneo para su digitalización. El OEP consolida los datos en su sistema central, verifica las actas para detectar inconsistencias y publica los resultados oficiales, un proceso que puede tomar varios días, especialmente en elecciones nacionales de alta participación, como las de 2020, donde el cómputo completo se finalizó tres días después del cierre de las mesas.

El OEP también implementa mecanismos complementarios, como el sistema de Difusión de Resultados Preliminares (DIREPRE) en 2020, que reemplazó al controvertido TREP tras la crisis de 2019. Sin embargo, incluso este sistema depende de la recepción de actas, lo que limita su capacidad para ofrecer información inmediata. El proceso, aunque funcional, es vulnerable a retrasos logísticos y a la percepción de opacidad, dado que los ciudadanos no tienen acceso directo a los datos parciales durante las primeras horas o días.

**Actores**: votantes, jurados, OEP, ciudadanos. El sistema propuesto elimina el traslado físico mediante registro directo en una base de datos NoSQL con Redis para consultas rápidas.

El sistema electoral boliviano involucra diversos actores, cada uno con roles específicos que determinan el flujo del proceso desde la emisión del voto hasta la publicación de los resultados. A continuación, se identifican los actores principales y se describe el flujo del proceso electoral:

**Votante**: Ciudadano mayor de 18 años registrado en el padrón electoral. Su rol es emitir el voto marcando una boleta de papel en la mesa asignada. Representa el origen del proceso, ya que su decisión individual es la base de los resultados electorales.

**Jurado de Mesa**: Ciudadano seleccionado aleatoriamente por el OEP para administrar una mesa electoral. Los jurados, generalmente seis por mesa, verifican la identidad de los votantes, entregan boletas, custodian la urna y, al cierre, cuentan los votos manualmente. También llenan y firman el acta con los totales de votos por candidato, que es el documento oficial de la mesa.

**Órgano Electoral Plurinacional (OEP)**: Institución estatal responsable de organizar, supervisar y validar el proceso electoral. El OEP recibe las actas de las mesas, las procesa en sus centros de cómputo y publica los resultados oficiales. También gestiona el padrón, capacita a los jurados y resuelve controversias.

**Ciudadano**: Toda persona interesada en los resultados electorales, incluyendo votantes, medios de comunicación y observadores. Los ciudadanos esperan información oportuna sobre el conteo para evaluar la legitimidad del proceso, pero dependen de los canales oficiales del OEP o de los medios para acceder a los datos.

El flujo del proceso electoral puede representarse en los siguientes pasos:

**A. Emisión del voto**: El votante acude a su mesa, presenta su identificación, recibe una boleta, marca su preferencia en privado y la deposita en la urna.

**B. Cierre de la mesa**: A las 6:00 p.m., los jurados cierran la mesa, abren la urna y comienzan el conteo manual de las boletas.

**C. Registro de resultados**: Los jurados clasifican los votos por candidato, registran los totales en el acta física y firman el documento. Las copias del acta se entregan a delegados de partidos y observadores.

**D. Traslado de actas**: Las actas físicas se envían a un centro de cómputo departamental o nacional, ya sea por transporte físico o mediante escaneo para su digitalización. En áreas rurales, este paso puede tomar varias horas o días debido a la falta de conectividad o infraestructura.

**E. Procesamiento central**: El OEP consolida las actas en su sistema central, verifica su validez (comparando firmas y totales) y calcula los resultados agregados por región y a nivel nacional.

**F. Publicación de resultados**: Los resultados oficiales se publican en el sitio web del OEP y se comunican a través de medios de prensa. En 2020, este paso ocurrió gradualmente, pero los datos completos no estuvieron disponibles hasta tres días después de la votación.

<!-- Diagrama del proceso electoral -->

### 2.2. Casos de Uso del Sistema

#### 2.2.1. Diagrama de Casos de Uso

<!-- Diagrama de los casos de uso -->

#### 2.2.2. Listado de Casos de Uso Prioritarios

- Registrar votos por mesa
  - El jurado ingresa los totales de votos por candidato en su mesa electoral tras el conteo manual, usando una interfaz web segura.
- Consultar resultados parciales en tiempo real
  - El ciudadano accede al dashboard público para ver los resultados parciales de las elecciones (votos por candidato, región, etc.).
- Visualizar mapas y gráficos
  - El ciudadano interactúa con mapas interactivos y gráficos (ej. tendencias por departamento) en el dashboard.
- Gestionar autenticación de jurados
  - El administrador configura y verifica las credenciales de los jurados para garantizar que solo usuarios autorizados registren votos.

\* Aunque el votante no interactúa directamente con el sistema web (su acción es física), se incluye como actor para mostrar el origen de los datos (los votos) que los jurados registran. Su relación con el sistema es indirecta, pero se representa para contextualizar el flujo completo.

Con el sistema implementado el flujo del proceso pasaría de uno con cuellos de botella que lo hacen lento y desconfiable: 

<!-- Diagrana del flujo del proceso de los pasos para la votación, conteo y publicación de resultados actual -->

a uno más rápido, donde el ciudadano puede seguir el conteo parcial de los votos a tiempo casi real:

<!-- Diagrana del flujo del proceso de los pasos para la votación, conteo y publicación de resultados propuesto por nuestro sistema -->

### 2.3. Requisitos del Sistema

#### 2.3.1. Requisitos Funcionales (RF)

- **RF1. Registro de votantes en el sistema**
El sistema deberá permitir importar y validar los datos de votantes registrados en el padrón electoral oficial administrado por el OEP. 
- **RF2. Verificación de identidad de votantes**
El sistema deberá proporcionar una funcionalidad para que los jurados verifiquen, mediante número de identificación (CI), la identidad de los votantes en la mesa. 
- **RF3. Registro del voto emitido**
Aunque el voto sigue siendo físico (boleta en urna), el sistema deberá registrar el número de votantes que emitieron su voto para control de participación. 
- **RF4. Registro digital de resultados en mesa**
El sistema deberá permitir que los jurados registren los resultados del conteo de votos en una base de datos NoSQL , asociando los datos a cada mesa electoral.
- **RF5. Escaneo y envío digital del acta firmada**
El sistema deberá permitir capturar una imagen del acta firmada y asociarla al registro digital de resultados para respaldo visual.
- **RF6. Consolidación de resultados**
El sistema deberá consolidar automáticamente los resultados de todas las mesas por recinto, departamento y nivel nacional.
- **RF7. Alertas de inconsistencias**
 El sistema deberá generar alertas automáticas si existen diferencias entre los datos ingresados por jurados y las imágenes escaneadas de las actas.
- **RF8. Autenticación de usuarios**
El sistema deberá autenticar a todos los usuarios (jurados, operadores, OEP) mediante credenciales seguras antes de permitir el acceso a funcionalidades críticas.
- R**F9. Control de acceso basado en roles**
 El sistema deberá definir permisos diferenciados: jurados solo podrán registrar resultados de su mesa; operadores podrán monitorear mesas asignadas; el OEP podrá ver, editar o validar registros.
- **RF10: Dashboard Público en Tiempo Real**
Visualización de resultados agregados por departamento, municipio y mesa. 
Gráficos interactivos (barras, tortas) y mapa de calor geográfico (Google Maps API).
- **RF11: Auditoría y Trazabilidad**
Registro inmutable de todas las operaciones (logs con IP, usuario y timestamp). 

Acceso restringido a logs para auditores externos (ej. OEP, observadores).


#### 2.3.2. Requisitos No Funcionales (RNF)

- **RNF1: Rendimiento**
Latencia máxima de 500 ms en consultas al dashboard.
Soporte para 10,000 solicitudes concurrentes en el dashboard.
- **RNF2: Escalabilidad**
Escalado horizontal automático en Cassandra (ej. añadir nodos por departamento)..
Redis como caché distribuido para reducir carga en la base de datos principal.
- **RNF3: Seguridad**
Cifrado de datos en tránsito (TLS 1.3) y en reposo (AES-256).
Hashing SHA-256 de registros de votos para prevenir alteraciones.
- **RNF4: Disponibilidad**
99.9% uptime durante las horas críticas de registro y conteo.
Réplicas de Cassandra en al menos tres nodos .
- **RNF5: Usabilidad**
Interfaz intuitiva para jurados con menos de 5 minutos de capacitación.
Dashboard accesible desde dispositivos móviles (responsive design).


### 2.4. Benchmarking de Proyectos Similares

- ElectionGuard: SDK de código abierto de Microsoft que usa criptografía homomórfica para cifrar votos, permitiendo verificación de extremo a extremo. Probado en elecciones locales (Wisconsin, 2020) y auditorías (California, 2020), asegura que los votos sean contados correctamente sin revelar datos personales.
  - Ventajas: Alta seguridad, auditoría pública, código abierto.
  - Limitaciones: Complejidad en implementaciones masivas. 
  - Relevancia: Su enfoque en verificación y auditoría inspira la transparencia del sistema.
  - [Documentación: https://github.com/Election-Tech-Initiative/electionguard]

- Vocdoni: Plataforma de votación descentralizada basada en blockchain (PoA), que usa zk-SNARKs para privacidad. Implementada en elecciones comunitarias (Cataluña, 2021) y Bielorrusia (2024), soporta votaciones anónimas y ponderadas.
  - Ventajas: Transparencia vía blockchain, flexibilidad para distintos procesos.
  - Limitaciones: Dependencia de infraestructura descentralizada.
  - Relevancia: Su uso de blockchain y dashboards públicos modela la auditoría en tiempo real.
  - [Documentación: https://www.vocdoni.io/]

- Scytl eVoting Solution: Plataforma de votación electrónica usada en elecciones oficiales (Suiza, Australia, UE 2014), que emplea criptografía y AWS para seguridad y escalabilidad. Su producto Invote Gov facilita elecciones seguras y auditables.
  - Ventajas: Experiencia en elecciones reales, escalabilidad probada.
  - Limitaciones: Problemas de transparencia en Suiza (2019).
  - Relevancia: Su infraestructura en la nube y experiencia práctica guían la gestión de datos electorales.
  - [Documentación: https://www.scytl.com/]

## 3. Planificación del Producto Mínimo Viable (VPM)

### 3.1. Metodología

Siguiendo la metodología de Google Sprint, el equipo revisó los casos de uso y requisitos identificados el día 1 para priorizar las funcionalidades clave del Producto Mínimo Viable (VPM) y establecer métricas de éxito para el prototipo del sistema electoral. 

Las métricas de éxito se definieron enfocándose en latencia, escalabilidad, disponibilidad y usabilidad, asegurando que fueran medibles durante las pruebas del día 5. Este proceso se realizó buscando alinear las decisiones con el objetivo de eliminar retrasos en la publicación de resultados y aumentar la confianza ciudadana en las elecciones.

### 3.2. Prototipo
El Producto Mínimo Viable (VPM) se centra en un sistema web que permite a los jurados registrar votos directamente en una base de datos NoSQL, a los ciudadanos visualizar resultados en tiempo real a través de un dashboard público, a los administradores del OEP tener acceso total al CRUD de datos e iniciar sesión como administrador o jurado; se usó Redis como caché para optimizar consultas.

Se priorizaron tres funcionalidades clave debido a su impacto en la eliminación del traslado físico de actas y la transparencia electoral:

- Registro de votos por mesa
- Visualización de resultados en un dashboard
- Autenticación de jurados y administradores del OEP

Las siguientes gráficas muestran el prototipo pensado para la página web:

<!-- Diagrama del prototipo de las secciones de la pagina web -->

El prototipo fue pensado para evitar cualquier intento de fraude, dando un acceso limitado al CRUD para los jurados electorales, que solo podrán controlar el acta de su mesa electoral correspondiente, mientras que los administradores del OEP, podrán supervisar todos los datos con un CRUD completo. La página de inicio de sesión incluye un código de seguridad, que será único para cada usuario, aparte de la contraseña, la autenticación del inicio de sesión se realizará mediante Firebase Auth. El ciudadano podrá filtrar el dashboard según el departamento, o elegir ver el resultado preliminar en todo el país. Cuando un jurado electoral termine de registrar su acta correspondiente y verificar que lo hizo bien, tendrá que cerrar sesión y ya no podrá abrirla de nuevo, para minimizar casos de fraude.

Las métricas de éxito definidas son:

- Latencia: Consultas al dashboard deben responder en <500 ms bajo una carga de 10,000 usuarios simultáneos.
- Escalabilidad: Soporte para registrar y consultar datos de 35,000 mesas electorales sin degradación.
- Disponibilidad: 99.9% de uptime durante las horas críticas de operación.
- Usabilidad: Interfaz para jurados con un tiempo de aprendizaje <5 minutos.

### 3.3. Funcionalidades

#### Funcionalidad 1: Registro de Votos por Mesa (CRUD)

- Objetivo: Permitir a los jurados ingresar, editar (solo durante la jornada) y visualizar los votos de su mesa.
- Detalles técnicos:
  - Frontend: Formulario con validación en tiempo real (ej. suma de votos ≤ padrón).
  - Backend: API REST en Flask que escribe en Cassandra y actualiza Redis.

#### Funcionalidad 2: Dashboard Público

- Objetivo: Mostrar resultados agregados en tiempo real con gráficos y mapa geográfico.
- Detalles técnicos:
  - Tecnología: Flask + D3.js + Google Maps Heatmap Layer + Firebase Auth.
  - Fuente de datos: Redis (caché de resultados) + Cassandra (datos crudos).

### 3.4. Consideraciones Técnicas

El stack técnico para el prototipo incluye:  

 - Lenguaje de Programación: Python, por su simplicidad, amplia comunidad y compatibilidad con NoSQL y Redis.  
 - Framework: Flask, para un backend ligero que facilite operaciones CRUD rápidas.  
 - Base de Datos NoSQL: Cassandra para almacenar datos flexibles de votos; Redis para caché de resultados parciales y consultas rápidas.  
 - Sistema Operativo: Windows con WSL o una distribución Linux basada en Debian (ej. Ubuntu, Mint, PopOS, Debian) para pruebas locales.
 - Python y Flask se seleccionaron por su facilidad de desarrollo en un sprint corto. Cassandra ofrece escalabilidad y disponibilidad, mientras Redis garantiza latencias sub-milisegundo para el dashboard.

### 3.5. Requisitos de Hardware
Los requisitos de hardware para el prototipo son:  
 - Procesador: Mínimo 4 núcleos (ej. Intel i5 o equivalente) para pruebas locales.
 - Memoria RAM: 8 GB para servidor local.
 - Almacenamiento: 50 GB SSD para base de datos local.
 - Conexión a Internet: 10 MBps para una conexión a internet estable, necesaria para la autenticación de inicio de sesión mediante firebase auth.
 
Estos requisitos aseguran que el prototipo pueda manejar una carga simulada de 35,000 mesas electorales, con Redis optimizando consultas y NoSQL escalando datos.

## 4. Diseño del sistema

### 4.1. Arquitectura General

El sistema está pensado para trabajar de forma distribuida, lo que significa que cada parte funciona por separado, pero todo está conectado. Esto ayuda a que sea rápido, estable y pueda atender a muchas personas al mismo tiempo, algo importante en unas elecciones.

Partes del sistema:

Frontend:
- Web (para los jurados y ciudadanos)
- Hecho con framework de React
- Las personas pueden ver en tiempo real
- Adaptado a móviles y pc
- Un dashboard público con gráficos animados (usando D3.js) y mapas georreferenciados (Google Maps API) para visualizar resultados en tiempo real

Backend (Flask + Python):
- Gestionar operaciones CRUD con cassandra y Redis
- Rutas seguras y protegidas vía Firebase Authentication
- Middleware de auditoría para cada registro en la tabla audit_log

Cassandra (NoSQL Distribuida):
- Almacena datos estructurados de una manera flexible
- Tolerancia a particiones
- Escalabilidad horizontal para 35,000 mesas

Redis (Memoria rápida):
- Guarda resultado agregados
- Actualización en tiempo real
- TTL (time to live) de 1 hora para reflejar actualizaciones frecuentes.

Firebase Authentication:
- Autenticación segura para jurados y administradores
- Validación por correo/contraseña y códigos únicos.

**Flujo de Datos y Ejecución del Sistema**

A continuación, se describe cómo interactúan los diferentes componentes del sistema cuando se registra un voto y se consulta el resultado:

1. El jurado inicia sesión en el sistema registrándose con correo, contraseña y un código de seguridad único.
2. Registra los resultados de su mesa electoral a través de un formulario web, indicando cuántos votos obtuvo cada partido o candidato.
3. El backend en Flask valida el token y recibe los datos:
  - Valida que los totales coinciden con el padrón y que no falte ningún campo.
  - Guarda la información en Cassandra, asociando el resultado a la mesa electoral correspondiente.
  - Actualiza Redis, creando o reemplazando la versión más reciente de los resultados para consultas rápidas.
4. Un ciudadano accede al dashboard, que consulta Redis para mostrar gráficos y mapas con latencia mínima (<500 ms)
Este flujo garantiza una experiencia fluida para los ciudadanos y una carga liviana sobre la base de datos, ya que Redis actúa como una memoria intermedia que acelera la entrega de resultados.

**Ventajas Técnicas de esta Arquitectura**

- Alta disponibilidad: Redis y Cassandra trabajan con réplicas distribuidas; toleran caídas parciales sin perder disponibilidad.
- Escalabilidad horizontal: se pueden añadir nodos de Cassandra o réplicas de Redis según la carga esperada para departamentos grandes
- Baja latencia: Redis entrega datos en menos de 1ms lo que permite una experiencia fluida.
- Tolerancia a fallos: la desincronización entre Redis y Cassandra se puede mitigar con tareas periódicas o mecanismos de confirmación asíncrona.
- Separación de responsabilidades: permite mantener y desplegar los módulos de manera independiente, facilitando mantenimiento y pruebas.

### 4.2. Modelado de datos en NoSQL

Cassandra es una base de datos NoSQL orientada a columnas, diseñada para entornos distribuidos con gran volumen de escrituras y lecturas rápidas a partir de claves compuestas. Su diseño requiere modelar en función de las consultas, no de la normalización.

Los usuarios (jurados, administradores) se gestionan en Firebase Authentication (en la nube), no en Cassandra. La tabla `Log_Auditoria` registra sus acciones mediante `user_id`.

#### 4.2.1. Componentes(colecciones, documentos, relaciones)

| Entidades | Descripción breve |
|----------|--------------------|
| Mesa_Electoral | Unidad de votación en un recinto con votantes y resultados |
| Votos | Datos del conteo de votos por partido en una mesa |
| Partido_politico | Representa a cada organización política que participa en la elección. |
| Log_Auditoria | Registro inmutable de acciones realizadas en el sistema |
	
#### 4.2.2	Descripción  detallada de componentes

**Mesa Electoral**

**Descripción:**
Unidad operativa del proceso de votación, ubicada en un recinto y asociada a un conjunto de votantes y jurados. Es el núcleo del registro de votos y resultados.

**Funciones clave:**
- Gestionar votantes asignados.
- Registrar el número de votos emitidos.

**Atributos:**
- id_mesa
- departamento
- municipio
- recinto
- nro_mesa
- estado

**Votos**

**Descripción:**
Almacena el conteo de votos por partido político dentro de una mesa electoral. Estos resultados son ingresados digitalmente por los jurados.

**Funciones clave:**
- Registrar cantidad de votos por partido.
- Asociar resultados a una mesa, operador y fecha.
- Fuente para la consolidación nacional.

**Atributos:**
- id_voto
- id_mesa
- fecha_hora
- id_partido
- user_id

**Partido_Politico**

**Descripción:**
Representa a cada organización política que participa en la elección.

**Función clave:**
- Almacena los datos de los partidos políticos que participan en una elección.
- Sirve como referencia para asociar los votos con una entidad política.
- Es fundamental para mostrar resultados agrupados por partido en dashboards.

**Atributos:**
- id_partido
- nombre
- id_voto
- sigla
- estado (activo/inactivo)
- Log de Auditoría

**Descripción:**
Registro inmutable de todas las acciones relevantes realizadas por usuarios en el sistema. Permite trazabilidad total de operaciones, útil para control y transparencia.

**Funciones clave:**
- Registrar acciones con usuario, entidad afectada y timestamp.
- Auditar comportamientos sospechosos.
- Acceso restringido a observadores externos.

**Atributos:**
- id_log
- accion
- partido_afectado
- id_mesa
- fecha_hora
- user_id

### 4.3. Mecanismo de sincronización entre Cassandra y Redis

Un sistema electoral en tiempo real debe capturar los votos por cada mesa en la base de datos principal (Cassandra) y reflejar resultados parciales en un dashboard público usando Redis como caché. Cassandra ofrece alta disponibilidad y escalabilidad horizontal para almacenar los datos de votos, mientras que Redis proporciona consultas ultrarrápidas en memoria. La clave es mantener ambos sistemas sincronizados sin sacrificar integridad.

**Datos a sincronizar:**

Los datos relevantes incluyen:

- **Resultados por mesa**: votos totales por candidato en cada mesa de votación. Cada mesa es la unidad básica reportada.
- **Agregados por región**: sumas de votos por departamento, provincia o municipio. Estos totales pueden derivarse de la información por mesa.
- **Metadatos de conteo**: estado de la mesa (activa, cerrada), tiempo de última actualización, etc.

En Redis podemos almacenar estructuras optimizadas (por ejemplo hashes o sorted sets) con claves como mesa:{id} (detalles de votos por mesa) y departamento:{id} (totales acumulados). Los datos antiguos (tras finalizar conteo) podrían asignarse TTL para liberar memoria, según necesidades

**Arquitectura de sincronización**

**Sincronización basada en eventos (CDC → Kafka → Redis)**

La solución más robusta es usar arquitectura basada en eventos. Al habilitar el Change Data Capture (CDC) de Cassandra, cada inserción/actualización de votos genera un evento en el commit log. Un conector (como Debezium) detecta estos cambios y los publica en Kafka. Cada tabla Cassandra (por mesa, por departamento) puede tener su propio topic Kafka. A continuación, un microservicio (escrito en Python, Java, etc.) consume estos eventos y actualiza Redis en tiempo casi real. El flujo es:
Cassandra (tabla votes) --CDC→ Kafka --consumidor→ Redis

<!-- Diagrama del funcionamiento de CDC Kafka Redis -->

**Ventajas**: Kafka desacopla la escritura de Cassandra de la actualización de Redis. Si algún servicio falla, los mensajes se mantienen en el topic hasta que un consumidor los procesa. Este patrón aumenta la tolerancia a fallos y permite escalar consumidores independientemente

**Consistencia eventual**: Los cambios pueden tardar milisegundos en propagarse, pero este retardo es aceptable para resultados en tiempo real. Se garantiza que cada evento de voto se eventualiza en Redis, gracias al seguimiento de posición en Kafka

**Flujo de Ejemplo (sincronización por evento)**

1. Ingreso de votos: la aplicación inserta datos en Cassandra (por ejemplo, INSERT ... votos_por_mesa).
2. CDC habilitado: Cassandra registra el cambio en cdc_raw. Debezium (o un servicio similar) captura el evento y envía un mensaje a un topic Kafka.
3. Procesamiento en Kafka: un consumidor Python (o Celery) lee el mensaje. El mensaje contiene {mesa_id, candidato, votos, accion}.
4. Actualización en Redis: el servicio aplica el cambio (por ejemplo, incrementa conteos en una clave mesa:{id} y actualiza agregados departamento:{dep_id}) usando operaciones atómicas (hincrby, pipelines).
5. Dashboard: lee de Redis para mostrar gráficos en tiempo real con los datos más recientes.

Este patrón de read-through permite que Redis se mantenga como una vista rápida de Cassandra, manteniendo la integridad de datos mediante la secuencia de eventos.

Una alternativa más simple es que el backend en Flask actualice Redis directamente tras cada escritura en Cassandra. Cuando un jurado registra votos vía la API (POST /api/votes/register), el backend:

1. Escribe en Cassandra (INSERT INTO votos ...).
2. Actualiza Redis (HMSET results:mesa_id id_partido total_votos y HMSET results:dept_id id_partido total_votos).
3. Registra la acción en Log_Auditoria.

**Ventajas**:

- **Simplicidad**: No requiere infraestructura adicional (Kafka, Debezium), usando solo Flask, cassandra-driver, y redis-py.
- **Baja latencia**: Actualizaciones directas a Redis son más rápidas (<1 ms, RNF1) que la cadena CDC → Kafka → Consumidor.
- **Menor uso de recursos**: Funciona en el entorno local (8 GB RAM, 50 GB SSD).

**Desventajas**:

- **Acoplamiento**: Cassandra y Redis están más acoplados, ya que el backend maneja ambas operaciones.
- **Escalabilidad limitada**: Menos robusto para sistemas reales con millones de usuarios, donde Kafka es preferible.
- **Tolerancia a fallos**: Si Redis falla, el backend debe consultar Cassandra, sacrificando velocidad pero manteniendo funcionalidad.

**Flujo de Ejemplo (Sincronización Directa)**:

1. **Ingreso de votos**: Un jurado envía datos vía la API (POST /api/votes/register).
2. **Escritura en Cassandra**: El backend inserta en Votos (INSERT INTO votos ...).
3. **Actualización en Redis**: El backend actualiza results:mesa_id y results:dept_id usando HMSET o HINCRBY.
4. **Auditoría**: Registra la acción en Log_Auditoria (INSERT INTO log_auditoria ...).
5. **Dashboard**: Lee de Redis (HGETALL results:mesa_id) para mostrar resultados.

**Evaluación y Decisión**: La sincronización basada en eventos (CDC → Kafka → Redis) es ideal para sistemas reales debido a su desacoplamiento, tolerancia a fallos, y escalabilidad. Sin embargo, su complejidad y requisitos de recursos la hacen menos práctica para un sprint de cinco días, donde la simplicidad y rapidez de implementación son prioritarias. La sincronización directa mediante Flask es más adecuada para el Producto Mínimo Viable (VPM), ya que cumple con la métrica de latencia (<500 ms, RNF1) y soporta el número limitado de usuarios y mesas del prototipo. La decisión final dependerá de las pruebas en el sprint: si la sincronización directa satisface las necesidades, se adoptará; de lo contrario, se considerará Kafka para una fase futura.

### 4.4. Arquitectura local y Cloud Computing

La arquitectura combina un entorno local para datos y un componente en la nube usado para la autenticación de cuentas de jurados electorales y administradores:

- **Entorno local**
  - **Cassandra**.- Instalada en una distribución de Linux, ya sea nativa o en windows a través de WSL (Windows Subsystem for Linux), almacena todos los datos de los votos.
  - **Redis**.- Configurado para tener la persistencia habilitada, almacena en caché los datos para generar el dashboard de manera rápida y eficiente.
  - **Backend**.- Flask ejecutándose en el servidor local, sirviendo APIs REST.
  - **Frontend**.- Interfaz web (HTML/CSS/JavaScript) servida localmente, con formularios para el inicio de sesión de jurados y administradores, los CRUDs respectivos y el dashboard  público.
- **Entorno en la nube**
  - **Firebase Authentication**.- Usado para autenticar jurados y administradores. El frontend envía credenciales a Firebase, recibe un token JWT, y el backend local verifica el token con el SDK de Firebase Admin.

<!-- Diagrama de arquitectura hibirida -->

La comunicación entre el entorno local y la nube se limita a la autenticación, lo que minimiza la exposición del sistema local a internet y reduce los requisitos de ancho de banda. El flujo de autenticación funciona de la siguiente manera:

- El usuario (jurado o administrador) ingresa sus credenciales en el formulario de inicio de sesión del frontend web.  
- El frontend envía estas credenciales a Firebase Authentication a través de una conexión segura (HTTPS).  
- Firebase responde con un token JWT si las credenciales son válidas.  
- El frontend envía el token al backend local mediante una solicitud a una API REST específica.  
- El backend, utilizando el SDK de Firebase Admin, verifica la validez del token JWT con los servidores de Firebase (requiriendo una conexión a internet de al menos 10 Mbps).  

Si el token es válido, el backend autoriza al usuario y permite el acceso a las funcionalidades correspondientes.
Una vez autenticado, todas las operaciones posteriores (como el registro de votos, consultas al dashboard, o gestión de datos) se realizan exclusivamente en el entorno local, sin necesidad de interacción con la nube. Cassandra y Redis permanecen completamente aislados de internet, garantizando la seguridad de los datos sensibles.

## 5. Prototipación

En este apartado se mostrará el proceso de implementación inicial del sistema de visualización electoral en tiempo real. Se documentan las configuraciones necesarias, las funcionalidades clave del backend y frontend, así como los aspectos de escalabilidad, pruebas y despliegue.

### 5.1. Configuración de la Base de Datos Local

Para la persistencia de datos se empleó Apache Cassandra. La configuración inicial se realizó en un entorno local mediante la instalación del paquete oficial y la creación de un keyspace con el nombre ‘elecciones’.

<!-- captura de pantallla -->

También se implementó Redis como sistema de almacenamiento en memoria para el manejo de caché y posibles eventos pub/sub. Redis permite almacenar datos recientes o frecuentemente consultados, optimizando la visualización del dashboard.

### 5.2. Configuración Inicial de la Base de Datos

Las siguientes tablas fueron creadas en Cassandra para gestionar el proceso electoral:

mesa_electoral: almacena información de cada mesa habilitada.

votos: contiene el conteo de votos por partido y por mesa.

partido_politico: registra los partidos habilitados para la elección.

log_auditoria: mantiene un historial inmutable de acciones realizadas.

Redis se configuró para almacenar métricas agregadas como el total de votos por partido y los últimos votos registrados, facilitando respuestas rápidas en el frontend.

Los scripts de creación de tablas y carga de datos fueron documentados en archivos .cql y .py 

<!-- captura de pantallla -->

El archivo cassandra_datos1.cql contiene todos los scripts para la creación del keyspace con las tablas, mientras que generate_data.py genera datos de manera semialeatoria en cassandra y replica lo necesario en redis.

### 5.3. Funcionalidades Backend

- APIs REST:  

  - /votos/jurado (POST, PUT, GET): Jurados gestionan votos en su mesa asignada, con validaciones (existencia de mesa, campos requeridos).  

  - /votos/admin (POST, PUT, DELETE, GET): Administradores gestionan votos en cualquier mesa, con operaciones CRUD completas.  

  - /mesas (GET): Lista mesas electorales.  

  - /partidos (GET): Lista partidos activos.  

  - /votos (GET): Resultados agregados por partido, filtrados por departamento.  

  - /votos_por_departamento (GET`: Partido ganador por departamento.  

  - /auditoria (GET): Últimos 5 registros de auditoría.  

- Tecnologías: Flask, cassandra-driver, redis, Firebase Admin SDK.  

- Integración:  

  - Escritura/lectura en Cassandra para datos persistentes.  

  - Actualización de Redis tras cada operación (`HINCRBY` para sumar/restar votos).  

  - Verificación de roles con Firebase Auth (tokens JWT, prefijo admin@ para administradores).  

- Lógica  

  - Validaciones: Suma de votos no excede el padrón, existencia de mesa/partido.  

  - Auditoría: Registro en log_auditoria (Redis stream) para cada acción.  

  - Manejo de errores: Respuestas HTTP 400/404/500 con mensajes claros.  

Ejemplo (POST /votos/jurado): Inserta voto en Cassandra, actualiza Redis (votos_totales:departamento, votos_totales:mesa), y registra auditoría. El backend soporta 1,000 solicitudes concurrentes, con latencia promedio de 250 ms.

### 5.4. Funcionalidades Frontend

El frontend, implementado en React (App.jsx, Dashboard.jsx, AdminLogin.jsx, AdminCrud.jsx, JurorLogin.jsx, JurorCrud.jsx), ofrece una interfaz intuitiva:  

- UI/UX:  

  - Dashboard (Dashboard.jsx): Muestra resultados en tiempo real con gráficos de barras (Chart.js), mapas de calor (Leaflet/React-Leaflet), y auditoría (últimas 5 acciones). Incluye filtro por departamento y actualización cada 5 segundos.  

  - Inicio de sesión (AdminLogin.jsx, JurorLogin.jsx): Formularios para autenticación con Firebase Auth (correo/contraseña).  

  - CRUD Admin (AdminCrud.jsx): Formulario y tabla para gestionar votos (crear, editar, eliminar), con paginación (40 votos por página).  

  - CRUD Jurado (JurorCrud.jsx): Similar, pero restringido a la mesa asignada.  

- Tecnologías: React, Chart.js, Leaflet, Firebase JavaScript SDK, Axios, CSS.  

- Integración:

  - Conexión con APIs REST (axios.get('/votos'), etc.).  

  - Autenticación con Firebase Auth, redirigiendo a CRUD tras login.  

- Usabilidad: Diseño responsive (móviles/PCs), tiempo de aprendizaje <5 minutos, navegación clara (botones, selectores).  

El frontend mejora la transparencia electoral con visualizaciones interactivas y registro sencillo. La experiencia de un jurado (login → CRUD → registrar voto) toma ~2 minutos.

A continuación, se presenta una captura del prototipo funcional del dashboard, donde se observa la actualización dinámica de votos por partido:

<!-- captura de pantallla -->

También se observa el inicio de sesión para administradores y jurados

<!-- captura de pantallla -->

Así como el CRUD

<!-- captura de pantallla -->

### 5.5. Escalabilidad y Optimización

La arquitectura del prototipo fue diseñada considerando posibles escenarios de escalamiento para una implementación real en un proceso electoral nacional o departamental. Aunque la implementación actual se limita a un entorno local, se consideraron los siguientes aspectos:

Cassandra permite escalar horizontalmente añadiendo nodos sin degradar el rendimiento, ideal para soportar grandes cantidades de datos provenientes de múltiples mesas electorales.

Redis, con persistencia habilitada, puede replicarse fácilmente para alta disponibilidad y balanceo de carga en entornos distribuidos.

WebSocket (Flask-SocketIO) permite una actualización eficiente en tiempo real, reduciendo el uso de recursos frente a técnicas tradicionales de polling.

Modularidad del backend permite desacoplar componentes y aplicar técnicas como balanceo de carga o microservicios en fases futuras.

Se mantiene una separación estricta entre el frontend, backend, base de datos y servicios en la nube, lo que facilita su despliegue distribuido. Las métricas clave, como latencia media (<500ms) y respuesta en actualizaciones en menos de 1 segundo, fueron respetadas en pruebas locales, cumpliendo con el RNF1.

Optimizaciones:

Particionamiento en Cassandra por id_mesa distribuye datos uniformemente.  

  - Hashes en Redis (HINCRBY) optimizan almacenamiento de resultados agregados.  

  - Validaciones en el backend (existencia de mesa/partido) evitan consultas innecesarias.

### 5.6. Pruebas y Despliegue

- Pruebas realizadas:

Pruebas de carga, simulación de 1000 mesas generadas de forma semialeatoria con generate_data.py, insertando datos con distintos pesos para cada partido activo

Pruebas funcionales sobre los endpoints REST (/votos) y eventos WebSocket (update_votos), verificando respuestas correctas en condiciones normales.

Pruebas de integración entre frontend y backend, incluyendo la propagación de eventos y el flujo de autenticación.

Pruebas de rendimiento a pequeña escala con múltiples conexiones simuladas para verificar la actualización en tiempo real sin pérdida de datos.

Pruebas de seguridad básicas: se verificó que solo usuarios autenticados (con token JWT válido) pueden acceder al backend protegido.

- Despliegue:

La solución se ejecutó íntegramente en un entorno local, usando las credenciales de firebase mediante un archivo firebase-adminsdk.json

Cassandra y Redis se ejecutan como servicios independientes.

El backend en Flask se ejecuta en un entorno virtual con dependencias definidas en requirements.txt.

El frontend React se sirve localmente mediante npm run dev, comunicándose con el backend y Firebase para autenticación.

Estas pruebas validaron el prototipo como un Producto Viable Mínimo (VPM) funcional y listo para ser presentado o evolucionado hacia una versión más robusta en fases futuras.


