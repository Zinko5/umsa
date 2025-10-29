# analisis.py - Versión final con 6 gráficos
import os
import json
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

# Configuración
nombresCorpus = ['corto', 'mediano', 'largo', 'muy_largo']
nombresVariaciones = ['base', 'dropoutMas', 'dropoutMenos', 'temperaturaMas', 'temperaturaMenos',
                      'epocasMas', 'epocasMenos', 'longitudMas', 'longitudMenos']

parametrosBase = {'longitudSecuencia': 30, 'epocas': 30, 'temperatura': 0.4, 'dropout': 0.2}
mapeoVariaciones = {
    'dropoutMas': {'dropout': 0.5}, 'dropoutMenos': {'dropout': 0.0},
    'temperaturaMas': {'temperatura': 0.8}, 'temperaturaMenos': {'temperatura': 0.2},
    'epocasMas': {'epocas': 60}, 'epocasMenos': {'epocas': 15},
    'longitudMas': {'longitudSecuencia': 50}, 'longitudMenos': {'longitudSecuencia': 15},
    'base': {}
}

os.makedirs('analisis_resultados', exist_ok=True)

def obtenerParametros(corpus, var):
    params = parametrosBase.copy()
    params.update(mapeoVariaciones.get(var, {}))
    return params

# === RECOPILAR DATOS ===
datos = []
archivosFaltantes = []

for corpus in nombresCorpus:
    for var in nombresVariaciones:
        nombreConfig = f"{corpus}_{var}"
        rutaJson = os.path.join('resultados', nombreConfig, 'metricas.json')
        if not os.path.exists(rutaJson):
            archivosFaltantes.append(rutaJson)
            continue
        try:
            with open(rutaJson, 'r', encoding='utf-8') as f:
                m = json.load(f)
            params = obtenerParametros(corpus, var)
            fila = {
                'corpus': corpus,
                'variacion': var,
                'longitudSecuencia': m.get('longitudSecuencia', params['longitudSecuencia']),
                'epocas': m.get('epocas', params['epocas']),
                'temperatura': m.get('temperatura', params['temperatura']),
                'dropout': m.get('dropout', params['dropout']),
                'perplejidad': m.get('perplejidad'),
                'ttr': m.get('ttr'),
                'longitudMedia': m.get('longitudMedia'),
                'porcentajeCierre': m.get('porcentajeCierre'),
                'calidad': m.get('calidad')  # 1 a 5, rellenar manualmente
            }
            datos.append(fila)
        except Exception as e:
            print(f"Error en {rutaJson}: {e}")
            archivosFaltantes.append(rutaJson)

df = pd.DataFrame(datos)
df.to_csv('analisis_resultados/resumen_metricas.csv', index=False, encoding='utf-8')
print("Tabla guardada: analisis_resultados/resumen_metricas.csv")

# === GRÁFICOS (6 en total) ===
plt.style.use('seaborn-v0_8')
fig = plt.figure(figsize=(18, 12))
gs = fig.add_gridspec(3, 3, hspace=0.4, wspace=0.4)

# 1. Perplejidad por variación (agrupado por corpus)
ax1 = fig.add_subplot(gs[0, 0])
sns.barplot(data=df, x='variacion', y='perplejidad', hue='corpus', ax=ax1, palette='viridis')
ax1.set_title('Perplejidad por Variación y Corpus')
ax1.tick_params(axis='x', rotation=45)

# 2. TTR (diversidad) por temperatura
ax2 = fig.add_subplot(gs[0, 1])
sns.barplot(data=df, x='temperatura', y='ttr', hue='corpus', ax=ax2, palette='magma')
ax2.set_title('Diversidad Léxica (TTR) por Temperatura')

# 3. Longitud media por longitud de secuencia
ax3 = fig.add_subplot(gs[0, 2])
sns.barplot(data=df, x='longitudSecuencia', y='longitudMedia', hue='corpus', ax=ax3, palette='plasma')
ax3.set_title('Longitud Media del Cuento por Secuencia')

# 4. % de cierre por dropout
ax4 = fig.add_subplot(gs[1, 0])
sns.barplot(data=df, x='dropout', y='porcentajeCierre', hue='corpus', ax=ax4, palette='cividis')
ax4.set_title('% de Cuentos que Terminan con Palabra de Cierre')

# 5. Heatmap de correlaciones (solo automáticas)
ax5 = fig.add_subplot(gs[1, 1])
metricasAuto = df[['perplejidad', 'ttr', 'longitudMedia', 'porcentajeCierre']].dropna()
if not metricasAuto.empty:
    corr = metricasAuto.corr()
    sns.heatmap(corr, annot=True, cmap='coolwarm', ax=ax5, fmt='.2f', linewidths=.5)
    ax5.set_title('Correlaciones entre Métricas Automáticas')
else:
    ax5.text(0.5, 0.5, 'Sin datos', ha='center', va='center', transform=ax5.transAxes)
    ax5.set_title('Correlaciones (sin datos)')

# 6. Boxplot: Perplejidad por tamaño de corpus
ax6 = fig.add_subplot(gs[1, 2])
sns.boxplot(data=df, x='corpus', y='perplejidad', ax=ax6, palette='Set2')
ax6.set_title('Distribución de Perplejidad por Tamaño de Corpus')

# # 7. (Bonus) Calidad subjetiva (si ya está rellena)
# ax7 = fig.add_subplot(gs[2, :])
# if df['calidad'].notna().any():
#     sns.barplot(data=df, x='corpus', y='calidad', hue='variacion', ax=ax7, palette='tab10')
#     ax7.set_title('Calidad Subjetiva (1–5) por Corpus y Variación')
#     ax7.tick_params(axis='x', rotation=45)
# else:
#     ax7.text(0.5, 0.5, 'Rellena "calidad" en el CSV para ver este gráfico', 
#              ha='center', va='center', transform=ax7.transAxes, fontsize=12, color='gray')
#     ax7.set_title('Calidad Subjetiva (pendiente)')

plt.suptitle('Análisis Completo de Calidad en Generación de Cuentos', fontsize=16, y=0.98)
plt.savefig('analisis_resultados/graficos_completos_6.png', dpi=300, bbox_inches='tight')
plt.show()

print("6 gráficos generados: analisis_resultados/graficos_completos_6.png")
if archivosFaltantes:
    print(f"\nAdvertencia: Faltan {len(archivosFaltantes)} archivos. Verifica.")