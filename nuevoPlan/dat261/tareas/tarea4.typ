#set page(
  margin: (x: 2.5cm, y: 2.5cm) //Para trabajos digitales e impresos simples
  // margin: (left: 3.8cm, y: 2.5cm, right: 2.5cm) //Para trabajos impresos a doble cara
)
#set text(lang:"es")
#set text(font: "DejaVu Sans")
#show math.equation: set text(font: "DejaVu Math TeX Gyre")
#set par(justify: true)
#show raw: set text(size: 1.2em)

#let separador() = align(center)[#line(length: 100%)]

#let cajaCodigo(contenido) = {
  box(
    stroke: black,
    radius: 5pt,
    inset: 5pt,
    fill: rgb("#bdbdbd5e"),
    // Verificar si el contenido es de tipo content y un bloque raw
    if type(contenido) == content and contenido.func() == raw {
      contenido
    } else {
      raw(str(contenido))
    }
  )
}

#let cajaCodigoRompible(contenido) = {
  block(
    stroke: black,
    radius: 5pt,
    inset: 5pt,
    fill: rgb("#bdbdbd5e"),
    // Verificar si el contenido es de tipo content y un bloque raw
    if type(contenido) == content and contenido.func() == raw {
      contenido
    } else {
      raw(str(contenido))
    }
  )
}

Nombre: Gabriel Muñoz Marcelo Callisaya\
CI: 9873103\
= DAT 261 - Procesamiento del lenguaje natural
= Tarea 4.

Ver reseñas del debate vicepresidencial, clasificarlas, crear el modelo y determinar si el debate fue positivo o negativo.

*Recolección de reseñas del debate*:

Las reseñas se obtuvieron mediante búsquedas en X (Twitter) de conversaciones sobre el debate. Se realizaron búsquedas específicas con operadores avanzados para filtrar por fecha, idioma, y geolocalización centrada en Bolivia.

Se recopilaron un total de aproximadamente 66 tweets, etiquetados manualmente como positivo (1) o negativo (0). Estos resultados se almacenaron en un archivo CSV `tweets.csv` con columnas `text` (el contenido del tweet) y `label` (la clasificación dada). 

#cajaCodigo("\"debate\" since:2025-10-04_10:00:00_BOT until:2025-10-06_23:59:00_BOT lang:es geocode:-17.0,-65.0,600km")
#cajaCodigo("\"debate\" claro since:2025-10-04_10:00:00_BOT until:2025-10-06_23:59:00_BOT lang:es geocode:-17.0,-65.0,600km")
#cajaCodigo("\"debate\" bien since:2025-10-04_10:00:00_BOT until:2025-10-06_23:59:00_BOT lang:es geocode:-17.0,-65.0,600km")
#cajaCodigo("\"debate\" preparado since:2025-10-04_10:00:00_BOT until:2025-10-06_23:59:00_BOT lang:es geocode:-17.0,-65.0,600km")
#cajaCodigo("\"debate\" listo since:2025-10-04_10:00:00_BOT until:2025-10-06_23:59:00_BOT lang:es geocode:-17.0,-65.0,600km")
#cajaCodigo("\"debate\" capaz since:2025-10-04_10:00:00_BOT until:2025-10-06_23:59:00_BOT lang:es geocode:-17.0,-65.0,600km")
#cajaCodigo("\"debate\" propuesta since:2025-10-04_10:00:00_BOT until:2025-10-06_23:59:00_BOT lang:es geocode:-17.0,-65.0,600km")


*Clasificación de las reseñas y creación del modelo*:

La clasificación de las reseñas se realizó manualmente analizando el tono y contenido de cada tweet: aquellos que expresaban opiniones favorables, elogios o aspectos constructivos se etiquetaron como positivos (1), mientras que los críticos, negativos o decepcionantes se marcaron como negativos (0). 

Para el modelo de clasificación, se crearon dos programas en Python utilizando Máquinas de Soporte Vectorial SVM para clasificación binaria. 

Se emplearon librerías como `pandas` para manejar datos, `re` para expresiones regulares, `nltk` para procesamiento de lenguaje natural, `sklearn` para vectorización TF-IDF y el modelo SVM, y `numpy` para manipulaciones numéricas. 

