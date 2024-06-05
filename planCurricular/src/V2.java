import java.util.*;

public class V2 {
    private static Map<String, Asignatura> asignaturas = new HashMap<>();

    public static void main(String[] args) {
        inicializarAsignaturas();
        Scanner scanner = new Scanner(System.in);

        // Estado de las materias del usuario
        Map<String, String> estadoMaterias = new HashMap<>();

        // Preguntar al usuario sobre el estado de cada materia
        for (String codigo : asignaturas.keySet()) {
            if (!estadoMaterias.containsKey(codigo)) {
                preguntarEstadoMateria(codigo, estadoMaterias, scanner);
            }
        }

        // Listar materias que el usuario está tomando actualmente
        List<String> tomandoActualmente = new ArrayList<>();
        for (Map.Entry<String, String> entry : estadoMaterias.entrySet()) {
            if (entry.getValue().equals("o")) {
                tomandoActualmente.add(entry.getKey());
            }
        }

        System.out.println("Materias que estás tomando actualmente: " + tomandoActualmente);

        int gestion = 2; // Empezamos en la gestion II/2024
        int year = 2024;
        boolean planTerminado = false;
        int semestre;
        while (!planTerminado) {
            // Proyectar los semestres futuros
            semestre = calcularSemestre(estadoMaterias);
            System.out.println("Semestre actual: " + semestre + "\n");
            List<String> materiasSemestre = new ArrayList<>();
            for (Map.Entry<String, Asignatura> entry : asignaturas.entrySet()) {
                String codigo = entry.getKey();
                Asignatura asignatura = entry.getValue();
                if (estadoMaterias.getOrDefault(codigo, "n").equals("n")
                        && puedeTomar(asignatura, estadoMaterias, semestre)) {
                    materiasSemestre.add(codigo);
                }
            }

            if (materiasSemestre.isEmpty()) {
                planTerminado = true;
            } else {
                System.out.println("Materias que tomarás en la gestión " + (gestion % 2 == 0 ? "II" : "I") + "/" + year
                        + ": " + materiasSemestre);
                for (String codigo : materiasSemestre) {
                    estadoMaterias.put(codigo, "y");
                }
                gestion++;
                if (gestion % 2 == 1) {
                    year++;
                }
            }
        }

        System.out.println("Fin del plan curricular.");
    }

    // calcular semestre en que se encuentra el usuario
    private static int calcularSemestre(Map<String, String> estadoMaterias) {
        int semestre = 0;
        int v[] = new int[9];
        for (Map.Entry<String, String> entry : estadoMaterias.entrySet()) {
            String codigo = entry.getKey();
            Asignatura asignatura = asignaturas.get(codigo);
            if (asignatura != null && entry.getValue().equals("y") && asignatura.semestre == 1) {
                v[0]++;
            }
            if (asignatura != null && entry.getValue().equals("y") && asignatura.semestre == 2) {
                v[1]++;
            }
            if (asignatura != null && entry.getValue().equals("y") && asignatura.semestre == 3) {
                v[2]++;
            }
            if (asignatura != null && entry.getValue().equals("y") && asignatura.semestre == 4) {
                v[3]++;
            }
            if (asignatura != null && entry.getValue().equals("y") && asignatura.semestre == 5) {
                v[4]++;
            }
            if (asignatura != null && entry.getValue().equals("y") && asignatura.semestre == 6) {
                v[5]++;
            }
            if (asignatura != null && entry.getValue().equals("y") && asignatura.semestre == 7) {
                v[6]++;
            }
            if (asignatura != null && entry.getValue().equals("y") && asignatura.semestre == 8) {
                v[7]++;
            }
            if (asignatura != null && entry.getValue().equals("y") && asignatura.semestre == 9) {
                v[8]++;
            }
        }
        if (v[0] >= 6) {
            semestre = 1;
        }
        if (v[1] >= 6) {
            semestre = 2;
        }
        if (v[2] >= 6) {
            semestre = 3;
        }
        if (v[3] >= 6) {
            semestre = 4;
        }
        if (v[4] >= 6) {
            semestre = 5;
        }
        if (v[5] >= 6) {
            semestre = 6;
        }
        if (v[6] >= 5) {
            semestre = 7;
        }
        if (v[7] >= 5) {
            semestre = 8;
        }
        if (v[8] >= 1) {
            semestre = 9;
        }
        return semestre;
    }

