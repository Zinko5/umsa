public class seleccionSort {
    public static void main(String[] args) {
        int v[] = new int[4];
        v[0] = 10;
        v[1] = 1;
        v[2] = 5;
        v[3] = 15;
        mostrar(v);
        seleccion(v);
        mostrar(v);
    }

    static void mostrar(int v[]){
        for (int i = 0; i < v.length; i++) {
            System.out.print("[" + v[i] + "]");
        }
        System.out.println();
    }

    // static void seleccion(int v[]){
    //     int k, tmp;
    //     for (int i = 0; i < v.length - 1; i++) {
    //         k = i;
    //         tmp = v[i];
    //         for (int j = i + 1; j < v.length; j++) {
    //             if (tmp > v[j]) {
    //                 tmp = v[j];
    //                 k = j;
    //             }
    //         }
    //         v[k] = v[i];
    //         v[i] = tmp;
    //     }
    // }

    static void seleccion(int v[]){
        int tmp, k;
        for (int i = 0; i < v.length - 1; i++) {
            k = i;
            tmp = v[i];
            for (int j = i + 1; j < v.length; j++) {
                if (tmp > v[j]) {
                    tmp = v[j];
                    k = j;
                }
            }
            v[k] = v[i];
            v[i] = tmp;
        }
    }
}
