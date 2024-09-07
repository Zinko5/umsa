import java.util.Scanner;

public class primosv2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        boolean c = true;
        for (int i = 2; i < n; i++) {
            if (n % i == 0) {
                c = false;
                break;
            }
        }
        if (c) {
            System.out.println(n + " es primo");
        } else {
            System.out.println(n + " no es primo");
        }
    }
}
