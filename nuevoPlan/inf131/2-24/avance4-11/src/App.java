import java.util.Scanner;

public class App {
    public static void main(String[] args) throws Exception {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int nroCOnjuntos = n;
        inicializar(n);
        int nroUniones = 3;
        while (nroUniones --> 0) {
            u = sc.nextInt();
            v = sc.nextInt();
            if (find(u) == find(v)) {
                System.out.println("No se pueden unir por estar en el mismo conjunto");
            }
            else {
                union(u, v);
                System.out.println("Se unieron ambos conjuntos");
            }
        }
        
    }
    static void inicializar(int n){
        for (int i = 0; i <= n; i++) {
            P[i] = i;
        }
    }
    static int find(int u){
        if (u == P[u]) {
            return u;
        }
        return find(P[u]);
    }
    static void union(int u, int v){
        u = find(u);
        v = find(v);
        if (u != v) {
            P[u] = v;
        }
    }

}
