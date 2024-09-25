import java.util.Scanner;

public class mcd {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int a, b;
        System.out.println("Datos de entrada:");
        a = sc.nextInt();
        b = sc.nextInt();
        System.out.println("\nTema: recursividad\nNombre: Gabriel Marcelo Muñoz Callisaya CI: 9873103\n");
        System.out.println("MCD recursivo 1:");
        System.out.println(mcd1(a, b));
        System.out.println("MCD recursivo 2:");
        System.out.println(mcd2(a, b));
    }

    static int mcd1(int a, int b) {
        if (b == 0) {
            return a;
        } else {
            return mcd1(b, a % b);
        }
    }

    static int mcd2(int a, int b) {
        if (a == b) {
            return a;
        } else {
            if (a > b) {
                return mcd2(a - b, b);
            } else {
                return mcd2(a, b - a);
            }
        }
    }
}
