# analisis_individual.py - 7 gráficos individuales (6 + bonus calidad)
import os
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

# Configuración
plt.style.use('seaborn-v0_8')
sns.set_palette('viridis')
OUTPUT_DIR = 'analisis_resultados'
os.makedirs(OUTPUT_DIR, exist_ok=True)

# Cargar datos
CSV_PATH = os.path.join(OUTPUT_DIR, 'resumen_metricas.csv')
df = pd.read_csv(CSV_PATH)

# Asegurar tipos correctos
df['corpus'] = df['corpus'].astype('category')
df['variacion'] = df['variacion'].astype('category')
df['longitudSecuencia'] = df['longitudSecuencia'].astype(int)
df['epocas'] = df['epocas'].astype(int)
df['temperatura'] = df['temperatura'].astype(float)
df['dropout'] = df['dropout'].astype(float)

# Orden personalizado para variaciones
orden_variaciones = [
    'base', 'dropoutMenos', 'dropoutMas',
    'temperaturaMenos', 'temperaturaMas',
    'epocasMenos', 'epocasMas',
    'longitudMenos', 'longitudMas'
]
df['variacion'] = pd.Categorical(df['variacion'], categories=orden_variaciones, ordered=True)

# === FUNCIÓN PARA GUARDAR GRÁFICO ===
def guardar_grafico(fig, nombre):
    path = os.path.join(OUTPUT_DIR, f"{nombre}.png")
    fig.savefig(path, dpi=300, bbox_inches='tight')
    plt.close(fig)
    print(f"Guardado: {path}")

# === 1. Perplejidad por Variación y Corpus ===
fig1, ax1 = plt.subplots(figsize=(10, 6))
sns.barplot(data=df, x='variacion', y='perplejidad', hue='corpus', ax=ax1, palette='viridis')
ax1.set_title('Perplejidad por Variación y Corpus', fontsize=14, pad=15)
ax1.set_xlabel('Variación')
ax1.set_ylabel('Perplejidad')
ax1.tick_params(axis='x', rotation=45)
ax1.legend(title='Corpus', title_fontsize=12, fontsize=10)
guardar_grafico(fig1, '1_perplejidad_por_variacion')

# === 2. Diversidad Léxica (TTR) por Temperatura ===
fig2, ax2 = plt.subplots(figsize=(8, 6))
sns.barplot(data=df, x='temperatura', y='ttr', hue='corpus', ax=ax2, palette='magma')
ax2.set_title('Diversidad Léxica (TTR) por Temperatura', fontsize=14, pad=15)
ax2.set_xlabel('Temperatura')
ax2.set_ylabel('TTR')
ax2.legend(title='Corpus')
guardar_grafico(fig2, '2_ttr_por_temperatura')

# === 3. Longitud Media por Longitud de Secuencia ===
fig3, ax3 = plt.subplots(figsize=(8, 6))
sns.barplot(data=df, x='longitudSecuencia', y='longitudMedia', hue='corpus', ax=ax3, palette='plasma')
ax3.set_title('Longitud Media del Cuento por Secuencia', fontsize=14, pad=15)
ax3.set_xlabel('Longitud de Secuencia')
ax3.set_ylabel('Longitud Media')
ax3.legend(title='Corpus')
guardar_grafico(fig3, '3_longitudMedia_por_secuencia')

# === 4. % de Cuentos que Terminan con Palabra de Cierre ===
fig4, ax4 = plt.subplots(figsize=(8, 6))
sns.barplot(data=df, x='dropout', y='porcentajeCierre', hue='corpus', ax=ax4, palette='cividis')
ax4.set_title('% de Cuentos que Terminan con Palabra de Cierre', fontsize=14, pad=15)
ax4.set_xlabel('Dropout')
ax4.set_ylabel('% de Cierre')
ax4.set_ylim(0, 110)
ax4.legend(title='Corpus')
guardar_grafico(fig4, '4_porcentaje_cierre_por_dropout')

# === 5. Heatmap de Correlaciones ===
fig5, ax5 = plt.subplots(figsize=(7, 6))
metricas = df[['perplejidad', 'ttr', 'longitudMedia', 'porcentajeCierre']].dropna()
if not metricas.empty:
    corr = metricas.corr()
    sns.heatmap(corr, annot=True, cmap='coolwarm', ax=ax5, fmt='.2f',
                linewidths=.5, cbar_kws={'shrink': 0.8})
    ax5.set_title('Correlaciones entre Métricas Automáticas', fontsize=14, pad=15)
else:
    ax5.text(0.5, 0.5, 'Sin datos para correlación', ha='center', va='center',
             transform=ax5.transAxes, fontsize=12, color='gray')
    ax5.set_title('Correlaciones (sin datos)', fontsize=14, pad=15)
guardar_grafico(fig5, '5_correlaciones_metricas')

# === 6. Boxplot: Perplejidad por Tamaño de Corpus ===
fig6, ax6 = plt.subplots(figsize=(8, 6))
sns.boxplot(data=df, x='corpus', y='perplejidad', ax=ax6, palette='Set2')
ax6.set_title('Distribución de Perplejidad por Tamaño de Corpus', fontsize=14, pad=15)
ax6.set_xlabel('Corpus')
ax6.set_ylabel('Perplejidad')
guardar_grafico(fig6, '6_boxplot_perplejidad_corpus')

# === 7. BONUS: Calidad Subjetiva (si está rellena) ===
fig7, ax7 = plt.subplots(figsize=(12, 6))
if df['calidad'].notna().any() and df['calidad'].dtype != 'object':
    sns.barplot(data=df, x='corpus', y='calidad', hue='variacion', ax=ax7, palette='tab10')
    ax7.set_title('Calidad Subjetiva (1–5) por Corpus y Variación', fontsize=14, pad=15)
    ax7.set_xlabel('Corpus')
    ax7.set_ylabel('Calidad (1–5)')
    ax7.tick_params(axis='x', rotation=0)
    ax7.legend(title='Variación', bbox_to_anchor=(1.05, 1), loc='upper left', fontsize=9)
else:
    ax7.text(0.5, 0.5, 'Rellena la columna "calidad" en el CSV\n(1 a 5) para ver este gráfico',
             ha='center', va='center', transform=ax7.transAxes, fontsize=13, color='gray')
    ax7.set_title('Calidad Subjetiva (pendiente)', fontsize=14, pad=15)
    ax7.axis('off')
guardar_grafico(fig7, '7_calidad_subjetiva')

print("\nTodos los gráficos han sido generados y guardados individualmente en:")
print(f"   {os.path.abspath(OUTPUT_DIR)}")