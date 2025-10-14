import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.model_selection import train_test_split
from sklearn.svm import SVC
from sklearn.metrics import classification_report, accuracy_score
from sklearn.preprocessing import LabelEncoder

# Paso 1: Cargar el CSV con los tweets etiquetados
df = pd.read_csv('tweets.csv')  # Reemplaza con la ruta de tu archivo

# Paso 2: Preprocesar (opcional: limpiar texto, pero para simplicidad lo dejamos)
X = df['text']  # Textos de tweets
y = df['label']  # Etiquetas (0: negativo, 1: positivo)

# Paso 3: Vectorizar los textos usando TF-IDF (representación en espacio vectorial)
vectorizer = TfidfVectorizer(max_features=5000)  # Limita a 5000 términos para eficiencia
X_vectorized = vectorizer.fit_transform(X)

# Paso 4: Dividir los datos en entrenamiento y prueba (80% train, 20% test)
X_train, X_test, y_train, y_test = train_test_split(X_vectorized, y, test_size=0.2, random_state=42)

# Paso 5: Entrenar el modelo SVM (encuentra el hiperplano)
svm_model = SVC(kernel='linear')  # Kernel lineal para espacios linealmente separables, como menciona la tarea
svm_model.fit(X_train, y_train)

# Paso 6: Evaluar el modelo
y_pred = svm_model.predict(X_test)
print("Accuracy:", accuracy_score(y_test, y_pred))
print(classification_report(y_test, y_pred))

# Paso 7: Determinar si el debate fue positivo o negativo overall (basado en conteo de etiquetas)
total_pos = (df['label'] == 1).sum()
total_neg = (df['label'] == 0).sum()
porc_pos = (total_pos / len(df)) * 100
porc_neg = (total_neg / len(df)) * 100

print(f"Conteo overall: {total_pos} positivos ({porc_pos:.2f}%), {total_neg} negativos ({porc_neg:.2f}%)")

if porc_pos > porc_neg:
    print("El debate tuvo una recepción overall positiva.")
elif porc_neg > porc_pos:
    print("El debate tuvo una recepción overall negativa.")
else:
    print("El debate tuvo una recepción overall equilibrada.")

# Explicación de cómo llegar a la solución:
# - Etiquetamos manualmente los tweets (positivo/negativo).
# - Vectorizamos con TF-IDF para representar en espacio vectorial.
# - Entrenamos SVM con kernel lineal para encontrar el hiperplano que separa positivos de negativos.
# - Evaluamos con métricas estándar.
# - Para el overall, contamos las etiquetas (puedes usar el modelo para clasificar nuevos tweets si agregas más).
# La distancia entre vectores de soporte es 2/||w||, donde w es el vector normal del hiperplano (accesible con svm_model.coef_ si necesitas).