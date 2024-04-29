public class quickSort {
    public static void main(String[] args) throws Exception {
        int v[] = { 16, 76, -2, -33, -6, -92, 23, -1, 52, -55, 39, 10, 56, -71, 88, -56, 92, 34, 73, -60, -22, 53, 61,
                74, 20, 10, -33, 19, 43, 40 };
        mostrar(v);
        quick(v);
        mostrar(v);
    }

    static void mostrar(int v[]) {
        for (int i = 0; i < v.length; i++) {
            System.out.print("[" + v[i] + "]");
        }
        System.out.println();
    }

    public static void quick(int[] v) {
        final int N = v.length;
        sort(v, 0, N - 1);
    }

    public static void sort(int[] v, int inicio, int fin) {
        if (inicio >= fin) {
            return;
        }
        int pivote = v[inicio];
        int izq = inicio + 1;
        int der = fin;
        while (izq <= der) {
            while (izq <= fin && v[izq] < pivote) {
                izq++;
            }
            while (der > inicio && v[der] >= pivote) {
                der--;
            }
            if (izq < der) {
                int tmp = v[izq];
                v[izq] = v[der];
                v[der] = tmp;
            }
        }
        if (der > inicio) {
            int tmp = v[inicio];
            v[inicio] = v[der];
            v[der] = tmp;
        }
        sort(v, inicio, der - 1);
        sort(v, der + 1, fin);
    }
}
