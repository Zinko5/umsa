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
    "Ataque": ["enemigo", "traidor", "fracaso", "mentira", "corrupto", "mal", "abusivos"],
    "Unidad": ["hermanos", "juntos", "unidos", "consenso", "alianza", "paz", "bueno", "lograr"]
}


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


def detectar_discurso(texto):
    conteo = {categoria: 0 for categoria in tipos_discurso.keys()}
    for categoria, palabras in tipos_discurso.items():
        for palabra in palabras:
            if palabra in texto:
                conteo[categoria] += 1
    if max(conteo.values()) == 0:
        return "General"
    return max(conteo, key=conteo.get)


def analizar_por_candidato_y_mes(df):
    resultados = {}
    for candidato in df['Candidato'].unique():
        df_candidato = df[df['Candidato'] == candidato].copy()
        polaridad_por_mes = df_candidato.groupby('Mes')['Polaridad'].agg(['mean', 'count', 'std'])
        polaridad_por_mes = polaridad_por_mes.round(3)
        resultados[candidato] = {
            'total_noticias': len(df_candidato),
            'polaridad_promedio': df_candidato['Polaridad'].mean(),
            'por_mes': polaridad_por_mes
        }
    return resultados


def visualizar_resultados(df):
    # Gráfica 1: Polaridad Promedio por Candidato
    plt.figure(figsize=(10, 6))
    polaridad_candidatos = df.groupby('Candidato')['Polaridad'].mean().sort_values()
    bars = plt.barh(polaridad_candidatos.index, polaridad_candidatos.values)
    plt.title('Polaridad Promedio por Candidato')
    plt.xlabel('Polaridad Promedio (VADER)')
    plt.axvline(x=0, color='red', linestyle='--', alpha=0.7)
    for bar in bars:
        width = bar.get_width()
        plt.text(width, bar.get_y() + bar.get_height() / 2,
                 f'{width:.3f}', ha='left', va='center')
    plt.tight_layout()
    plt.show()

    # Gráfica 2: Distribución de Sentimientos por Candidato
    plt.figure(figsize=(12, 8))
    conteo_sentimientos = df.groupby(['Candidato', 'Sentimiento']).size().unstack(fill_value=0)
    conteo_sentimientos.plot(kind='bar', stacked=True, ax=plt.gca())
    plt.title('Distribución de Sentimientos por Candidato')
    plt.ylabel('Cantidad de Noticias')
    plt.xlabel('Candidato')
    plt.xticks(rotation=45)
    plt.legend(title='Sentimiento')
    plt.tight_layout()
    plt.show()

    # Gráfica 3: Evolución de Polaridad por Mes
    plt.figure(figsize=(12, 8))
    # Definir orden explícito de meses para consistencia
    meses_orden = ['Junio', 'Julio', 'Agosto', 'Septiembre']
    # Paleta de colores clara y distintiva
    colores = ['#1f77b4', '#ff7f0e', '#2ca02c', '#d62728']  # Azul, Naranja, Verde, Rojo
    for idx, candidato in enumerate(df['Candidato'].unique()):
        df_candidato = df[df['Candidato'] == candidato].copy()
        if len(df_candidato) > 1:
            # Calcular promedio de polaridad por mes
            polaridad_mes = df_candidato.groupby('Mes')['Polaridad'].mean().reindex(meses_orden)
            plt.plot(meses_orden, polaridad_mes, 
                     label=candidato, linewidth=3, color=colores[idx % len(colores)])
    plt.title('Evolución de Polaridad por Mes', fontsize=16, pad=15)
    plt.xlabel('Mes', fontsize=14)
    plt.ylabel('Polaridad Promedio', fontsize=14)
    plt.axhline(y=0, color='red', linestyle='--', alpha=0.7)
    plt.legend(fontsize=12)
    plt.xticks(rotation=45, fontsize=12)
    plt.yticks(fontsize=12)
    plt.grid(True, linestyle='--', alpha=0.5)  # Añadir cuadrícula suave
    plt.tight_layout()
    plt.savefig('evolucion_polaridad_mejorada.png', bbox_inches='tight')  # Guardar para presentación
    plt.show()

    # Gráfica 4: Heatmap de Polaridad
    plt.figure(figsize=(10, 8))
    try:
        heatmap_data = df.pivot_table(values='Polaridad', index='Candidato',
                                      columns='Mes', aggfunc='mean')
        sns.heatmap(heatmap_data, annot=True, cmap='RdBu_r', center=0,
                    cbar_kws={'label': 'Polaridad'})
        plt.title('Heatmap: Polaridad por Candidato y Mes')
        plt.xlabel('Mes')
        plt.ylabel('Candidato')
        plt.tight_layout()
        plt.show()
    except Exception:
        plt.text(0.5, 0.5, 'Heatmap no disponible\n(datos insuficientes)',
                 ha='center', va='center', transform=plt.gca().transAxes)
        plt.title('Heatmap: Polaridad por Candidato y Mes')
        plt.tight_layout()
        plt.show()

    # Gráfica 5: Distribución de Tipos de Discurso por Candidato
    plt.figure(figsize=(12, 8))
    conteo_discurso = df.groupby(['Candidato', 'Discurso']).size().unstack(fill_value=0)
    conteo_discurso.plot(kind='bar', stacked=True, ax=plt.gca())
    plt.title('Distribución de Tipos de Discurso por Candidato')
    plt.ylabel('Cantidad de Noticias')
    plt.xlabel('Candidato')
    plt.xticks(rotation=45)
    plt.legend(title='Discurso')
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
                    'polaridad_promedio': noticias_filtradas['Polaridad'].mean(),
                    'porcentaje': (len(noticias_filtradas) / len(df_candidato)) * 100
                }
        resultados[candidato] = resultados_candidato
    return resultados


