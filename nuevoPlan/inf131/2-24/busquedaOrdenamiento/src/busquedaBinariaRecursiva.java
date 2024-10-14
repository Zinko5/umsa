public class busquedaBinariaRecursiva {
    public static void main(String[] args) {
        int v[] = new int[4];
        v[0] = 10;
        v[1] = 1;
        v[2] = 5;
        v[3] = 15;
        mostrar(v);
        System.out.println(busqBinRec(v, 0, v.length - 1, 5));
    }

    static void mostrar(int v[]){
        for (int i = 0; i < v.length; i++) {
            System.out.print("[" + v[i] + "]");
        }
        System.out.println();
    }

    static int busqBinRec(int v[], int p, int u, int x){
        int medio;
        if (p > u) {
            return 0;
        }
        medio = (p + u) / 2;
        if (v[medio] == x) {
            return medio;
        } else {
            if (v[medio] > x) {
                return busqBinRec(v, p, medio - 1, x);
            } else {
                return busqBinRec(v, medio + 1, u, x);
            }
        } 
    }
}