import java.util.Scanner;
//v2 con quicksort
public class App {
    public static void main(String[] args) throws Exception {
        Scanner sc = new Scanner(System.in);
        int N = sc.nextInt();
        int poderDinos[] = leer(sc, N);
        ordenacionRapida(poderDinos);
        int Q = sc.nextInt();
        int poderMig[] = leer(sc, Q);
        for (int i = 0; i < Q; i++) {
            int poderDino = 0;
            int j = 0;
            for (; j < N; j++) {
                if (poderMig[i] >= poderDinos[j]) {
                    poderDino = poderDino + poderDinos[j];
                } else {
                    break;
                }
            }
            System.out.println(j + " " + poderDino);
        }
    }

    public static int[] leer(Scanner sc, int x){
        int vec[] = new int[x];
        for (int i = 0; i < x; i++) {
            vec[i] = sc.nextInt();
        }
        return vec;
    }
    

    public static void ordenacionRapida(int[] v) {
        final int N = v.length;
        quickSort(v, 0, N - 1);
    }

    public static void quickSort(int[] v, int inicio, int fin) {
        if (inicio >= fin) {
            return;
        }
        int pivote = v[inicio];
        int izq = inicio + 1;
        int der = fin;
        while (izq <= der) {
            while (izq <= fin && v [izq] < pivote) {
                izq ++;
            }
            while (der > inicio && v[der] >= pivote) {
                der--;
            }
            if (izq < der) {
                int tmp = v[izq];
                v[izq] = v[der];
                v[der] = tmp;
            }
        }
        if (der > inicio) {
            int tmp = v[inicio];
            v[inicio] = v[der];
            v[der] = tmp;
        }
        quickSort(v, inicio, der - 1);
        quickSort(v, der + 1, fin);
    }
}
