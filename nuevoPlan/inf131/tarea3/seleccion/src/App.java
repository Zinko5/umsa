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
        seleccion(v, v.length);
        mostrar(v);
    }

    static void mostrar(int v[]) {
        for (int i = 0; i < v.length; i++) {
            System.out.print("[" + v[i] + "]");
        }
        System.out.println();
    }

    static void seleccion(int v[], int n) {
        int k, tmp;
        for (int i = 0; i < n - 1; i++) {
            k = i;
            tmp = v[i];
            for (int j = i + 1; j < n; j++) {
                if (v[j] < tmp) {
                    tmp = v[j];
                    k = j;
                }
            }
            v[k] = v[i];
            v[i] = tmp;
        }
    }
}
