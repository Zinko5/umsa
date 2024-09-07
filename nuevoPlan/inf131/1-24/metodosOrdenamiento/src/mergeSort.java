import java.util.Arrays;

public class mergeSort {
    public static void main(String[] args) throws Exception {
        int v[] = { 16, 76, -2, -33, -6, -92, 23, -1, 52, -55, 39, 10, 56, -71, 88, -56, 92, 34, 73, -60, -22, 53, 61,
                74, 20, 10, -33, 19, 43, 40 };
        mostrar(v);
        merge(v);
        mostrar(v);
    }

    static void mostrar(int v[]) {
        for (int i = 0; i < v.length; i++) {
            System.out.print("[" + v[i] + "]");
        }
        System.out.println();
    }

    public static void merge(int[] v) {
        final int N = v.length;
        if (N <= 1)
            return;
        int mitad = N / 2;
        int[] izq = Arrays.copyOfRange(v, 0, mitad);
        int[] der = Arrays.copyOfRange(v, mitad, N);
        merge(izq);
        merge(der);
        sort(v, izq, der);
    }

    public static void sort(int[] resp, int[] izq, int[] der) {
        int i = 0;
        int j = 0;
        for (int k = 0; k < resp.length; k++) {
            if (i >= izq.length) {
                resp[k] = der[j++];
                continue;
            }
            if (j == der.length) {
                resp[k] = izq[i++];
                continue;
            }
            resp[k] = (izq[i] < der[j]) ? izq[i++] : der[j++];
        }
    }
}
