import java.util.Scanner;

public class ejer3 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int B = scanner.nextInt();
        int G = scanner.nextInt();

        if (B > G) {
            System.out.println("Bat");
        } else {
            System.out.println("Glove");
        }

        scanner.close();

        System.out.println("\nGabriel Marcelo Muñoz Callisaya\r\n" + //
                        "Abimael Sanchez Aparicio\r\n" + //
                        "Erick Fernando Poma Condori\r\n" + //
                        "Paola Nathaly Casilla Rengel\r\n" + //
                        "Jhasmin Nicol Mamani Quispe");
    }
}