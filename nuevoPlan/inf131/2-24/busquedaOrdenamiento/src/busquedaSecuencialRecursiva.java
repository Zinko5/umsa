public class busquedaSecuencialRecursiva {
    public static void main(String[] args) {
        int v[] = new int[4];
        v[0] = 10;
        v[1] = 1;
        v[2] = 5;
        v[3] = 15;
        mostrar(v);
        System.out.println(busqSecRec(v, v.length - 1, 5));
    }

    static void mostrar(int v[]){
        for (int i = 0; i < v.length; i++) {
            System.out.print("[" + v[i] + "]");
        }
        System.out.println();
    }

    static int busqSecRec(int v[], int n, int x){
        if (n == 0) { // si el vector no esta ordenado
     // if (n == 0 || x > v[n]) { si el vector esta ordenado
            return 0;
        } else {
            if (v[n] == x) {
                return n;
            } else {
                return busqSecRec(v, n - 1, x);
            }
        }
    }
}
