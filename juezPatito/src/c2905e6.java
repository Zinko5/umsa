// Array Palindrome?
import java.util.Scanner;

public class c2905e6 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int[] a = new int[n];
        for (int i = 0; i < n; i++) {
            a[i] = sc.nextInt();
        }
        boolean esPalindrome = true;
        for (int i = 0; i < n / 2; i++) {
            if (a[i] != a[n - 1 - i]) {
                esPalindrome = false;
                break;
            }
        }
        if (esPalindrome) {
            System.out.println("SI");
        } else {
            System.out.println("NO");
        }
    }
}
