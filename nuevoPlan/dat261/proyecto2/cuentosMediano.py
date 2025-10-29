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
    palabrasCierre = {'escondido', 'pueblo', 'mágica', 'encantada', 'dragones', 'pastor', 'anochecer', 'deseo', 'luces', 'encantados', 'protegió', 'monstruo', 'curaban', 'cantaban', 'destino', 'niño', 'épicas', 'marineros', 'altas', 'maravillas', 'flores', 'mágicas', 'reino', 'bosque', 'bondadoso', 'puros', 'sanador', 'entero', 'escondido', 'tímido', 'estrellado', 'tormentas', 'dragón', 'aire', 'reyes', 'paz', 'niño', 'casa', 'volaban', 'pastor', 'aventuras', 'amanecer', 'mágico', 'fértil', 'perdido', 'héroe', 'parlante', 'brillante', 'pueblo', 'débil', 'pájaros', 'aldea', 'enfermó', 'barcos', 'paz', 'aventuras', 'arco', 'día', 'mágicas', 'frío', 'propia', 'reino', 'secretos', 'pueblo', 'viento', 'olvidadas', 'pueblo', 'niño', 'volaron', 'tímido', 'heroicos', 'brillantes', 'encantados', 'verde', 'tesoro', 'todos', 'suave', 'puros', 'estrellas', 'pueblo', 'mágicos', 'montañas', 'barcos', 'paz', 'niño', 'mágico', 'reino', 'pueblo', 'bondadoso', 'sano', 'pueblo', 'mágico', 'protegió', 'reino', 'casa', 'pueblo', 'luna', 'oro', 'mágicas', 'guió', 'día', 'épicas', 'salvo', 'encantadas', 'amanecer', 'nubes', 'magia', 'niño', 'hablaron', 'pueblo', 'suave', 'mágicas', 'puros', 'niño', 'voladores', 'niño', 'encantado', 'paz', 'roto', 'noche', 'enfermo', 'risas', 'agua', 'secreto', 'dormía', 'verdad', 'eterna', 'dulce', 'perdidos', 'pesadillas', 'antiguas', 'alegría', 'multitud', 'hogar', 'felices', 'oculta', 'plata', 'seca', 'luz', 'verano', 'mar', 'seguro', 'espíritus', 'proféticos', 'estrella', 'invisibilidad', 'pesados', 'olvidados', 'peligro', 'tripulación', 'tierra', 'momento', 'mundo', 'plaga', 'puro', 'reciente', 'guerra', 'noble', 'suerte', 'volar', 'vino', 'paz', 'feliz', 'sombras', 'anciano', 'habitantes', 'invulnerable', 'felicidad', 'brindis', 'prosperidad', 'mañana', 'curativa', 'miedos', 'envejecer', 'audiencia', 'segura', 'pensamientos', 'recuerdo', 'verdad', 'fortuna', 'heridas', 'financiero', 'prisioneros', 'estrellas', 'animales', 'joyas', 'clima', 'justicia', 'mágica', 'invierno', 'paralelas', 'verdadero', 'valor', 'eternas', 'deseos', 'mapa', 'olas', 'fénix', 'durmientes', 'cosecha', 'oro', 'barco', 'seco', 'subterráneo', 'banquete', 'fortuna', 'tristeza', 'mundo', 'futuro', 'verdad', 'noche', 'sabiduría', 'dolor', 'sequía', 'peligro', 'constructor', 'mar', 'necesario', 'aire', 'camino', 'oscuridad', 'muro', 'noche', 'invierno', 'amado', 'gigante', 'fortuna', 'gemelas', 'pájaros', 'ladrones', 'pensamientos', 'lluvia', 'secreta', 'cosas', 'gastaba'}
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
def main():
    ubicacionCorpus = 'cuentosMediano.txt'
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