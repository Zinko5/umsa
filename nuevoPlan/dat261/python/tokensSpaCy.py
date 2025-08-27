import spacy
nlp = spacy.blank("en")

with open('textoBBC.txt', 'r', encoding='utf-8') as archivo:
    texto = archivo.read()

doc = nlp(texto)

for token in doc:
    print(token)