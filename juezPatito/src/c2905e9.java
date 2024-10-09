import java.util.HashSet;
import java.util.Scanner;

public class c2905e9 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int numCasos = sc.nextInt();
        StringBuilder resultados = new StringBuilder();
        
        for (int i = 0; i < numCasos; i++) {
            long n = sc.nextLong();
            resultados.append(esNumeroFeliz(n) ? "Feliz\n" : "Triste\n");
        }
        
        System.out.print(resultados);
        sc.close();
    }

    static boolean esNumeroFeliz(long n) {
        HashSet<Long> visitados = new HashSet<>();
        while (n != 1 && !visitados.contains(n)) {
            visitados.add(n);
            long suma = 0;
            while (n > 0) {
                long digito = n % 10;
                suma += digito * digito;
                n /= 10;
            }
            n = suma;
        }
        return n == 1;
    }
}
