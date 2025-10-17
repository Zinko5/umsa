import pandas as pd
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

print(f"Porcentaje de reseñas positivas: {porcentajePositivos:.2f}%")
print(f"Porcentaje de reseñas negativas: {porcentajeNegativos:.2f}%")

if 45 <= porcentajePositivos <= 55:
    clasificacionGeneral = "neutra"
elif porcentajePositivos > 55:
    clasificacionGeneral = "positivo"
else:
    clasificacionGeneral = "negativo"

print(f"La clasificación general del debate es: {clasificacionGeneral}")

vectorizador = TfidfVectorizer()
textosVectorizados = vectorizador.fit_transform(datos['text'])

modelo = SVC(kernel='linear')
modelo.fit(textosVectorizados, datos['label'])

# Convertir coeficientes a array de NumPy
coeficientes = modelo.coef_.toarray()[0]
nombresCaracteristicas = vectorizador.get_feature_names_out()

palabrasPositivas = [nombresCaracteristicas[i] for i in np.argsort(coeficientes)[-10:][::-1]]
palabrasNegativas = [nombresCaracteristicas[i] for i in np.argsort(coeficientes)[:10]]

print("Las 10 palabras más positivas:", palabrasPositivas)
print("Las 10 palabras más negativas:", palabrasNegativas)