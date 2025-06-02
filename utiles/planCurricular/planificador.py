class Materia:
    def __init__(self, sigla, nombre, semestre, requisitos):
        self.sigla = sigla
        self.nombre = nombre
        self.semestre = semestre
        self.requisitos = requisitos

def obtener_materias_disponibles(materias, aprobadas, vencidos):
    disponibles = []
    for materia in materias:
        # Verificar si la materia ya ha sido aprobada
        if materia.sigla in aprobadas:
            continue
        
        # Verificar si todos los requisitos están cumplidos
        requisitos_cumplidos = all(req in aprobadas or req in vencidos for req in materia.requisitos)
        
        # Agregar a la lista de disponibles si cumple los requisitos
        if requisitos_cumplidos:
            disponibles.append(materia)
    
    return disponibles

def simular_semestres(materias, aprobadas_iniciales, semestre_inicial, anio_inicial):
    aprobadas = set(aprobadas_iniciales)
    vencidos = set()  # Semestres "vencidos" (todos aprobados)
    semestre_actual = semestre_inicial
    anio_actual = anio_inicial
    historial = []

    while True:
        # Obtener las materias disponibles para el semestre actual
        materias_disponibles = obtener_materias_disponibles(materias, aprobadas, vencidos)
        
        if not materias_disponibles:
            break  # No hay más materias disponibles, terminamos la simulación
        
        # Ordenar materias por semestre sugerido para seguir el "camino principal"
        materias_disponibles.sort(key=lambda x: x.semestre)
        
        # Seleccionar un máximo de 6 materias
        materias_tomar = materias_disponibles[:6]
        
        # Registrar el semestre actual en el historial
        historial.append({
            "anio": anio_actual,
            "semestre": semestre_actual,
            "materias": [(m.sigla, m.nombre) for m in materias_tomar]
        })
        
        # Actualizar las materias aprobadas
        aprobadas.update(m.sigla for m in materias_tomar)
        
        # Marcar semestres vencidos si se aprueban todas las materias de un semestre
        for i in range(1, 9):
            if all(m.sigla in aprobadas for m in materias if m.semestre == i):
                vencidos.add(f"{i}to semestre vencido")
        
        # Avanzar al siguiente semestre
        semestre_actual += 1
        if semestre_actual > 2:
            semestre_actual = 1
            anio_actual += 1
    
    return historial

