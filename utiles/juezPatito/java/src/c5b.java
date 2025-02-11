// Mercader de Medias

import java.util.HashMap;
import java.util.Scanner;

public class c5b {
    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);
        int n = entrada.nextInt();
        int[] arr = new int[n];
        for (int i = 0; i < n; i++) {
            arr[i] = entrada.nextInt();
        }
        
        HashMap<Integer, Integer> contador = new HashMap<>();
        int pares = 0;
        for (int i = 0; i < n; i++) {
            int color = arr[i];
            if (contador.containsKey(color)) {
                contador.put(color, contador.get(color) + 1);
                if (contador.get(color) % 2 == 0) {
                    pares++;
                }
            } else {
                contador.put(color, 1);
            }
        }
        System.out.println(pares);
    }
}
