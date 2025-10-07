from nltk.tokenize import word_tokenize
from nltk.corpus import stopwords
from nltk.stem import SnowballStemmer
from nltk.stem import WordNetLemmatizer
import re
import unidecode

with open('textoBBC.txt', 'r', encoding='utf-8') as archivo:
    texto = archivo.read()

textoNormalizado = texto.lower()
textoNormalizado = unidecode.unidecode(textoNormalizado)
textoNormalizado = re.sub(r'[^\w\s]', '', textoNormalizado)
textoNormalizado = re.sub(r'\d+', '', textoNormalizado)
textoNormalizado = ' '.join(textoNormalizado.split())

palabras = word_tokenize(textoNormalizado)
palabrasFiltradas = [palabra for palabra in palabras if palabra not in stopwords.words('english')]

stemmer = SnowballStemmer('english')
palabrasStemmed = [stemmer.stem(palabra) for palabra in palabrasFiltradas]

lemmatizer = WordNetLemmatizer()
palabrasLemmatized = [lemmatizer.lemmatize(palabra) for palabra in palabrasFiltradas]

print("Tokens (Stemming):")
print(palabrasStemmed[:50] + ['...'])
print("Tokens (Lematización):")
print(palabrasLemmatized[:50] + ['...'])