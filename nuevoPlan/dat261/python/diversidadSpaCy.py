import spacy

nlp = spacy.blank("en")

with open('textoBBC.txt', 'r', encoding='utf-8') as archivo:
    texto = archivo.read()

doc = nlp(texto.lower())

Tokens = [token.text for token in doc if not token.is_space]

tipos = set(Tokens)

tokens = len(Tokens)
ttr = len(tipos) / tokens if tokens > 0 else 0

print(f"Tipos: {len(tipos)}")
print(f"Tokens: {tokens}")
print(f"Diversidad léxica: {ttr:.4f}")