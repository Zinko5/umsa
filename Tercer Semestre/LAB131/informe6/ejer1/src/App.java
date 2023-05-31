public class App {
    public static void main(String[] args) throws Exception {
        ArbolBinarioEnteros ab = new ArbolBinarioEnteros();
        ab.setRaiz(new NodoEnteros());
        ab.crear(ab.getRaiz());
        System.out.println("\nPreorden:");
        ab.preorden();
        ab.podarHojas(ab.getRaiz());
        System.out.println("\nPreorden:");
        ab.preorden();
    }
}
