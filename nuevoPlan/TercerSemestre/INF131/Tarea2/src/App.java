import java.util.Random;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
public class App {
    //Gabriel Marcelo Muñoz Callisaya CI:9873103
    public static void main(String[] args) throws Exception {
        long tiempoini;
        long tiempofini;
        Random random = new Random();
        int elem = random.nextInt(150000);
        tiempoini = System.currentTimeMillis();
        tiempofini = System.currentTimeMillis();
        System.out.println("\nGabriel Marcelo Muñoz Callisaya CI:9873103\n\nNumero random: " + elem + "\n\nBusqueda secuencial iterativa:\n");
        int v[];

        System.out.print("Con datos con orden y sin repetidos: " + elem  + " está en el indice ");
        v = leerDatos("ConOrdenSinRepetidos.txt");
        /* mostrar(v); */
        tiempoini = System.currentTimeMillis();
        System.out.print(secuencialIt(v, elem));  
        tiempofini = System.currentTimeMillis();
        System.out.println(" ---------- tardó " + (tiempofini - tiempoini) + " milisegundo(s)");

        System.out.print("Con datos con orden y con repetidos: " + elem  + " está en el indice ");
        v = leerDatos("ConOrdenConRepetidos.txt");
        /* mostrar(v); */
        tiempoini = System.currentTimeMillis();
        System.out.print(secuencialIt(v, elem));  
        tiempofini = System.currentTimeMillis();
        System.out.println(" ---------- tardó " + (tiempofini - tiempoini) + " milisegundo(s)");

        System.out.print("Con datos sin orden y sin repetidos: " + elem  + " está en el indice ");
        v = leerDatos("SinOrdenSinRepetidos.txt");
        /* mostrar(v); */
        tiempoini = System.currentTimeMillis();
        System.out.print(secuencialIt(v, elem));  
        tiempofini = System.currentTimeMillis();
        System.out.println(" ---------- tardó " + (tiempofini - tiempoini) + " milisegundo(s)");

        System.out.print("Con datos sin orden y con repetidos: " + elem  + " está en el indice ");
        v = leerDatos("SinOrdenConRepetidos.txt");
        /* mostrar(v); */
        tiempoini = System.currentTimeMillis();
        System.out.print(secuencialIt(v, elem));  
        tiempofini = System.currentTimeMillis();
        System.out.println(" ---------- tardó " + (tiempofini - tiempoini) + " milisegundo(s)");

        System.out.println("\nBusqueda secuencial recursiva:\n");

        System.out.print("Con datos con orden y sin repetidos: " + elem  + " está en el indice ");
        v = leerDatos("ConOrdenSinRepetidos.txt");
        /* mostrar(v); */
        tiempoini = System.currentTimeMillis();
        System.out.print(secuencialRec(v, 0, elem));
        tiempofini = System.currentTimeMillis();
        System.out.println(" ---------- tardó " + (tiempofini - tiempoini) + " milisegundo(s)");

        System.out.print("Con datos con orden y con repetidos: " + elem  + " está en el indice ");
        v = leerDatos("ConOrdenConRepetidos.txt");
        /* mostrar(v); */
        tiempoini = System.currentTimeMillis();
        System.out.print(secuencialRec(v, 0, elem));
        tiempofini = System.currentTimeMillis();
        System.out.println(" ---------- tardó " + (tiempofini - tiempoini) + " milisegundo(s)");

        System.out.print("Con datos sin orden y sin repetidos: " + elem  + " está en el indice ");
        v = leerDatos("SinOrdenSinRepetidos.txt");
        /* mostrar(v); */
        tiempoini = System.currentTimeMillis();
        System.out.print(secuencialRec(v, 0, elem));
        tiempofini = System.currentTimeMillis();
        System.out.println(" ---------- tardó " + (tiempofini - tiempoini) + " milisegundo(s)");

        System.out.print("Con datos sin orden y con repetidos: " + elem  + " está en el indice ");
        v = leerDatos("SinOrdenConRepetidos.txt");
        /* mostrar(v); */
        tiempoini = System.currentTimeMillis();
        System.out.print(secuencialRec(v, 0, elem));
        tiempofini = System.currentTimeMillis();
        System.out.println(" ---------- tardó " + (tiempofini - tiempoini) + " milisegundo(s)");
    }
  
    public static long secuencialIt(int[] v, int elem) {
        for (int i = 0; i < v.length; i++) {
            if (v[i] == elem) {
                return i;
            }
        }
        return -1;
    }

    public static long secuencialRec(int[] v, int n, int elem) {
        try {
            if (n >= v.length) {
                return -1;
            }
            
            if (v[n] == elem) {
                return n;
            }
            
            return secuencialRec(v, n + 1, elem);
        } catch (StackOverflowError e) {
            return -2; //Si hay desbordamiento antes de encontrar el elemento
        }
    }

    public static void mostrar(int v[]){
        System.out.println("El vector es:");
        for (int i = 0; i < v.length; i++) {
            System.out.print("[" + v[i] + "] ");
        }
        System.out.println();
    }

    public static int[] leerDatos(String nombreArchivo) throws IOException {
        BufferedReader br = new BufferedReader(new FileReader(nombreArchivo));
        String linea = br.readLine();
        String[] elementos = linea.split(", "); // Puedes ajustar el separador según cómo estén organizados los datos en tu archivo
        int[] datos = new int[elementos.length];
        for (int i = 0; i < elementos.length; i++) {
            datos[i] = Integer.parseInt(elementos[i]);
        }
        br.close();
        return datos;
    }
}
