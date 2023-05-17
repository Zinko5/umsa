public class App {
    public static void main(String[] args) {
        LSimpleV listSimp = new LSimpleV();
        listSimp.adiprinc("Nissan", "4578EPF", "Rojo", 2017);
        listSimp.adiprinc("Toyota", "4512FKL", "Azul", 2019);
        listSimp.adiprinc("Fiat", "2187PER", "Verde", 2021);
        listSimp.adiprinc("Toyota", "0022EPR", "Rojo", 2019);
        listSimp.adiprinc("Fiat", "4353VME", "Blanco", 2018);
        listSimp.adiprinc("Twingo", "0178PVM", "Negro", 2020);
        listSimp.adiprinc("Nissan", "ZPW", "Blanco", 2009);
        
        listSimp.mostrar();
        //1. Mostrar la marca y la placa de los vehiculos del color x
        System.out.println();
        Color(listSimp, "Rojo");
        //2. Mostrar el modelo mas reciente y el mas antiguo
        System.out.println();
        antiguoYNuevo(listSimp);
        
        //3 agregar un nuevo nodo detras de cada vehiculo con datos xxx yyy rojo 2020
        System.out.println();
        agrega(listSimp);
        listSimp.mostrar();
        
        LDobleT listDoble = new LDobleT();
        Trufi truf1 = new Trufi(1, "8437KDN", "Azul", "Nissan");
        Trufi truf2 = new Trufi(1, "4534FGE", "Blanco", "Toyota");
        Trufi truf3 = new Trufi(2, "4612GQE", "Rojo", "Nissan");
        Trufi truf4 = new Trufi(3, "693ERQ", "Negro", "Twingo");
        Trufi truf5 = new Trufi(3, "017QCZ", "Azul", "Nissan");
        Trufi truf6 = new Trufi(4, "126PZP", "Negro", "Toyota");
        listDoble.adifinal(truf1);
        listDoble.adifinal(truf2);
        listDoble.adifinal(truf3);
        listDoble.adifinal(truf4);
        listDoble.adifinal(truf5);
        listDoble.adifinal(truf6);
        listDoble.mostrar();
        //4. Verificar si existe algun trufi de la marca x
        System.out.println();
        verifica(listDoble, "Nissan");
        //5. Cuantos trufis son del color x
        System.out.println();
        Color(listDoble, "Negro");
    }
    static public void Color (LSimpleV listsimp, String x) {
        NodoV nodo = listsimp.getP();
        while (nodo != null) {            
            if (nodo.getColor().equals(x)) {
                System.out.println(nodo.getMarca() + " " + nodo.getPlaca());
            }
            nodo = nodo.getSig();
        }
    }
    static public int antiguo (LSimpleV listsimp) {
        int n = 9999999;
        NodoV nodo = listsimp.getP();
        while (nodo != null) {
            if (nodo.getModelo() < n) {
                n = nodo.getModelo();
            }
            nodo = nodo.getSig();
        }
        System.out.println("El modelo más antiguo es: " + n);
        return n;
    }
    static public int nuevo (LSimpleV listsimp) {
        int n = 0;
        NodoV nodo = listsimp.getP();
        while (nodo != null) {
            if (nodo.getModelo() > n) {
                n = nodo.getModelo();
            }
            nodo = nodo.getSig();
        }
        System.out.println("El modelo más reciente es: " + n);
        return n;
    }
    static public void antiguoYNuevo(LSimpleV listsimp) {
        nuevo(listsimp);
        antiguo(listsimp);
    }
    
    static  public void verifica(LDobleT listdoble, String x ) {
        boolean c = false;
        NodoT nodo = listdoble.getP();
        while (nodo != null) {            
            if (nodo.getT().getMarca().equals(x)) {
                c = true;
            }
            nodo = nodo.getSig();
        }
        if (c) {
            System.out.println("Sí existe un trufi con marca " + x);
        } else {
            System.out.println("No existe un trufi con marca " + x);
        }
    }
    static public void agrega(LSimpleV listsimp) {
        NodoV nodo = listsimp.getP();
        while (nodo != null) {
            NodoV nuevoNodo = new NodoV();
            nuevoNodo.setMarca("xxx");
            nuevoNodo.setPlaca("yyy");
            nuevoNodo.setColor("Rojo");
            nuevoNodo.setModelo(2020);
            NodoV nodoaux = nodo.getSig();
            nodo.setSig(nuevoNodo);
            nodo = nodoaux;
        }
    }
    static  public void Color(LDobleT listdoble, String x ) {
        int c = 0;
        NodoT nodo = listdoble.getP();
        while (nodo != null) {            
            if (nodo.getT().getColor().equals(x)) {
                c ++;
            }
            nodo = nodo.getSig();
        }
            System.out.println(c + " trufi(s) son del color " + x);   
    }
}