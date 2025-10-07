import pandas as pd
import numpy as np
import seaborn as sns
import re
from unidecode import unidecode
from vaderSentiment.vaderSentiment import SentimentIntensityAnalyzer
import matplotlib
matplotlib.use('TkAgg')
import matplotlib.pyplot as plt
plt.style.use('ggplot')
plt.rcParams['figure.figsize'] = (14, 8)
plt.rcParams['font.size'] = 12
sns.set_palette("viridis")

# Analizador de sentimientos (VADER)
analizador = SentimentIntensityAnalyzer()

# Diccionario de tipos de discurso
tipos_discurso = {
    "Populista": ["pueblo", "ricos", "elite", "corrupcion", "oligarquia"],
    "Técnico": ["ley", "propuesta", "economia", "infraestructura", "impuesto", "desarrollo"],
    "Emotivo": ["esperanza", "futuro", "patria", "sueño", "confianza", "hermoso", "mejor"],
    "Ataque": ["enemigo", "traidor", "fracaso", "mentira", "corrupto", "mal"],
    "Unidad": ["hermanos", "juntos", "unidos", "consenso", "alianza", "paz"]
}


def cargar_y_preparar_datos(archivo_csv):
    try:
        # Asegurar encabezados
        df = pd.read_csv(
            archivo_csv,
            encoding='utf-8',
            header=0,
            names=['Candidato', 'Mes', 'Texto']
        )
        print(f"✅ Datos cargados: {len(df)} registros")
        print(f"✅ Candidatos encontrados: {df['Candidato'].unique().tolist()}")
        return df
    except Exception as e:
        print(f"❌ Error al cargar el archivo: {e}")
        return None


def limpiar_texto(texto):
    if not isinstance(texto, str) or pd.isna(texto):
        return ""
    texto = texto.lower()
    texto = unidecode(texto)
    texto = re.sub(r'[^a-zA-Z\s]', '', texto)
    texto = re.sub(r'\s+', ' ', texto).strip()
    return texto


def analizar_sentimiento_vader(texto):
    try:
        if not texto or len(texto.strip()) < 10:
            return 0
        resultado = analizador.polarity_scores(texto)
        return resultado['compound']
    except Exception as e:
        print(f"Error analizando texto: {e}")
        return 0


def clasificar_sentimiento(polaridad):
    if polaridad >= 0.05:
        return 'Positivo'
    elif polaridad <= -0.05:
        return 'Negativo'
    else:
        return 'Neutral'


def detectar_discurso(texto):
    conteo = {categoria: 0 for categoria in tipos_discurso.keys()}
    for categoria, palabras in tipos_discurso.items():
        for palabra in palabras:
            if palabra in texto:
                conteo[categoria] += 1
    if max(conteo.values()) == 0:
        return "General"
    return max(conteo, key=conteo.get)


def visualizar_resultados(df):
    fig, axes = plt.subplots(1, 2, figsize=(16, 6))

    # Gráfico de sentimientos
    conteo_sentimientos = df.groupby(['Candidato', 'Sentimiento']).size().unstack(fill_value=0)
    conteo_sentimientos.plot(kind='bar', stacked=True, ax=axes[0])
    axes[0].set_title('Distribución de Sentimientos por Candidato')
    axes[0].set_ylabel('Cantidad de frases')
    axes[0].tick_params(axis='x', rotation=45)

    # Gráfico de tipos de discurso
    conteo_discurso = df.groupby(['Candidato', 'Discurso']).size().unstack(fill_value=0)
    conteo_discurso.plot(kind='bar', stacked=True, ax=axes[1])
    axes[1].set_title('Distribución de Tipos de Discurso por Candidato')
    axes[1].set_ylabel('Cantidad de frases')
    axes[1].tick_params(axis='x', rotation=45)

    plt.tight_layout()
    plt.show()



def main(archivo_csv):
    print("🔍 Iniciando análisis de campañas presidenciales...")

    # 1. Cargar datos
    df = cargar_y_preparar_datos(archivo_csv)
    if df is None:
        return

    # 2. Limpiar texto
    print("🧹 Limpiando texto...")
    df['texto_limpio'] = df['Texto'].apply(limpiar_texto)

    # 3. Analizar sentimiento
    print("📊 Analizando sentimiento con VADER...")
    df['Polaridad'] = df['texto_limpio'].apply(analizar_sentimiento_vader)
    df['Sentimiento'] = df['Polaridad'].apply(clasificar_sentimiento)

    # 4. Detectar discurso
    print("🗣️ Clasificando tipo de discurso...")
    df['Discurso'] = df['texto_limpio'].apply(detectar_discurso)

    # 5. Visualizar
    print("🎨 Generando visualizaciones...")
    visualizar_resultados(df)

    # 6. Guardar resultados
    df.to_csv('resultados_analisis_discurso.csv', index=False, encoding='utf-8')
    print(f"\n💾 Resultados guardados en 'resultados_analisis_discurso.csv'")

    return df


# Ejecutar análisis
if __name__ == "__main__":
    archivo = 'noticias2.csv'
    resultados_df = main(archivo)
