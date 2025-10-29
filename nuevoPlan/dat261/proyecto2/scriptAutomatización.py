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