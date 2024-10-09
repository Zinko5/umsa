// Números capicúa	
import java.util.Scanner;

public class c2905e5 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String n = sc.nextLine();
        String invertida = "";
        for (int i = n.length() - 1; i >= 0; i--) {
            invertida += n.charAt(i);
        }

        if (n.equals(invertida)) {
            System.out.println('S');
        } else {
            System.out.println('N');
        }
    }
}
