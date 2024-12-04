import java.util.Scanner;
import java.util.Stack;

/**
 *
 * @author ALEMARHECT
 */
public class ejer3 {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int casos_prueba = sc.nextInt();
        for (int i = 0; i < casos_prueba; i++) {
            int nro_cordenadas = sc.nextInt();
            Stack<int[]> coordenadas = new Stack<int[]>();
            for (int j = 0; j < nro_cordenadas; j++) {
                int x = sc.nextInt();
                int y = sc.nextInt();
                int coods[] = new int[2];
                coods[0] = x;
                coods[1] = y;
                coordenadas.add(coods);
            }
            int x_circulo = sc.nextInt();
            int y_circulo = sc.nextInt();
            int r_circulo = sc.nextInt();
            
            int count = 0;
            while (!coordenadas.isEmpty()) {
                int[] coordenadaActual = coordenadas.pop();
                if (verificarPuntoEnCirculo(coordenadaActual[0],coordenadaActual[1],x_circulo,y_circulo,r_circulo)) {
                    count++;
                } 
            }
            System.out.println(count);
        }
        
    }
    
    public static boolean verificarPuntoEnCirculo(int x, int y, int h, int k, int r) {
        double distanciaCuadrada = Math.pow(x - h, 2) + Math.pow(y - k, 2);
        double radioCuadrado = Math.pow(r, 2);
        
        return distanciaCuadrada <= radioCuadrado;
    }
}