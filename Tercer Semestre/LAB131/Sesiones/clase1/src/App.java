import java.util.*;
public class App {
    static boolean Verifica(Vector v, int x){
        boolean c = false;
            for (int i = 0; i < v.size(); i++) {
                if (v.get(i).equals(x)) {
                    c = true;
                }
            }
            return c;
        }
    static int Verifica(Vector v, String x){
        int c = -1;
            for (int i = 0; i < v.size(); i++) {
                if (v.get(i).equals(x)) {
                    c = i;
                }
            }
            return c;
    }
    static void Insertar(Vector v, int y, boolean x) {
        for (int i = 0; i < v.size(); i++) {
            boolean c = false;
            if (!v.get(i).equals(y)) {
                v.add(i, x);
            }
            else {
                v.add(v.size(), v.get(i));
            }
        }
    }
    public static void main(String[] args) throws Exception {
        Scanner sc = new Scanner(System.in);
        Vector v1 = new Vector();
        Vector<Integer> v2 = new Vector<Integer>();
        Vector<String> v3 = new Vector<String>();
        //ingresar en cada vector n elementos
        int n;
        System.out.print("Enter n: ");
        n = sc.nextInt();
        for (int i = 0; i < n; i++) {
            if(i % 2 == 0) {
                v1.add(true);
            }
            else {
                v1.add(false);
            }
        }
        System.out.print("Enter n: ");
        n = sc.nextInt();
        for (int i = 0; i < n; i++) {
            v2.add(i);
        }
        System.out.print("Enter n: ");
        n = sc.nextInt();
        for (int i = 0; i < n; i++) {
            String c = "abc" + Integer.toString(i);
            v3.add(c);
        }
        System.out.println(v1);
        System.out.println(v2);
        System.out.println(v3);
        System.out.println();
        
        //verificar si existe el elemento x en vector de numeros
        int x;
        System.out.print("Enter x: ");
        x = sc.nextInt();
        if (Verifica(v2, x)) {
            System.out.println("si existe");
        }
        else {
            System.out.println("no existe");
        }
        System.out.println();
        
        //mostrar el indice donde esta x en vector de cadenas
        String x1;
        System.out.print("Enter x: ");
        x1 = sc.nextLine();
        x1 = sc.nextLine();
        if (Verifica(v3, x1) == -1){
            System.out.println("no existe " + x1);
        }
        else {
            System.out.println("indice " + Verifica(v3, x1));
        }
        
        //inserar un nuevo elemento en la posicion i
    }
}