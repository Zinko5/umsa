// Contando en sort de Inserción
import java.util.*;

public class c2906e1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        while (sc.hasNextLine()) {
            String linea = sc.nextLine();
            String[] partes = linea.split(" ");
            int[] vector = new int[partes.length];
            for (int i = 0; i < partes.length; i++) {
                vector[i] = Integer.parseInt(partes[i]);
            }
            System.out.println(ordenacionInsercion(vector));
        }
        sc.close();
    }

    public static int ordenacionInsercion(int[] vector) {
        int movs = 0;
        List<Integer> ordenado = new ArrayList<>();
        for (int num : vector) {
            int i = 0;
            while (i < ordenado.size() && ordenado.get(i) < num) {
                i++;
            }
            ordenado.add(i, num);
            movs += ordenado.size() - i - 1;
        }
        return movs;
    }
}
