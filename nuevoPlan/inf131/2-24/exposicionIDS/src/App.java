import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.Stack;

public class App {
    static class Estado {
        int[] tablero;
        Estado padre;
        int profundidad;

        public Estado(int[] tablero, Estado padre, int profundidad) {
            this.tablero = tablero;
            this.padre = padre;
            this.profundidad = profundidad;
        }

        public boolean esSolucion() {
            int[] solucion = { 1, 2, 3, 4, 5, 6, 7, 8, 0 };
            return Arrays.equals(this.tablero, solucion);
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < tablero.length; i++) {
                sb.append(tablero[i]).append(" ");
                if ((i + 1) % 3 == 0) {
                    sb.append("\n");
                }
            }
            return sb.toString();
        }

        public List<Estado> generarSucesores() {
            List<Estado> sucesores = new ArrayList<>();
            int vacioIndex = -1;
            for (int i = 0; i < tablero.length; i++) {
                if (tablero[i] == 0) {
                    vacioIndex = i;
                    break;
                }
            }
            int[] movimientos = { -3, 3, -1, 1 };
            for (int mov : movimientos) {
                int nuevoIndice = vacioIndex + mov;
                if (nuevoIndice >= 0 && nuevoIndice < tablero.length) {
                    if (mov == -1 && vacioIndex % 3 == 0) {
                        continue;
                    }
                    if (mov == 1 && (vacioIndex + 1) % 3 == 0) {
                        continue;
                    }
                    int[] nuevoTablero = tablero.clone();
                    nuevoTablero[vacioIndex] = nuevoTablero[nuevoIndice];
                    nuevoTablero[nuevoIndice] = 0;
                    sucesores.add(new Estado(nuevoTablero, this, this.profundidad + 1));
                }
            }
            return sucesores;
        }
    }

    public static Estado DFS(Estado inicial) {
        int limite = 0;
        while (true) {
            Estado solucion = BFS(inicial, limite);
            if (solucion != null) {
                return solucion;
            }
            limite++;
        }
    }

    public static Estado BFS(Estado estado, int limite) {
        Stack<Estado> pila = new Stack<>();
        Set<String> visitados = new HashSet<>();
        pila.push(estado);
        while (!pila.isEmpty()) {
            Estado actual = pila.pop();
            if (actual.esSolucion()) {
                return actual;
            }
            if (actual.profundidad < limite) {
                visitados.add(Arrays.toString(actual.tablero));
                List<Estado> sucesores = actual.generarSucesores();
                for (Estado sucesor : sucesores) {
                    if (!visitados.contains(Arrays.toString(sucesor.tablero))) {
                        pila.push(sucesor);
                    }
                }
            }
        }
        return null;
    }

    public static void main(String[] args) {
        int[] tableroInicial = { 1, 2, 3, 4, 5, 6, 7, 8, 0 };
        int[] tableroDesordenado = { 1, 2, 3, 5, 6, 0, 4, 7, 8 };
        Estado estadoInicial = new Estado(tableroDesordenado, null, 0);
        Estado solucion = DFS(estadoInicial);
        if (solucion != null) {
            List<Estado> camino = new ArrayList<>();
            Estado temp = solucion;
            while (temp != null) {
                camino.add(temp);
                temp = temp.padre;
            }
            Collections.reverse(camino);
            System.out.println("Solucion encontrada:");
            for (Estado e : camino) {
                System.out.println(e);
            }
        } else {
            System.out.println("No se encontro solución.");
        }
    }
}