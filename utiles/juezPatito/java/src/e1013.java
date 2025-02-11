// Suma igual a XOR
import java.util.Scanner;

public class e1013 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int t = sc.nextInt();
        for (int i = 0; i < t; i++) {
            long n = sc.nextLong();
            long cerosBin = contarCerosEnBinario(n);
            System.out.println((long) Math.pow(2, cerosBin));
        }
        sc.close();
    }

    public static long contarCerosEnBinario(long n) {
        String binario = Long.toBinaryString(n);
        long c = 0;
        for (int i = 0; i < binario.length(); i++) {
            if (binario.charAt(i) == '0') {
                c++;
            }
        }
        return c;
    }
}
