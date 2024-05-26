import java.util.Scanner;

public interface ejer2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int v[][] = new int[n][3];
        for (int i = 0; i < n; i++) {
            v[i][0] = sc.nextInt();
            v[i][1] = sc.nextInt();
            v[i][2] = sc.nextInt();
        }
        for (int i = 0; i < n; i++) {
            String r ="SI";
            if (v[i][1] == 1 && v[i][1] != 1) {
                r = "SI";
            }
            if (v[i][1] > v[i][2]) {
                r = "NO";
            }
            if (v[i][1] == v[i][0]) {
                r = "NO";
            }
            if (v[i][1] > v[i][0]) {
                r = "NO";
            }
            if (v[i][0] > 4 && v[i][0] > v[i][1] && v[i][2] > v[i][0]) {
                r = "NO";
            }
            System.out.println(r);
        }
        sc.close();
    }
}
