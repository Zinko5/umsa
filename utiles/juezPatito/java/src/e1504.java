// Ordenando el Laboratorio
import java.util.Scanner;

public class e1504 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int t = sc.nextInt();
        for (int i = 0; i < t; i++) {
            int n = sc.nextInt();
            int[][] a = new int[n][n];
            for (int j = 0; j < n; j++) {
                for (int k = 0; k < n; k++) {
                    a[j][k] = sc.nextInt();
                }
            }
            boolean bienOrdenado = true;
            for (int j = 0; j < n; j++) {
                for (int k = 0; k < n; k++) {
                    if (a[j][k] != 1) {
                        boolean encontrado = false;
                        for (int s = 0; s < n; s++) {
                            for (int u = 0; u < n; u++) {
                                if (a[j][k] == a[j][s] + a[u][k]) {
                                    encontrado = true;
                                    break;
                                }
                            }
                            if (encontrado) {
                                break;
                            }
                        }
                        if (!encontrado) {
                            bienOrdenado = false;
                            break;
                        }
                    }
                }
                if (!bienOrdenado) {
                    break;
                }
            }
            if (bienOrdenado) {
                System.out.println("Si");
            } else {
                System.out.println("No");
            }
        }
        sc.close();
    }
}
