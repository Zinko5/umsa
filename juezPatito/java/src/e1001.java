// Material
import java.util.Scanner;

public class e1001 {
    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);
        int n = entrada.nextInt();
        int[] numeros = new int[n];
        
        for (int i = 0; i < n; i++) {
            numeros[i] = entrada.nextInt();
        }
        
        for (int i = 0; i < n; i++) {
            System.out.println(numeros[i]);
        }
        
        entrada.close();
    }
}
