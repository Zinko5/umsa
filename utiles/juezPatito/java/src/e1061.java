// Cuantos Grafos
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Scanner;
import java.util.Set;

public class e1061 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        ArrayList<Integer> salida = new ArrayList<>();

        while (true) {
            int minimo = sc.nextInt();
            int maximo = sc.nextInt();
            if (minimo == 0 && maximo == 0) break;
            salida.add(contarGrafosConexos(minimo, maximo));
        }

        for (int i = 0; i < salida.size(); i++) {
            System.out.println(salida.get(i));
        }
    }

    public static boolean esPrimo(int num) {
        if (num < 2) return false;
        if (num == 2 || num == 3) return true;
        if (num % 2 == 0 || num % 3 == 0) return false;
        int i = 5;
        while (i * i <= num) {
            if (num % i == 0 || num % (i + 2) == 0) return false;
            i += 6;
        }
        return true;
    }

    public static int contarGrafosConexos(int minimo, int maximo) {
        ArrayList<Integer> nodos = new ArrayList<>();
        for (int i = minimo; i <= maximo; i++) {
            nodos.add(i);
        }

        HashMap<Integer, Set<Integer>> grafo = new HashMap<>();
        for (int i = 0; i < nodos.size(); i++) {
            grafo.put(nodos.get(i), new HashSet<Integer>());
        }

        for (int i = 0; i < nodos.size(); i++) {
            for (int j = i + 1; j < nodos.size(); j++) {
                int suma = nodos.get(i) + nodos.get(j);
                if (esPrimo(suma)) {
                    grafo.get(nodos.get(i)).add(nodos.get(j));
                    grafo.get(nodos.get(j)).add(nodos.get(i));
                }
            }
        }

        HashSet<Integer> visitados = new HashSet<>();
        int componentesConexas = 0;

        for (int i = 0; i < nodos.size(); i++) {
            int nodo = nodos.get(i);
            if (!visitados.contains(nodo)) {
                dfs(nodo, grafo, visitados);
                componentesConexas++;
            }
        }

        return componentesConexas;
    }

    public static void dfs(int nodo, HashMap<Integer, Set<Integer>> grafo, HashSet<Integer> visitados) {
        ArrayList<Integer> pila = new ArrayList<>();
        pila.add(nodo);

        while (!pila.isEmpty()) {
            int n = pila.remove(pila.size() - 1);
            if (!visitados.contains(n)) {
                visitados.add(n);
                ArrayList<Integer> vecinos = new ArrayList<>(grafo.get(n));
                for (int i = 0; i < vecinos.size(); i++) {
                    int vecino = vecinos.get(i);
                    if (!visitados.contains(vecino)) {
                        pila.add(vecino);
                    }
                }
            }
        }
    }
}
