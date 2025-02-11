import java.util.*;

public class V2 {
    private static ArrayList<ArrayList<Asignatura>> asignaturas = new ArrayList<>();

    public static void main(String[] args) {
        inicializarAsignaturas(asignaturas);
        Scanner scanner = new Scanner(System.in);

        // Estado de las materias del usuario
        // Preguntar al usuario sobre el estado de cada materia
        for (int i = 0; i < asignaturas.size(); i++) {
            asignaturas.get(i).add(null);
        }
/* 

        int gestion = 1; // Empezamos en la gestion II/2024
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

        System.out.println("Fin del plan curricular."); */
    }

    // calcular semestre en que se encuentra el usuario
   /*  private static int calcularSemestre(Map<String, String> estadoMaterias) {
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

 */    private static void inicializarAsignaturas(ArrayList<ArrayList<Asignatura>> asignaturas) {
        // Aquí se inicializan las asignaturas con sus prerrequisitos.
        // Esta función debe completarse con toda la información del plan curricular.
        // Primer semestre
        ArrayList<Asignatura> primer = new ArrayList<>();
        ArrayList<Asignatura> segundo = new ArrayList<>();
        ArrayList<Asignatura> tercer = new ArrayList<>();
        ArrayList<Asignatura> cuarto = new ArrayList<>();
        ArrayList<Asignatura> quinto = new ArrayList<>();
        ArrayList<Asignatura> sexto = new ArrayList<>();
        ArrayList<Asignatura> septimo = new ArrayList<>();
        ArrayList<Asignatura> octavo = new ArrayList<>();
        ArrayList<Asignatura> noveno = new ArrayList<>();

        // Primer semestre
        primer.add(new Asignatura("INF-111", "Programación I", 1, Arrays.asList(), "R"));
        primer.add(new Asignatura("INF-112", "Fundamentos digitales", 1, Arrays.asList(), "R"));
        primer.add(new Asignatura("INF-113", "Programación web I", 1, Arrays.asList(), "R"));
        primer.add(new Asignatura("INF-114", "Álgebra", 1, Arrays.asList(), "R"));
        primer.add(new Asignatura("INF-115", "Cálculo I", 1, Arrays.asList(), "R"));
        primer.add(new Asignatura("INF-117", "Matemática discreta", 1, Arrays.asList(), "R"));

        // Segundo semestre
        segundo.add(new Asignatura("INF-121", "Programación II", 2, Arrays.asList("INF-111"), "R"));
        segundo.add(new Asignatura("INF-122", "Programación web II", 2, Arrays.asList("INF-113"), "R"));
        segundo.add(new Asignatura("INF-123", "Electrónica general", 2, Arrays.asList("INF-112"), "R"));
        segundo.add(new Asignatura("INF-124", "Estadística I", 2, Arrays.asList("INF-114"), "R"));
        segundo.add(new Asignatura("INF-125", "Álgebra lineal", 2, Arrays.asList("INF-114"), "R"));
        segundo.add(new Asignatura("INF-126", "Cálculo II", 2, Arrays.asList("INF-115"), "R"));

        // Tercer semestre
        tercer.add(new Asignatura("INF-131", "Programación III", 3, Arrays.asList("INF-121"), "R"));
        tercer.add(new Asignatura("INF-132", "Base de datos I", 3, Arrays.asList("INF-121", "INF-122"), "R"));
        tercer.add(new Asignatura("INF-133", "Programación web III", 3, Arrays.asList("INF-111", "INF-122"), "R"));
        tercer.add(new Asignatura("INF-134", "Estadística II", 3, Arrays.asList("INF-124"), "R"));
        tercer.add(new Asignatura("DAT-135", "Cálculo III", 3, Arrays.asList("INF-126"), "R"));
        tercer.add(new Asignatura("TRA-136", "Metodología de la investigación", 3, Arrays.asList("INF-124", "INF-125"), "R"));

        // Cuarto semestre
        cuarto.add(new Asignatura("DAT-241", "Programación distribuida y paralela", 4, Arrays.asList("INF-131"), "R"));
        cuarto.add(new Asignatura("DAT-242", "Base de datos II", 4, Arrays.asList("INF-132"), "R"));
        cuarto.add(new Asignatura("DAT-243", "Métodos numéricos I", 4, Arrays.asList("DAT-135"), "R"));
        cuarto.add(new Asignatura("DAT-244", "Investigación Operativa I", 4, Arrays.asList("INF-134"), "R"));
        cuarto.add(new Asignatura("DAT-245", "Inteligencia artificial", 4, Arrays.asList("INF-123", "INF-125"), "R"));
        cuarto.add(new Asignatura("DAT-246", "Modelado estadístico", 4, Arrays.asList("INF-134"), "R"));

        // Quinto semestre
        quinto.add(new Asignatura("DAT-251", "Base de Datos III", 5, Arrays.asList("DAT-242"), "R"));
        quinto.add(new Asignatura("DAT-252", "Métodos numéricos II", 5, Arrays.asList("DAT-243"), "R"));
        quinto.add(new Asignatura("DAT-253", "Minería de Datos", 5, Arrays.asList("DAT-246"), "R"));
        quinto.add(new Asignatura("DAT-254", "Investigación Operativa II", 5, Arrays.asList("DAT-244"), "R"));
        quinto.add(new Asignatura("DAT-255", "Aprendizaje automático", 5, Arrays.asList("DAT-246"), "R"));
        quinto.add(new Asignatura("TRA-256", "Legislación informática y ética", 5, Arrays.asList("Tercer semestre vencido"), "R"));

        // Sexto semestre
        sexto.add(new Asignatura("DAT-261", "Procesamiento del lenguaje natural", 6, Arrays.asList("DAT-251"), "R"));
        sexto.add(new Asignatura("DAT-262", "Procesos estocásticos y análisis de series de tiempo", 6, Arrays.asList("INF-134", "DAT-135"), "R"));
        sexto.add(new Asignatura("DAT-263", "Análisis de datos", 6, Arrays.asList("DAT-254"), "R"));
        sexto.add(new Asignatura("DAT-264", "Aprendizaje profundo", 6, Arrays.asList("DAT-253"), "R"));
        sexto.add(new Asignatura("DAT-265", "Taller de Análisis de Datos (TS)", 6, Arrays.asList("Quinto semestre vencido"), "R"));
        sexto.add(new Asignatura("Electiva I", "Electiva I", 6, Arrays.asList("Quinto semestre vencido"), "R"));

        // Séptimo semestre
        septimo.add(new Asignatura("DAT-371", "Computación en la nube", 7, Arrays.asList("DAT-261"), "R"));
        septimo.add(new Asignatura("DAT-372", "Inteligencia de negocios (Business Intelligence)", 7, Arrays.asList("DAT-254", "DAT-264"), "R"));
        septimo.add(new Asignatura("TRA-374", "Práctica profesional", 7, Arrays.asList("Quinto semestre vencido"), "R"));
        septimo.add(new Asignatura("Electiva II", "Electiva II", 7, Arrays.asList("Quinto semestre vencido"), "R"));
        septimo.add(new Asignatura("Electiva III", "Electiva III", 7, Arrays.asList("Quinto semestre vencido"), "R"));

        // Octavo semestre
        octavo.add(new Asignatura("DAT-381", "Macrosdatos y analítica de datos (Big Data)", 8, Arrays.asList("DAT-372"), "R"));
        octavo.add(new Asignatura("DAT-382", "Visualización de datos", 8, Arrays.asList("DAT-263"), "R"));
        octavo.add(new Asignatura("DAT-383", "Taller de graduación I", 8, Arrays.asList("Sexto semestre vencido"), "R"));
        octavo.add(new Asignatura("Electiva IV", "Electiva IV", 8, Arrays.asList("Sexto semestre vencido"), "R"));
        octavo.add(new Asignatura("Electiva V", "Electiva V", 8, Arrays.asList("Sexto semestre vencido"), "R"));

        // Noveno semestre
        noveno.add(new Asignatura("DAT-391", "Taller de graduación II", 9, Arrays.asList("Octavo semestre vencido"), "R"));
    
        asignaturas.add(primer);
        asignaturas.add(segundo);
        asignaturas.add(tercer);
        asignaturas.add(cuarto);
        asignaturas.add(quinto);
        asignaturas.add(sexto);
        asignaturas.add(septimo);
        asignaturas.add(octavo);
        asignaturas.add(noveno);

        for (int i = 0; i < asignaturas.size(); i++) {
            System.out.println("\n" + (i +  1) + "° semestre");
            for (int j = 0; j < asignaturas.get(i).size(); j++) {
                System.out.println(asignaturas.get(i).get(j));
            }
        }
    }

    /* private static void preguntarEstadoMateria(LinkedMap<String, Asignatura>) {
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

 */    private static boolean puedeTomar(Asignatura asignatura, Map<String, String> estadoMaterias, int semestreActual) {
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
        String sigla;
        String nombre;
        int semestre;
        String estado;
        List<String> prerrequisitos;

        Asignatura(String sigla, String nombre, int semestre, List<String> prerrequisitos, String estado) {
            this.sigla = sigla;
            this.nombre = nombre;
            this.semestre = semestre;
            this.prerrequisitos = prerrequisitos;
            this.estado = estado;
        }
        @Override
        public String toString() {
            return nombre + " " + sigla;
        }
    }
}
