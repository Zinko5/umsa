// Tabla de posiciones
import java.util.*;

public class e1980 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Map<String, Integer> puntos = new HashMap<>();
        Set<String> equipos = new HashSet<>();

        while (sc.hasNextLine()) {
            String linea = sc.nextLine();
            if (linea.isEmpty()) break;
            String[] partes = linea.split(" ");
            if (partes[0].equals("E")) {
                puntos.put(partes[1], puntos.getOrDefault(partes[1], 0) + 1);
                puntos.put(partes[2], puntos.getOrDefault(partes[2], 0) + 1);
                equipos.add(partes[1]);
                equipos.add(partes[2]);
            } else if (partes[0].equals("G")) {
                puntos.put(partes[1], puntos.getOrDefault(partes[1], 0) + 2);
                equipos.add(partes[1]);
            }
        }

        List<Map.Entry<String, Integer>> tabla = new ArrayList<>(puntos.entrySet());
        Collections.sort(tabla, (a, b) -> {
            int cmp = b.getValue().compareTo(a.getValue());
            if (cmp == 0) {
                return a.getKey().compareTo(b.getKey());
            }
            return cmp;
        });

        for (Map.Entry<String, Integer> eq : tabla) {
            System.out.println(eq.getKey() + " " + eq.getValue());
        }
    }
}
