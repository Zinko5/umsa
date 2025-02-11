// Ordenando funciones
import java.util.ArrayList;
import java.util.Scanner;

public class e1334 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = Integer.parseInt(scanner.nextLine());
        ArrayList<Integer> vector = new ArrayList<>();

        for (int i = 0; i < n; i++) {
            vector.add(scanner.nextInt());
        }
        scanner.close();

        for (int i = 0; i < vector.size() - 1; i++) {
            for (int j = i + 1; j < vector.size(); j++) {
                if (comparar(vector.get(i), vector.get(j)) > 0) {
                    int temp = vector.get(i);
                    vector.set(i, vector.get(j));
                    vector.set(j, temp);
                }
            }
        }

        for (int i = 0; i < vector.size(); i++) {
            System.out.print(vector.get(i));
            if (i < vector.size() - 1) {
                System.out.print(" ");
            }
        }
        System.out.println();
    }

    public static int sumarDigitos(int x) {
        int suma = 0;
        while (x != 0) {
            suma += x % 10;
            x /= 10;
        }
        return suma;
    }

    public static int comparar(int a, int b) {
        int sdA = sumarDigitos(a);
        int sdB = sumarDigitos(b);
        if (sdA != sdB) {
            return sdA - sdB;
        } else {
            return a - b;
        }
    }
}
