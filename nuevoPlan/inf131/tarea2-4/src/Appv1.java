import java.util.Scanner;
//v1 con burbuja
public class Appv1 {
    public static void main(String[] args) throws Exception {
        Scanner sc = new Scanner(System.in);
        int N = sc.nextInt();
        int poderDinos[] = leer(sc, N);
        burbuja(poderDinos, N);
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

    static void burbuja(int v[], int n) {
        int aux;
        for (int i = 0; i < n - 1; i++) {
            for (int j = i + 1; j < n; j++) {
                if (v[i] > v[j]) {
                    aux = v[i];
                    v[i] = v[j];
                    v[j] = aux;
                }
            }
        }
    }
}