    private static void inicializarAsignaturas() {
        // Aquí se inicializan las asignaturas con sus prerrequisitos.
        // Esta función debe completarse con toda la información del plan curricular.
        // Primer semestre
        asignaturas.put("INF-111", new Asignatura("Programación I", 1, Arrays.asList()));
        asignaturas.put("INF-112", new Asignatura("Fundamentos digitales", 1, Arrays.asList()));
        asignaturas.put("INF-113", new Asignatura("Programación web I", 1, Arrays.asList()));
        asignaturas.put("INF-114", new Asignatura("Álgebra", 1, Arrays.asList()));
        asignaturas.put("INF-115", new Asignatura("Cálculo I", 1, Arrays.asList()));
        asignaturas.put("INF-117", new Asignatura("Matemática discreta", 1, Arrays.asList()));

        // Segundo semestre
        asignaturas.put("INF-121", new Asignatura("Programación II", 2, Arrays.asList("INF-111")));
        asignaturas.put("INF-122", new Asignatura("Programación web II", 2, Arrays.asList("INF-113")));
        asignaturas.put("INF-123", new Asignatura("Electrónica general", 2, Arrays.asList("INF-112")));
        asignaturas.put("INF-124", new Asignatura("Estadística I", 2, Arrays.asList("INF-114")));
        asignaturas.put("INF-125", new Asignatura("Álgebra lineal", 2, Arrays.asList("INF-114")));
        asignaturas.put("INF-126", new Asignatura("Cálculo II", 2, Arrays.asList("INF-115")));

        // Tercer semestre
        asignaturas.put("INF-131", new Asignatura("Programación III", 3, Arrays.asList("INF-121")));
        asignaturas.put("INF-132", new Asignatura("Base de datos I", 3, Arrays.asList("INF-121", "INF-122")));
        asignaturas.put("INF-133", new Asignatura("Programación web III", 3, Arrays.asList("INF-111", "INF-122")));
        asignaturas.put("INF-134", new Asignatura("Estadística II", 3, Arrays.asList("INF-124")));
        asignaturas.put("DAT-135", new Asignatura("Cálculo III", 3, Arrays.asList("INF-126")));
        asignaturas.put("TRA-136",
                new Asignatura("Metodología de la investigación", 3, Arrays.asList("INF-124", "INF-125")));

        // Cuarto semestre
        asignaturas.put("DAT-241", new Asignatura("Programación distribuida y paralela", 4, Arrays.asList("INF-131")));
        asignaturas.put("DAT-242", new Asignatura("Base de datos II", 4, Arrays.asList("INF-132")));
        asignaturas.put("DAT-243", new Asignatura("Métodos numéricos I", 4, Arrays.asList("DAT-135")));
        asignaturas.put("DAT-244", new Asignatura("Investigación Operativa I", 4, Arrays.asList("INF-134")));
        asignaturas.put("DAT-245", new Asignatura("Inteligencia artificial", 4, Arrays.asList("INF-123", "INF-125")));
        asignaturas.put("DAT-246", new Asignatura("Modelado estadístico", 4, Arrays.asList("INF-134")));

        // Quinto semestre
        asignaturas.put("DAT-251", new Asignatura("Base de Datos III", 5, Arrays.asList("DAT-242")));
        asignaturas.put("DAT-252", new Asignatura("Métodos numéricos II", 5, Arrays.asList("DAT-243")));
        asignaturas.put("DAT-253", new Asignatura("Minería de Datos", 5, Arrays.asList("DAT-246")));
        asignaturas.put("DAT-254", new Asignatura("Investigación Operativa II", 5, Arrays.asList("DAT-244")));
        asignaturas.put("DAT-255", new Asignatura("Aprendizaje automático", 5, Arrays.asList("DAT-246")));
        asignaturas.put("TRA-256",
                new Asignatura("Legislación informática y ética", 5, Arrays.asList("Tercer semestre vencido")));

        // Sexto semestre
        asignaturas.put("DAT-261", new Asignatura("Procesamiento del lenguaje natural", 6, Arrays.asList("DAT-251")));
        asignaturas.put("DAT-262", new Asignatura("Procesos estocásticos y análisis de series de tiempo", 6,
                Arrays.asList("INF-134", "DAT-135")));
        asignaturas.put("DAT-263", new Asignatura("Análisis de datos", 6, Arrays.asList("DAT-254")));
        asignaturas.put("DAT-264", new Asignatura("Aprendizaje profundo", 6, Arrays.asList("DAT-253")));
        asignaturas.put("DAT-265",
                new Asignatura("Taller de Análisis de Datos (TS)", 6, Arrays.asList("Quinto semestre vencido")));
        asignaturas.put("Electiva I", new Asignatura("Electiva I", 6, Arrays.asList("Quinto semestre vencido")));

        // Séptimo semestre
        asignaturas.put("DAT-371", new Asignatura("Computación en la nube", 7, Arrays.asList("DAT-261")));
        asignaturas.put("DAT-372", new Asignatura("Inteligencia de negocios (Business Intelligence)", 7,
                Arrays.asList("DAT-254", "DAT-264")));
        asignaturas.put("TRA-374", new Asignatura("Práctica profesional", 7, Arrays.asList("Quinto semestre vencido")));
        asignaturas.put("Electiva II", new Asignatura("Electiva II", 7, Arrays.asList("Quinto semestre vencido")));
        asignaturas.put("Electiva III", new Asignatura("Electiva III", 7, Arrays.asList("Quinto semestre vencido")));

        // Octavo semestre
        asignaturas.put("DAT-381",
                new Asignatura("Macrosdatos y analítica de datos (Big Data)", 8, Arrays.asList("DAT-372")));
        asignaturas.put("DAT-382", new Asignatura("Visualización de datos", 8, Arrays.asList("DAT-263")));
        asignaturas.put("DAT-383",
                new Asignatura("Taller de graduación I", 8, Arrays.asList("Sexto semestre vencido")));
        asignaturas.put("Electiva IV", new Asignatura("Electiva IV", 8, Arrays.asList("Sexto semestre vencido")));
        asignaturas.put("Electiva V", new Asignatura("Electiva V", 8, Arrays.asList("Sexto semestre vencido")));

        // Noveno semestre
        asignaturas.put("DAT-391",
                new Asignatura("Taller de graduación II", 9, Arrays.asList("Octavo semestre vencido")));
    }

