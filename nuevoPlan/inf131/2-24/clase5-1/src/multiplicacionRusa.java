import java.util.Scanner;

public class multiplicacionRusa {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int a, b;
        System.out.println("Datos de entrada:");
        a = sc.nextInt();
        b = sc.nextInt();
        System.out.println("\nTema: recursividad\nNombre: Gabriel Marcelo Muñoz Callisaya CI: 9873103\n");
        System.out.println("Multiplicacion Rusa:");
        System.out.println(mr(a, b)); 
    }

    static int mr(int a, int b){
        if (a == 0) {
            return 0;
        } else {
            if (a % 2 == 0) {
                return(mr(a / 2, b + b));
            } else {
                return(mr(a / 2, b + b) + b);                
            }
        }
    }
}
