import java.util.Random;
public class App {

    //Gabriel Marcelo Muñoz Callisaya CI: 9873103
    public static void main(String[] args) throws Exception {
        Random rand = new Random();
        int matriz[][] = new int[rand.nextInt(8) + 2][rand.nextInt(8) + 2];
        llenar(matriz);
        mostrar(matriz);
        posicion(matriz, 4);
        System.out.println("\nGabriel Marcelo Muñoz Callisaya CI: 9873103");
    }

    static void llenar(int matriz[][]){
        Random rand = new Random();
        for (int i = 0; i < matriz.length; i++) {
            for (int j = 0; j < matriz[0].length; j++) {
                matriz[i][j] = rand.nextInt(20);
            }
        }
    }

    static void mostrar(int matriz[][]){
        for (int i = 0; i < matriz.length; i++) {
            for (int j = 0; j < matriz[0].length; j++) {
                System.out.print("[" + matriz[i][j] + "] ");
            }
            System.out.println( );
        }
    }

    static void posicion(int matriz[][], int x) {
        for (int i = 0; i < matriz.length; i++) {
            for (int j = 0; j < matriz[0].length; j++) {
                if (matriz[i][j] == x) {
                    System.out.println(x + " existe en la posicion [" + (i + 1) + "][" + (j + 1) + "]");
                    return;
                }
            }
        }
        System.out.println(x + " no existe en la matriz");
    }
}
