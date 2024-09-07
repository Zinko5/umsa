import java.util.Arrays;
public class App {
    public static void main(String[] args) throws Exception {
        System.out.println("\nGabriel Marcelo Muñoz Callisaya CI: 9873103");
        int a[] = { 3, 2, 8, 4, 5 };
        int b[] = { 1, 2, 3, 4, 5 };
        int vc[] = new int[10];
        int c[] = new int[10];
        String d[] = new String[10];
        int e[] = new int[10];
        String f[] = new String[10];
        System.out.println("\nVectores:");
        mostrar(a);
        mostrar(b);
        System.out.println("\nEjercicio 1:");
        System.out.println("Los vectores son iguales: " + Arrays.equals(a, b));
        System.out.println("\nEjercicio 2:");
        vc = Arrays.copyOf(a, 3);
        mostrar(vc);
        System.out.println("\nEjercicio 3:");
        Arrays.fill(c, 2);
        Arrays.fill(d, "a");
        mostrar(c);
        mostrar(d);
        System.out.println("\nEjercicio 4:");
        Arrays.fill(e, 2,5,6);
        Arrays.fill(f, 2,6,"a");
        mostrar(e);
        mostrar(f);
        System.out.println("\nEjercicio 5:");
        int num = Arrays.binarySearch(a, 8);
        System.out.print("8 esta en la posicion " + num + " de: ");
        mostrar(a);
        System.out.println("\nEjercicio 6:");
        System.out.print("ordenando:");
        mostrar(a);
        System.out.print("sale: ");
        Arrays.sort(a);
        mostrar(a);

    }

    public static void mostrar(int[] x) {
        for (int i = 0; i < x.length; i++) {
            System.out.print("[" + x[i] + "] ");
        }
        System.out.println();
    }

    public static void mostrar(String[] x) {
        for (int i = 0; i < x.length; i++) {
            System.out.print("[" + x[i] + "] ");
        }
        System.out.println();
    }

    public static boolean iguales(int v1[], int v2[]) {
        if (v1.length != v2.length) {
            return false;
        } else {
            for (int i = 0; i < v1.length; i++) {
                if (v1[i] != v2[i]) {
                    return false;
                }
            }
            return true;
        }
    }

    public static void cp(int v1[], int v2[], int n) {
        for (int i = 0; i < n; i++) {
            v2[i] = v1[i];
        }
    }

    public static void ini(int[] x) {
        for (int i = 0; i < x.length; i++) {
            x[i] = i;
        }
    }

    public static void ini(String[] x) {
        for (int i = 0; i < x.length; i++) {
            x[i] = "abc" + Integer.toString(i);
        }
    }

    public static void ini(int[] x, int p, int q) {
        for (int i = p; i < q; i++) {
            x[i] = i;
        }
    }

    public static void ini(String[] x, int p, int q) {
        for (int i = p; i < q; i++) {
            x[i] = "abc" + Integer.toString(i);
        }
    }
    public static int buscar(String v[], String x) {
        for (int i = 0; i < v.length; i++) {
            if (v[i].equals(x)) {
                return i;
            }
        }
        return -1;
    }

    static void ordenar(int v[], int n) {
        int aux;
        for (int i = 0; i < n - 1; i++) {
            for (int j = i + 1; j < n; j++) {
                if (v[i] > v[j]) {
                    aux = v[i];
                    v[i] = v[j];
                    v[j] = aux;
                }
            }
        }
    }
}
