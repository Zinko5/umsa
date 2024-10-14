// Cuando entrega los trabajos
import java.util.Scanner;

public class c2906e4 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int[] tiempos = new int[n];
        for (int i = 0; i < n; i++) {
            tiempos[i] = sc.nextInt();
        }
        int consultas = sc.nextInt();

        for (int i = 0; i < consultas; i++) {
            int k = sc.nextInt();
            int izq = 1;
            int der = Integer.MAX_VALUE;
            
            while (izq < der) {
                int medio = (izq + der) / 2;
                long suma = 0;
                
                for (int t : tiempos) {
                    suma += medio / t;
                }
                
                if (suma >= k) {
                    der = medio;
                } else {
                    izq = medio + 1;
                }
            }
            
            System.out.println("Tiempo minimo para " + k + " trabajos es: " + izq);
        }
        
        sc.close();
    }
}
