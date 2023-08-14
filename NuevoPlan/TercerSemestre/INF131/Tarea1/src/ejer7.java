import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class ejer7 {
    public static void main(String[] args) throws FileNotFoundException {
        //Gabriel Muñoz Marcelo Callisaya CI: 9873103
        Scanner sc = new Scanner(new File("./src/datos.txt"));
        while (sc.hasNext()) {
            int n = sc.nextInt();
            System.out.println();
            for (int i = 0; i < n; i++) {
                int dato = sc.nextInt();
                System.out.println(dato);;
            }
        }
        sc.close();
    }
}
