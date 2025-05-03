# Informe Día 1: Sistema de Registro de Votos Electorales

## 1. Introducción

### 1.1. Contexto y Problemática
*Redactado por Integrante 1: Líder de Investigación y Problemática*

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
*Redactado por Integrante 1: Líder de Investigación y Problemática*

El proyecto tiene como propósito diseñar una solución tecnológica que aborde los retrasos y la desconfianza en el sistema electoral boliviano, utilizando herramientas modernas de desarrollo web y bases de datos no relacionales. Los objetivos se dividen en: 

- **Objetivo General**: Desarrollar un sistema web basado en una base de datos NoSQL y Redis que permita a los jurados registrar votos directamente y a los ciudadanos visualizar resultados en tiempo real, promoviendo transparencia en las elecciones bolivianas.

- **Objetivos Específicos**: 
  - Diseñar una interfaz CRUD accesible para que los jurados registren los totales de votos por candidato en cada mesa de manera rápida y eficiente.
  - Implementar un dashboard público con resultados parciales, mapas y gráficos en tiempo real.  
  - Garantizar consultas a la base de datos con latencia inferior a 500 ms bajo alta carga.  
  - Validar la usabilidad del prototipo mediante pruebas con usuarios simulados, asegurando que tanto jurados como ciudadanos encuentren la solución intuitiva y confiable. 

### 1.3. Justificación del Uso de NoSQL
*Redactado por Integrante 2: Especialista en NoSQL y Justificación Técnica*

La elección de una base de datos NoSQL y Redis para este proyecto se fundamenta en sus características técnicas, que se alinean directamente con las necesidades del sistema electoral propuesto, ofreciendo las siguientes ventajas: 

- **Escalabilidad**: NoSQL (ej. MongoDB, Cassandra, Firestore) maneja miles de registros simultáneos mediante sharding. Redis, como caché, reduce la carga en consultas frecuentes.  
- **Flexibilidad**: NoSQL permite esquemas dinámicos para datos como votos, regiones y timestamps. Redis almacena resultados parciales clave-valor.  
-  **Rendimiento en consultas**: NoSQL optimiza consultas agregadas con índices, y Redis ofrece latencias sub-milisegundo.
**Teorema CAP**: Dado el contexto electoral, donde la publicación en tiempo real y la operatividad en áreas con conectividad limitada son críticas, la base de datos NoSQL debe priorizar AP (Disponibilidad y Tolerancia a Particiones) para garantizar que los jurados puedan registrar votos y los ciudadanos consultar resultados incluso durante particiones de red, mientras Redis prioriza AP para consultas rápidas. Estamos evaluando opciones como Cassandra y DynamoDB (AP) frente a MongoDB y Firestore (CP).

Comparado con SQL, NoSQL y Redis reducen la complejidad de relaciones y mejoran la escritura intensiva, esenciales para registrar 35,000 mesas en tiempo real.

### 1.4. Herramientas de Google Utilizadas

Para la colaboración y documentación del proyecto, utilizamos un conjunto de herramientas de Google que facilitan el trabajo en equipo y la organización. Google Drive sirve como repositorio central para almacenar y compartir todos los recursos, incluyendo documentos, diagramas y capturas, asegurando acceso en tiempo real para los cinco integrantes. Google Meet se emplea para coordinar reuniones diarias, como la sesión inicial de alineación y la revisión final del día 1, permitiendo discusiones efectivas y toma de decisiones. Google Docs es la herramienta principal para redactar y editar el informe de manera colaborativa, garantizando que todos puedan contribuir simultáneamente. Además, es probable que utilicemos Google Slides para preparar presentaciones visuales de los casos de uso y diagramas, y Google Sheets para crear tablas comparativas, como la evaluación de bases de datos NoSQL y el análisis de requisitos.

### 1.5. Alcance del Design Sprint

