public class insercionSort {
    public static void main(String[] args) {
        int v[] = new int[4];
        v[0] = 10;
        v[1] = 1;
        v[2] = 5;
        v[3] = 15;
        mostrar(v);
        insercion(v, v.length);
        mostrar(v);
    }

    static void mostrar(int v[]) {
        for (int i = 0; i < v.length; i++) {
            System.out.print("[" + v[i] + "]");
        }
        System.out.println();
    }

    static void insercion(int v[], int n) {
        int tmp, j;
        for (int i = 1; i < n; i++) {
            tmp = v[i];
            j = i - 1;
            while (j >= 0 && v[j] > tmp) {
                v[j + 1] = v[j];
                j--;
            }
            v[j + 1] = tmp;
        }
    }
}
