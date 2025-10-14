import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.svm import SVC
import nltk
from nltk.corpus import stopwords
import re

# Descarga stopwords si no las tienes (ejecuta una vez)
# nltk.download('stopwords')
stop_words_es = stopwords.words('spanish')

# Función para limpiar texto
def clean_text(text):
    text = re.sub(r'http\S+', '', text)  # Remover URLs
    text = re.sub(r'@\w+', '', text)     # Remover menciones
    text = re.sub(r'[^\w\s]', '', text)  # Remover puntuación
    text = text.lower()                  # Minúsculas
    return text

# Cargar el CSV con las etiquetas (asumiendo que existe 'tweets.csv')
df = pd.read_csv('tweets.csv')

# Limpiar los textos
df['text_clean'] = df['text'].apply(clean_text)

# Mapear labels a números (positive=1, negative=0)
df['label_num'] = df['label'].map({'positive': 1, 'negative': 0})

# Vectorización con TF-IDF (entrenar en todos los datos)
vectorizer = TfidfVectorizer(stop_words=stop_words_es, max_features=5000)
X = vectorizer.fit_transform(df['text_clean'])
y = df['label_num']

# Entrenar SVM lineal en todos los datos (para predicción)
model = SVC(kernel='linear', C=1.0)
model.fit(X, y)

# Pedir input al usuario
user_input = input("Ingresa un tweet o frase para analizar el sentimiento: ")

# Limpiar el input
clean_input = clean_text(user_input)

# Vectorizar el input
X_input = vectorizer.transform([clean_input])

# Predecir
prediction = model.predict(X_input)[0]

# Mapear de vuelta a etiqueta
sentiment = 'positive' if prediction == 1 else 'negative'

# Mostrar resultado
print(f"El sentimiento de la frase es: {sentiment}")