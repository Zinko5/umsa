import sys
import re
import os

def extraer_ultimas_palabras(archivo_entrada):
    # Leer el archivo
    with open(archivo_entrada, 'r', encoding='utf-8') as f:
        contenido = f.read()

    # Separar por dos saltos de línea
    cuentos = [c.strip() for c in contenido.split('\n\n') if c.strip()]

    ultimas_palabras = []

    for cuento in cuentos:
        # Eliminar posibles puntos, comas, etc. al final y dividir en palabras
        palabras = re.findall(r'\b\w+\b', cuento)
        if palabras:
            ultima = palabras[-1]
            ultimas_palabras.append(ultima)

    # Generar nombre del archivo de salida
    nombre_base = os.path.splitext(archivo_entrada)[0]
    archivo_salida = f"{nombre_base}Ultimas.txt"

    # Escribir resultado
    with open(archivo_salida, 'w', encoding='utf-8') as f:
        linea = ", ".join(f"'{palabra}'" for palabra in ultimas_palabras)
        f.write(linea + '\n')

    print(f"Archivo generado: {archivo_salida}")
    print(f"Total de palabras extraídas: {len(ultimas_palabras)}")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Uso: python extraer_ultimas.py <nombre_archivo.txt>")
        sys.exit(1)

    archivo = sys.argv[1]
    if not os.path.exists(archivo):
        print(f"Error: El archivo '{archivo}' no existe.")
        sys.exit(1)

    extraer_ultimas_palabras(archivo)