public class quickSort {
    public static void main(String[] args) {
        int v[] = new int[4];
        v[0] = 10;
        v[1] = 1;
        v[2] = 5;
        v[3] = 15;
        mostrar(v);
        ordenacionRapida(v);
        mostrar(v);
    }

    static void mostrar(int v[]){
        for (int i = 0; i < v.length; i++) {
            System.out.print("[" + v[i] + "]");
        }
        System.out.println();
    }

    // static void ordenacionRapida(int v[]){
    //     final int N = v.length;
    //     quick(v, 0, N - 1);
    // }

    // static void quick(int v[], int ini, int fin){
    //     if (ini >= fin) {
    //         return;
    //     }
    //     int pivote = v[ini];
    //     int izq = ini + 1;
    //     int der = fin;
    //     while (der >= izq) {
    //         while (fin >= ini && pivote > v[izq]) {
    //             izq ++;
    //         }
    //         while (der > ini && v[der] >= pivote) {
    //             der --;
    //         }
    //         if (der > izq) {
    //             int tmp = v[izq];
    //             v[izq] = v[der];
    //             v[der] = tmp;
    //         }
    //     }
    //     if (der > ini) {
    //         int tmp = v[ini];
    //         v[ini] = v[der];
    //         v[der] = tmp;
    //     }
    //     quick(v, ini, der - 1);
    //     quick(v, der + 1, fin);
    // }

    static void ordenacionRapida(int v[]){
        final int N = v.length;
        quick(v, 0, N - 1);
    }

    static void quick(int v[], int ini, int fin){
        if (ini >= fin) {
            return;
        }
        int pivote = v[ini];
        int izq = ini + 1;
        int der = fin;
        while (der >= izq) {
            while (fin >= ini && pivote > v[izq]) {
                izq ++;
            }
            while (der > ini && v[der] >= pivote) {
                der --;
            }
            if (der > izq) {
                int tmp = v[izq];
                v[izq] = v[der];
                v[der] = tmp;
            }
        }
        if (der > ini) {
            int tmp = v[ini];
            v[ini] = v[der];
            v[der] = tmp;
        }
        quick(v, ini, der - 1);
        quick(v, der + 1, fin);
    }
}
