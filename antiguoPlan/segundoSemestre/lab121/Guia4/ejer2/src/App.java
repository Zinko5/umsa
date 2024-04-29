import java.util.Scanner;

public class App {
    public static void main(String[] args) throws Exception {
        Scanner sc = new Scanner(System.in);
        MyPlayLists pl = new MyPlayLists();
        pl.Leer();
        pl.Mostrar();
        pl.MostrarM();
        System.out.print("Leer X: ");
        String X = sc.nextLine();
        pl.Verificar(X);
        System.out.print("Leer X: ");
        X = sc.nextLine();
        pl.MostrarG(X);
        pl.Ordenar();
        pl.Mostrar();
        sc.close();
    }
}
