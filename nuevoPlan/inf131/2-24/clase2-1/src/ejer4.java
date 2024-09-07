import java.util.Scanner;

public class ejer4 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int x, n;
        x = sc.nextInt();
        n = sc.nextInt();
        for (int i = 1; i <= n; i++) {
            System.out.print(x * i + " ");
        }
    }
}
