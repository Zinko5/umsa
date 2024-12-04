import java.util.Scanner;
import java.util.Stack;

public class ejer1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String str = sc.nextLine();
        Stack<Character> p = new Stack<>();

        for (int i = 0; i < str.length(); i++) {
            p.push(str.charAt(i));
        }

        String res = "";
        while (!p.isEmpty()) {
            res = res + p.pop();
        }

        System.out.println(res);
    }
}
