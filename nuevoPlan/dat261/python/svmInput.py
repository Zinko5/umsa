import pandas as pd
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

textoNuevo = input("Ingrese un texto nuevo para clasificar: ")
textoNuevoLimpio = limpiarTexto(textoNuevo)
textoNuevoVectorizado = vectorizador.transform([textoNuevoLimpio])
probabilidadPositiva = modelo.predict_proba(textoNuevoVectorizado)[0][1]

if 0.45 < probabilidadPositiva < 0.55:
    resultado = "neutra"
elif probabilidadPositiva >= 0.55:
    resultado = "positivo"
else:
    resultado = "negativo"

print(f"La clasificación del texto es: {resultado}")