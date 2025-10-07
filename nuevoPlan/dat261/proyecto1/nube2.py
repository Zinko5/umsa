import pandas as pd
import re
from unidecode import unidecode
from wordcloud import WordCloud
import matplotlib.pyplot as plt
import os
from nltk.corpus import stopwords
import nltk

nltk.download('stopwords')

# Obtener stopwords en español y normalizarlas (quitar acentos)
stop_words_es = set(unidecode(word) for word in stopwords.words('spanish'))

# Agregar palabras adicionales irrelevantes comunes en noticias (verbos de reporte, etc.)
custom_stops = [
    'dijo', 'aseguro', 'declaro', 'comento', 'senalo', 'expreso', 'manifesto',
    'agrego', 'indico', 'afirmo', 'asi', 'ademas', 'bolivia', 'candidato', 'pais', 'elecciones', 'gobierno'
]
stop_words_es.update(custom_stops)

# Definir nombres de candidatos y variaciones a excluir (en minúsculas)
candidatos_nombres = {
    'Rodrigo Paz': ['rodrigo', 'paz', 'rodrigo paz'],
    'Edman Lara': ['edman', 'lara', 'edman lara'],
    'Tuto Quiroga': ['tuto', 'quiroga', 'tuto quiroga'],
    'JP Velasco': ['jp', 'velasco', 'juan', 'pablo', 'juan pablo', 'pablo velasco', 'jp velasco']
}

# Todos los nombres para la nube global
all_nombres = set()
for nombres in candidatos_nombres.values():
    all_nombres.update(nombres)

def limpiar_texto(texto):
    if not isinstance(texto, str):
        return ""
    texto = texto.lower()
    texto = unidecode(texto)
    texto = re.sub(r'[^a-z\s]', '', texto)  # Elimina puntuación y números
    texto = ' '.join([word for word in texto.split() if word not in stop_words_es])  # Elimina stopwords y custom
    return texto

def filtrar_nombres(texto, exclude_nombres):
    words = texto.split()
    filtered_words = [word for word in words if word not in exclude_nombres]
    return ' '.join(filtered_words)

def generar_nube(texto_combinado, titulo, archivo_salida, exclude_nombres=set()):
    if not texto_combinado.strip():
        print(f"No hay texto para {titulo}")
        return
    texto_filtrado = filtrar_nombres(texto_combinado, exclude_nombres)
    wordcloud = WordCloud(width=800, height=400, background_color='white', max_words=100).generate(texto_filtrado)
    plt.figure(figsize=(10, 5))
    plt.imshow(wordcloud, interpolation='bilinear')
    plt.title(titulo)
    plt.axis('off')
    plt.savefig(archivo_salida, bbox_inches='tight')
    plt.close()
    print(f"Nube generada: {archivo_salida}")

def main(archivo_csv):
    df = pd.read_csv(archivo_csv, encoding='utf-8')
    df['texto_limpio'] = df['Texto'].apply(limpiar_texto)
    
    os.makedirs('nubes_palabras', exist_ok=True)
    
    # Nube global (todo el corpus, excluyendo todos los nombres)
    texto_global = ' '.join(df['texto_limpio'])
    generar_nube(texto_global, 'Nube de Palabras - Todo el Corpus', 'nubes_palabras/global.png', exclude_nombres=all_nombres)
    
    # Por candidato
    candidatos = df['Candidato'].unique()
    meses = ['Junio', 'Julio', 'Agosto', 'Septiembre']  # Asegúrate de que coincidan con tu CSV (case-sensitive)
    
    for candidato in candidatos:
        df_cand = df[df['Candidato'] == candidato]
        texto_general = ' '.join(df_cand['texto_limpio'])
        exclude = set(candidatos_nombres.get(candidato, []))
        generar_nube(texto_general, f'Nube de Palabras - {candidato} (General)', f'nubes_palabras/{candidato}_general.png', exclude_nombres=exclude)
        
        for mes in meses:
            df_mes = df_cand[df_cand['Mes'] == mes]
            texto_mes = ' '.join(df_mes['texto_limpio'])
            generar_nube(texto_mes, f'Nube de Palabras - {candidato} ({mes})', f'nubes_palabras/{candidato}_{mes}.png', exclude_nombres=exclude)

if __name__ == "__main__":
    main('noticias.csv')  # Cambia a 'noticiasPrueba.csv' o el nombre exacto de tu archivo
