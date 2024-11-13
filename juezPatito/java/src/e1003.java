// Rumores
import java.util.*;

public class e1003 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int t = sc.nextInt();
        
        for (int i = 0; i < t; i++) {
            int n = sc.nextInt();
            int m = sc.nextInt();
            ArrayList<ArrayList<Integer>> grafo = new ArrayList<>();
            
            for (int j = 0; j <= n; j++) {
                grafo.add(new ArrayList<>());
            }
            
            for (int j = 0; j < m; j++) {
                int u = sc.nextInt();
                int v = sc.nextInt();
                grafo.get(u).add(v);
                grafo.get(v).add(u);
            }
            
            int x = sc.nextInt();
            int y = sc.nextInt();
            
            boolean[] visitados = new boolean[n + 1];
            dfs(grafo, visitados, x);
            
            if (visitados[y]) {
                System.out.println("SI");
            } else {
                System.out.println("NO");
            }
        }
        
        sc.close();
    }
    
    public static void dfs(ArrayList<ArrayList<Integer>> grafo, boolean[] visitados, int nodo) {
        visitados[nodo] = true;
        
        for (int i = 0; i < grafo.get(nodo).size(); i++) {
            int vecino = grafo.get(nodo).get(i);
            if (!visitados[vecino]) {
                dfs(grafo, visitados, vecino);
            }
        }
    }
}
