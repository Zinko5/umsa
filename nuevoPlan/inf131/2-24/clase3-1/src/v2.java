import java.util.Scanner;

public class v2 {
    public static void main(String[] args) {
        long n;
        Scanner sc = new Scanner(System.in);
        n = sc.nextLong();
        for (long i = 1; i * i < n; i++) {
            if (n % i == 0) {
                System.out.println(n + " es divisible por " + i);
                System.out.println(n + " es divisible por " + n / i);
            }
        }
    }
}
