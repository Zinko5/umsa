Quiero hacer un trabajo/proyecto de:   Análisis de generación de cuentos cortos generados con LSTM según la variación de parámetros.

Consiste en que yo hice un programa que entrena un modelo LSTM que pide al usuario parámetros de dropout, temperatura, longitud de secuencia y épocas, con esos parámetros entrena al modelo, una vez entrenado, el programa pide al usuario ingresar las primeras palabras del cuento (la semilla) y completa el cuento.

Además de esos 4 parámetros, también hice variaciones en el tamaño del corpus, con un corpus corto, uno mediano, uno largo y uno muy largo.

El objetivo del proyecto es analizar cómo varía la calidad del cuento generado según la variación de cada parámetro.

El documento, informe, presentación o documentación del trabajo debe estar escrito en un documento doc.typ de Typst. Necesito que generes el código de Typst que tendrá el documento. Te pediré que generes fragmentos de código de Typst que yo colocaré en el archivo.typ así que deben tener continuidad. En cada nuevo mensaje, te indicaré qué contenido debe tener el fragmento de código Typst que generarás y me pasarás. En el documento, se es posible que se deban realizar algunos cálculos numéricos u otros procedimientos científicos, si ese es el caso, te pasaré algunos apuntes teóricos, ejemplos, guías, pautas y/o instrucciones de lo que quiero que hagas y debes responder con el fragmento de código de Typst aplicando las fuentes a mi trabajo, cumpliendo sus requerimientos. No hagas justificaciones matemáticas ni demostraciones de las fórmulas. Solo realiza el procedimiento paso por paso aplicando lo que digan las fuentes. Al momento de anotar ecuaciones, no expliques cosas básicas, es un trabajo universitario, no una clase de guía o texto educativo básico, igue las reglas que aplicarías a un paper matemático científico: La resolución de ejercicios debe ser comprensible para el lector (que se asume tiene conocimientos del tema, pero no necesariamente conoce todos los detalles de tu enfoque). Por lo tanto, no siempre es necesario desglosar cada paso de forma exhaustiva, pero sí debes proporcionar suficiente detalle para que el razonamiento sea reproducible. Aquí algunos principios clave:

Explicar el contexto: Antes de resolver un ejercicio, introduce brevemente el problema, la fórmula o el método que usarás. Por ejemplo: "Para resolver la ecuación diferencial, aplicaremos el método de separación de variables."
Mostrar pasos clave: No es necesario detallar cada operación aritmética, pero sí los pasos lógicos importantes (por ejemplo, cómo llegas de una ecuación a otra, o por qué aplicas una fórmula específica).
Justificar decisiones: Si aplicas una fórmula o teorema, menciona por qué es válido en el contexto (p.ej., "Por el teorema de Pitágoras, dado que el triángulo es rectángulo...").
Evitar redundancia: En papers profesionales, se omite el detalle excesivo de cálculos triviales para mantener la concisión, pero sin sacrificar claridad.

Las ecuaciones mostrando los cálculos no deben saltar directamente al resultado, sino mostrar el desgloce paso por paso, de manera formal y vigorosa matemática y científicamente. Lo mínimo es que cuando apliques una fórmula, primero escribas la fórmula y después reemplaces las variables por sus valores reales (las variables en Typst) antes de mostrar el resultado, esto no aplica para sumatorias ni productorias, pero sí para cualquier función o fórmula definida en las fuentes.




Los fragmentos de codigo que me pasaras solo deben ser eso, fragmentos, yo lo uniré todo después, así que que sepas que los fragmentos que envíes tendrán continuidad. Debes pasármelos en un bloque de código de Typst.




Debes usar correctamente la sintaxis de Typst para escribir las fórmulas, no intentes hacerlo como si fuera en LaTeX, la sintaxis es muy distinta.




Revisa la documentacion en internet para no equivocarte en la sintaxis y no uses recursos como por ejemplo `bold()` o `mat()` que no aparezcan en las fuentes.




Tampoco introduzcas nuevos índices ni títulos con `=` a no ser que yo te lo indique directamente.




Para realizar los cálculos numéricos, hazlos usando la función de typst `#calc`, esta es su documentación:




https://typst.app/docs/reference/foundations/calc/




No uses cosas que no están dentro de `calc`, por ejemplo, no existe `calc.sum` ni `calc.add`. Para operaciones básicas como suma, resta, multiplicación y división, se hacen simplemente con `#calc.round(x + y, digits: 4)`, `#calc.round(x - y, digits: 4)`, `#calc.round(x * y, digits: 4)`, `#calc.round(x / y, digits: 4)`.




Otras consideraciones útiles en las ecuaciones de Typst son:

- escribir letras seguidas de otras letras o números, puesto que solo van juntas si forman un símbolo o una variable definida con `#let`, por ejemplo, $xa$ resulta en un error, ya que no existe un símbolo matemático 'xa', sino que para anotar solo las letras, lo correcto sería escribir `$x a$` separadas por un espacio.

- Al momento de escribir texto dentro de un bloque de ecuación, se hace simplemente escribiendo el texto entre comillas. Ejemplo: `$a = c + b "es la ecuación."$` es un uso correcto del texto dentro de una ecuación.

