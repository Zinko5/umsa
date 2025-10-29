import os
import json
import tensorflow as tf
import numpy as np
from tensorflow.keras.preprocessing.text import Tokenizer
from tensorflow.keras.preprocessing.sequence import pad_sequences
from tensorflow.keras.layers import Embedding, LSTM, Dense, Dropout
from sklearn.model_selection import train_test_split

# Set seeds for reproducibility
np.random.seed(42)
tf.random.set_seed(42)

# Define corpus paths
corpus_paths = {
    'corto': 'cuentosCorto.txt',
    'mediano': 'cuentosMediano.txt',
    'largo': 'cuentosLargo.txt',
    'muy_largo': 'cuentosMuyLargo.txt'
}

# Define base parameters
base_params = {
    'seq_len': 30,
    'epochs': 30,
    'temp': 0.4,
    'dropout': 0.2
}

# Define variations
variations = {
    'base': {},
    'dropout_plus': {'dropout': 0.5},
    'dropout_minus': {'dropout': 0.0},
    'temp_plus': {'temp': 0.8},
    'temp_minus': {'temp': 0.2},
    'epochs_plus': {'epochs': 60},
    'epochs_minus': {'epochs': 15},
    'seq_len_plus': {'seq_len': 50},
    'seq_len_minus': {'seq_len': 15}
}

# Fixed seeds for generation
semillas = [
    "un lobo",
    "un gato",
    "un niño",
    "una anciana",
    "en un pueblo",
    "en un bosque",
    "había una vez"
]

# Function to load corpus
def cargarCorpus(ubicacionArchivo):
    with open(ubicacionArchivo, 'r', encoding='utf-8') as archivo:
        cuentos = archivo.read().lower().split('\n')
    return [cuento.strip() for cuento in cuentos if cuento.strip()]

# Function to create input sequences from texts
def create_sequences(cuentos, tokenizador, longitudSecuencia):
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
    return datosEntrada, datosSalida

# Function to preprocess with split
def preprocesarConSplit(cuentos, longitudSecuencia):
    # Split into train and val
    cuentos_train, cuentos_val = train_test_split(cuentos, test_size=0.2, random_state=42)
    
    # Tokenizer on train
    tokenizador = Tokenizer()
    tokenizador.fit_on_texts(cuentos_train)
    palabrasTotales = len(tokenizador.word_index) + 1
    
    # Create sequences for train
    X_train, y_train = create_sequences(cuentos_train, tokenizador, longitudSecuencia)
    
    # Create sequences for val (using same tokenizer)
    X_val, y_val = create_sequences(cuentos_val, tokenizador, longitudSecuencia)
    
    return tokenizador, palabrasTotales, X_train, y_train, X_val, y_val

# Function to build model
def construirModelo(palabrasTotales, longitudSecuencia, dropout):
    modelo = tf.keras.Sequential([
        Embedding(palabrasTotales, 100, input_length=longitudSecuencia-1),
        LSTM(150, return_sequences=False),
        Dropout(dropout),
        Dense(palabrasTotales, activation='softmax')
    ])
    modelo.compile(loss='sparse_categorical_crossentropy', optimizer='adam')
    return modelo

# Function to train model
def entrenarModelo(modelo, X_train, y_train, epocas):
    modelo.fit(X_train, y_train, epochs=epocas, verbose=1)

