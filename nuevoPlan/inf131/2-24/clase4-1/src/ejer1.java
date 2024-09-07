import java.util.Scanner;

public class ejer1 {
    public static void main(String[] args) {
        // 1. dado un entero positico, calcular el nro de divisores que tiene, mostrar
        // el nro de divisores ordenados ascendentemente
        // n en un rango de 1 <= n <= n^8
        System.out.println("Ejer 1:");
        Scanner sc = new Scanner(System.in);
        long n = sc.nextLong();
        int c = 0;
        long[] d = new long[(int) n];

        for (long i = 1; i * i <= n; i++) {
            if (n % i == 0) {
                d[c++] = i;
                if (i != n / i) {
                    d[c++] = n / i;
                }
            }
        }

        burbuja(d, c);

        for (int i = 0; i < c; i++) {
            System.out.println(d[i]);
        }

        System.out.println(n + " tiene " + c + " divisores\n");

        // 2. dado un a y b donde a < b, mostrar los primos truncables que existen en el
        // rango, un primo es truncable cuando al quitar un digito de la derecha o
        // izquierda, el numero restante sigue siendo primo

        System.out.println("Ejer 2:");
        int a = sc.nextInt();
        int b = sc.nextInt();
        int c2 = 0;
        int[] pt = new int[b - a + 1];

        for (int i = a; i <= b; i++) {
            if (truncable(i)) {
                pt[c2++] = i;
            }
        }

        System.out.println("\nprimos truncables entre " + a + " y " + b + ":");

        for (int i = 0; i < c2; i++) {
            System.out.println(pt[i]);
        }
    }

    public static boolean truncable(int x) {
        if (!esPrimo(x))
            return false;
        int izq = x;
        int der = x;
        int aux = 10;

        while (der > 0) {
            der = der / 10;
            if (der > 0 && !esPrimo(der))
                return false;
        }

        while (x / aux > 0) {
            izq = x % aux;
            if (!esPrimo(izq))
                return false;
            aux = aux * 10;
        }
        return true;
    }

    public static boolean esPrimo(int x) {
        if (x < 2)
            return false;
        for (int i = 2; i * i <= x; i++) {
            if (x % i == 0)
                return false;
        }
        return true;
    }

    public static void burbuja(long[] v, int n) {
        for (int i = 0; i < n - 1; i++) {
            for (int j = 0; j < n - i - 1; j++) {
                if (v[j] > v[j + 1]) {
                    long temp = v[j];
                    v[j] = v[j + 1];
                    v[j + 1] = temp;
                }
            }
        }
    }
}
