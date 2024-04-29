public class App {
    public static void main(String[] args) {
        /*ArbolBinarioEstudiantes abRecursivo = new ArbolBinarioEstudiantes();
        abRecursivo.setRaiz(new NodoEstudiantes());
        abRecursivo.crear(abRecursivo.getRaiz());
        //1. mostrar preorden
        System.out.println("\nPreorden:");
        abRecursivo.preorden(abRecursivo.getRaiz());
        //2. mostrar inorden y posorden
        System.out.println("\nInOrden:");
        abRecursivo.inorden(abRecursivo.getRaiz());
        System.out.println("\nPosOrden:");
        abRecursivo.posorden(abRecursivo.getRaiz());
        //4. contar la cantidad de aprobados
        System.out.println("\nConteo de aprobados: " + abRecursivo.contar(abRecursivo.getRaiz()));
        */
        //5. crear de forma iterativa
        ArbolBinarioEstudiantes abIterativo = new ArbolBinarioEstudiantes();
        System.out.println();
        abIterativo.crear();
        System.out.println("\nPreorden:");
        abIterativo.preorden();
        
        //6. completar 
        //abIterativo.completar();
        abIterativo.completar(abIterativo.getRaiz());
        System.out.println("\nPreorden y completando:");
        abIterativo.preorden();
    }
}
