import java.util.Arrays;

public class App {
    public static void main(String[] args) throws Exception {
        /*
         * Tania Mamani Pinto
         * Gabriel Marcelo Muñoz Callisaya
         * Adolfo Alexander Choque Llanque
         * Alan Paxi Gutierrez
         * Andreś Kadir Aquin Flores
         */
        System.out.println("Integrantes:\nTania Mamani Pinto\nGabriel Marcelo Muñoz Callisaya\nAdolfo Alexander Choque Llanque\nAlan Paxi Gutierrez\nAndreś Kadir Aquin Flores");
        int v[] = { 16, 76, -2, -33, -6, -92, 23, -1, 52, -55, 39, 10, 56, -71, 88, -56, 92, 34, 73, -60, -22, 53, 61, 74, 20, 10, -33, 19, 43, 40 };
        mostrar(v);
        ordenacionCombinacion(v);
        mostrar(v);
    }

    static void mostrar(int v[]) {
        for (int i = 0; i < v.length; i++) {
            System.out.print("[" + v[i] + "]");
        }
        System.out.println();
    }

    public static void ordenacionCombinacion(int[] v) { //mergesort
        final int N = v.length;
        if (N <= 1)
            return;
        int mitad = N / 2;
        int[] izq = Arrays.copyOfRange(v, 0, mitad);
        int[] der = Arrays.copyOfRange(v, mitad, N);
        ordenacionCombinacion(izq);
        ordenacionCombinacion(der);
        combinar(v, izq, der);
    }

    public static void combinar(int[] resp, int[] izq, int[] der) {
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
