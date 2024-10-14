// Numeros de Serie
import java.util.*;

public class c2906e2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        while (sc.hasNextLine()) {
            String[] lst = sc.nextLine().trim().split(" ");
            Arrays.sort(lst, new Comparator<String>() {
                public int compare(String a, String b) {
                    if (a.length() != b.length()) {
                        return a.length() - b.length();
                    }
                    int sumA = 0, sumB = 0;
                    for (int i = 0; i < a.length(); i++) {
                        if (a.charAt(i) >= '0' && a.charAt(i) <= '9') {
                            sumA += a.charAt(i) - '0';
                        }
                    }
                    for (int i = 0; i < b.length(); i++) {
                        if (b.charAt(i) >= '0' && b.charAt(i) <= '9') {
                            sumB += b.charAt(i) - '0';
                        }
                    }
                    if (sumA != sumB) {
                        return sumA - sumB;
                    }
                    return a.compareTo(b);
                }
            });
            System.out.println(String.join(" ", lst) + " ");
        }
        sc.close();
    }
}
