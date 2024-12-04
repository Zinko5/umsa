import java.util.Scanner;
import java.util.Stack;
public class ejer2 {
     public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        int[] arr = new int[n]; 
        for (int i = 0; i < n; i++) {
            arr[i] = scanner.nextInt();
        }
        System.out.println(espalin(arr));
}

public static String espalin(int[] arr) {
    Stack<Integer> stack = new Stack<>();
    int n = arr.length;
    for (int i = 0; i < n / 2; i++) {
        stack.push(arr[i]);
    }
    for (int i = (n + 1) / 2; i < n; i++) {
        if (arr[i] != stack.pop()) {
            return "NO";
        }
    }

    return "SI";
}
}
