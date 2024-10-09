// Digitos Primos
import java.util.Scanner;

public class c2905e7 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int t = sc.nextInt();
        sc.nextLine();
        for (int i = 0; i < t; i++) {
            String n = sc.nextLine();
            String res = "";
            for (char d : n.toCharArray()) {
                if (d == '2' || d == '3' || d == '5' || d == '7') {
                    res += d;
                }
            }
            System.out.println(res.length() > 0 ? res : -1);
        }
        sc.close();
    }
}
