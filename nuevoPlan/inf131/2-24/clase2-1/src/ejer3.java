import java.util.Scanner;

public class ejer3 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        while (scanner.hasNext()) {
            String x = scanner.next();
            char d = scanner.next().charAt(0);
            String result = "";

            for (int i = 0; i < x.length(); i++) {
                char c = x.charAt(i);
                if (c == d) {
                    char m = '0';
                    for (int j = 0; j < x.length(); j++) {
                        if (x.charAt(j) > m && x.charAt(j) != d) {
                            m = x.charAt(j);
                        }
                    }
                    result += m;
                } else {
                    result += c;
                }
            }
            System.out.println(result);
        }
    }
}
