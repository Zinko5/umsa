// al revés
import java.util.Scanner;

public class c51 {
    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);
        int n = entrada.nextInt();
        
        for (int i = 0; i < n; i++) {
            int a = entrada.nextInt();
            int[] numeros = new int[a];
            
            for (int j = 0; j < a; j++) {
                numeros[j] = entrada.nextInt();
            }
            
            for (int j = a - 1; j >= 0; j--) {
                System.out.print(numeros[j]);
                if (j > 0) {
                    System.out.print(" ");
                }
            }
            System.out.println();
        }
        
        entrada.close();
    }
}
