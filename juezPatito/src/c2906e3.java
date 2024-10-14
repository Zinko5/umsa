// Miguelito contra los Dinosaurios 
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class c2906e3 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        List<Integer> poderes = new ArrayList<>();
        
        for (int i = 0; i < n; i++) {
            poderes.add(sc.nextInt());
        }
        
        int q = sc.nextInt();
        List<Integer> potencias = new ArrayList<>();
        
        for (int i = 0; i < q; i++) {
            potencias.add(sc.nextInt());
        }

        for (int potencia : potencias) {
            int cont = 0;
            int suma = 0;
            for (int poder : poderes) {
                if (poder <= potencia) {
                    cont++;
                    suma += poder;
                }
            }
            System.out.println(cont + " " + suma);
        }
        
        sc.close();
    }
}