El CSV se cargó con pd.read_csv('tweets.csv'), separando textos y etiquetas. Se introdujo una categoría "neutra" para casos ambiguos: en el primer programa, si el porcentaje de positivos está entre 45% y 55%; en el segundo, si la probabilidad positiva está entre 0.45 y 0.55.

Se realiza el preprocesamiento con:

#cajaCodigo("def limpiarTexto(texto):\n    texto = texto.lower()\n    texto = re.sub(r'[\\W_]+', ' ', texto)\n    texto = ' '.join([palabra for palabra in texto.split() if palabra not in palabrasVacias])\n    return texto")

Y lo que hace es convertir el texto a minúsculas para estandarizar, eliminar caracteres no alfanuméricos con expresiones regulares para limpiar ruido, y remover palabras vacías (stopwords) usando NLTK para enfocarse en términos relevantes y reducir dimensionalidad.

Luego, se vectoriza el texto con TF-IDF:

#cajaCodigo("vectorizador = TfidfVectorizer()\ntextosVectorizados = vectorizador.fit_transform(datos['text'])")

Esta parte transforma los textos limpios en vectores numéricos ponderados por frecuencia e importancia (TF-IDF), lo que permite al modelo SVM trabajar en un espacio vectorial.

El modelo SVM se entrena con kernel lineal:

#cajaCodigo("modelo = SVC(kernel='linear')\nmodelo.fit(textosVectorizados, datos['label'])")

SVM encuentra un hiperplano que separa clases positivas y negativas maximizando el margen, usando coeficientes para identificar palabras influyentes.

Para el primer programa, se calculan porcentajes y palabras top basadas en coeficientes:

#cajaCodigo("coeficientes = modelo.coef_.toarray()[0]\npalabrasPositivas = [nombresCaracteristicas[i] for i in np.argsort(coeficientes)[-10:][::-1]]")

Esto extrae las 10 palabras con coeficientes más altos (positivas) y bajos (negativas), indicando su contribución a cada clase.

El segundo programa usa probabilidades para clasificar inputs nuevos:

#cajaCodigo("probabilidadPositiva = modelo.predict_proba(textoNuevoVectorizado)[0][1]\nif 0.45 < probabilidadPositiva < 0.55:\n    resultado = \"neutra\"")

Esto permite clasificaciones más matizadas, incluyendo neutral.

*Ejecución de los progamas*:

Programa uno (determinar si el debate fue positivo o negativo):

#cajaCodigo("python3 svm.py
[nltk_data] Downloading package stopwords to /home/zinko/nltk_data...
[nltk_data]   Package stopwords is already up-to-date!
Porcentaje de reseñas positivas: 40.91%
Porcentaje de reseñas negativas: 59.09%
La clasificación general del debate es: negativo
Las 10 palabras más positivas: ['bolivia', 'larazondigital', 'cabo', 'presidencial', 'claro', 'velasco', 'pasado', 'vicepresidencial', 'lara', 'tse']
Las 10 palabras más negativas: ['perdió', 'ambos', 'visto', 'propuestas', 'balotaje', 'desnudos', 'terminó', 'tahuichi', 'agenda', 'mediática']")

Programa dos (clasificar nuevos inputs):

#cajaCodigo("python3 svmInput.py
[nltk_data] Downloading package stopwords to /home/zinko/nltk_data...
[nltk_data]   Package stopwords is already up-to-date!
Ingrese un texto nuevo para clasificar: el debate fue claro, velasco y lara llevaron a cabo un debate vice presidencial correcto
La clasificación del texto es: positivo")

#cajaCodigo("python3 svmInput.py
[nltk_data] Downloading package stopwords to /home/zinko/nltk_data...
[nltk_data]   Package stopwords is already up-to-date!
Ingrese un texto nuevo para clasificar: las propuestas fueron buenas
La clasificación del texto es: negativo")

#cajaCodigo("python3 svmInput.py
[nltk_data] Downloading package stopwords to /home/zinko/nltk_data...
[nltk_data]   Package stopwords is already up-to-date!
Ingrese un texto nuevo para clasificar: bolivia tuvo un horrendo debate, lo que ha pasado es terrible
La clasificación del texto es: positivo")

