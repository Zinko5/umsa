import java.lang.Math;
import java.util.Scanner;

public class ejer1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        long v[][] = new long[n][2];
        for (int i = 0; i < n; i++) {
            v[i][0] = sc.nextLong();
        }
        long aux = Long.SIZE;
        for (int i = 0; i < n; i++) {
            long c = 0;
            c = (aux - Long.numberOfLeadingZeros(v[i][0]) - Long.bitCount(v[i][0]));
            v[i][1] = (long) Math.pow(2, c);
        }
        for (int i = 0; i < n; i++) {
            System.out.println(v[i][1]);
        }
        sc.close();
    }
}