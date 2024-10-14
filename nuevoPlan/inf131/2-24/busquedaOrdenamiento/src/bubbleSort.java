public class bubbleSort {
    public static void main(String[] args) throws Exception {
        int v[] = new int[4];
        v[0] = 10;
        v[1] = 1;
        v[2] = 5;
        v[3] = 15;
        mostrar(v);
        burbuja(v);
        mostrar(v);
    }

    static void mostrar(int v[]){
        for (int i = 0; i < v.length; i++) {
            System.out.print("[" + v[i] + "]");
        }
        System.out.println();
    }

    // static void burbuja(int v[]){
    //     int aux;
    //     for (int i = 0; i < v.length - 1; i++) {
    //         for (int j = i + 1; j < v.length; j++) {
    //             if (v[i] > v[j]) {
    //                 aux = v[i];
    //                 v[i] = v[j];
    //                 v[j] = aux;
    //             }
    //         }
    //     }
    // }

    static void burbuja(int v[]){
        int aux;
        for (int i = 0; i < v.length - 1; i++) {
            for (int j = i + 1; j < v.length; j++) {
                if (v[i] > v[j]) {
                    aux = v[i];
                    v[i] = v[j];
                    v[j] = aux;
                }
            }
        }
    }
}
