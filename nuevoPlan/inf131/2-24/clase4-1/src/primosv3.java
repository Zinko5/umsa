import java.util.Scanner;

public class primosv3 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        boolean c = true;
        if (n % 2 == 0 && n != 2) {
            c = false;
        } else {
            for (int i = 3; i * i < n; i = i + 2) {
                if (n % i == 0) {
                    c = false;
                    // break;
                }
            }
        }
        if (c) {
            System.out.println(n + " es primo");
        } else {
            System.out.println(n + " no es primo");
        }
    }
}
