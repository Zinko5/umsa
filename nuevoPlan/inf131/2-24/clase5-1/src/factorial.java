import java.util.Scanner;

public class factorial {
    public static void main(String[] args) throws Exception {
        Scanner sc = new Scanner(System.in);
        System.out.println("Datos de entrada:");
        int n = sc.nextInt();
        System.out.println("\nTema: recursividad\nNombre: Gabriel Marcelo Muñoz Callisaya CI: 9873103\n");
        System.out.println("factorial recursivo:");
        System.out.println(facto(n));
    }

    static int facto(int n){
        if (n == 0) {
            return 1;
        } else {
            return(n * facto(n - 1));
        }
    }
}
