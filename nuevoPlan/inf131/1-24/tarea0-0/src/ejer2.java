import java.util.Scanner;

public class ejer2 {
    public static void main(String[] args) throws Exception {
        //Gabriel Muñoz Marcelo Callisaya CI: 9873103
        Scanner sc = new Scanner(System.in);
        System.out.print("entrada: ");
        while (sc.hasNext()) {
            int i = sc.nextInt();
            System.out.println(i);
            System.out.print("entrada: ");
        }
        sc.close();
    }
}
