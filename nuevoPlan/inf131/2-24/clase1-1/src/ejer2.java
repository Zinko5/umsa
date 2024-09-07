import java.util.Scanner;

public class ejer2 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int N = scanner.nextInt();

        String numero = String.valueOf(N);

        if (numero.contains("7")) {
            System.out.println("Sí");
        } else {
            System.out.println("No");
        }

        scanner.close();

        System.out.println("\nGabriel Marcelo Muñoz Callisaya\r\n" + //
                        "Abimael Sanchez Aparicio\r\n" + //
                        "Erick Fernando Poma Condori\r\n" + //
                        "Paola Nathaly Casilla Rengel\r\n" + //
                        "Jhasmin Nicol Mamani Quispe");
    }
}