# Function to generate story
def generarCuento(modelo, tokenizador, textoSemilla, longitudSecuencia, temperatura):
    textoGenerado = textoSemilla.lower()
    palabrasCierre = {'escondido', 'pueblo', 'mágica', 'encantada', 'dragones', 'pastor', 'anochecer', 'deseo', 'luces', 'encantados', 'protegió', 'monstruo', 'curaban', 'cantaban', 'destino', 'niño', 'épicas', 'marineros', 'altas', 'maravillas', 'flores', 'mágicas', 'reino', 'bosque', 'bondadoso', 'puros', 'sanador', 'entero', 'escondido', 'tímido', 'estrellado', 'tormentas', 'dragón', 'aire', 'reyes', 'paz', 'niño', 'casa', 'volaban', 'pastor', 'aventuras', 'amanecer', 'mágico', 'fértil', 'perdido', 'héroe', 'parlante', 'brillante', 'pueblo', 'débil', 'pájaros', 'aldea', 'enfermó', 'barcos', 'paz', 'aventuras', 'arco', 'día', 'mágicas', 'frío', 'propia', 'reino', 'secretos', 'pueblo', 'viento', 'olvidadas', 'pueblo', 'niño', 'volaron', 'tímido', 'heroicos', 'brillantes', 'encantados', 'verde', 'tesoro', 'todos', 'suave', 'puros', 'estrellas', 'pueblo', 'mágicos', 'montañas', 'barcos', 'paz', 'niño', 'mágico', 'reino', 'pueblo', 'bondadoso', 'sano', 'pueblo', 'mágico', 'protegió', 'reino', 'casa', 'pueblo', 'luna', 'oro', 'mágicas', 'guió', 'día', 'épicas', 'salvo', 'encantadas', 'amanecer', 'nubes', 'magia', 'niño', 'hablaron', 'pueblo', 'suave', 'mágicas', 'puros', 'niño', 'voladores', 'niño', 'encantado', 'paz', 'roto', 'noche', 'enfermo', 'risas', 'agua', 'secreto', 'dormía', 'verdad', 'eterna', 'dulce', 'perdidos', 'pesadillas', 'antiguas', 'alegría', 'multitud', 'hogar', 'felices', 'oculta', 'plata', 'seca', 'luz', 'verano', 'mar', 'seguro', 'espíritus', 'proféticos', 'estrella', 'invisibilidad', 'pesados', 'olvidados', 'peligro', 'tripulación', 'tierra', 'momento', 'mundo', 'plaga', 'puro', 'reciente', 'guerra', 'noble', 'suerte', 'volar', 'vino', 'paz', 'feliz', 'sombras', 'anciano', 'habitantes', 'invulnerable', 'felicidad', 'brindis', 'prosperidad', 'mañana', 'curativa', 'miedos', 'envejecer', 'audiencia', 'segura', 'pensamientos', 'recuerdo', 'verdad', 'fortuna', 'heridas', 'financiero', 'prisioneros', 'estrellas', 'animales', 'joyas', 'clima', 'justicia', 'mágica', 'invierno', 'paralelas', 'verdadero', 'valor', 'eternas', 'deseos', 'mapa', 'olas', 'fénix', 'durmientes', 'cosecha', 'oro', 'barco', 'seco', 'subterráneo', 'banquete', 'fortuna', 'tristeza', 'mundo', 'futuro', 'verdad', 'noche', 'sabiduría', 'dolor', 'sequía', 'peligro', 'constructor', 'mar', 'necesario', 'aire', 'camino', 'oscuridad', 'muro', 'noche', 'invierno', 'amado', 'gigante', 'fortuna', 'gemelas', 'pájaros', 'ladrones', 'pensamientos', 'lluvia', 'secreta', 'cosas', 'gastaba', 'oro', 'personas', 'estrellas', 'tesoro', 'pasadas', 'elocuencia', 'suerte', 'desearlo', 'perdidos', 'infinito', 'imaginado', 'aventura', 'orilla', 'almohada', 'marea', 'habitación', 'enfermos', 'milagrosa', 'curaba', 'felicidad', 'mágico', 'importante', 'deseos', 'preocupaciones', 'lejos', 'inmensa', 'futuro', 'peligro', 'lugar', 'volara', 'protección', 'multiplicaba', 'objetos', 'verdad', 'cercano', 'justicia', 'ángel', 'suerte', 'sabiduría', 'planetas', 'suave', 'pueblo', 'animales', 'naturaleza', 'amuleto', 'enfermedades', 'paz', 'consejo', 'enemigos', 'destino', 'secreto', 'clima', 'recuerdos', 'triunfo', 'invencible', 'apagaba', 'tesoro', 'coraje', 'mentes', 'oculto', 'caminar', 'sueños', 'verdad', 'sobrehumana', 'calor', 'mundo', 'maldad', 'felicidad', 'manantial', 'magia', 'rápidos', 'azul', 'tierra', 'cantaba', 'preciosas', 'tiempo', 'futuro', 'joya', 'perdidos', 'deseo', 'risa', 'bondad', 'heridas', 'sabio', 'palabra', 'pasado', 'cofre', 'sabiduría', 'mal', 'tesoro', 'correcta', 'dolor', 'espíritu', 'armonía', 'deseo', 'maremoto', 'llover', 'paz', 'oro', 'sola', 'identidad', 'brillaba', 'invisibilidad', 'libertad', 'pasaje', 'valentía', 'deseo', 'escondite', 'verdad', 'juventud', 'agua', 'héroes', 'monedas', 'secreto', 'cosechas', 'inmensidad', 'semilla', 'alegría', 'fuerza', 'túnel', 'calor', 'suerte', 'tesoro', 'invisibilidad', 'sabiduría', 'mineral', 'caos', 'calor', 'atajo', 'memoria', 'astucia', 'escondite', 'bailar', 'pasión', 'arrecife', 'camino', 'precisión', 'secreto', 'seguridad', 'belleza', 'mágica', 'velocidad', 'protección', 'camino', 'verdad', 'curaba', 'llave', 'futuro', 'calma', 'atajo', 'riquezas', 'lealtad', 'mineral', 'suerte', 'ligereza', 'cueva', 'emoción', 'alegría', 'constelación', 'mundo', 'gracia', 'fósil', 'fuerza', 'hogar', 'estanque', 'esperanza', 'calidez', 'nido', 'crecía', 'amor', 'néctar', 'conocimiento', 'objetos', 'llave', 'sonido', 'amor', 'secreto', 'memoria', 'sueño', 'agua', 'fantasía', 'juventud', 'fruto', 'poder', 'calma', 'mensaje', 'victoria', 'brillo', 'portal', 'vida', 'libertad', 'camino', 'suerte', 'objetos', 'sendero', 'fuerza', 'seguridad', 'atajo', 'luz', 'paz', 'secreto', 'ingenio', 'salud', 'pasaje', 'verdad', 'risa', 'deseo', 'calma', 'tranquilidad', 'conjuro', 'suerte', 'quietud', 'tesoro', 'placer', 'talento', 'portal', 'alegría', 'protección', 'joya', 'invulnerabilidad', 'fortuna', 'fruto', 'mal', 'vida', 'camino', 'coraje', 'belleza', 'secreto', 'tiempo', 'paz', 'joya', 'genio', 'amor', 'portal', 'luz', 'fuerza', 'mapa', 'sabiduría', 'imaginación', 'tesoro', 'magia', 'suerte', 'cristal', 'conocimiento', 'vida', 'atajo', 'abundancia', 'calma', 'secreto', 'alegría', 'protección', 'mensaje', 'bondad', 'valor', 'espejo', 'invencibilidad', 'calor', 'visión', 'oscuridad', 'fluidez', 'camino', 'esperanza', 'verdad', 'portal', 'sabiduría', 'amor', 'secreto', 'justicia', 'paz', 'tesoro', 'calma', 'felicidad', 'mineral', 'calma', 'velocidad', 'mensaje', 'fuerza', 'valentía', 'sueño', 'dirección', 'protección', 'portal', 'fortuna', 'libertad', 'tesoro', 'suerte', 'astucia', 'secreto', 'objetos', 'multiplicaba', 'pasaje', 'precisión', 'viento', 'atajo', 'fertilidad', 'vida', 'recuerdo', 'armonía', 'deseo', 'camino', 'pasado', 'verdad', 'mineral', 'calma', 'calor', 'tesoro', 'solución', 'amor', 'espíritu', 'alegría', 'amistad', 'escondite', 'paz', 'vida', 'vino', 'suerte', 'conocimiento', 'cofre', 'verdad', 'calma', 'sabiduría', 'futuras', 'dueña', 'perdidos', 'animales', 'vuelo', 'verdadero', 'heridas', 'ánimo', 'estelar', 'paralelas', 'dorado', 'pesado', 'fotográfica', 'fugaces', 'secreta', 'tormentas', 'verdad', 'alma', 'bellas', 'espíritus', 'eterno', 'valentía', 'lado', 'tesoro', 'multiplicaba', 'invisibilidad', 'atajo', 'volar', 'alegría', 'profecía', 'agua', 'pensamientos', 'deseo', 'respuestas', 'calidez', 'rey', 'sabiduría', 'rápido', 'feliz', 'imaginación', 'poder', 'consejo', 'paz', 'viento', 'visión', 'verdad', 'vida', 'miel', 'amor', 'astucia', 'pasaje', 'bailar', 'juventud', 'secreto', 'fuerza', 'invisibilidad', 'fuente', 'oscuridad', 'calma', 'camino', 'esperanza', 'verdad', 'portal', 'sabiduría', 'amor', 'secreto', 'justicia', 'paz', 'tesoro', 'calma', 'felicidad', 'mineral', 'calma', 'velocidad', 'mensaje', 'fuerza', 'valentía', 'sueño', 'dirección', 'protección', 'portal', 'fortuna', 'libertad', 'tesoro', 'suerte', 'astucia', 'secreto', 'objetos', 'multiplicaba', 'pasaje', 'precisión', 'viento', 'atajo', 'fertilidad', 'vida', 'recuerdo', 'armonía', 'deseo', 'camino', 'pasado', 'verdad', 'mineral', 'calma', 'calor', 'tesoro', 'solución', 'amor', 'espíritu', 'alegría', 'amistad', 'escondite', 'paz', 'vida', 'vino', 'suerte', 'conocimiento', 'cofre', 'verdad', 'calma', 'sabiduría', 'futuras', 'dueña', 'perdidos', 'animales', 'vuelo', 'verdadero', 'heridas', 'ánimo', 'estelar', 'paralelas', 'dorado', 'pesado', 'fotográfica', 'fugaces', 'secreta', 'tormentas', 'verdad', 'alma', 'bellas', 'espíritus', 'eterno', 'valentía', 'lado', 'tesoro', 'multiplicaba', 'invisibilidad', 'atajo', 'volar', 'alegría', 'profecía', 'agua', 'pensamientos', 'deseo', 'respuestas', 'calidez', 'rey', 'sabiduría', 'rápido', 'feliz', 'imaginación', 'poder', 'consejo', 'paz', 'viento', 'visión', 'verdad', 'vida'}
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
    if len(textoGenerado.split()) > 15:
        textoGenerado = ' '.join(textoGenerado.split()[:15])
    return textoGenerado

