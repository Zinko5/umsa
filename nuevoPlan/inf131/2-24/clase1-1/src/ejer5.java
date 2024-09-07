import java.util.Scanner;

public class ejer5 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int N = scanner.nextInt();
        int S = scanner.nextInt();
        int K = scanner.nextInt();

        int totalProductos = 0;

        for (int i = 0; i < N; i++) {
            int precio = scanner.nextInt();
            int cantidad = scanner.nextInt();
            totalProductos += precio * cantidad;
        }

        int costoEnvio = (totalProductos >= S) ? 0 : K;

        int totalPagar = totalProductos + costoEnvio;

        System.out.println(totalPagar);

        scanner.close();

        System.out.println("\nGabriel Marcelo Muñoz Callisaya\r\n" + //
                        "Abimael Sanchez Aparicio\r\n" + //
                        "Erick Fernando Poma Condori\r\n" + //
                        "Paola Nathaly Casilla Rengel\r\n" + //
                        "Jhasmin Nicol Mamani Quispe");
    }
}