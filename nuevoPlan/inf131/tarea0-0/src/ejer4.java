import java.util.Scanner;

public class ejer4 {
    public static void main(String[] args) throws Exception {
        //Gabriel Muñoz Marcelo Callisaya CI: 9873103
        Scanner sc = new Scanner(System.in);
        System.out.print("cantidad de casos: ");
        int n = sc.nextInt();
        while (n-- > 0) {
            System.out.print("cantidad de entradas: ");
            int i = sc.nextInt();
            while (i-- > 0) {
                System.out.print("entrada: ");
                int o = sc.nextInt();
                System.out.println(o);
            }
        }
        sc.close();
    }
}
