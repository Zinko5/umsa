import java.util.Scanner;
public class App {
    public static void main(String[] args) throws Exception {
        Scanner sc = new Scanner (System.in);
        Biblioteca b1 = new Biblioteca();
        Biblioteca b2 = new Biblioteca();
        b1.Leer();
        b2.Leer();
        b1.Mostrar();
        b2.Mostrar();
        System.out.println("Leer x: ");
        String x = sc.nextLine();
        b1.Verificar(x);
        b1.Mostrar(b2);
    }
}
