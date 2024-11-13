import java.util.Arrays;
import java.util.LinkedList;
import java.util.Scanner;
import java.util.Queue;

public class e1717 {
    static int n = 10000; // max nro de vertives
    static int visitados[] = new int[n + 1];
    static LinkedList<Integer> g[] = new LinkedList[n + 1];

    static int invertir(int n){
        int nuevo = 0;
        while (n > 0) {
            nuevo = (nuevo * 10) + (n % 10);
            n = n / 10;
        }
        return nuevo;
    }

    static void generarGrafo(){
        for (int i = 0; i <= n; i++) {
            int a = i + 1;
            int b = invertir(i);
            g[i].add(a);
            if (i != b) {
                g[i].add(b);
            }
        }
    }
    public static void main(String[] args) throws Exception {
        Scanner sc = new Scanner(System.in);
        generarGrafo();
        int t = sc.nextInt();
        for (int i = 1; i <= t; i++) {
            int ver = sc.nextInt(); // nro de vertices (contando desde 1)
            int ar = sc.nextInt(); // nro de arcos (contando desde 1)
        }

        // inicializar el grafo
        for (int i = 0; i < n; i++) {
            g[i] = new LinkedList<Integer>();
        }

        // llenar el grafo
        for (int i = 0; i < 0; i++) {
            int a = sc.nextInt(); // vertice origen
            int b = sc.nextInt(); // vertice destino
            g[a].add(b);
            g[b].add(a); // comentado: grafos dirigidos. no comentado: grafos no dirigidos
        }

        Arrays.fill(visitados, -1);
        // dfs(0);
        bfs(5);
    }

    static void bfs (int nodo){
        visitados[nodo] = 0;
        Queue<Integer> q = new LinkedList<Integer>();
        q.offer(nodo);
        while (!q.isEmpty()) {
            int u = q.poll();
            System.out.print(u + " -> ");
            for (int i = 0; i < g[u].size(); i++) {
                int v = g[u].get(i);
                if (visitados[v] == -1) {
                    visitados[v] = visitados[u] + 1;
                    q.offer(v);
                }
            }
        }
    }
}
