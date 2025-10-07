import spacy
from nltk.corpus import stopwords
from nltk.stem import SnowballStemmer
import re
import unidecode

nlp = spacy.load('en_core_web_sm')

with open('textoBBC.txt', 'r', encoding='utf-8') as archivo:
    texto = archivo.read()

textoNormalizado = texto.lower()
textoNormalizado = unidecode.unidecode(textoNormalizado)
textoNormalizado = re.sub(r'[^\w\s]', '', textoNormalizado)
textoNormalizado = re.sub(r'\d+', '', textoNormalizado)
textoNormalizado = ' '.join(textoNormalizado.split())

doc = nlp(textoNormalizado)
palabrasFiltradas = [token.text for token in doc if not token.is_space and token.text not in stopwords.words('english')]

stemmer = SnowballStemmer('english')
palabrasStemmed = [stemmer.stem(palabra) for palabra in palabrasFiltradas]

palabrasLemmatized = [token.lemma_ for token in doc if not token.is_space and token.text not in stopwords.words('english')]

print("Tokens (Stemming):")
print(palabrasStemmed[:50] + ['...'])
print("Tokens (Lematización):")
for token in palabrasLemmatized[:50]:
    print(token)
print('...')