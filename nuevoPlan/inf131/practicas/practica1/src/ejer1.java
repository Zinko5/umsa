import java.util.Scanner;

public class ejer1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int v[][] = new int[n][2];
        for (int i = 0; i < n; i++) {
            v[i][0] = sc.nextInt();
        }
        for (int i = 0; i < n; i++) {
            int c = 0;
            for (int j = 0; j < v[i][0]; j++) {
                if ((v[i][0] + j) == (v[i][0] ^ j)) {
                    c ++;
                }
            }
            v[i][1] = c;
        }
        for (int i = 0; i < n; i++) {
            System.out.println(v[i][1]);
        }
        sc.close();
    }
}