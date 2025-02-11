import java.util.*;

public class nievo {
    private static Map<String, Asignatura> asignaturas = new HashMap<>();

    public static void main(String[] args) {
        inicializarAsignaturas();
        Scanner scanner = new Scanner(System.in);

        // Estado de las materias del usuario
        Map<String, String> estadoMaterias = new HashMap<>();

        // Preguntar al usuario sobre el estado de cada materia, considerando los requisitos
        for (String codigo : asignaturas.keySet()) {
            if (!estadoMaterias.containsKey(codigo)) {
                preguntarEstadoMateria(codigo, estadoMaterias, scanner);
            }
        }

        int gestion = 2; // Empezamos en la gestion II/2024
        int year = 2024;
        boolean planTerminado = false;

        while (!planTerminado) {
            int semestre = calcularSemestre(estadoMaterias);
            System.out.println("Semestre actual: " + semestre + "\n");
            List<String> materiasSemestre = new ArrayList<>();

            // Seleccionar materias que el usuario puede tomar en este semestre
            for (Map.Entry<String, Asignatura> entry : asignaturas.entrySet()) {
                String codigo = entry.getKey();
                Asignatura asignatura = entry.getValue();

                if (estadoMaterias.getOrDefault(codigo, "n").equals("n")
                        && puedeTomar(asignatura, estadoMaterias, semestre)) {
                    materiasSemestre.add(codigo);
                }
            }

            // Limitar las materias a 7 por semestre
            if (materiasSemestre.size() > 7) {
                materiasSemestre = materiasSemestre.subList(0, 7);
            }

            if (materiasSemestre.isEmpty()) {
                planTerminado = true;
            } else {
                System.out.println("Materias que tomarás en la gestión " + (gestion % 2 == 0 ? "II" : "I") + "/" + year + ":");
                for (String codigo : materiasSemestre) {
                    Asignatura asignatura = asignaturas.get(codigo);
                    System.out.println("- " + asignatura.nombre);
                    estadoMaterias.put(codigo, "y"); // Marcar como aprobada
                }

                gestion++;
                if (gestion % 2 == 1) {
                    year++;
                }
            }
        }

        System.out.println("Fin del plan curricular.");
    }

    // Calcular el semestre en el que se encuentra el usuario
    private static int calcularSemestre(Map<String, String> estadoMaterias) {
        int semestre = 0;
        int[] v = new int[9];

        for (Map.Entry<String, String> entry : estadoMaterias.entrySet()) {
            Asignatura asignatura = asignaturas.get(entry.getKey());
            if (asignatura != null && entry.getValue().equals("y")) {
                v[asignatura.semestre - 1]++;
            }
        }

        for (int i = 0; i < v.length; i++) {
            if (v[i] >= 6) {
                semestre = i + 1;
            }
        }

        return semestre;
    }

    // Inicializar las asignaturas con sus requisitos
    private static void inicializarAsignaturas() {
        asignaturas.put("INF-111", new Asignatura("Programación I", 1, Arrays.asList()));
        asignaturas.put("INF-112", new Asignatura("Fundamentos digitales", 1, Arrays.asList()));
        asignaturas.put("INF-113", new Asignatura("Programación web I", 1, Arrays.asList()));
        asignaturas.put("INF-114", new Asignatura("Álgebra", 1, Arrays.asList()));
        asignaturas.put("INF-115", new Asignatura("Cálculo I", 1, Arrays.asList()));
        asignaturas.put("INF-117", new Asignatura("Matemática discreta", 1, Arrays.asList()));
        asignaturas.put("INF-121", new Asignatura("Programación II", 2, Arrays.asList("INF-111")));
        asignaturas.put("INF-122", new Asignatura("Programación web II", 2, Arrays.asList("INF-113")));
        // Resto de las materias...
    }

    // Verifica si una asignatura puede ser tomada
    private static boolean puedeTomar(Asignatura asignatura, Map<String, String> estadoMaterias, int semestreActual) {
        if (asignatura.semestre > semestreActual) {
            return false;
        }
        for (String prerequisito : asignatura.prerrequisitos) {
            if (!estadoMaterias.getOrDefault(prerequisito, "n").equals("y")) {
                return false;
            }
        }
        return true;
    }

    // Pregunta al usuario sobre el estado de una materia, considerando requisitos
    private static void preguntarEstadoMateria(String codigo, Map<String, String> estadoMaterias, Scanner scanner) {
        Asignatura asignatura = asignaturas.get(codigo);

        for (String prerequisito : asignatura.prerrequisitos) {
            if (!estadoMaterias.getOrDefault(prerequisito, "n").equals("y")) {
                // Si un requisito no está aprobado, no preguntar por la materia
                estadoMaterias.put(codigo, "n");
                return;
            }
        }

        System.out.println("¿Aprobaste la materia " + asignatura.nombre + "? (y/n)");
        String respuesta = scanner.nextLine().toLowerCase();
        estadoMaterias.put(codigo, respuesta.equals("y") ? "y" : "n");
    }

    static class Asignatura {
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
