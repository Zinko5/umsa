import tensorflow as tf
import numpy as np
from tensorflow.keras.preprocessing.text import Tokenizer
from tensorflow.keras.preprocessing.sequence import pad_sequences
from tensorflow.keras.layers import Embedding, LSTM, Dense, Dropout
from tensorflow.keras.callbacks import EarlyStopping
import os

def cargarCorpus(ubicacionArchivo):
    """Carga cuentos separados por doble salto de línea, en minúsculas y con punto final."""
    with open(ubicacionArchivo, 'r', encoding='utf-8') as archivo:
        texto = archivo.read().lower()
    # Separar por doble salto de línea
    cuentos = [c.strip() for c in texto.split('\n\n') if c.strip()]
    # Filtrar solo los que terminan en punto
    cuentos = [c for c in cuentos if c.endswith('.')]
    return cuentos

def preprocesarTexto(cuentos, longitudSecuencia):
    tokenizador = Tokenizer(filters='!"#$%&()*+,-/:;<=>?@[\\]^_`{|}~\t\n', lower=True)
    tokenizador.fit_on_texts(cuentos)
    palabrasTotales = len(tokenizador.word_index) + 1
    
    secuenciasEntrada = []
    for cuento in cuentos:
        tokens = cuento.split()
        for i in range(1, len(tokens)):
            secuencia = tokens[:i+1]
            secuenciasEntrada.append(' '.join(secuencia))
    
    secuenciasTokenizadas = tokenizador.texts_to_sequences(secuenciasEntrada)
    secuenciasRellenas = pad_sequences(secuenciasTokenizadas, maxlen=longitudSecuencia, padding='pre')
    
    datosEntrada = secuenciasRellenas[:, :-1]  # Todo menos la última palabra
    datosSalida = secuenciasRellenas[:, -1]    # La palabra a predecir
    
    return tokenizador, palabrasTotales, datosEntrada, datosSalida

def construirModelo(palabrasTotales, longitudSecuencia):
    modelo = tf.keras.Sequential([
        Embedding(palabrasTotales, 128, input_length=longitudSecuencia-1),
        LSTM(256, return_sequences=True),
        Dropout(0.4),
        LSTM(128),
        Dropout(0.4),
        Dense(palabrasTotales, activation='softmax')
    ])
    modelo.compile(loss='sparse_categorical_crossentropy', optimizer='adam', metrics=['accuracy'])
    return modelo

def entrenarModelo(modelo, datosEntrada, datosSalida, epocas):
    early_stop = EarlyStopping(monitor='loss', patience=8, restore_best_weights=True, verbose=1)
    modelo.fit(datosEntrada, datosSalida, epochs=epocas, verbose=1, callbacks=[early_stop])
    return modelo

def generarCuento(modelo, tokenizador, textoSemilla, longitudSecuencia, temperatura, max_palabras=20):
    textoGenerado = textoSemilla.strip().lower()
    palabrasCierre = {'pueblo', 'reino', 'hogar', 'mágica', 'salvo', 'encantada', 'siempre', 'aventuras', 'niño', 'estrellas', 'casa', 'hogar', 'altas', 'épicas', 'dragones', 'heroicos'}
    
    for _ in range(max_palabras):
        # Tokenizar entrada actual
        listaTokens = tokenizador.texts_to_sequences([textoGenerado])
        if not listaTokens or not listaTokens[0]:
            break
        listaTokens = pad_sequences([listaTokens[0]], maxlen=longitudSecuencia-1, padding='pre')
        
        # Predecir
        prediccion = modelo.predict(listaTokens, verbose=0)[0]
        
        # Aplicar temperatura
        prediccion = np.log(prediccion + 1e-10) / temperatura
        prediccion = np.exp(prediccion) / np.sum(np.exp(prediccion))
        
        # Muestreo
        indicePredicho = np.random.choice(len(prediccion), p=prediccion)
        palabraPredicha = tokenizador.index_word.get(indicePredicho, '')
        
        if not palabraPredicha:
            break
            
        textoGenerado += " " + palabraPredicha
        
        # Cierre natural
        if palabraPredicha in palabrasCierre and len(textoGenerado.split()) >= 8:
            if palabraPredicha in ['salvo', 'reino', 'casa', 'hogar', 'pueblo']:
                textoGenerado += "."
            break
    
    # Asegurar que termine con punto
    if not textoGenerado.endswith('.'):
        textoGenerado += "."
    
    return textoGenerado.strip().capitalize()

def main():
    ubicacionCorpus = 'cuentos.txt'
    
    # === PARÁMETROS ÓPTIMOS ===
    longitudSecuencia = 15
    epocas = 50
    temperatura = 0.6
    
    print(f"\nUsando: longitudSecuencia={longitudSecuencia}, épocas={epocas}, temperatura={temperatura}\n")
    
    cuentos = cargarCorpus(ubicacionCorpus)
    if not cuentos:
        print("Error: No se encontraron cuentos válidos en el archivo.")
        return
    
    print(f"{len(cuentos)} cuentos cargados. Ejemplo:")
    print(f"  → {cuentos[0][:60]}...\n")
    
    tokenizador, palabrasTotales, datosEntrada, datosSalida = preprocesarTexto(cuentos, longitudSecuencia)
    modelo = construirModelo(palabrasTotales, longitudSecuencia)
    
    print("Entrenando modelo...")
    modelo = entrenarModelo(modelo, datosEntrada, datosSalida, epocas)
    
    print("\n" + "="*60)
    print("GENERADOR DE CUENTOS MÁGICOS")
    print("="*60)
    
    while True:
        textoSemilla = input("\nIngresa las primeras palabras (o 'salir'): ").strip()
        if textoSemilla.lower() == 'salir':
            print("¡Hasta la próxima aventura!")
            break
        if not textoSemilla:
            print("Por favor, ingresa al menos una palabra.")
            continue
            
        cuento = generarCuento(modelo, tokenizador, textoSemilla, longitudSecuencia, temperatura)
        print(f"\n→ {cuento}\n")

if __name__ == "__main__":
    main()