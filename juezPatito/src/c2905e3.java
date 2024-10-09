// Unica Aparicion
import java.util.Scanner;

public class c2905e3 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        long s = 0;
        for (int i = 0; i < n; i++) {
            long num = sc.nextLong();
            s ^= num;
        }
        System.out.println(s);
        sc.close();
    }
}
