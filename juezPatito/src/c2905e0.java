// Mi música Favorita
import java.util.*;

public class c2905e0 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int tc = scanner.nextInt();
        for (int k = 0; k < tc; k++) {
            int n = scanner.nextInt();
            int t = scanner.nextInt();
            int[] pistas = new int[t];
            for (int i = 0; i < t; i++) {
                pistas[i] = scanner.nextInt();
            }

            int[] dp = new int[n + 1];
            boolean[][] selecciones = new boolean[n + 1][t + 1];

            for (int i = 1; i <= t; i++) {
                for (int j = n; j >= pistas[i - 1]; j--) {
                    if (dp[j - pistas[i - 1]] + pistas[i - 1] >= dp[j]) {
                        dp[j] = dp[j - pistas[i - 1]] + pistas[i - 1];
                        System.arraycopy(selecciones[j - pistas[i - 1]], 0, selecciones[j], 0, t + 1);
                        selecciones[j][i] = true;
                    }
                }
            }

            List<Integer> resultado = new ArrayList<>();
            for (int i = 1; i <= t; i++) {
                if (selecciones[n][i]) {
                    resultado.add(pistas[i - 1]);
                }
            }

            for (int i = 0; i < resultado.size(); i++) {
                if (i > 0) System.out.print(" ");
                System.out.print(resultado.get(i));
            }
            System.out.println();
        }
        scanner.close();
    }
}