def generar_reporte(resultados_analisis, palabras_clave_analisis, df_final):
    print("=" * 60)
    print("📊 REPORTE DE ANÁLISIS DE CAMPAÑAS PRESIDENCIALES")
    print("=" * 60)

    conteo_discurso = df_final.groupby(['Candidato', 'Discurso']).size().unstack(fill_value=0)

    for candidato, datos in resultados_analisis.items():
        print(f"\n🎯 CANDIDATO: {candidato}")
        print(f"   📰 Total de noticias analizadas: {datos['total_noticias']}")
        print(f"   📈 Polaridad promedio: {datos['polaridad_promedio']:.3f}")

        if not datos['por_mes'].empty:
            print(f"   📅 Análisis de polaridad por mes:")
            for mes, fila in datos['por_mes'].iterrows():
                print(f"      • {mes}: {fila['mean']:.3f} (n={fila['count']})")

        print(f"   🗣️ Distribución de discursos:")
        if candidato in conteo_discurso.index:
            discursos_candidato = conteo_discurso.loc[candidato]
            for discurso, conteo in discursos_candidato.items():
                if conteo > 0:
                    porcentaje = (conteo / datos['total_noticias']) * 100
                    print(f"      • {discurso}: {conteo} menciones ({porcentaje:.1f}%)")

        if candidato in palabras_clave_analisis:
            print(f"   🔍 Palabras clave relevantes:")
            for palabra, datos_palabra in palabras_clave_analisis[candidato].items():
                print(f"      • '{palabra}': {datos_palabra['cantidad']} menciones, "
                      f"polaridad: {datos_palabra['polaridad_promedio']:.3f}")


# EJECUCIÓN PRINCIPAL
def main(archivo_csv):
    print("🔍 Iniciando análisis de campañas presidenciales...")
    df = cargar_y_preparar_datos(archivo_csv)
    if df is None:
        return

    print("🧹 Limpiando texto...")
    df['texto_limpio'] = df['Texto'].apply(limpiar_texto)

    print("📊 Analizando sentimiento con VADER...")
    df['Polaridad'] = df['texto_limpio'].apply(analizar_sentimiento_vader)
    df['Sentimiento'] = df['Polaridad'].apply(clasificar_sentimiento)

    print("🗣️ Clasificando tipo de discurso...")
    df['Discurso'] = df['texto_limpio'].apply(detectar_discurso)

    print("📈 Analizando tendencias...")
    resultados_analisis = analizar_por_candidato_y_mes(df)

    palabras_clave = ['eleccion', 'voto', 'democracia', 'poder', 'gobierno', 'pais', 'ley', 'partido', 'presidente',
                      'vicepresidente', 'propuesta', 'presidencia', 'bien', 'mal', 'bueno', 'malo']
    palabras_clave_analisis = analizar_palabras_clave_por_candidato(df, palabras_clave)

    print("🎨 Generando y mostrando visualizaciones...")
    visualizar_resultados(df)

    print("📝 Generando reporte textual...")
    generar_reporte(resultados_analisis, palabras_clave_analisis, df)

    df.to_csv('resultados_analisis_detallado.csv', index=False, encoding='utf-8')
    print(f"\n💾 Resultados guardados en 'resultados_analisis_detallado.csv'")

    return df, resultados_analisis


if __name__ == "__main__":
    archivo = 'noticias2.csv'
    resultados_df, analisis_completo = main(archivo)