import nltk
from nltk.tokenize import word_tokenize
nltk.download('punkt')
nltk.download('punkt_tab')

def desencriptar_cesar(texto, desplazamiento):
    resultado = ""
    for char in texto:
        if char.isalpha():
            ascii_base = ord('A') if char.isupper() else ord('a')
            nuevo_char = chr((ord(char) - ascii_base + desplazamiento) % 26 + ascii_base)
            resultado += nuevo_char
        else:
            resultado += char
    return resultado

mensaje = "TI TCH LM TI TCVI JZQTTI UIA YCM TI VQMJTI"
desplazamiento = -8
palabras = word_tokenize(mensaje, language='spanish')

mensaje_desencriptado = []
for palabra in palabras:
    palabra_desencriptada = desencriptar_cesar(palabra, desplazamiento)
    mensaje_desencriptado.append(palabra_desencriptada)

for i, palabra in enumerate(mensaje_desencriptado):
    print(f"Palabra {i+1}: {palabra}")

print("Mensaje completo:", " ".join(mensaje_desencriptado))