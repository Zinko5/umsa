// Lote especial
import java.util.Scanner;

public class e2307 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int x = sc.nextInt();
        int[] lote = new int[n];
        for (int i = 0; i < n; i++) {
            lote[i] = sc.nextInt();
        }
        boolean cond1 = true;
        for (int i = 0; i < n - 1; i++) {
            if (lote[i] > lote[i + 1]) {
                cond1 = false;
                break;
            }
        }
        boolean cond2 = (sum(lote) % 2 == 1);
        int contPrimos = 0;
        for (int num : lote) {
            if (esPrimo(num)) {
                contPrimos++;
            }
        }
        boolean cond3 = (contPrimos >= x);
        if (cond1 && cond2 && cond3) {
            System.out.println("SI");
        } else {
            System.out.println("NO");
        }
    }

    public static boolean esPrimo(int num) {
        if (num < 2) {
            return false;
        }
        for (int i = 2; i * i <= num; i++) {
            if (num % i == 0) {
                return false;
            }
        }
        return true;
    }

    public static int sum(int[] array) {
        int total = 0;
        for (int num : array) {
            total += num;
        }
        return total;
    }
}
