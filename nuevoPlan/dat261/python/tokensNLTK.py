from nltk.tokenize import word_tokenize

with open('textoBBC.txt', 'r', encoding='utf-8') as archivo:
    texto = archivo.read()

palabras = word_tokenize(texto)
print(palabras)

