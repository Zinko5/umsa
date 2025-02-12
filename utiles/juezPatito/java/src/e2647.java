// XOR en Numeros
import java.util.Scanner;

public class e2647 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int t = sc.nextInt();
        
        for (int i = 0; i < t; i++) {
            long a = sc.nextLong();
            long b = sc.nextLong();
            long k = sc.nextLong();
            System.out.println(kEsimoPos(a, b, k));
        }
        sc.close();
    }

    public static long kEsimoPos(long a, long b, long k) {
        long lcmAb = (a * b) / gcd(a, b);
        long left = 1, right = k * Math.min(a, b) * 2;

        while (left < right) {
            long mid = (left + right) / 2;
            long count = (mid / a) + (mid / b) - 2 * (mid / lcmAb);
            if (count < k) {
                left = mid + 1;
            } else {
                right = mid;
            }
        }

        return left;
    }

    public static long gcd(long x, long y) {
        while (y != 0) {
            long temp = y;
            y = x % y;
            x = temp;
        }
        return x;
    }
}
