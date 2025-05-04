# Informe reunión 1

## 1. Desarrollo del Día 1: Fase de Entender (Google Design Sprint)

### 1.1. Preparación del Entorno

Se organizó un equipo multidisciplinario compuesto por expertos técnicos, juristas electorales, facilitadores de diseño y representantes ciudadanos. Se habilitaron herramientas digitales para la colaboración como Miro (para mapas de procesos), Google Docs (para actas). Se establecieron reglas de trabajo basadas en enfoque ágil: decisiones rápidas, comunicación clara y prototipado temprano.

### 1.2. Investigación del Contexto

Se estudió detalladamente el proceso electoral boliviano administrado por el OEP, caracterizado por su complejidad logística y dependencia del traslado físico de actas. Se detectaron los principales problemas: demoras en el procesamiento por factores geográficos, riesgo de pérdida o alteración de actas en tránsito y falta de acceso temprano de los ciudadanos a resultados parciales. 

### 1.3. Definición de la Meta a Largo Plazo

Modernizar el proceso de conteo y publicación de resultados electorales en Bolivia mediante un sistema de registro y consolidación digital en tiempo real, utilizando una base de datos NoSQL que elimine el traslado físico de actas, reduzca tiempos de cómputo, garantice la integridad de los datos y permita a los ciudadanos monitorear el avance de los resultados de forma transparente y segura.

### 1.4. Mapeo del Proceso Electoral

*Se representó el flujo actual*:

inscripción → votación presencial → conteo manual → llenado de acta física → traslado físico o escaneo → procesamiento centralizado → publicación de resultados. Se identificaron puntos críticos: el traslado físico de actas (vulnerabilidad a retrasos y extravíos) y el procesamiento central (cuellos de botella en validación).

*Se propuso el nuevo flujo*:

votación → conteo manual → registro inmediato de resultados en plataforma digital → verificación automática → publicación pública en dashboard en tiempo real.

### 1.5. Identificación de Preguntas Clave

¿Cómo autenticar de manera segura a los jurados para el registro digital de resultados?

¿Qué estrategias de redundancia garantizan que los datos no se pierdan (por ejemplo, copias de seguridad automáticas cada 10 minutos)?

¿Cómo permitir a los ciudadanos consultar los resultados de manera clara, ordenada y confiable?

¿Qué mecanismos de auditoría permitirán validar el proceso digital frente a auditorías internas y observadores externos?

¿Cómo adaptar el sistema en zonas rurales con conectividad limitada?

### 1.6. Selección del Foco del Sprint

Se seleccionó como enfoque central el registro y transmisión segura de resultados desde la mesa electoral, eliminando el traslado físico de actas. El primer prototipo se centrará en la creación de una aplicación para jurados que registre los resultados de su mesa directamente en una base de datos Redis, con validación inmediata, generación de un log inmutable por cada registro y visualización pública en un dashboard de resultados agregados.

### 1.7. Fuentes de datos

Se consultaron los siguientes sitios web para obtener información:

https://es.wikipedia.org/wiki/Elecciones_generales_de_Bolivia_de_2020 

https://www.oep.org.bo/elecciones-generales-2020/ 

https://en.wikipedia.org/wiki/CAP_theorem 

https://www.bmc.com/blogs/cap-theorem/

https://www.scytl.com/ 

https://democracy-technologies.org/tool/scytl/ 

https://en.wikipedia.org/wiki/Scytl 

https://elreferente.es/startup/vocdoni/ 

https://ca.wikipedia.org/wiki/Vocdoni 

https://www.vocdoni.io/ 

https://github.com/vocdoni 

https://www.electionguard.vote/ 

https://news.microsoft.com/es-xl/nuevos-e-innovadores-usos-de-electionguard/ 

https://github.com/Election-Tech-Initiative/electionguard 

https://www.usenix.org/conference/usenixsecurity24/presentation/benaloh 
