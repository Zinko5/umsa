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
    }
}