*Conclusion*

El trabajo demostró que el debate vicepresidencial fue percibido mayoritariamente como negativo (59.09% de reseñas negativas), con una clasificación general negativa.

Los resultados del modelo SVM fueron razonables para un conjunto de datos pequeño y equilibrado, identificando palabras clave asociadas a cada sentimiento.

Sin embargo, en pruebas con el segundo programa, una reseña claramente negativa como `"bolivia tuvo un horrendo debate, lo que ha pasado es terrible"` se clasificó como positiva debido a palabras como `"bolivia"` y `"pasado"` que el modelo asocia con positivos por su frecuencia en contextos favorables.

Esto resalta limitaciones de SVM: como modelo lineal, depende fuertemente de features TF-IDF y puede fallar en capturar contexto semántico o sarcasmo, siendo sensible a desbalances o datos ruidosos. Para mejoras, se podría usar embeddings más avanzados o modelos no lineales.

*Programas completos y CSV*:

`tweets.csv`:

#cajaCodigoRompible("text,label
\"En el congreso se debate y aprueban leyes, leyes que luego serán acatadas y puestas en práctica por el poder judicial, será por eso que primero van al congreso antes que ir al poder judicial?\",0
\"Hablan sin saber. Hace poco asesinaron a un vecino chofer a tres cuadras de mi casa por no pagar cupos. No tiene idea de lo que dice. Para muchos esto no es un debate en redes, es una cuestión de vida o muerte.\",0
\"Este impresentable detrás del bodrio que es ese debate\",0
\"Debería darte vergüenza Tahuichi. Entendimos los votantes que, el objetivo del debate no era desnudar a los candidatos, sino arroparse con propuestas de solución a la crisis.\",0
\"Cual si fuesen novatos! dejaron que Lara violara casi todas las reglas del debate, si no hay penalización este tipo de situaciones incómodas seguirán sucediendo.\",0
\"No moderaron nada, dejaron que Lara violara casi todas las reglas del debate, si no hay penalización este tipo de situaciones incómodas seguirán sucediendo.\",0
\"Que comentario parcializado, resentido y mal intencionado de su parte. Las propuestas son hablar del futuro, proposiciones, ideas, promesas en base a una realidad . Y que Lara tuvo a su favor un tema no es el espíritu de un debate… Que bien despropósito….\",0
\"VOCAL TAHUICHI EL DEBATE VICEPRESIDENCIAL: QUISIÉRAMOS TENER JUGADORES DE TALLA, PERO ES LO QUE TENEMOS\",0
\"Debate por el balotaje en Bolivia: Ganó la estrategia, perdió la agenda mediática\",0
\"DEBATE PRESIDENCIAL, LA PINTANA 2025 https://www.youtube.com/watch?si=8CMG4CTkQPLM8Sed&v=pw91RWkzvdE&feature=youtu.be a través de @YouTube\",1
\"Sala Plena del TSE definirá este martes los ejes temáticos del debate presidencial, señala vocal Ávila\",1
\"Era el disfraz, terminó el debate y prácticamente la botó… así de hipócrita es el paco\",0
\"🔴En VIVO Confirman debate vicepresidencial por RTP y Radio Deseo este miércoles desde las 20.00 #NoMentirás\",1
\"Debate por el balotaje en Bolivia: Ganó la estrategia, perdió la agenda mediática Los que esperaban el debate de los dos candidatos a vicepresidente de Bolivia para ver quién golpea, quién cae, quién sangra, como si fuera un ring de boxeo, se quedaron con los crespos hechos pero más decepcionada quedó la ciudadanía que esperaba dilucidar cuál de los dos postulantes podía perfilarse más claramente como el mejor segundo mandatario de la elección del 19 de octubre. ✅Aquí el texto completo:  📎 https://t.co/6U3LdeL3P6 Suscripción gratuita por email:\",0
\"#FuegoCruzado 🗳 La comunicadora social Verónica Rocha analiza el debate vicepresidencial llevado a cabo el pasado domingo, organizado por el TSE, entre los candidatos Juan Pablo Velasco y Edman Lara.\",1
\"#FuegoCruzado 🗳 El analista político Edgar Sánchez se refiere al debate vicepresidencial llevado a cabo el pasado domingo, organizado por el TSE, entre los candidatos Juan Pablo Velasco y Edman Lara.\",1
\"#FuegoCruzado 🗳 La historiadora y comunicadora Sayuri Loza analiza el debate vicepresidencial llevado a cabo el pasado domingo, organizado por el TSE, entre los candidatos Juan Pablo Velasco y Edman Lara.\",1
\"#FuegoCruzado 🗳 La historiadora y comunicadora Sayuri Loza analiza el debate vicepresidencial llevado a cabo el pasado domingo, organizado por el TSE, entre los candidatos Juan Pablo Velasco y Edman Lara.\",1
\"#ElXQDeLasNoticias ▶ El debate vicepresidencial organizado por el TSE terminó más marcado por las injurias que por las propuestas. RTP y Radio Deseo organizan un debate alternativo para este miércoles, que contará con una metolodogía diferente.\",0
\"APLP califica de fracaso debate vicepresidencial y pide que periodistas conduzcan el encuentro presidencial del domingo 12 https://estudio99.com.bo/aplp-califica-de-fracaso-debate-vicepresidencial-y-pide-que-periodistas-conduzcan-el-encuentro-presidencial-del-domingo-12/\",0
\"Tahuichi sobre el debate: “Hemos visto desnudos a los candidatos a vice, es lo que tenemos” https://correodelsur.com/politica/20251006/tahuichi-sobre-el-debate-hemos-visto-desnudos-a-los-candidatos-a-vice-es-lo-que-tenemos.html\",0
\"Ni en un debate político lo que menos se espera es cordialidad, es un espacio de enfrentamiento  planificado con anticipación, la debilidad  del oponente y la capacidad de sacar ventaja de ello, determinan al vencedor...bueno lo vieron...ya saben quién ganó.\",1
\"#AMUN | Arias sobre el debate vicepresidencial: “Ambos perdieron, perdió el país”. Lee la nota completa aquí 📎 https://amun.lapaz.bo/arias-sobre-el-debate-vicepresidencial-ambos-perdieron-perdio-el-pais/ . #LaPaz #GAMLP\",0
\"Francamente, más que lo que se ha dicho en ese debate, me preocupa la falta de consistencia del programa de gobierno de @tutoquiroga Si llega a ser gobierno y aplica ese programa, nos terminamos de ir al diablo. Te recomiendo que lo revises en detalle\",0
\"Este corrupto quiere ascender gente que no le corresponde para asi tambien tener a la pnp bajo control. Al caballazo sin debate, sin opinion de expertos. Menos mal que lo han parado.\",0
\"#BOLIVIA La Asociación Nacional de Periodistas de Bolivia acepta la invitación de RTP y Radio Deseo para ser parte del debate vicepresidencial alternativo que se llevará a cabo este miércoles por la noche.\",1
\"Dicen que el miercoles habra debate de los mismos en LPZ . Estaran frente a la machorra ,circo seguro. Por higiene mental JP no debe asistir grite quien grite. Se imaginan al OPA y la Machorra juntos contra JP?  Tomen previsiones y manden a rodar a esos indecentes.\",0
\"Deberían para el debate de los presidenciables modificar las reglas de juego. Los panelistas tienen que tener libertad de hacer preguntas  claras a los candidatos. El tiempo de respuesta 2 \ , una vez respondidas ,se dá 1 minuto a cada candidato para hacer ? Al otro. Así avanzamos\",1
\"- @Rodrigo_PazP luego del debate de Lara: Ahora que historia me invento con semejan te 💩💩💩 Y zas cholita, sale la historia de los botínes que tiene por más de una década y que están echas mier..😂🤣\",0
\"‘Pensé que iba a ser difícil encontrar un peor vicepresidente de Choquehuanca’, Carlos Saavedra sobre el debate vicepresidencial entre JP y Lara #LaRazonPlus #LaRazonDigital #LaRazonDigital #Bolivia #Elecciones2025 #Debate #Lara #Velasco\",0
\"@ANBOLIVIA: TAHUICHI SOBRE EL DEBATE: ‘HEMOS VISTO DESNUDOS A ... https://anbolivia.blogspot.com/2025/10/tahuichi-sobre-el-debate-hemos-visto.html?spref=tw\",0
\"#LaPaz El senador Flores advirtió que si la Comisión de Constitución no debate esta semana la suspensión de vocales del TSE, el proyectista Vargas podrá pedir su tratamiento directo en el Pleno. #abyayalatv #prorroga #tsebolivia\",0
\"¿Qué estrategia desplegaron Lara y JP Velasco en el debate vicepresidencial? https://eju.tv/2025/10/que-estrategia-desplegaron-lara-y-jp-velasco-en-el-debate-vicepresidencial/ a través de @ejutv\",1
\"Se vio un Juan Pablo Velasco ‘acartonado’: ‘Perdió la oportunidad de clausurar el tema de los tuits’, señala analista. #LaRazonPlus #LaRazonDigital #LaRazonDigital #Bolivia #Elecciones2025 #Debate #Lara #Velasco\",0
\"Tahuichi sobre el debate: ‘hemos visto desnudos a los candidatos a vice, es lo que tenemos’ https://eju.tv/2025/10/tahuichi-sobre-el-debate-hemos-visto-desnudos-a-los-candidatos-a-vice-es-lo-que-tenemos/ a través de @ejutv\",0
\"Expertos analizan el desempeño de Lara: ‘Ayer la música la puso él’ #LaRazonPlus #LaRazonDigital #LaRazonDigital #Bolivia #Elecciones2025 #Debate #Lara #Velasco\",1
\"Para el proximo debate me gustaría sugerir al @TSEBolivia que seleccione temas útiles que sirvan para que la población efectivamente se entere qué proponen los candidatos y de qué modo van a cumplirlo. Los temas de ayer no tenían norte.\",0
\"El debate vicepresidencial se hizo al margen de la ‘espectacularización’ de la política #LaRazonPlus #LaRazonDigital #LaRazonDigital #Bolivia #Elecciones2025 #Debate #Lara #Velasco\",1
\"Que el cabeza de poto de  Cuéllar diga que Lara “dio cátedra” solo confirma que ambos desconocen lo que es un verdadero debate. Entre improvisados se entienden y bueno un masista defendiendo a Lara, ya sabemos por dónde va la cosa.\",0
\"Uno hablo sin sentido y atracando y el otro habló correcto pero no quedó una idea clara sobre su discurso. Creo, por lo que leo, que Lara salió mejor parado del debate. Pfffff\",1
\"Terminando el debate se la quitó, éso es lo peor.\",0
\"#NoticieroPopular 🗳Analista lamenta que en el debate vicepresidencial llevado a cabo este pasado domingo entre los candidatos Juan Pablo Velasco y Edman Lara hayan primado los ataques entre ambos en lugar de la presentación de propuestas para el país.\",0
\"#NoticieroPopular 🗳El vocal del TSE, Tahuichi Tahuichi, destaca el debate vicepresidencial llevado a cabo este pasado domingo, aunque admite algunas falencias que promete mejorar para el debate presidencial.\",1
\"#NoticieroPopular 🗳 Parlamentarios destacan la importancia del debate vicepresidencial alternativo que organiza RTP y Radio Deseo, que se llevará a cabo este miércoles en la noche. Los candidatos deberían asistir por el bien de la democracia, afirman.\",1
\"Ganó alguien el debate? https://twitter.com/i/broadcasts/1ypJdqMWMmQxW\",1
\"#ANBNEws|#BreakingNews ESTOS SON LOS DOS CAMBIOS URGENTES QUE SUGIEREN PARA EL DEBATE PRESIDENCIAL #Bolivia|#ElAlto|#LaPaz\",1
\"donde el pensamiento crítico se diluye entre consignas vacías y actas prefabricadas. No hay debate, no hay reclamo, no hay escucha; solo hay sumisión. Recuerdo que durante las protestas del 11 de julio de 2021, el presidente del Tribunal Supremo declaró declaró ante la televisión\",0
\"Pienso igual,  JP pierde más yendo al debate/barricada con Galindo/Lara que faltando.\",0
\"#LaRazonPlus #LaRazonDigital #LaRazonDigital #Bolivia #noticias #Elecciones2025 #TribunalSupremoElectoral #SegundaVuelta2025\",1
\"FALTAN 14 DÍAS PARA EL BALOTAJE EN BOLIVIA Pasó el debate de Vicepresidenciables, demostraron que no estan preparado para ser Vicepresidente. Pocas propuesta por parte de #JPVelasco, y el otro se dedicó a insultar, acusar, no respetar las reglas. Muy bajo el nivel del debate\",0
\"Es bien curioso como cuando entro a los Spaces q hacen Edu o Ruben nos agarramos a debate, hay mucha discrepancia, no estamos d acuerdo casi en nada y aún así, dicen q estamos organizados, coordinados e incluso financiados Casualmente, los q nos acusan cuando hacen sus espacios para 50 personas siempre están coordinados, organizados y tienen un líder al q le copian los argumentos e incluso el vocabulario y se la chupan públicamente La gente no es tonta muchachos\",0
\"No sé qué debate vio el gordito, no sabe cómo quedar bien con ambos bandos.\",0
\"No se muy bien como explicarlo pero JP ayer estuvo todo el debate haciendo esta mirada\",0
\"El que la pasó bien en el debate fue @esgravesiempre hicieron muchos edits de su live en Tik Tok.\",1
\"Cómo es posible que éste cholo ignorante esté aspirando al segundo cargo más importante en el país? Qué hicimos mal como país, como sociedad? Tengo la esperanza que luego del debate haya quedado claro para todos los que desean el bien para Bolivia, por quién votar el domingo 19!\",1
\"Se viene el gran debate TUTO - PAZ ,ahi veremos cual es realmente capaz de tomar el control del pais.\",1
\"Que debate viste? Agarrarse del racismo como ventaja es patear al aire, que bien que no consideré votar por vos con esa perspectiva que tenés, te sigue doliendo las derrotas pero de verdad no estas a la altura de ser presi, no ni en su campaña pudo decir algo creíble\",0
\"Bolivision traro de darle al debate seriedad con sus panelistas. Bien x Coca,Zambrana. No puedo opinar lo mismo de GALINDE. Machorra con cara de ódio,desprecio,y analisis destilando mierda ,aparte de payasa en sus presentaciones. Por favor hnos paceños hagan algo esa y el opa 😡\",0
\"Que debate viste? Agarrarse del racismo como ventaja es patear al aire, que bien que no consideré votar por vos con esa perspectiva que tenés, te sigue doliendo las derrotas pero de verdad no estas a la altura de ser presi, no ni en su campaña pudo decir algo creíble\",0
\"Según el senador,  con el debate vicepresidencial quedó claro que el PDC representa a  grandes mayorías y “no a unas minorías que desprecian hasta el vendedor  ambulante”. https://correodelsur.com/politica/20251006/paz-destaca-la-cordura-de-lara-y-afirma-que-velasco-lo-discrimino-al-decirle-pajpaku.html a través de @correodelsurcom\",1
\"Lara fue a un careo y JP a un debate así no se puede pero quedó claro que Binomio tiene planes, para Bolivia 🇧🇴 el otro solo dice que en Bolivia sobra dinero 💰 siguen prometiendo cielo y tierra y no saben de donde saldrán los recursos\",1
\"Ahora ya sabemos tu postura política, te tenía en lo alto como analista político, al decir que ese opa doble gano el debate ,dejas claro que la patria es lo menos que te intereza\",0
\"🇧🇴 Bolivia merece un cambio radical. Después de ver el debate de candidatos a vicepresidente, me queda más claro que nunca: no podemos seguir atrapados en el pasado. #EsConTutoyJP\",1
\"Anoche quedó claro quién está preparado… y quién da vergüenza. Juan Pablo Velasco subió al debate con ideas, propuestas y liderazgo. Edman Lara llegó con gritos, insultos y contradicciones. Mientras uno hablaba del futuro, el otro convirtió el escenario en un basurero verbal. Porque cuando no hay ideas, aparece el odio. Y cuando el que practica la guerra sucia se victimiza… es porque ya no tiene argumentos. Bolivia no necesita agitadores con micrófono. Necesita líderes con respuestas. Y anoche, nos sentimos profundamente orgullosos de Juan Pablo Velasco: firme, claro, respetuoso, preparado. Como debe ser. Lara no debatió. Atacó. No respondió. Agredió. No propuso. Se desbordó. Como siempre. Lo vimos todos: Un joven líder al que da gusto escuchar… Y un candidato al que da vergüenza ver.\",1
\"Chicanero sin gracia ni respeto por los moderadores, sin la mínima de educación lo de Lara así todo el debate tirando mierda cuando había que proponer soluciones, esta claro que futuro esperanzador solo podemos encontrarlo con uno\",1
\"Del “debate” entre tonto, retonto y malos presentadores, sólo queda claro que hay que seguir investigando la estafa del banco Fassil y las expresiones racistas\",0")

