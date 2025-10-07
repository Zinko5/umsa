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

tiposStemmed = set(palabrasStemmed)
tokensStemmed = len(palabrasStemmed)
diversidadLexicaStemmed = len(tiposStemmed) / tokensStemmed if tokensStemmed > 0 else 0

tiposLemmatized = set(palabrasLemmatized)
tokensLemmatized = len(palabrasLemmatized)
diversidadLexicaLemmatized = len(tiposLemmatized) / tokensLemmatized if tokensLemmatized > 0 else 0

print(f"Tipos (Stemming): {len(tiposStemmed)}")
print(f"Tokens (Stemming): {tokensStemmed}")
print(f"Diversidad léxica (Stemming): {diversidadLexicaStemmed:.4f}")
print(f"Tipos (Lematización): {len(tiposLemmatized)}")
print(f"Tokens (Lematización): {tokensLemmatized}")
print(f"Diversidad léxica (Lematización): {diversidadLexicaLemmatized:.4f}")