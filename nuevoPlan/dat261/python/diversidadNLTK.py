import nltk
from nltk.tokenize import word_tokenize

with open('textoBBC.txt', 'r', encoding='utf-8') as archivo:
    texto = archivo.read()

Tokens = word_tokenize(texto.lower())

tipos = set(Tokens)

tokens = len(Tokens)

ttr = len(tipos) / tokens if tokens > 0 else 0

print(f"Tipos: {len(tipos)}")
print(f"Tokens: {tokens}")
print(f"Diversidad léxica: {ttr:.4f}")