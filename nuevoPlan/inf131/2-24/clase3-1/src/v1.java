import java.util.Scanner;

public class v1 {
    public static void main(String[] args) throws Exception {
        long n;
        Scanner sc = new Scanner(System.in);
        n = sc.nextLong();
        for (long i = 1; i < n; i++) {
            if (n % i == 0) {
                System.out.println(n + " es divisible por " + i);
            }
        }
    }
}