# Function to calculate automatic metrics
def calcular_metricas_automaticas(cuentos_gen, tokenizador, palabrasCierre, X_val, y_val, modelo):
    metricas = {}
    
    # Perplexity (PPL) on validation set
    if len(X_val) > 0:
        loss = modelo.evaluate(X_val, y_val, verbose=0)
        metricas['PPL'] = np.exp(loss)
    else:
        metricas['PPL'] = None  # No val data
    
    # Type-Token Ratio (TTR) for diversity
    all_words = ' '.join(cuentos_gen).split()
    unique_words = set(all_words)
    metricas['TTR'] = len(unique_words) / len(all_words) if all_words else 0
    
    # Average length
    lengths = [len(cuento.split()) for cuento in cuentos_gen]
    metricas['avg_length'] = np.mean(lengths)
    
    # % closure
    closures = [cuento.split()[-1] in palabrasCierre for cuento in cuentos_gen if cuento.split()]
    metricas['pct_closure'] = sum(closures) / len(closures) * 100 if closures else 0
    
    # Placeholder for subjective metrics (1-5 scale)
    metricas['coherencia'] = None
    metricas['gramatica'] = None
    metricas['creatividad'] = None
    metricas['adecuacion'] = None
    metricas['finalizacion'] = None
    
    return metricas

