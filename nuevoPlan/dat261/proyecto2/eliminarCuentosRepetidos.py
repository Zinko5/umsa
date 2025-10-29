def eliminar_duplicados(input_file, output_file=None):
    """
    Elimina líneas duplicadas manteniendo el orden original y preservando líneas vacías.
    
    Args:
        input_file (str): Ruta del archivo de entrada.
        output_file (str, optional): Ruta del archivo de salida. 
                                    Si no se especifica, sobrescribe el original.
    """
    # Usamos un conjunto para rastrear líneas ya vistas
    lineas_vistas = set()
    lineas_unicas = []
    
    # Leer el archivo
    with open(input_file, 'r', encoding='utf-8') as f:
        for linea in f:
            # Comparar la línea completa (incluyendo \n al final, pero no lo necesitamos)
            # Usamos .rstrip('\n') para comparar solo el contenido, pero preservamos el \n al guardar
            contenido = linea.rstrip('\n')
            
            if contenido not in lineas_vistas:
                lineas_vistas.add(contenido)
                lineas_unicas.append(linea)  # Guardamos la línea original con su \n
    
    # Escribir el resultado
    output = output_file if output_file else input_file
    with open(output, 'w', encoding='utf-8') as f:
        f.writelines(lineas_unicas)
    
    print(f"Archivo procesado. Líneas únicas guardadas en: {output}")
    print(f"   - Líneas originales: {len(lineas_vistas) + (sum(1 for _ in open(input_file, 'r', encoding='utf-8')) - len(lineas_unicas))}")
    print(f"   - Líneas únicas: {len(lineas_unicas)}")

# === USO ===
if __name__ == "__main__":
    eliminar_duplicados('cuentosMuyLargo.txt')  # Sobrescribe el original
    # eliminar_duplicados('cuentosMuyLargo.txt', 'cuentosMuyLargo_sin_duplicados.txt')  # Guarda en otro archivo