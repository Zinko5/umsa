public class App {
    public static void main(String[] args) {
        ArbolBinarioActividades abActividades = new ArbolBinarioActividades();
        System.out.println();
        abActividades.crear();
        System.out.println("\nPreorden:");
        abActividades.preorden();
        System.out.println();
        abActividades.masActividades(abActividades.getRaiz(), "13");
        System.out.println("La cantidad de nodos con el mismo mes que sus descendientes izquierdos es: " + abActividades.contarMismoMesIzq(abActividades.getRaiz()));
    }
}
