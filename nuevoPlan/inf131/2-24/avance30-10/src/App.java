import java.util.Arrays;
import java.util.LinkedList;
import java.util.Scanner;
import java.util.Queue;

public class App {
    static int n = 10000; // max nro de vertives
    static boolean visitados[] = new boolean[n + 1];
    static LinkedList<Integer> g[] = new LinkedList[n + 1];

    public static void main(String[] args) throws Exception {
        Scanner sc = new Scanner(System.in);
        int ver = 6; // nro de vertices (empezando en 1)
        int ar = 9; // nro de arcos (empezando en 1)
        // inicializar el grafo
        for (int i = 0; i < n; i++) {
            g[i] = new LinkedList<Integer>();
        }

        // llenar el grafo
        for (int i = 0; i < ar; i++) {
            int a = sc.nextInt(); // vertice origen
            int b = sc.nextInt(); // vertice destino
            g[a].add(b);
            g[b].add(a); // comentado: grafos dirigidos. no comentado: grafos no dirigidos
        }

        //mostrar el grafo
        for (int i = 0; i < ver; i++) {
            System.out.print("vertice " + i + ": ");
            for (int j = 0; j < g[i].size(); j++) {
                int u = g[i].get(j);
                System.out.print(u + " ");
            }
            System.out.println();
        }

        Arrays.fill(visitados, false);
        // dfs(0);
        bfs(5);
    }

    // depth first search
    static void dfs(int nodo){
        System.out.print(nodo + " -> ");
        visitados[nodo] = true; 
        for (int i = 0; i < g[nodo].size(); i++) {
            int u = g[nodo].get(i);
            if (visitados[u] == false) {
                dfs(u);
            }
        }
    }

    static void bfs (int nodo){
        visitados[nodo] = true;
        Queue<Integer> q = new LinkedList<Integer>();
        q.offer(nodo);
        while (!q.isEmpty()) {
            int u = q.poll();
            System.out.print(u + " -> ");
            for (int i = 0; i < g[u].size(); i++) {
                int v = g[u].get(i);
                if (visitados[v] == false) {
                    visitados[v] = true;
                    q.offer(v);
                }
            }
        }
    }
}
