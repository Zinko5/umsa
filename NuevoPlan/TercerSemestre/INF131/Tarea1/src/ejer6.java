import java.util.Scanner;

public class ejer6 {
    public static void main(String[] args) {
        //Gabriel Muñoz Marcelo Callisaya CI: 9873103
        Scanner sc = new Scanner(System.in);
        System.out.print("cantidad de entradas: ");
        while (sc.hasNext()) {
            int n = sc.nextInt();
            for (int i = 0; i < n; i++) {
                System.out.print("entrada: ");
                int dato = sc.nextInt();
                System.out.println(dato);;
            }
            System.out.print("cantidad de entradas: ");
        }
        sc.close();
    }
}