#separador()

Programa uno (determinar si el debate fue positivo o negativo) `svm.py`:

#cajaCodigoRompible("import pandas as pd
import re
import nltk
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.svm import SVC
from nltk.corpus import stopwords
import numpy as np

nltk.download('stopwords')
palabrasVacias = stopwords.words('spanish')

def limpiarTexto(texto):
    texto = texto.lower()
    texto = re.sub(r'[\W_]+', ' ', texto)
    texto = ' '.join([palabra for palabra in texto.split() if palabra not in palabrasVacias])
    return texto

datos = pd.read_csv('tweets.csv')
datos['text'] = datos['text'].apply(limpiarTexto)

porcentajePositivos = (datos['label'].sum() / len(datos)) * 100
porcentajeNegativos = 100 - porcentajePositivos

print(f\"Porcentaje de reseñas positivas: {porcentajePositivos:.2f}%\")
print(f\"Porcentaje de reseñas negativas: {porcentajeNegativos:.2f}%\")

if 45 <= porcentajePositivos <= 55:
    clasificacionGeneral = \"neutra\"
elif porcentajePositivos > 55:
    clasificacionGeneral = \"positivo\"
else:
    clasificacionGeneral = \"negativo\"

print(f\"La clasificación general del debate es: {clasificacionGeneral}\")

vectorizador = TfidfVectorizer()
textosVectorizados = vectorizador.fit_transform(datos['text'])

modelo = SVC(kernel='linear')
modelo.fit(textosVectorizados, datos['label'])

# Convertir coeficientes a array de NumPy
coeficientes = modelo.coef_.toarray()[0]
nombresCaracteristicas = vectorizador.get_feature_names_out()

palabrasPositivas = [nombresCaracteristicas[i] for i in np.argsort(coeficientes)[-10:][::-1]]
palabrasNegativas = [nombresCaracteristicas[i] for i in np.argsort(coeficientes)[:10]]

print(\"Las 10 palabras más positivas:\", palabrasPositivas)
print(\"Las 10 palabras más negativas:\", palabrasNegativas)")

#separador()

Programa dos (clasificar nuevos inputs) `svmInput.py`:

#cajaCodigoRompible("import pandas as pd
import re
import nltk
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.svm import SVC
from nltk.corpus import stopwords

nltk.download('stopwords')
palabrasVacias = stopwords.words('spanish')

def limpiarTexto(texto):
    texto = texto.lower()
    texto = re.sub(r'[\W_]+', ' ', texto)
    texto = ' '.join([palabra for palabra in texto.split() if palabra not in palabrasVacias])
    return texto

datos = pd.read_csv('tweets.csv')
datos['text'] = datos['text'].apply(limpiarTexto)
textos = datos['text']
etiquetas = datos['label']

vectorizador = TfidfVectorizer()
textosVectorizados = vectorizador.fit_transform(textos)

modelo = SVC(kernel='linear', probability=True)
modelo.fit(textosVectorizados, etiquetas)

textoNuevo = input(\"Ingrese un texto nuevo para clasificar: \")
textoNuevoLimpio = limpiarTexto(textoNuevo)
textoNuevoVectorizado = vectorizador.transform([textoNuevoLimpio])
probabilidadPositiva = modelo.predict_proba(textoNuevoVectorizado)[0][1]

if 0.45 < probabilidadPositiva < 0.55:
    resultado = \"neutra\"
elif probabilidadPositiva >= 0.55:
    resultado = \"positivo\"
else:
    resultado = \"negativo\"

print(f\"La clasificación del texto es: {resultado}\")")

