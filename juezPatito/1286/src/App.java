import java.util.ArrayList;
import java.util.Scanner;

public class App {
    public static void main(String[] args) throws Exception {
        int n;
        int c;
        int a;
        Scanner sc = new Scanner(System.in);
        n = sc.nextInt();

        for (int i = 0; i < n; i++) {
            ArrayList<Integer> v = new ArrayList<>();
            boolean bool = true;
            while (bool) {
                a = sc.nextInt();
                v.add(a);
                if (a == 0) {
                    bool = false;
                }
            }

            c = 0;

            for (int j = 0; j < v.size() - 1; j++) {
                    if (v.get(j) < v.get(j + 1)) {
                        c++;
                    }


                // System.out.println("aaaaa");
            }
            System.out.println(c);
        }
    }
}
