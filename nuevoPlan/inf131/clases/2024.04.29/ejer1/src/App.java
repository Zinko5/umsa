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
        /*
         * igual(a, b);
         * copiar(a, c, 4);
         * 
         */
        System.out.println("\nVectores:");
        mostrar(a);
        mostrar(b);
        System.out.println("\nEjercicio 1:");
        if (iguales(a, b)) {
            System.out.println("Son iguales");
        } else {
            System.out.println("No son iguales");
        }
        System.out.println("\nEjercicio 2:");
        cp(a, vc, 3);
        mostrar(vc);
        System.out.println("\nEjercicio 3:");
        ini(c);
        mostrar(c);
        ini(d);
        mostrar(d);
        System.out.println("\nEjercicio 4:");
        ini(e, 3, 7);
        ini(f, 6, 8);
        mostrar(e);
        mostrar(f);
        System.out.println("\nEjercicio 5:");
        int num = buscar(d, "abc2");
        System.out.print("abc2 esta en la posicion " + num + " de: ");
        mostrar(d);
        System.out.println("\nEjercicio 6:");
        System.out.print("ordenando:");
        mostrar(a);
        System.out.print("sale: ");
        ordenar(a, a.length);
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
