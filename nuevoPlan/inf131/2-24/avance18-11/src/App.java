import java.util.Scanner;

public class App {
    public static void main(String[] args) throws Exception {
        // dado un vector a de n numeros enteros, encontrar la suma en el rango p y q donde 0 <= p <= q <= n
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int v[] = new int[n];
        leer(v);
        int p = sc.nextInt();
        int q = sc.nextInt();
        // mostrar(v);
        System.out.println("suma: " + suma(v, p, q));
    }

    static void leer(int v[]){
        Scanner sc = new Scanner(System.in);
        for (int i = 0; i < v.length; i++) {
            v[i] = sc.nextInt();
        }
    }

    static int suma(int v[], int p, int q){
        int c = 0;
        // System.out.println("desde " + p + " hasta " + q);
        for (int i = p; i < q + 1; i++) {
            c = c + v[i];
            // System.out.println("se suma " + v[i] + " en la posicion " + i);
        }
        return c;
    }

    static void mostrar(int v[]){
        for (int i = 0; i < v.length; i++) {
            System.out.print("[" + v[i] + "]");
        }
        System.out.println();
    }
}
