import os
from pathlib import Path

def limpiar_contenido(texto):
    """
    Recibe el contenido de un .txt (como string) y devuelve solo las primeras 20 líneas.
    Elimina la línea 21 (solo un espacio) y la 22 (vacía).
    """
    lineas = texto.strip().split('\n')
    # Tomamos solo las primeras 20 líneas (índices 0 a 19)
    lineas_limpias = lineas[:20]
    return '\n'.join(lineas_limpias).strip()

def main():
    # Ruta actual (donde está el tree)
    raiz = Path('.')
    
    # Archivo de salida
    salida_path = raiz / 'conjunto.txt'
    
    # Lista para almacenar entradas procesadas
    entradas = []
    
    # Recorrer todas las subcarpetas
    for carpeta in raiz.iterdir():
        if not carpeta.is_dir():
            continue
        
        txt_path = carpeta / 'cuentos_generados.txt'
        if not txt_path.exists():
            continue
        
        # Leer y limpiar contenido
        with open(txt_path, 'r', encoding='utf-8') as f:
            contenido_original = f.read()
        
        contenido_limpio = limpiar_contenido(contenido_original)
        
        # Nombre del archivo con ruta relativa
        nombre_archivo = f"{carpeta.name}/cuentos_generados.txt"
        
        # Construir bloque
        bloque = f"{nombre_archivo}:\n[{contenido_limpio}]\n\ncalificación: \n\n---\n"
        entradas.append(bloque)
    
    # Escribir todo en conjunto.txt
    with open(salida_path, 'w', encoding='utf-8') as salida:
        for bloque in entradas:
            salida.write(bloque)
    
    print(f"¡Listo! Se generó '{salida_path}' con {len(entradas)} entradas.")

if __name__ == "__main__":
    main()