El proyecto se desarrolla bajo la metodología Design Sprint, un proceso estructurado de cinco días diseñado para resolver problemas complejos mediante la colaboración intensiva, la ideación rápida y la validación de soluciones. Este enfoque, creado por Jake Knapp en Google Ventures, es particularmente adecuado para proyectos académicos con recursos limitados, ya que permite generar resultados tangibles en un tiempo reducido. El alcance del Design Sprint para este proyecto incluye:

- Día 1 (Entender): Analizar el proceso electoral boliviano, identificar los problemas clave (retrasos y desconfianza), entender el problema electoral, analizar usuarios, definir foco. 

- Día 2 (Idear): Priorizar funcionalidades (registro de votos, dashboard). 

- Día 3 (Decidir): Diseñar arquitectura y esquemas de datos. 

- Día 4 (Prototipar): Crear prototipo con NoSQL y Redis.

- Día 5 (Testear): Probar prototipo y medir rendimiento.

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

### 2.2. Casos de Uso del Sistema

#### 2.2.1. Diagrama de Casos de Uso
[un diagrama de los casos de uso]

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


## 3. Desarrollo del Día 1: Fase de Entender (Google Design Sprint)

### 3.1. Preparación del Entorno

Se organizó un equipo multidisciplinario compuesto por expertos técnicos, juristas electorales, facilitadores de diseño y representantes ciudadanos. Se habilitaron herramientas digitales para la colaboración como Miro (para mapas de procesos), Google Docs (para actas). Se establecieron reglas de trabajo basadas en enfoque ágil: decisiones rápidas, comunicación clara y prototipado temprano.

### 3.2. Investigación del Contexto

Se estudió detalladamente el proceso electoral boliviano administrado por el OEP, caracterizado por su complejidad logística y dependencia del traslado físico de actas. Se detectaron los principales problemas: demoras en el procesamiento por factores geográficos, riesgo de pérdida o alteración de actas en tránsito y falta de acceso temprano de los ciudadanos a resultados parciales. 

### 3.3. Definición de la Meta a Largo Plazo

Modernizar el proceso de conteo y publicación de resultados electorales en Bolivia mediante un sistema de registro y consolidación digital en tiempo real, utilizando una base de datos NoSQL que elimine el traslado físico de actas, reduzca tiempos de cómputo, garantice la integridad de los datos y permita a los ciudadanos monitorear el avance de los resultados de forma transparente y segura.

### 3.4. Mapeo del Proceso Electoral

*Se representó el flujo actual*:

inscripción → votación presencial → conteo manual → llenado de acta física → traslado físico o escaneo → procesamiento centralizado → publicación de resultados. Se identificaron puntos críticos: el traslado físico de actas (vulnerabilidad a retrasos y extravíos) y el procesamiento central (cuellos de botella en validación).

*Se propuso el nuevo flujo*:

votación → conteo manual → registro inmediato de resultados en plataforma digital → verificación automática → publicación pública en dashboard en tiempo real.

### 3.5. Identificación de Preguntas Clave

¿Cómo autenticar de manera segura a los jurados para el registro digital de resultados?

¿Qué estrategias de redundancia garantizan que los datos no se pierdan (por ejemplo, copias de seguridad automáticas cada 10 minutos)?

¿Cómo permitir a los ciudadanos consultar los resultados de manera clara, ordenada y confiable?

¿Qué mecanismos de auditoría permitirán validar el proceso digital frente a auditorías internas y observadores externos?

¿Cómo adaptar el sistema en zonas rurales con conectividad limitada?

### 3.6. Selección del Foco del Sprint

Se seleccionó como enfoque central el registro y transmisión segura de resultados desde la mesa electoral, eliminando el traslado físico de actas. El primer prototipo se centrará en la creación de una aplicación para jurados que registre los resultados de su mesa directamente en una base de datos Redis, con validación inmediata, generación de un log inmutable por cada registro y visualización pública en un dashboard de resultados agregados.