- A diferencia de LaTeX, en Typst se usan los paréntesis simples `()` en lugar de los corchetes para agrupar cosas, por ejemplo: `$sum_(i = 1)^n x_(i 1) x_(i 2)$` es un uso correcto de los paréntesis para agrupar.

- A diferencia de LaTeX, en Typst las fracciones se anotan con el símbolo `/`, aprovechando las agrupaciones con paréntesis. Por ejemplo: `x = (2x^(n - 1))/(a + b - c) + 1/(n - 1)` es un uso correcto de las fracciones en Typst.

- Al momento de aplicar un símbolo de tipo acento en Typst como `$overline()$`, `$hat()$` o  `$sqrt()$`, no se le puede pasar unicamente una variable, sino que debe ser al menos una cosa que no sea una variable, aunque sea un texto vacío `""`. Por ejemplo, si se define la variable `$#let a = 2$`, el resultado de `$sqrt(#a)$` es erróneo, en cambio, se puede arreglar pasando `$sqrt(#a"")$`, cuyo resultado es correcto y no afecta en nada a la ecuación. Siguiendo el mismo ejemplo, colocar: `$sqrt(#a prop #a)$` también sería correcto, ya que además de la variable `#a`, se está pasando otra cosa (un símbolo `prop`).




No hagas calculos internos con python para comprobar los números, solo se mostrarán los resultados obtenidos con la función `#calc` de Typst.




Repito, tu no hagas calculos de ningun tipo, todos los calculos se haran con `#calc`, así que sólo maneja bien las variables.




Usa variables de Typst aplicando la función `#let` (recuerda que tendrán continuidad con tus siguientes fragmentos de código) para los cálculos, que tendrás que mostrar en ecuaciones de Typst paso a paso.




Cuando muestres resultados numéricos, que tengan solo cuatro decimales.




Al momento de nombrar a las variables que crees con `#let`, nómbralas usando camelCase.




Evita escribir los valores numéricos manualmente, siempre que se pueda usa la función `#calc` para tener presición perfecta, o usa una variable `#let` si el valor numérico se repite varias veces a lo largo del documento.




---




En el documento, es posible que se deban justificar cosas teóricas de programación, si ese es el caso, debes investigar en internet y usar tu conocimiento para explicar qué es cada cosa de programación que sea avanzada también es posible que te pase consideraciones del código. Por ejemplo, no debes explicar qué es un lenguaje popular como Python o Java, pero sí deberías explicar un lenguaje menos conocido como R. No debes explicar conceptos básicos del código, como estructuras de bucle o declaraciones de variables, pero sí deberías explicar aplicaciones de funciones de librerías complejas




