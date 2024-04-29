public class insertionSort {
    public static void main(String[] args) throws Exception {
        int v[] = { 16, 76, -2, -33, -6, -92, 23, -1, 52, -55, 39, 10, 56, -71, 88, -56, 92, 34, 73, -60, -22, 53, 61,
                74, 20, 10, -33, 19, 43, 40 };
        mostrar(v);
        insertion(v);
        mostrar(v);
    }

    public static void mostrar(int v[]) {
        for (int i = 0; i < v.length; i++) {
            System.out.print("[" + v[i] + "]");
        }
        System.out.println();
    }

    public static void insertion(int v[]) {
        int tmp, j;
        for (int i = 1; i < v.length; i++) {
            tmp = v[i];
            j = i - 1;
            while (j >= 0 && v[j] > tmp) {
                v[j + 1] = v[j];
                j--;
            }
            v[j + 1] = tmp;
        }
    }

}
