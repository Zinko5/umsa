import java.util.Scanner;

public class ejer3 {
    public static void main(String[] args) throws Exception {
        //Gabriel Muñoz Marcelo Callisaya CI: 9873103
        Scanner sc = new Scanner(System.in);
        System.out.print("cantidad de entradas: ");
        int n = sc.nextInt();
        while (n-- > 0) {
            System.out.print("entrada: ");
            int i = sc.nextInt();
            System.out.println(i);
        }
        sc.close();
    }
}
