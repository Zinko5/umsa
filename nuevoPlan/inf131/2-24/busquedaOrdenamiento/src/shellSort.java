public class shellSort {
    public static void main(String[] args) {
        int v[] = new int[4];
        v[0] = 10;
        v[1] = 1;
        v[2] = 5;
        v[3] = 15;
        mostrar(v);
        ordenacionShell(v);
        mostrar(v);
    }

    static void mostrar(int v[]){
        for (int i = 0; i < v.length; i++) {
            System.out.print("[" + v[i] + "]");
        }
        System.out.println();
    }

    static void ordenacionShell(int[] v) {
        final int N = v.length;
        int incremento = N;
        do {
            incremento = incremento / 2;
            for (int k = 0; k < incremento; k++) {
                for (int i = incremento + k; i < N; i += incremento) {
                    int j = i;
                    while (j - incremento >= 0 && v[j] < v[j - incremento]) {
                        int tmp = v[j];
                        v[j] = v[j - incremento];
                        v[j - incremento] = tmp;
                        j = incremento;
                    }
                }
            }
        } while (incremento > 1);
    }
}