# Main automation function
def run_experiments():
    for corpus_name, corpus_path in corpus_paths.items():
        for var_name, var_params in variations.items():
            config = base_params.copy()
            config.update(var_params)
            config_name = f"{corpus_name}_{var_name}"
            result_dir = os.path.join('resultados', config_name)
            os.makedirs(result_dir, exist_ok=True)
            
            print(f"Running: {config_name}")
            
            # Load corpus
            cuentos = cargarCorpus(corpus_path)
            
            # Preprocess with split
            tokenizador, palabrasTotales, X_train, y_train, X_val, y_val = preprocesarConSplit(cuentos, config['seq_len'])
            
            # Build and train model
            modelo = construirModelo(palabrasTotales, config['seq_len'], config['dropout'])
            entrenarModelo(modelo, X_train, y_train, config['epochs'])
            
            # Save model
            modelo.save(os.path.join(result_dir, 'modelo.h5'))
            
            # Generate stories
            cuentos_gen = []
            for semilla in semillas:
                cuento = generarCuento(modelo, tokenizador, semilla, config['seq_len'], config['temp'])
                cuentos_gen.append(cuento)
            
            # Save generated stories
            with open(os.path.join(result_dir, 'cuentos_generados.txt'), 'w', encoding='utf-8') as f:
                for i, cuento in enumerate(cuentos_gen):
                    f.write(f"Semilla: {semillas[i]}\n")
                    f.write(cuento + "\n\n")
            
            # Calculate metrics
            palabrasCierre = {'pueblo', 'reino', 'hogar', 'mágica', 'salvo', 'encantada', 'siempre', 'aventuras', 'niño', 'estrellas', 'casa', 'hogar', 'altas', 'épicas', 'dragones'}
            metricas = calcular_metricas_automaticas(cuentos_gen, tokenizador, palabrasCierre, X_val, y_val, modelo)
            
            # Save metrics
            with open(os.path.join(result_dir, 'metricas.json'), 'w', encoding='utf-8') as f:
                json.dump(metricas, f, indent=4)
            
            print(f"Completed: {config_name}")

# Run all
if __name__ == "__main__":
    run_experiments()