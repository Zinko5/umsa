import java.util.Scanner;

public class ejer2 {
    public static void main(String[] args) throws Exception {
        int a, b;
        Scanner sc = new Scanner(System.in);
        while (sc.hasNext()) {
            a = sc.nextInt();
            b = sc.nextInt();
            if (a % b == 0) {
                System.out.println(a + " es divisible por " + b);
            } else if (b % a == 0) {
                System.out.println(b + " es divisible por " + a);
            } else {
                System.out.println("-1");
            }
        }
    }
}
