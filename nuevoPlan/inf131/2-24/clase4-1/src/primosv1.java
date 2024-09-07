import java.util.Scanner;

public class primosv1 {
    public static void main(String[] args) throws Exception {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int c = 0;
        for (int i = 1; i < n + 1; i++) {
            if (n % i == 0) {
                c++;
            }
        }
        if (c == 2) {
            System.out.println(n + " es primo");
        } else {
            System.out.println(n + " no es primo");
        }
    }
}
