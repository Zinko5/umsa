import java.util.Arrays;
import java.util.Scanner;

public class e272 {
    public static void main(String[] args) throws Exception {
        Scanner sc = new Scanner(System.in);
        int n;
        while (sc.hasNextInt()) {
            n = sc.nextInt();
            int c = 0;
            for (int i = 100000000; i < 999999999; i++) {
                int aux = i / 10000;
                int aux2 = i % 10000;
                if (aux2 != 0) {
                    if (aux / aux2 == n && aux % aux2 == 0 && sinRepetidos(aux, aux2)) {
                        System.out.println(aux + " / " + aux2 + " " + n);
                        c++;
                    }
                }
            }
            if (c == 0) {
                System.out.println("No hay soluciones para " + n);
            }
        }
    }

    public static boolean sinRepetidos(int a, int b) {
        int aux = a * 10000 + b;
        int v[] = new int[9];
        for (int i = 0; i < v.length; i++) {
            v[i] = aux % 10;
            aux = aux / 10;
        }
        Arrays.sort(v);
        for (int i = 0; i < v.length - 1; i++) {
            if (v[i] == v[i + 1]) {
                return false;
            }
        }
        return true;
    }
}
