import java.util.Scanner;

public class ejer5 {
    public static void main(String[] args) throws Exception {
        //Gabriel Muñoz Marcelo Callisaya CI: 9873103
        Scanner sc = new Scanner(System.in);
        System.out.print("cantidad de entradas: ");
        int n = sc.nextInt();
        while (n > 0) {
            for (int i = 0; i < n; i++) {
                System.out.print("entrada: ");
                int dato = sc.nextInt();
                System.out.println(dato);
            }
            System.out.print("cantidad de entradas: ");
            n = sc.nextInt();
        }
        sc.close();
    }
}
