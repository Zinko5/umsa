import java.util.*;

public class AppConMenosDatos {
    private static Map<String, Asignatura> asignaturas = new HashMap<>();

    public static void main(String[] args) {
        inicializarAsignaturas();

        // Estado de las materias del usuario predefinido
        Map<String, String> estadoMaterias = new HashMap<>();
        estadoMaterias.put("INF-111", "y");
        estadoMaterias.put("INF-112", "y");
        estadoMaterias.put("INF-113", "y");
        estadoMaterias.put("INF-114", "y");
        estadoMaterias.put("INF-115", "y");
        estadoMaterias.put("INF-117", "n");
        estadoMaterias.put("INF-121", "n");
        estadoMaterias.put("INF-122", "n");
        estadoMaterias.put("INF-123", "n");
        estadoMaterias.put("INF-124", "n");
        estadoMaterias.put("INF-125", "n");
        estadoMaterias.put("INF-126", "n");
        estadoMaterias.put("INF-131", "n");
        estadoMaterias.put("INF-132", "n");
        estadoMaterias.put("INF-133", "n");
        estadoMaterias.put("INF-134", "n");
        estadoMaterias.put("DAT-135", "n");
        estadoMaterias.put("TRA-136", "n");

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

        while (!planTerminado) {
            // Proyectar los semestres futuros
            int semestre = calcularSemestre(estadoMaterias);
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
                System.out.println("Materias que tomarás el semestre " + (gestion % 2 == 0 ? "II" : "I") + "/" + year
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

    // El resto del código permanece igual...
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
        if (v[0] == 6) {
            semestre = 1;
        }
        if (v[1] == 6) {
            semestre = 2;
        }
        if (v[2] == 6) {
            semestre = 3;
        }
        if (v[3] == 6) {
            semestre = 4;
        }
        if (v[4] == 6) {
            semestre = 5;
        }
        if (v[5] == 6) {
            semestre = 6;
        }
        if (v[6] == 5) {
            semestre = 7;
        }
        if (v[7] == 5) {
            semestre = 8;
        }
        if (v[8] == 1) {
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

        
    }

    private static void preguntarEstadoMateria(String codigo, Map<String, String> estadoMaterias, Scanner scanner) {
        if (asignaturas.get(codigo) == null) {
            estadoMaterias.put(codigo, "y"); // Asignatura no definida, asumir aprobada
            return;
        }

        Asignatura asignatura = asignaturas.get(codigo);
        System.out.print("¿Aprobaste " + codigo + " (" + asignatura.nombre + ")? (y/n/o): ");
        String respuesta = scanner.nextLine().trim().toLowerCase();

        while (!respuesta.equals("y") && !respuesta.equals("n") && !respuesta.equals("o")) {
            System.out.print("Respuesta inválida. ¿Aprobaste " + codigo + " (" + asignatura.nombre + ")? (y/n/o): ");
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
