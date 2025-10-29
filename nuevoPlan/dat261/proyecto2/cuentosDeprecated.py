import tensorflow as tf
import numpy as np
from tensorflow.keras.preprocessing.text import Tokenizer
from tensorflow.keras.preprocessing.sequence import pad_sequences
from tensorflow.keras.layers import Embedding, LSTM, Dense, Dropout

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
        Dropout(0.2),
        Dense(palabrasTotales, activation='softmax')
    ])
    modelo.compile(loss='sparse_categorical_crossentropy', optimizer='adam')
    return modelo

def entrenarModelo(modelo, datosEntrada, datosSalida, epocas):
    modelo.fit(datosEntrada, datosSalida, epochs=epocas, verbose=1)

def generarCuento(modelo, tokenizador, textoSemilla, longitudSecuencia, temperatura):
    textoGenerado = textoSemilla.lower()
    palabrasCierre = {'pueblo', 'reino', 'hogar', 'mágica', 'salvo', 'encantada', 'siempre', 'aventuras', 'niño', 'estrellas', 'casa', 'hogar', 'altas', 'épicas', 'dragones'}
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
            if palabraPredicha in palabrasCierre and len(textoGenerado.split()) >= 6:
                break
    return textoGenerado

def obtenerEnteroPositivo(mensaje, valorDefecto):
    while True:
        entrada = input(mensaje)
        if entrada.strip() == '':
            return valorDefecto
        try:
            valor = int(entrada)
            if valor > 0:
                return valor
            else:
                print("Debe ser un número positivo.")
        except ValueError:
            print("Entrada no válida. Intenta de nuevo.")

def obtenerFlotanteRango(mensaje, valorDefecto, minimo, maximo):
    while True:
        entrada = input(mensaje)
        if entrada.strip() == '':
            return valorDefecto
        try:
            valor = float(entrada)
            if minimo <= valor <= maximo:
                return valor
            else:
                print(f"Debe estar entre {minimo} y {maximo}.")
        except ValueError:
            print("Entrada no válida. Intenta de nuevo.")

def main():
    ubicacionCorpus = 'cuentos.txt'
    print("Configuración de parámetros (presiona Enter para usar valor por defecto):")
    longitudSecuencia = obtenerEnteroPositivo("Ingresa la longitud de secuencia (defecto: 12): ", 12)
    epocas = obtenerEnteroPositivo("Ingresa el número de épocas (defecto: 50): ", 50)
    temperatura = obtenerFlotanteRango("Ingresa la temperatura (defecto: 0.6, rango 0.4-0.7): ", 0.6, 0.4, 0.7)
    cuentos = cargarCorpus(ubicacionCorpus)
    tokenizador, palabrasTotales, datosEntrada, datosSalida = preprocesarTexto(cuentos, longitudSecuencia)
    modelo = construirModelo(palabrasTotales, longitudSecuencia)
    entrenarModelo(modelo, datosEntrada, datosSalida, epocas)
    while True:
        textoSemilla = input("Ingresa las primeras palabras del cuento (o 'salir' para terminar): ")
        if textoSemilla.lower() == 'salir':
            break
        cuentoGenerado = generarCuento(modelo, tokenizador, textoSemilla, longitudSecuencia, temperatura)
        print("Cuento generado:", cuentoGenerado)

if __name__ == "__main__":
    main()