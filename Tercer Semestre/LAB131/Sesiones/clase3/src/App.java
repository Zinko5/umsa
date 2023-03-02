import java.util.*;
public class App {
    public static void verifica(PilaPr a, String x) {
        boolean c = false;
        PilaPr aux = new PilaPr();
        while (!a.esvacia()) {            
            Prenda px = a.eliminar();
            if (px.getNombre().equals(x)) {
                c = true;
            }
            aux.adicionar(px);
        }
        a.vaciar(aux);
        if (c) {
            System.out.println("Si existe " + x);
        }
        else {
            System.out.println("No existe " + x);
        }
    }
    public static void preciomayor(PilaPr a, int x) {
        int c = 0;
        PilaPr aux = new PilaPr();
        while (!a.esvacia()) {            
            Prenda px = a.eliminar();
            if (px.getPrecio() > x) {
                c ++;
            }
            aux.adicionar(px);
        }
        a.vaciar(aux);
        System.out.println("Hay " + c + " prendas con precio mayor a " + x);
    }
    public static void nosevendieron(PilaPr a, PilaVe b) {
        PilaPr aa = new PilaPr();
        PilaVe bb = new PilaVe();
        while (!a.esvacia()) {            
            Prenda px = a.eliminar();
            boolean c = false;
            while (!b.esvacia()) {            
            Venta vx = b.eliminar();
            if (vx.getNombre().equals(px.getNombre())) {
                c = true;
            }
             bb.adicionar(vx);
        }
            b.vaciar(bb);
            if (!c) {
                System.out.println("no vendida: " + px.getNombre());
            }
            aa.adicionar(px);
        }
        a.vaciar(aa);
    }
    public static void vendidasfecha(PilaPr a, PilaVe b, String x) {
        PilaPr aa = new PilaPr();
        PilaVe bb = new PilaVe();
        while (!a.esvacia()) { 
            Prenda px = a.eliminar();
            boolean c = false;
            while (!b.esvacia()) {
                Venta vx = b.eliminar();
                if (vx.getNombre().equals(px.getNombre()) && vx.getFecha().equals(x)) {
                    c = true;
                }
                bb.adicionar(vx);
            }
            b.vaciar(bb);
            if (c) {
                System.out.println("vendida en fecha " + x + ": " + px.getNombre());
            }
            aa.adicionar(px);
        }
        a.vaciar(aa);
    }
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        PilaPr a = new PilaPr();
        Prenda p1 = new Prenda(34, "camisa", "tela", "L");
        Prenda p2 = new Prenda(51, "camiseta", "algodon", "L");
        Prenda p3 = new Prenda(15, "gorro", "lana", "M");
        Prenda p4 = new Prenda(80, "pantalon", "tela", "M");
        Prenda p5 = new Prenda(44, "chompa", "lana", "M");
        a.adicionar(p1);
        a.adicionar(p2);
        a.adicionar(p3);
        a.adicionar(p4);
        a.adicionar(p5);
        a.mostrar();
        
        //verificar si existe la prenda con nombre x true/false
        String x;
        System.out.print("\nEnter x: ");
        x = sc.nextLine();
        verifica(a, x);
        
        //cuantas prendas tienen precio mayor a x
        int x1;
        System.out.print("\nEnter x: ");
        x1 = sc.nextInt();
        preciomayor(a, x1);
        
        //crear la pila de ventas
        System.out.println();
        PilaVe b = new PilaVe();
        Venta v1 = new Venta("camisa", "05/10/2003", 4);
        Venta v2 = new Venta("gorro", "25/12/2016", 6);
        Venta v3 = new Venta("pantalon", "08/05/2023", 10);
        b.adicionar(v1);
        b.adicionar(v2);
        b.adicionar(v3);
        b.mostrar();
        
        //mostrar las pilas que se vendieron en la fecha x
        System.out.println();
        vendidasfecha(a, b, "08/05/2023");
        
        //mostrar las prendas que no se vendieron
        System.out.println();
        nosevendieron(a, b);
        sc.close();
    }
}
