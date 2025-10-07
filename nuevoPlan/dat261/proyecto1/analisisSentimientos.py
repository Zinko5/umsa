import pandas as pd
import numpy as np
import seaborn as sns
from datetime import datetime
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
analizador = SentimentIntensityAnalyzer()


def cargar_y_preparar_datos(archivo_csv):
    try:
        df = pd.read_csv(archivo_csv, encoding='utf-8')
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


def mapear_mes_a_numero(mes_str):
    meses = {
        'enero': 1, 'febrero': 2, 'marzo': 3, 'abril': 4,
        'mayo': 5, 'junio': 6, 'julio': 7, 'agosto': 8,
        'septiembre': 9, 'octubre': 10, 'noviembre': 11, 'diciembre': 12
    }
    return meses.get(mes_str.lower().strip(), 0)


def analizar_por_candidato_y_mes(df):
    resultados = {}
    for candidato in df['Candidato'].unique():
        df_candidato = df[df['Candidato'] == candidato].copy()
        polaridad_por_mes = df_candidato.groupby('Mes')['polaridad'].agg(['mean', 'count', 'std'])
        polaridad_por_mes = polaridad_por_mes.round(3)
        resultados[candidato] = {
            'total_noticias': len(df_candidato),
            'polaridad_promedio': df_candidato['polaridad'].mean(),
            'por_mes': polaridad_por_mes
        }
    return resultados


def visualizar_resultados(df, resultados_analisis):
    fig, axes = plt.subplots(2, 2, figsize=(16, 12))
    polaridad_candidatos = df.groupby('Candidato')['polaridad'].mean().sort_values()
    bars = axes[0, 0].barh(polaridad_candidatos.index, polaridad_candidatos.values)
    axes[0, 0].set_title('Polaridad Promedio por Candidato')
    axes[0, 0].set_xlabel('Polaridad Promedio (VADER)')
    axes[0, 0].axvline(x=0, color='red', linestyle='--', alpha=0.7)
    for bar in bars:
        width = bar.get_width()
        axes[0, 0].text(width, bar.get_y() + bar.get_height() / 2,
                        f'{width:.3f}', ha='left', va='center')
    conteo_sentimientos = df.groupby(['Candidato', 'sentimiento']).size().unstack(fill_value=0)
    conteo_sentimientos.plot(kind='bar', stacked=True, ax=axes[0, 1])
    axes[0, 1].set_title('Distribución de Sentimientos por Candidato')
    axes[0, 1].set_ylabel('Cantidad de Noticias')
    axes[0, 1].tick_params(axis='x', rotation=45)
    axes[0, 1].legend(title='Sentimiento')
    for candidato in df['Candidato'].unique():
        df_candidato = df[df['Candidato'] == candidato].copy()
        if len(df_candidato) > 1:
            df_candidato['mes_num'] = df_candidato['Mes'].apply(mapear_mes_a_numero)
            df_ordenado = df_candidato.sort_values('mes_num')
            axes[1, 0].plot(df_ordenado['Mes'], df_ordenado['polaridad'],
                            marker='o', label=candidato, linewidth=2)
    axes[1, 0].set_title('Evolución de Polaridad por Mes')
    axes[1, 0].set_xlabel('Mes')
    axes[1, 0].set_ylabel('Polaridad Promedio')
    axes[1, 0].axhline(y=0, color='red', linestyle='--', alpha=0.7)
    axes[1, 0].legend()
    axes[1, 0].tick_params(axis='x', rotation=45)
    try:
        heatmap_data = df.pivot_table(values='polaridad', index='Candidato',
                                      columns='Mes', aggfunc='mean')
        sns.heatmap(heatmap_data, annot=True, cmap='RdBu_r', center=0,
                    ax=axes[1, 1], cbar_kws={'label': 'Polaridad'})
        axes[1, 1].set_title('Heatmap: Polaridad por Candidato y Mes')
    except:
        axes[1, 1].text(0.5, 0.5, 'Heatmap no disponible\n(datos insuficientes)',
                        ha='center', va='center', transform=axes[1, 1].transAxes)
        axes[1, 1].set_title('Heatmap: Polaridad por Candidato y Mes')

    plt.tight_layout()
    plt.show()


def analizar_palabras_clave_por_candidato(df, palabras_clave):
    resultados = {}
    for candidato in df['Candidato'].unique():
        df_candidato = df[df['Candidato'] == candidato]
        resultados_candidato = {}
        for palabra in palabras_clave:
            mascara = df_candidato['texto_limpio'].str.contains(palabra, case=False, na=False)
            noticias_filtradas = df_candidato[mascara]
            if len(noticias_filtradas) > 0:
                resultados_candidato[palabra] = {
                    'cantidad': len(noticias_filtradas),
                    'polaridad_promedio': noticias_filtradas['polaridad'].mean(),
                    'porcentaje': (len(noticias_filtradas) / len(df_candidato)) * 100
                }
        resultados[candidato] = resultados_candidato
    return resultados


def generar_reporte(resultados_analisis, palabras_clave_analisis):
    print("=" * 60)
    print("📊 REPORTE DE ANÁLISIS DE CAMPAÑAS PRESIDENCIALES")
    print("=" * 60)
    for candidato, datos in resultados_analisis.items():
        print(f"\n🎯 CANDIDATO: {candidato}")
        print(f"   📰 Total de noticias analizadas: {datos['total_noticias']}")
        print(f"   📈 Polaridad promedio: {datos['polaridad_promedio']:.3f}")
        if not datos['por_mes'].empty:
            print(f"   📅 Análisis por mes:")
            for mes, fila in datos['por_mes'].iterrows():
                print(f"      • {mes}: {fila['mean']:.3f} (n={fila['count']})")
        if candidato in palabras_clave_analisis:
            print(f"   🔍 Palabras clave relevantes:")
            for palabra, datos_palabra in palabras_clave_analisis[candidato].items():
                print(f"      • '{palabra}': {datos_palabra['cantidad']} menciones, "
                      f"polaridad: {datos_palabra['polaridad_promedio']:.3f}")


# EJECUCIÓN PRINCIPAL
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
    df['polaridad'] = df['texto_limpio'].apply(analizar_sentimiento_vader)
    df['sentimiento'] = df['polaridad'].apply(clasificar_sentimiento)

    # 4. Analizar por candidato y mes
    print("📈 Analizando tendencias...")
    resultados_analisis = analizar_por_candidato_y_mes(df)

    # 5. Analizar palabras clave
    palabras_clave = ['eleccion', 'voto', 'democracia', 'poder', 'gobierno', 'pais', 'ley', 'partido', 'presidente', 'vicepresidente', 'propuesta','presidencia']
    palabras_clave_analisis = analizar_palabras_clave_por_candidato(df, palabras_clave)

    # 6. Visualizar resultados
    print("🎨 Generando y mostrando visualizaciones...")
    visualizar_resultados(df, resultados_analisis)

    # 7. Generar reporte
    print("📝 Generando reporte textual...")
    generar_reporte(resultados_analisis, palabras_clave_analisis)

    # 8. Guardar resultados
    df.to_csv('resultados_analisis_detallado.csv', index=False, encoding='utf-8')
    print(f"\n💾 Resultados guardados en 'resultados_analisis_detallado.csv'")

    return df, resultados_analisis


# Ejecutar análisis
if __name__ == "__main__":
    archivo = 'noticiasPrueba.csv'
    resultados_df, analisis_completo = main(archivo)