# Datos de las materias (sigla, nombre, semestre, requisitos)
materias_datos = [
            Materia("INF-111", "Programación I", 1, []),
        Materia("INF-112", "Fundamentos digitales", 1, []),
        Materia("INF-113", "Programación web I", 1, []),
        Materia("INF-114", "Álgebra", 1, []),
        Materia("INF-115", "Cálculo I", 1, []),
        Materia("INF-117", "Matemática discreta", 1, []),
        Materia("INF-121", "Programación II", 2, ["INF-111"]),
        Materia("INF-122", "Programación web II", 2, ["INF-113"]),
        Materia("INF-123", "Electrónica general", 2, ["INF-112"]),
        Materia("INF-124", "Estadística I", 2, ["INF-114"]),
        Materia("INF-125", "Álgebra lineal", 2, ["INF-114"]),
        Materia("INF-126", "Cálculo II", 2, ["INF-115"]),
        Materia("INF-131", "Programación III", 3, ["INF-121"]),
        Materia("INF-132", "Base de datos I", 3, ["INF-121", "INF-122"]),
        Materia("INF-133", "Programación web III", 3, ["INF-111", "INF-122"]),
        Materia("INF-134", "Estadística II", 3, ["INF-124"]),
        Materia("DAT-135", "Cálculo III", 3, ["INF-126"]),
        Materia("TRA-136", "Metodología de la investigación", 3, ["INF-124", "INF-125"]),
        Materia("DAT-241", "Programación distribuida y paralela", 4, ["INF-131"]),
        Materia("DAT-242", "Base de datos II", 4, ["INF-132"]),
        Materia("DAT-243", "Métodos numéricos I", 4, ["DAT-135"]),
        Materia("DAT-244", "Investigación Operativa I", 4, ["INF-134"]),
        Materia("DAT-245", "Inteligencia artificial", 4, ["INF-123", "INF-125"]),
        Materia("DAT-246", "Modelado estadístico", 4, ["INF-134"]),
        Materia("DAT-251", "Base de Datos III", 5, ["DAT-242"]),
        Materia("DAT-252", "Métodos numéricos II", 5, ["DAT-243"]),
        Materia("DAT-253", "Minería de Datos", 5, ["DAT-246"]),
        Materia("DAT-254", "Investigación Operativa II", 5, ["DAT-244"]),
        Materia("DAT-255", "Aprendizaje automático", 5, ["DAT-246"]),
        Materia("TRA-256", "Legislación informática y ética", 5, ["INF-131", "INF-132", "INF-133", "INF-134", "DAT-135", "TRA-136"]),
        Materia("DAT-261", "Procesamiento del lenguaje natural", 6, ["DAT-251"]),
        Materia("DAT-262", "Procesos estocásticos y análisis de series de tiempo", 6, ["INF-134", "DAT-135"]),
        Materia("DAT-263", "Análisis de datos", 6, ["DAT-254"]),
        Materia("DAT-264", "Aprendizaje profundo", 6, ["DAT-253"]),
        Materia("DAT-265", "Taller de Análisis de Datos (TS)", 6, ["DAT-251", "DAT-252", "DAT-253", "DAT-254", "TRA-256", "DAT-255"]),
        Materia("Electiva I", "Electiva I", 6, ["DAT-251", "DAT-252", "DAT-253", "DAT-254", "TRA-256", "DAT-255"]),
        Materia("DAT-371", "Computación en la nube", 7, ["DAT-261"]),
        Materia("DAT-372", "Inteligencia de negocios (Business Intelligence)", 7, ["DAT-254", "DAT-264"]),
        Materia("TRA-374", "Práctica profesional", 7, ["DAT-251", "DAT-252", "DAT-253", "DAT-254", "TRA-256", "DAT-255"]),
        Materia("Electiva II", "Electiva II", 7, ["DAT-251", "DAT-252", "DAT-253", "DAT-254", "TRA-256", "DAT-255"]),
        Materia("Electiva III", "Electiva III", 7, ["DAT-251", "DAT-252", "DAT-253", "DAT-254", "TRA-256", "DAT-255"]),
        Materia("DAT-381", "Macrosdatos y analítica de datos (Big Data)", 8, ["DAT-372"]),
        Materia("DAT-382", "Visualización de datos", 8, ["DAT-263"]),
        Materia("DAT-383", "Taller de graduación I", 8, ["DAT-261", "DAT-262", "DAT-263", "DAT-264", "DAT-265", "Electiva I"]),
        Materia("Electiva IV", "Electiva IV", 8, ["DAT-261", "DAT-262", "DAT-263", "DAT-264", "DAT-265", "Electiva I"]),
        Materia("Electiva V", "Electiva V", 8, ["DAT-261", "DAT-262", "DAT-263", "DAT-264", "DAT-265", "Electiva I"]),
        Materia("DAT-391", "Taller de graduación II", 9, ["DAT-381", "DAT-382", "DAT-383", "Electiva IV", "Electiva V"])
]
# materias_aprobadas = []
# Materias aprobadas por el usuario (ejemplo) 
# ejemplo 2-24
# materias_aprobadas = ["INF-111", "INF-112", "INF-113", "INF-114", "INF-115", "INF-117", "INF-121", "INF-122", "INF-123", "INF-124", "INF-125", "INF-132", "INF-133", "TRA-136"]
# ejemplo 1-25 si solo repruebo estadistica 2
# materias_aprobadas = ["INF-111", "INF-112", "INF-113", "INF-114", "INF-115", "INF-117", "INF-121", "INF-122", "INF-123", "INF-124", "INF-125", "INF-126", "INF-131", "INF-132", "INF-133", "TRA-136", "DAT-242", "DAT-245"]
# ejemplo 1-25 si apruebo todo
# materias_aprobadas = ["INF-111", "INF-112", "INF-113", "INF-114", "INF-115", "INF-117", "INF-121", "INF-122", "INF-123", "INF-124", "INF-125", "INF-126", "INF-131", "INF-132", "INF-133", "INF-134", "TRA-136", "DAT-242", "DAT-245"]

# ejemplo 1-25 si apruebo todo menos calculo 2 y estadistica 2:
# materias_aprobadas = ["INF-111", "INF-112", "INF-113", "INF-114", "INF-115", "INF-117", "INF-121", "INF-122", "INF-123", "INF-124", "INF-125", "INF-131", "INF-132", "INF-133", "TRA-136", "DAT-242", "DAT-245"]

# materias_aprobadas = ["INF-111", "INF-112", "INF-113", "INF-114", "INF-115", "INF-117", "INF-121", "INF-122", "INF-123", "INF-124", "INF-125", "INF-131", "INF-132", "INF-133", "TRA-136", "DAT-242", "DAT-245", "INF-134", "DAT-135"]

# materias_aprobadas = ["INF-111", "INF-112", "INF-113", "INF-114", "INF-115", "INF-117", "INF-121", "INF-122", "INF-123", "INF-124", "INF-125", "INF-131", "INF-132", "INF-133", "TRA-136", "DAT-242", "DAT-245", "INF-134", "DAT-135", "INF-126", "INF-134", "DAT-251"]

# materias_aprobadas = [
#     "INF-111", "INF-112", "INF-113", "INF-114", "INF-115", "INF-117",
#     "INF-121", "INF-122", "INF-123", "INF-124", "INF-125", "INF-126",
#     "INF-131", "INF-132", "INF-133", "INF-134", "TRA-136",
#     "DAT-242", "DAT-245",
#     "DAT-251"
# ]

materias_aprobadas = [
    "INF-111", "INF-112", "INF-113", "INF-114", "INF-115", "INF-117",
    "INF-121", "INF-122", "INF-123", "INF-124", "INF-125", "INF-126", 
    "INF-131", "INF-132", "INF-133", "INF-134", "TRA-136",
    "DAT-242", "DAT-245",
    "DAT-251"
]

# Iniciar simulación desde el semestre 1-2025
resultado = simular_semestres(materias_datos, materias_aprobadas, semestre_inicial=2, anio_inicial=2025)

# Mostrar el historial
for semestre in resultado:
    print(f"Año {semestre['anio']}, Semestre {semestre['semestre']}:")
    for sigla, nombre in semestre["materias"]:
        print(f"  {sigla} - {nombre}")