Cuando expliques una parte del código, menciónala explícitamente a través del modo raw que ofrece Typst, que pueden ser tanto en línea con \` \`, o en un bloque separado:

\`\`\`[lenguaje]

[código]

\`\`\`




Cuando menciones nombres de archivos, variables o funciones, házlo en notación de raw text \`\`, por ejemplo: "en el archivo `corpus.txt` se almacena el corpus".




--- 




Te pasaré la primera instrucción y la primera tanda de fuentes que quiero que uses para aplicarlas al trabajo.




Instrucción:



En un subindice `== Metodología` : Indica los datos utilizados: fuente, tamaño del corpus, características, preprocesamiento (tokenización, limpieza, stopwords, lematización, etc.). Indica también las herramientas utilizadas: librerías y software empleados



---



Fuentes o consideraciones:




el código es:

import tensorflow as tf
import numpy as np
from tensorflow.keras.preprocessing.text import Tokenizer
from tensorflow.keras.preprocessing.sequence import pad_sequences
from tensorflow.keras.layers import Embedding, LSTM, Dense, Dropout
import os
def cargarCorpus(ubicacionArchivo):
    with open(ubicacionArchivo, 'r', encoding='utf-8') as archivo:
        cuentos = archivo.read().lower().split('\n')
    return [cuento.strip() for cuento in cuentos if cuento.strip()]
def preprocesarTexto(cuentos, longitudSecuencia):
    tokenizador = Tokenizer()
    tokenizador.fit_on_texts(cuentos)
    palabrasTotales = len(tokenizador.word_index) + 1
    secuenciasEntrada = []
    for cuento in cuentos:
        palabras = cuento.split()
        for i in range(1, len(palabras)):
            secuencia = palabras[:i+1]
            secuenciasEntrada.append(' '.join(secuencia))
    secuenciasTokenizadas = tokenizador.texts_to_sequences(secuenciasEntrada)
    secuenciasRellenas = pad_sequences(secuenciasTokenizadas, maxlen=longitudSecuencia, padding='pre')
    datosEntrada = secuenciasRellenas[:, :-1]
    datosSalida = secuenciasRellenas[:, -1]
    return tokenizador, palabrasTotales, datosEntrada, datosSalida
def construirModelo(palabrasTotales, longitudSecuencia, dropout):
    modelo = tf.keras.Sequential([
        Embedding(palabrasTotales, 100, input_length=longitudSecuencia-1),
        LSTM(150, return_sequences=False),
        Dropout(dropout),
        Dense(palabrasTotales, activation='softmax')
    ])
    modelo.compile(loss='sparse_categorical_crossentropy', optimizer='adam')
    return modelo
def entrenarModelo(modelo, datosEntrada, datosSalida, epocas):
    modelo.fit(datosEntrada, datosSalida, epochs=epocas, verbose=1)
def generarCuento(modelo, tokenizador, textoSemilla, longitudSecuencia, temperatura):
    textoGenerado = textoSemilla.lower()
    palabrasCierre = {'escondido', 'poblado', 'mágica', 'encantada', 'dragones', 'anochecer', 'deseo', 'luces', 'encantados', 'protegió', 'monstruo', 'curaban', 'cantaban', 'destino', 'niño', 'épicas', 'marineros', 'altas', 'maravillas', 'mágicas', 'reino', 'bosque', 'bondadoso', 'puros', 'sanador', 'entero', 'escondido', 'tímido', 'estrellado', 'tormentas', 'aire', 'reyes', 'paz', 'niño'}
    while True:
        listaTokens = tokenizador.texts_to_sequences([textoGenerado])
        if not listaTokens or not listaTokens[0]:
            listaTokens = [[]]
        listaTokens = pad_sequences([listaTokens[0]], maxlen=longitudSecuencia-1, padding='pre')
        prediccion = modelo.predict(listaTokens, verbose=0)
        prediccion = np.log(prediccion + 1e-10) / temperatura
        prediccion = np.exp(prediccion) / np.sum(np.exp(prediccion))
        indicePredicho = np.random.choice(len(prediccion[0]), p=prediccion[0])
        palabraPredicha = tokenizador.index_word.get(indicePredicho, '')
        if palabraPredicha:
            textoGenerado += " " + palabraPredicha
            if palabraPredicha in palabrasCierre and len(textoGenerado.split()) >= 5:
                break
    return textoGenerado
def main():
    ubicacionCorpus = 'cuentos.txt'
    longitudSecuencia = None
    epocas = None
    temperatura = None
    dropout = None
    while longitudSecuencia is None:
        try:
            entrada = input("Ingresa la longitud de secuencia (e.g., 30): ")
            longitudSecuencia = int(entrada)
        except ValueError:
            print("Error: Ingresa un número entero válido.")
    while epocas is None:
        try:
            entrada = input("Ingresa el número de épocas (e.g., 30): ")
            epocas = int(entrada)
        except ValueError:
            print("Error: Ingresa un número entero válido.")
    while temperatura is None:
        try:
            entrada = input("Ingresa la temperatura (e.g., 0.4): ")
            temperatura = float(entrada)
        except ValueError:
            print("Error: Ingresa un número válido.")
    while dropout is None:
        try:
            entrada = input("Ingresa el valor de dropout (e.g., 0.2): ")
            dropout = float(entrada)
        except ValueError:
            print("Error: Ingresa un número válido.")
    cuentos = cargarCorpus(ubicacionCorpus)
    tokenizador, palabrasTotales, datosEntrada, datosSalida = preprocesarTexto(cuentos, longitudSecuencia)
    modelo = construirModelo(palabrasTotales, longitudSecuencia, dropout)
    entrenarModelo(modelo, datosEntrada, datosSalida, epocas)
    while True:
        textoSemilla = input("Ingresa las primeras palabras del cuento (o 'salir' para terminar): ")
        if textoSemilla.lower() == 'salir':
            break
        cuentoGenerado = generarCuento(modelo, tokenizador, textoSemilla, longitudSecuencia, temperatura)
        print("Cuento generado:", cuentoGenerado)
if __name__ == "__main__":
    main()

pero se adaptó en 4 programas distintos `cuentosCorto.py`, `cuentosMediano.py`, `cuentosLargo.py` y `cuentosMuyLargo.py`. Cada uno es igual al original, lo que cambia es que cada uno toma el corpus que le corresponde, y cada uno tiene las palabrasCierre que son las últimas palabras de cada cuento que compone su corpus correspondiente.

El corpus consiste en una colección de cuentos cortos, de 10-15 palabras cada uno, los cuentos fueron generados con Grok y Gemini, que sirvieron para generar los cuentos que cumplieran las condiciones que necesitaba el corpus para que el modelo sea preciso.

Los corpus son: 

`cuentosCorto.txt`: 144 cuentos. `cuentosMediano.txt`:  288 cuentos. `cuentosLargo.txt`:  432 cuentos. `cuentosMuyLargo.txt`:  578 cuentos.

un ejemplo de los cuentos que hay en los corpus es:

Un músico tocó un violín que hacía levitar los objetos más pesados.

En una herrería antigua, una fragua cantó historias de héroes olvidados.

Un niño solitario adoptó un perro que ladraba y protegía su aldea del peligro.

Una sirena varada dio una perla que brilló y salvó a la tripulación.



Para hacer la comparativa de cómo afecta la variabilidad de los parámetros, usé un resultado base para cada corpus con los parámetros de longitud de secuencia = 30, épocas = 30, temperatura = 0.4, dropout = 0.2; luego hice comparaciones en cada resultado base variando un parámetro cada vez, de manera que correría el programa solo 36 veces, estos son todos los modelos entrenados con variaciones:



Base corto
Base mediano
Base largo
Base muy largo

Base corto, dropout +
Base corto, temperatura +
Base corto, epocas +
Base corto, longitud +
Base corto, dropout-
Base corto, temperatura-
Base corto, epocas-
Base corto, longitud-
 
Base mediano, dropout +
Base mediano, temperatura +
Base mediano, epocas +
Base mediano, longitud +
Base mediano, dropout -
Base mediano, temperatura -
Base mediano, epocas -
Base mediano, longitud -
 
Base largo, dropout + 
Base largo, temperatura + 
Base largo, epocas + 
Base largo, longitud + 
Base largo, dropout -
Base largo, temperatura -
Base largo, epocas -
Base largo, longitud -
 
Base muy largo, dropout + 
Base muy largo, temperatura + 
Base muy largo, epocas + 
Base muy largo, longitud + 
Base muy largo, dropout - 
Base muy largo, temperatura - 
Base muy largo, epocas - 
Base muy largo, longitud - 

Donde el + indica que se ha de aumentar el número, y el menos, reducirlo.



Para crear estos 36 modelos, se hizo con un script automático `scriptAutomatización.py`, que tardó unos 20 minutos en ejecutarse la primera vez que tuvo que entrenar cada modelo:

# automatizacion_completa.py
# Ejecutable en entorno limpio: entrena si no existe modelo, carga si ya existe

import os
import json
import numpy as np
import tensorflow as tf
from tensorflow.keras.preprocessing.text import Tokenizer
from tensorflow.keras.preprocessing.sequence import pad_sequences
from tensorflow.keras.models import Sequential, load_model
from tensorflow.keras.layers import Embedding, LSTM, Dense, Dropout
from sklearn.model_selection import train_test_split

# --- CONFIGURACIÓN ---
np.random.seed(42)
tf.random.set_seed(42)

rutasCorpus = {
    'corto': 'cuentosCorto.txt',
    'mediano': 'cuentosMediano.txt',
    'largo': 'cuentosLargo.txt',
    'muy_largo': 'cuentosMuyLargo.txt'
}

parametrosBase = {
    'longitudSecuencia': 30,
    'epocas': 30,
    'temperatura': 0.4,
    'dropout': 0.2
}

variaciones = {
    'base': {},
    'dropoutMas': {'dropout': 0.5},
    'dropoutMenos': {'dropout': 0.0},
    'temperaturaMas': {'temperatura': 0.8},
    'temperaturaMenos': {'temperatura': 0.2},
    'epocasMas': {'epocas': 60},
    'epocasMenos': {'epocas': 15},
    'longitudMas': {'longitudSecuencia': 50},
    'longitudMenos': {'longitudSecuencia': 15}
}

semillas = [
    "un lobo",
    "un gato",
    "un niño",
    "una anciana",
    "en un pueblo",
    "en un bosque",
    "había una vez"
]

palabrasCierre = {'escondido', 'poblado', 'mágica', 'encantada', 'dragones', 'pastor', 'anochecer', 'deseo', 'luces', 'encantados', 'protegió', 'monstruo', 'curaban', 'cantaban', 'destino', 'niño', 'épicas', 'marineros', 'altas', 'maravillas', 'flores', 'mágicas', 'reino', 'bosque', 'bondadoso', 'puros', 'sanador', 'entero', 'escondido', 'tímido', 'estrellado', 'tormentas', 'dragón', 'aire', 'reyes', 'paz', 'niño', 'casa', 'volaban', 'pastor', 'amanecer', 'mágico', 'fértil', 'perdido', 'héroe', 'parlante', 'brillante', 'poblado', 'débil', 'pájaros', 'aldea', 'enfermó', 'barcos', 'paz', 'arco', 'día', 'mágicas', 'frío', 'propia', 'reino', 'secretos', 'poblado', 'viento', 'olvidadas', 'poblado', 'niño', 'volaron', 'tímido', 'heroicos', 'brillantes', 'encantados', 'verde', 'tesoro', 'suave', 'puros', 'estrellas', 'poblado', 'mágicos', 'montañas', 'barcos', 'paz', 'niño', 'mágico', 'reino', 'poblado', 'bondadoso', 'sano', 'poblado', 'mágico', 'protegió', 'reino', 'casa', 'poblado', 'oro', 'mágicas', 'día', 'épicas', 'encantadas', 'amanecer', 'nubes', 'magia', 'niño', 'hablaron', 'poblado', 'suave', 'mágicas', 'puros', 'niño', 'voladores', 'niño', 'encantado', 'paz', 'roto', 'noche', 'enfermo', 'risas', 'agua', 'secreto', 'dormía', 'verdad', 'eterna', 'dulce', 'perdidos', 'pesadillas', 'antiguas', 'alegría', 'multitud', 'hogar', 'felices', 'oculta', 'plata', 'seca', 'luz', 'verano', 'mar', 'seguro', 'espíritus', 'proféticos', 'estrella', 'invisibilidad', 'pesados', 'olvidados', 'peligro', 'tripulación', 'tierra', 'momento', 'mundo', 'plaga', 'puro', 'reciente', 'guerra', 'noble', 'suerte', 'volar', 'vino', 'paz', 'feliz', 'sombras', 'anciano', 'habitantes', 'invulnerable', 'felicidad', 'brindis', 'prosperidad', 'mañana', 'curativa', 'miedos', 'envejecer', 'audiencia', 'segura', 'pensamientos', 'recuerdo', 'verdad', 'fortuna', 'heridas', 'financiero', 'prisioneros', 'estrellas', 'animales', 'joyas', 'clima', 'justicia', 'mágica', 'invierno', 'paralelas', 'verdadero', 'valor', 'eternas', 'deseos', 'mapa', 'olas', 'fénix', 'durmientes', 'cosecha', 'oro', 'barco', 'seco', 'subterráneo', 'banquete', 'fortuna', 'tristeza', 'mundo', 'futuro', 'verdad', 'noche', 'sabiduría', 'dolor', 'sequía', 'peligro', 'constructor', 'mar', 'necesario', 'aire', 'camino', 'oscuridad', 'muro', 'noche', 'invierno', 'amado', 'gigante', 'fortuna', 'gemelas', 'pájaros', 'ladrones', 'pensamientos', 'lluvia', 'secreta', 'cosas', 'gastaba', 'oro', 'personas', 'estrellas', 'tesoro', 'pasadas', 'elocuencia', 'suerte', 'desearlo', 'perdidos', 'infinito', 'imaginado', 'orilla', 'almohada', 'marea', 'habitación', 'enfermos', 'milagrosa', 'curaba', 'felicidad', 'mágico', 'importante', 'deseos', 'preocupaciones', 'lejos', 'inmensa', 'futuro', 'peligro', 'lugar', 'volara', 'protección', 'multiplicaba', 'objetos', 'verdad', 'cercano', 'justicia', 'ángel', 'suerte', 'sabiduría', 'planetas', 'suave', 'poblado', 'animales', 'naturaleza', 'amuleto', 'enfermedades', 'paz', 'consejo', 'enemigos', 'destino', 'secreto', 'clima', 'recuerdos', 'triunfo', 'invencible', 'apagaba', 'tesoro', 'coraje', 'mentes', 'oculto', 'caminar', 'sueños', 'verdad', 'sobrehumana', 'calor', 'mundo', 'maldad', 'felicidad', 'manantial', 'magia', 'rápidos', 'azul', 'tierra', 'cantaba', 'preciosas', 'tiempo', 'futuro', 'joya', 'perdidos', 'deseo', 'risa', 'bondad', 'heridas', 'sabio', 'palabra', 'pasado', 'cofre', 'sabiduría', 'mal', 'tesoro', 'correcta', 'dolor', 'espíritu', 'armonía', 'deseo', 'maremoto', 'llover', 'paz', 'oro', 'sola', 'identidad', 'brillaba', 'invisibilidad', 'libertad', 'pasaje', 'valentía', 'deseo', 'escondite', 'verdad', 'juventud', 'agua', 'héroes', 'monedas', 'secreto', 'cosechas', 'inmensidad', 'semilla', 'alegría', 'fuerza', 'túnel', 'calor', 'suerte', 'tesoro', 'invisibilidad', 'sabiduría', 'mineral', 'caos', 'calor', 'atajo', 'memoria', 'astucia', 'escondite', 'bailar', 'pasión', 'arrecife', 'camino', 'precisión', 'secreto', 'seguridad', 'belleza', 'mágica', 'velocidad', 'protección', 'camino', 'verdad', 'curaba', 'llave', 'futuro', 'calma', 'atajo', 'riquezas', 'lealtad', 'mineral', 'suerte', 'ligereza', 'cueva', 'emoción', 'alegría', 'constelación', 'mundo', 'gracia', 'fósil', 'fuerza', 'hogar', 'estanque', 'esperanza', 'calidez', 'nido', 'crecía', 'amor', 'néctar', 'conocimiento', 'objetos', 'llave', 'sonido', 'amor', 'secreto', 'memoria', 'sueño', 'agua', 'fantasía', 'juventud', 'fruto', 'poder', 'calma', 'mensaje', 'victoria', 'brillo', 'portal', 'vida', 'libertad', 'camino', 'suerte', 'objetos', 'sendero', 'fuerza', 'seguridad', 'atajo', 'luz', 'paz', 'secreto', 'ingenio', 'salud', 'pasaje', 'verdad', 'risa', 'deseo', 'calma', 'tranquilidad', 'conjuro', 'suerte', 'quietud', 'tesoro', 'placer', 'talento', 'portal', 'alegría', 'protección', 'joya', 'invulnerabilidad', 'fortuna', 'fruto', 'mal', 'vida', 'camino', 'coraje', 'belleza', 'secreto', 'tiempo', 'paz', 'joya', 'amor', 'portal', 'luz', 'fuerza', 'mapa', 'sabiduría', 'imaginación', 'tesoro', 'magia', 'suerte', 'conocimiento', 'vida', 'atajo', 'abundancia', 'calma', 'secreto', 'alegría', 'protección', 'mensaje', 'bondad', 'valor', 'espejo', 'invencibilidad', 'calor', 'visión', 'oscuridad', 'fluidez', 'camino', 'esperanza', 'verdad', 'portal', 'sabiduría', 'amor', 'secreto', 'justicia', 'paz', 'tesoro', 'calma', 'felicidad', 'mineral', 'calma', 'velocidad', 'mensaje', 'fuerza', 'valentía', 'sueño', 'dirección', 'protección', 'portal', 'fortuna', 'libertad', 'tesoro', 'suerte', 'astucia', 'secreto', 'objetos', 'multiplicaba', 'pasaje', 'precisión', 'viento', 'atajo', 'fertilidad', 'vida', 'recuerdo', 'armonía', 'camino', 'pasado', 'verdad', 'mineral', 'calma', 'calor', 'tesoro', 'solución', 'amor', 'espíritu', 'alegría', 'amistad', 'paz', 'vida', 'vino', 'suerte', 'conocimiento', 'cofre', 'verdad', 'calma', 'sabiduría', 'futuras', 'dueña', 'perdidos', 'animales', 'vuelo', 'verdadero', 'heridas', 'ánimo', 'estelar', 'paralelas', 'pesado', 'fotográfica', 'fugaces', 'secreta', 'tormentas', 'verdad', 'alma', 'bellas', 'espíritus', 'eterno', 'valentía', 'lado', 'tesoro', 'multiplicaba', 'invisibilidad', 'atajo', 'volar', 'alegría', 'profecía', 'agua', 'pensamientos', 'deseo', 'respuestas', 'calidez', 'rey', 'sabiduría', 'rápido', 'feliz', 'imaginación', 'poder', 'consejo', 'paz', 'viento', 'visión', 'verdad', 'vida', 'miel', 'amor', 'bailar', 'juventud', 'secreto', 'fuerza', 'invisibilidad', 'calma', 'esperanza'}

# --- FUNCIONES ---
def cargarCorpus(ubicacionArchivo):
    with open(ubicacionArchivo, 'r', encoding='utf-8') as f:
        cuentos = f.read().lower().split('\n')
    return [c.strip() for c in cuentos if c.strip()]

def crearSecuencias(cuentos, tokenizador, longitudSecuencia):
    secuencias = []
    for cuento in cuentos:
        palabras = cuento.split()
        for i in range(1, len(palabras)):
            secuencias.append(' '.join(palabras[:i+1]))
    tokens = tokenizador.texts_to_sequences(secuencias)
    tokens = pad_sequences(tokens, maxlen=longitudSecuencia, padding='pre')
    return tokens[:, :-1], tokens[:, -1]

def preprocesarConDivision(cuentos, longitudSecuencia):
    cuentosEntrenamiento, cuentosValidacion = train_test_split(cuentos, test_size=0.2, random_state=42)
    tokenizador = Tokenizer()
    tokenizador.fit_on_texts(cuentosEntrenamiento)
    vocabulario = len(tokenizador.word_index) + 1
    XEntrenamiento, yEntrenamiento = crearSecuencias(cuentosEntrenamiento, tokenizador, longitudSecuencia)
    XValidacion, yValidacion = crearSecuencias(cuentosValidacion, tokenizador, longitudSecuencia)
    return tokenizador, vocabulario, XEntrenamiento, yEntrenamiento, XValidacion, yValidacion

def construirModelo(vocabulario, longitudSecuencia, dropout):
    modelo = Sequential([
        Embedding(vocabulario, 100, input_length=longitudSecuencia-1),
        LSTM(150),
        Dropout(dropout),
        Dense(vocabulario, activation='softmax')
    ])
    modelo.compile(loss='sparse_categorical_crossentropy', optimizer='adam')
    return modelo

def entrenarModelo(modelo, XEntrenamiento, yEntrenamiento, epocas):
    modelo.fit(XEntrenamiento, yEntrenamiento, epochs=epocas, verbose=1)

def generarCuento(modelo, tokenizador, textoSemilla, longitudSecuencia, temperatura):
    texto = textoSemilla.lower()
    while True:
        tokens = tokenizador.texts_to_sequences([texto])
        tokens = tokens[0] if tokens and tokens[0] else []
        tokens = pad_sequences([tokens], maxlen=longitudSecuencia-1, padding='pre')
        prediccion = modelo.predict(tokens, verbose=0)[0]
        prediccion = np.log(prediccion + 1e-10) / temperatura
        prediccion = np.exp(prediccion) / np.sum(np.exp(prediccion))
        indice = np.random.choice(len(prediccion), p=prediccion)
        palabra = tokenizador.index_word.get(indice, '')
        if palabra:
            texto += " " + palabra
            if palabra in palabrasCierre and len(texto.split()) >= 6:
                break
    return texto

def calcularMetricasAutomaticas(cuentosGenerados, tokenizador, XValidacion, yValidacion, modelo):
    metricas = {}
    
    # Perplejidad
    if len(XValidacion) > 0:
        perdida = modelo.evaluate(XValidacion, yValidacion, verbose=0)
        metricas['perplejidad'] = float(np.exp(perdida))
    else:
        metricas['perplejidad'] = None

    # TTR
    palabras = ' '.join(cuentosGenerados).split()
    metricas['ttr'] = len(set(palabras)) / len(palabras) if palabras else 0.0

    # Longitud media
    metricas['longitudMedia'] = float(np.mean([len(c.split()) for c in cuentosGenerados]))

    # % cierre
    cierres = [c.split()[-1] in palabrasCierre for c in cuentosGenerados if c.split()]
    metricas['porcentajeCierre'] = (sum(cierres) / len(cierres) * 100) if cierres else 0.0

    # Calidad subjetiva
    metricas['calidad'] = None

    return metricas

# --- FUNCIÓN PRINCIPAL ---
def ejecutarAutomatizacionCompleta():
    for nombreCorpus, rutaCorpus in rutasCorpus.items():
        if not os.path.exists(rutaCorpus):
            print(f"Archivo no encontrado: {rutaCorpus}")
            continue
        
        cuentos = cargarCorpus(rutaCorpus)
        
        for nombreVar, paramsVar in variaciones.items():
            config = parametrosBase.copy()
            config.update(paramsVar)
            nombreConfig = f"{nombreCorpus}_{nombreVar}"
            rutaDir = os.path.join('resultados', nombreConfig)
            rutaModelo = os.path.join(rutaDir, 'modelo.h5')
            os.makedirs(rutaDir, exist_ok=True)

            print(f"\nProcesando: {nombreConfig}")

            # --- ENTRENAR O CARGAR MODELO ---
            if os.path.exists(rutaModelo):
                print(f"  Cargando modelo existente...")
                modelo = load_model(rutaModelo)
                # Recrear tokenizador
                tokenizador, _, _, _, XValidacion, yValidacion = preprocesarConDivision(cuentos, config['longitudSecuencia'])
            else:
                print(f"  Entrenando modelo nuevo...")
                tokenizador, vocabulario, XEntrenamiento, yEntrenamiento, XValidacion, yValidacion = preprocesarConDivision(cuentos, config['longitudSecuencia'])
                modelo = construirModelo(vocabulario, config['longitudSecuencia'], config['dropout'])
                entrenarModelo(modelo, XEntrenamiento, yEntrenamiento, config['epocas'])
                modelo.save(rutaModelo)
                print(f"  Modelo guardado en: {rutaModelo}")

            # --- GENERAR CUENTOS ---
            cuentosGenerados = []
            for semilla in semillas:
                cuento = generarCuento(modelo, tokenizador, semilla, config['longitudSecuencia'], config['temperatura'])
                cuentosGenerados.append(cuento)

            # --- GUARDAR CUENTOS ---
            with open(os.path.join(rutaDir, 'cuentos_generados.txt'), 'w', encoding='utf-8') as f:
                for i, cuento in enumerate(cuentosGenerados):
                    f.write(f"Semilla: {semillas[i]}\n")
                    f.write(cuento + "\n\n")

            # --- CALCULAR MÉTRICAS ---
            metricas = calcularMetricasAutomaticas(cuentosGenerados, tokenizador, XValidacion, yValidacion, modelo)
            metricas.update({
                'longitudSecuencia': config['longitudSecuencia'],
                'epocas': config['epocas'],
                'temperatura': config['temperatura'],
                'dropout': config['dropout']
            })

            # --- GUARDAR MÉTRICAS ---
            with open(os.path.join(rutaDir, 'metricas.json'), 'w', encoding='utf-8') as f:
                json.dump(metricas, f, indent=4, ensure_ascii=False)

            print(f"  Completado: {nombreConfig}")

# --- EJECUCIÓN ---
if __name__ == "__main__":
    ejecutarAutomatizacionCompleta()



Ese script, ejecuta cada modelo con 7 palabras semillas para evaluar. 



Para realizar el análisis de los resultados de cada modelo, se usa el siguiente programa `análisis.py`:

# analisis.py - Versión final con 6 gráficos
import os
import json
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

# Configuración
nombresCorpus = ['corto', 'mediano', 'largo', 'muy_largo']
nombresVariaciones = ['base', 'dropoutMas', 'dropoutMenos', 'temperaturaMas', 'temperaturaMenos',
                      'epocasMas', 'epocasMenos', 'longitudMas', 'longitudMenos']

parametrosBase = {'longitudSecuencia': 30, 'epocas': 30, 'temperatura': 0.4, 'dropout': 0.2}
mapeoVariaciones = {
    'dropoutMas': {'dropout': 0.5}, 'dropoutMenos': {'dropout': 0.0},
    'temperaturaMas': {'temperatura': 0.8}, 'temperaturaMenos': {'temperatura': 0.2},
    'epocasMas': {'epocas': 60}, 'epocasMenos': {'epocas': 15},
    'longitudMas': {'longitudSecuencia': 50}, 'longitudMenos': {'longitudSecuencia': 15},
    'base': {}
}

os.makedirs('analisis_resultados', exist_ok=True)

def obtenerParametros(corpus, var):
    params = parametrosBase.copy()
    params.update(mapeoVariaciones.get(var, {}))
    return params

# === RECOPILAR DATOS ===
datos = []
archivosFaltantes = []

for corpus in nombresCorpus:
    for var in nombresVariaciones:
        nombreConfig = f"{corpus}_{var}"
        rutaJson = os.path.join('resultados', nombreConfig, 'metricas.json')
        if not os.path.exists(rutaJson):
            archivosFaltantes.append(rutaJson)
            continue
        try:
            with open(rutaJson, 'r', encoding='utf-8') as f:
                m = json.load(f)
            params = obtenerParametros(corpus, var)
            fila = {
                'corpus': corpus,
                'variacion': var,
                'longitudSecuencia': m.get('longitudSecuencia', params['longitudSecuencia']),
                'epocas': m.get('epocas', params['epocas']),
                'temperatura': m.get('temperatura', params['temperatura']),
                'dropout': m.get('dropout', params['dropout']),
                'perplejidad': m.get('perplejidad'),
                'ttr': m.get('ttr'),
                'longitudMedia': m.get('longitudMedia'),
                'porcentajeCierre': m.get('porcentajeCierre'),
                'calidad': m.get('calidad')  # 1 a 5, rellenar manualmente
            }
            datos.append(fila)
        except Exception as e:
            print(f"Error en {rutaJson}: {e}")
            archivosFaltantes.append(rutaJson)

df = pd.DataFrame(datos)
df.to_csv('analisis_resultados/resumen_metricas.csv', index=False, encoding='utf-8')
print("Tabla guardada: analisis_resultados/resumen_metricas.csv")

# === GRÁFICOS (6 en total) ===
plt.style.use('seaborn-v0_8')
fig = plt.figure(figsize=(18, 12))
gs = fig.add_gridspec(3, 3, hspace=0.4, wspace=0.4)

# 1. Perplejidad por variación (agrupado por corpus)
ax1 = fig.add_subplot(gs[0, 0])
sns.barplot(data=df, x='variacion', y='perplejidad', hue='corpus', ax=ax1, palette='viridis')
ax1.set_title('Perplejidad por Variación y Corpus')
ax1.tick_params(axis='x', rotation=45)

# 2. TTR (diversidad) por temperatura
ax2 = fig.add_subplot(gs[0, 1])
sns.barplot(data=df, x='temperatura', y='ttr', hue='corpus', ax=ax2, palette='magma')
ax2.set_title('Diversidad Léxica (TTR) por Temperatura')

# 3. Longitud media por longitud de secuencia
ax3 = fig.add_subplot(gs[0, 2])
sns.barplot(data=df, x='longitudSecuencia', y='longitudMedia', hue='corpus', ax=ax3, palette='plasma')
ax3.set_title('Longitud Media del Cuento por Secuencia')

# 4. % de cierre por dropout
ax4 = fig.add_subplot(gs[1, 0])
sns.barplot(data=df, x='dropout', y='porcentajeCierre', hue='corpus', ax=ax4, palette='cividis')
ax4.set_title('% de Cuentos que Terminan con Palabra de Cierre')

# 5. Heatmap de correlaciones (solo automáticas)
ax5 = fig.add_subplot(gs[1, 1])
metricasAuto = df[['perplejidad', 'ttr', 'longitudMedia', 'porcentajeCierre']].dropna()
if not metricasAuto.empty:
    corr = metricasAuto.corr()
    sns.heatmap(corr, annot=True, cmap='coolwarm', ax=ax5, fmt='.2f', linewidths=.5)
    ax5.set_title('Correlaciones entre Métricas Automáticas')
else:
    ax5.text(0.5, 0.5, 'Sin datos', ha='center', va='center', transform=ax5.transAxes)
    ax5.set_title('Correlaciones (sin datos)')

# 6. Boxplot: Perplejidad por tamaño de corpus
ax6 = fig.add_subplot(gs[1, 2])
sns.boxplot(data=df, x='corpus', y='perplejidad', ax=ax6, palette='Set2')
ax6.set_title('Distribución de Perplejidad por Tamaño de Corpus')

# 7. (Bonus) Calidad subjetiva (si ya está rellena)
ax7 = fig.add_subplot(gs[2, :])
if df['calidad'].notna().any():
    sns.barplot(data=df, x='corpus', y='calidad', hue='variacion', ax=ax7, palette='tab10')
    ax7.set_title('Calidad Subjetiva (1–5) por Corpus y Variación')
    ax7.tick_params(axis='x', rotation=45)
else:
    ax7.text(0.5, 0.5, 'Rellena "calidad" en el CSV para ver este gráfico', 
             ha='center', va='center', transform=ax7.transAxes, fontsize=12, color='gray')
    ax7.set_title('Calidad Subjetiva (pendiente)')

plt.suptitle('Análisis Completo de Calidad en Generación de Cuentos', fontsize=16, y=0.98)
plt.savefig('analisis_resultados/graficos_completos_6.png', dpi=300, bbox_inches='tight')
plt.show()

print("6 gráficos generados: analisis_resultados/graficos_completos_6.png")
if archivosFaltantes:
    print(f"\nAdvertencia: Faltan {len(archivosFaltantes)} archivos. Verifica.")

que genera 6 gráficos con datos de los resultados de cada modelo. Además, otro dato es "calidad", que es la evaluación humana de qué tan bueno fue el resultado, se mide manualmente en una escala de Likert del 1 al 5.



---


Recuerda que debes responder sólo el fragmento de código que formará parte del documento.