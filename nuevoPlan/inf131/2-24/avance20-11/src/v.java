import java.util.Scanner;

public class v {
    static int N = 100000;
    static int[] A = new int[N];

    static int[] ST = new int[4 * N + 10];

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int n = sc.nextInt();

        for (int i = 0; i < n; i++) {
            A[i] = sc.nextInt();
        }

        build(1, 0, n - 1);

        System.out.println("Segment Tree construido:");

        for (int i = 0; i <= n * 2 - 1; i++) {
            System.out.println("Nodo " + i + ": " + ST[i]);
        }

        // System.out.println("Introduce el rango para consultar el mínimo (inicio y fin):");
        // int l = sc.nextInt();
        // int r = sc.nextInt();
        // System.out.println("Mínimo en el rango [" + l + ", " + r + "]: " + minQuery(1, 0, n - 1, l, r));

        // sc.close();
    }

    static void build(int nodo, int l, int r) {
        if (l == r) {
            ST[nodo] = A[l];
            return;
        }
        int m = (l + r) / 2;
        build(nodo * 2, l, m);
        build(nodo * 2 + 1, m + 1, r);
        // ST[nodo] = Math.min(ST[nodo * 2], ST[nodo * 2 + 1]);
        ST[nodo] = ST[nodo * 2] +  ST[nodo * 2 + 1]; // para suma
    }

    static int minQuery(int nodo, int l, int r, int ql, int qr) {
        if (ql > r || qr < l) {
            return Integer.MAX_VALUE;
        }
        if (ql <= l && r <= qr) {
            return ST[nodo];
        }
        int m = (l + r) / 2;
        int left = minQuery(nodo * 2, l, m, ql, qr);
        int right = minQuery(nodo * 2 + 1, m + 1, r, ql, qr);
        return Math.min(left, right);
    }
}
