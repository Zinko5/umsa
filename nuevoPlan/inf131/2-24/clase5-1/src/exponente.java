import java.util.Scanner;

public class exponente {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Datos de entrada:");
        long n = sc.nextLong();
        long m = sc.nextLong();
        System.out.println("\nTema: recursividad\nNombre: Gabriel Marcelo Muñoz Callisaya CI: 9873103\n");
        System.out.println("potencia iterativa:");
        System.out.println(potenciaIt(n, m));
        System.out.println("potencia recursiva:");
        System.out.println(potenciaRec(n, m));
        System.out.println("potencia clasica:");
        System.out.println(potenciaClasica(n, m));
    }

    static long potenciaIt(long b, long e){
        long u = 1;
        while (e > 0) {
            if (e % 2 == 1) {
                u = u * b;
            }
            b = b * b;
            e = e / 2;
        }
        return u;
    }

    static long potenciaRec(long b, long e){
        if (e == 0) {
            return 1;
        } else {
            if (e % 2 == 0) {
                return potenciaRec(b * b, e / 2);
            } else {
                return potenciaRec(b * b, e / 2) * b;
            }
        }
    }

    static long potenciaClasica(long b, long e){
        long r = 1;
        for (int i = 0; i < e; i++) {
            r = r * b;
        }
        return r;
    }
}
