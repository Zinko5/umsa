public class App {
    public static void main(String[] args) throws Exception {
        System.out.println("Hello, World!");
    }
    /*Lista simple */
    public void ejercicios(ListaSimple lstasmple) {
        NodoSimple nodoSimple = lstasmple.getNodo();
        while(nodoSimple != null) {
            /*cosas del problema */
            nodoSimple = nodoSimple.getSig();
        }
    }
    
    /*Lista doble */
    public void ejerciciod(ListaDoble lstadble) {
        NodoDoble nodoDoble = lstadble.getNodo();
        while(nodoDoble != null) {
            /*cosas del problema */
            nodoDoble = nodoDoble.getSig();
        }
    }

    /*Lista circular simple*/
    public void ejerciciocs(ListaCircularSimple lstacirsmple) {
        NodoCircularSimple nodoCircularSimple = lstacirsmple.getNodo();
	    while (nodoCircularSimple.getSig() != lstacirsmple.getNodo()) {
            /*cosas del problema */
            nodoCircularSimple = nodoCircularSimple.getSig();
        }
        /*mismas cosas del problema de arriba */
    }

    /*Lista circular doble */
    public void ejerciciocd(ListaCircularDoble lstacirdble) {
        NodoCircularDoble nodoCircularDoble = lstacirdble.getNodo();
	    while (nodoCircularDoble.getSig() != lstacirdble.getNodo()) {
            /*cosas del problema */
            nodoCircularDoble = nodoCircularDoble.getSig();
        }
        /*mismas cosas del problema de arriba */
    }

    /*
    LinkedList:
    LinkedList<"objeto"> A = new LinkedList<"objeto">
    A.add("objeto")
    A.addFirst("objeto")
    A.addLast("objeto")

    public static void mostrar(LinkedList<Tema> A) {
            ListIterator<Tema> r=A.listIterator(); // para lista de objetos

            while(r.hasNext()) {
                    Tema tx = r.next();
                    tx.mostrar();//proceso
            }
        }

    ArrayList:
    ArrayList<"objeto"> B = new ArrayList<"objeto">();  
    A.add("objeto")

    public static public void Mostrar(ArrayList<Zona> rrylistZona) {
        for (int i = 0; i < rrylistZona.size(); i++) {
            objeto objetosacado = rrylistZona.get(i);
            objetosacado.mostrar();
        }
    }
    */
}
