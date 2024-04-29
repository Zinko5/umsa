import java.util.*;

public class App {
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    System.out.print("Ingrese el tamaño del vector: ");
    int n = scanner.nextInt();
    int[] vector = new int[n];
    for (int i = 0; i < n; i++) {
      System.out.print("Ingrese el elemento " + (i + 1) + ": ");
      vector[i] = scanner.nextInt();
    }
    System.out.println("\nLas posibles permutaciones son:");
    permutaciones(vector, 0, n-1);
  }
    
  public static void permutaciones(int[] vector, int primero, int ultimo) {
    if (primero == ultimo) {
      mostrar(vector);
    } else {
      for (int i = primero; i <= ultimo; i++) {
        int aux = vector[primero];
        vector[primero] = vector[i];
        vector[i] = aux;
        permutaciones(vector, primero + 1, ultimo);
        aux = vector[primero];
        vector[primero] = vector[i];
        vector[i] = aux;
      }
    }
  }
    
  public static void mostrar(int[] vector) {
    System.out.print("{");
    for (int i = 0; i < vector.length; i++) {
      System.out.print(vector[i]);
      if (i < vector.length-1) {
        System.out.print(".");
      }
    }
    System.out.println("}");
  }
}