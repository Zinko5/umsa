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

        System.out.println("\nBusqueda binaria iterativa:\n");

        System.out.print("Con datos con orden y sin repetidos: " + elem  + " está en el indice ");
        v = leerDatos("ConOrdenSinRepetidos.txt");
        /* mostrar(v); */
        tiempoini = System.currentTimeMillis();
        System.out.print(binariaIt(v, elem));
        tiempofini = System.currentTimeMillis();
        System.out.println(" ---------- tardó " + (tiempofini - tiempoini) + " milisegundo(s)");

        System.out.print("Con datos con orden y con repetidos: " + elem  + " está en el indice ");
        v = leerDatos("ConOrdenConRepetidos.txt");
        /* mostrar(v); */
        tiempoini = System.currentTimeMillis();
        System.out.print(binariaIt(v, elem));
        tiempofini = System.currentTimeMillis();
        System.out.println(" ---------- tardó " + (tiempofini - tiempoini) + " milisegundo(s)");

        System.out.println("\nBusqueda binaria recursiva:\n");

        System.out.print("Con datos con orden y sin repetidos: " + elem  + " está en el indice ");
        v = leerDatos("ConOrdenSinRepetidos.txt");
        /* mostrar(v); */
        tiempoini = System.currentTimeMillis();
        System.out.print(binariaRec(v, 0, v.length - 1, elem));
        tiempofini = System.currentTimeMillis();
        System.out.println(" ---------- tardó " + (tiempofini - tiempoini) + " milisegundo(s)");

        System.out.print("Con datos con orden y con repetidos: " + elem  + " está en el indice ");
        v = leerDatos("ConOrdenConRepetidos.txt");
        /* mostrar(v); */
        tiempoini = System.currentTimeMillis();
        System.out.print(binariaRec(v, 0, v.length - 1, elem));
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

    public static int binariaIt(int [] v, int elem){
        int a = 0;
        int b = v.length - 1;
        while ((b - a) > 1) {
            int mid = (a + b) / 2;
            if (v[mid] >= elem) {
                b = mid;
            } else {
                a = mid;
            }
        }
        if (v[b] == elem) {
            return b;
        }
        return -1;
    }

    public static int binariaRec(int[] v, int p, int u, int elem){
        int medio;
        if (p > u) {
            return -1;
        }
        medio = (p + u) / 2;
        if (v[medio] == elem) {
            return medio;
        } else {
            if (v[medio] > elem) {
                return binariaRec(v, p, medio - 1, elem);
            } else {
                return binariaRec(v, medio + 1, u, elem);
            }
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
