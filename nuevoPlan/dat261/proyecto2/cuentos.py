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

def construirModelo(palabrasTotales, longitudSecuencia):
    modelo = tf.keras.Sequential([
        Embedding(palabrasTotales, 100, input_length=longitudSecuencia-1),
        LSTM(150, return_sequences=False),
        Dropout(0.3),
        Dense(palabrasTotales, activation='softmax')
    ])
    modelo.compile(loss='sparse_categorical_crossentropy', optimizer='adam')
    return modelo

def entrenarModelo(modelo, datosEntrada, datosSalida, epocas):
    modelo.fit(datosEntrada, datosSalida, epochs=epocas, verbose=1)

def generarCuento(modelo, tokenizador, textoSemilla, longitudSecuencia, palabrasSiguientes, temperatura):
    textoGenerado = textoSemilla.lower()
    palabrasCierre = {'pueblo', 'reino', 'hogar', 'mágica', 'salvo', 'encantada', 'siempre', 'aventuras', 'niño', 'estrellas', 'casa', 'hogar', 'altas', 'épicas', 'dragones'}
    for _ in range(palabrasSiguientes):
        listaTokens = tokenizador.texts_to_sequences([textoGenerado])
        if not listaTokens or not listaTokens[0]:  # Manejar caso de tokenización vacía
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
    ubicacionCorpus = 'cuentos.txt'
    try:
        longitudSecuencia = int(input("Ingresa la longitud de secuencia (e.g., 10): "))
        epocas = int(input("Ingresa el número de épocas (e.g., 30): "))
        temperatura = float(input("Ingresa la temperatura (e.g., 0.8): "))
    except ValueError:
        print("Error: Ingresa valores numéricos válidos. Usando valores por defecto.")
        longitudSecuencia = 10
        epocas = 30
        temperatura = 0.8
    cuentos = cargarCorpus(ubicacionCorpus)
    tokenizador, palabrasTotales, datosEntrada, datosSalida = preprocesarTexto(cuentos, longitudSecuencia)
    modelo = construirModelo(palabrasTotales, longitudSecuencia)
    entrenarModelo(modelo, datosEntrada, datosSalida, epocas)
    while True:
        textoSemilla = input("Ingresa las primeras palabras del cuento (o 'salir' para terminar): ")
        if textoSemilla.lower() == 'salir':
            break
        palabrasSemilla = len(textoSemilla.split())
        palabrasSiguientes = max(5, 15 - palabrasSemilla)
        cuentoGenerado = generarCuento(modelo, tokenizador, textoSemilla, longitudSecuencia, palabrasSiguientes, temperatura)
        print("Cuento generado:", cuentoGenerado)

if __name__ == "__main__":
    main()