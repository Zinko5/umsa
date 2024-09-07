import java.util.Scanner;

public class ejer4 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int N = scanner.nextInt();

        int maximo = Integer.MIN_VALUE;
        int segundoMaximo = Integer.MIN_VALUE;

        for (int i = 0; i < N; i++) {
            int num = scanner.nextInt();

            if (num > maximo) {
                segundoMaximo = maximo;
                maximo = num;
            } else if (num > segundoMaximo && num < maximo) {
                segundoMaximo = num;
            }
        }

        System.out.println(segundoMaximo);

        scanner.close();

        System.out.println("\nGabriel Marcelo Muñoz Callisaya\r\n" + //
                        "Abimael Sanchez Aparicio\r\n" + //
                        "Erick Fernando Poma Condori\r\n" + //
                        "Paola Nathaly Casilla Rengel\r\n" + //
                        "Jhasmin Nicol Mamani Quispe");
    }
}