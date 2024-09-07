import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class App {
    public static void main(String[] args) throws Exception {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        for (int i = 0; i < n; i++) {
            List<Integer> v = new ArrayList<>();
            int m = sc.nextInt();
            for (int j = 0; j < m; j++) {
                v.add(sc.nextInt());
            }
            repetidos(v);
        }
    }

    public static void repetidos(List<Integer> v) {
        List<Integer> e = new ArrayList<>();
        int c = 0;
        for (int i = 0; i < v.size(); i++) {
            if (!e.contains(v.get(i))) {
                c++;
                e.add(v.get(i));
            }
        }
        System.out.println(c);
    }
}
