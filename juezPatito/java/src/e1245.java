// De arriba hacia abajo
import java.util.Scanner;

public class e1245 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int x = sc.nextInt();
        int y = sc.nextInt();
        int mayor = Math.max(x, y);
        int menor = Math.min(x, y);
        for (int i = mayor; i >= menor; i--) {
            System.out.println(i);
        }
    }
}