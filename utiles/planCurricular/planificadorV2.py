class Materia:
    def __init__(self, sigla, nombre, semestre, requisitos):
        self.sigla = sigla
        self.nombre = nombre
        self.semestre = semestre
        self.requisitos = requisitos


def obtener_materias_disponibles(materias, aprobadas, vencidos):
    disponibles = []
    for materia in materias:
        if materia.sigla in aprobadas:
            continue
        requisitos_cumplidos = all(req in aprobadas or req in vencidos for req in materia.requisitos)
        if requisitos_cumplidos:
            disponibles.append(materia)
    return disponibles


def simular_planificacion(materias, aprobadas_iniciales, semestre_inicial, anio_inicial):
    aprobadas = set(aprobadas_iniciales)
    vencidos = set()
    semestre_actual = semestre_inicial
    anio_actual = anio_inicial

    while True:
        if semestre_actual == 1 or semestre_actual == 2:
            temporada = "Enero" if semestre_actual == 1 else "Julio"
            print(f"\n¿Cuántas materias desea tomar en el curso de temporada de {temporada} {anio_actual}? (0, 1, 2)")
            num_temporada = int(input())

            if num_temporada > 0:
                materias_disponibles = obtener_materias_disponibles(materias, aprobadas, vencidos)
                for i, mat in enumerate(materias_disponibles):
                    print(f"[{i + 1}] {mat.sigla} - {mat.nombre}")
                seleccionadas = []
                for _ in range(num_temporada):
                    print("¿Cuál materia desea tomar?")
                    indice = int(input()) - 1
                    if 0 <= indice < len(materias_disponibles):
                        seleccionadas.append(materias_disponibles[indice])
                aprobadas.update(m.sigla for m in seleccionadas)

        # Materias del semestre regular
        print(f"\nAño {anio_actual}, Semestre {semestre_actual}:")
        materias_disponibles = obtener_materias_disponibles(materias, aprobadas, vencidos)
        if not materias_disponibles:
            print("No hay más materias disponibles. ¡Ha completado todas las materias!")
            break

        materias_disponibles.sort(key=lambda x: x.semestre)
        materias_tomar = materias_disponibles[:7]

        for mat in materias_tomar:
            print(f"  {mat.sigla} - {mat.nombre}")
        aprobadas.update(m.sigla for m in materias_tomar)

        # Marcar semestres vencidos
        for i in range(1, 9):
            if all(m.sigla in aprobadas for m in materias if m.semestre == i):
                vencidos.add(f"{i}to semestre vencido")

        # Avanzar al siguiente semestre
        semestre_actual += 1
        if semestre_actual > 2:
            semestre_actual = 1
            anio_actual += 1


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

# Materias ya aprobadas
materias_aprobadas = [
    "INF-111", "INF-112", "INF-113", "INF-114", "INF-115", "INF-117",
    "INF-121", "INF-122", "INF-123", "INF-124", "INF-125",
    "INF-131", "INF-132", "INF-133", "TRA-136", "DAT-242", "DAT-245"
]

# Simular la planificación
simular_planificacion(materias_datos, materias_aprobadas, 1, 2025)