    private static void preguntarEstadoMateria(String codigo, Map<String, String> estadoMaterias, Scanner scanner) {
        if (asignaturas.get(codigo) == null) {
            estadoMaterias.put(codigo, "y"); // Asignatura no definida, asumir aprobada
            return;
        }

        Asignatura asignatura = asignaturas.get(codigo);
        System.out.print("¿Aprobaste " + codigo + " (" + asignatura.nombre + ")? (y/n): ");
        String respuesta = scanner.nextLine().trim().toLowerCase();

        while (!respuesta.equals("y") && !respuesta.equals("n")) {
            System.out.print("Respuesta inválida. ¿Aprobaste " + codigo + " (" + asignatura.nombre + ")? (y/n): ");
            respuesta = scanner.nextLine().trim().toLowerCase();
        }

        estadoMaterias.put(codigo, respuesta);

        if (respuesta.equals("n")) {
            for (String prerrequisito : asignatura.prerrequisitos) {
                if (!estadoMaterias.containsKey(prerrequisito)) {
                    preguntarEstadoMateria(prerrequisito, estadoMaterias, scanner);
                }
            }
        }
    }

    private static boolean puedeTomar(Asignatura asignatura, Map<String, String> estadoMaterias, int semestreActual) {
        for (String prerrequisito : asignatura.prerrequisitos) {
            if (!estadoMaterias.getOrDefault(prerrequisito, "n").equals("y")) {
                return false;
            }
        }

        if (asignatura.nombre.startsWith("Electiva")) {
            int semestreNecesario = asignatura.nombre.equals("Electiva I") || asignatura.nombre.equals("Electiva II")
                    || asignatura.nombre.equals("Electiva III") ? 5 : 6;
            return semestreActual >= semestreNecesario;
        }

        if (asignatura.nombre.equals("Legislación informática y ética")) {
            int semestreNecesario = 3; // Semestre requerido
            return semestreActual >= semestreNecesario;
        }

        if (asignatura.nombre.equals("Práctica profesional")
                || asignatura.nombre.equals("Taller de Análisis de Datos (TS)")) {
            int semestreNecesario = 5; // Semestre requerido
            return semestreActual >= semestreNecesario;
        }

        if (asignatura.nombre.equals("Taller de graduación I")) {
            int semestreNecesario = 6; // Semestre requerido
            return semestreActual >= semestreNecesario;
        }

        if (asignatura.nombre.equals("Taller de graduación II")) {
            int semestreNecesario = 8; // Semestre requerido
            return semestreActual >= semestreNecesario;
        }

        return true;
    }

    private static class Asignatura {
        String nombre;
        int semestre;
        List<String> prerrequisitos;

        Asignatura(String nombre, int semestre, List<String> prerrequisitos) {
            this.nombre = nombre;
            this.semestre = semestre;
            this.prerrequisitos = prerrequisitos;
        }
    }
}
