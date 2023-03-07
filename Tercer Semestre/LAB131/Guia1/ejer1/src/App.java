public class App {
    public static void main(String[] args) throws Exception {
        Caja c1 = new Caja("banana", 12, 3);
        Caja c2 = new Caja("manzana", 22, 5);
        Caja c3 = new Caja("pera", 10, 6);
        Caja c4 = new Caja("naranja", 15, 4);
        Caja c5 = new Caja("fresa", 8, 6);
        Caja c6 = new Caja("kiwi", 6, 7);
        Caja c7 = new Caja("uva", 5, 8);
        Caja c8 = new Caja("limon", 18, 2);
        Caja c9 = new Caja("sandía", 3, 15);
        pilaCajas A = new pilaCajas();
        pilaCajas B = new pilaCajas();
        pilaCajas C = new pilaCajas();
        A.adicionar(c1);
        A.adicionar(c2);
        A.adicionar(c3);
        B.adicionar(c4);
        B.adicionar(c5);
        B.adicionar(c6);
        C.adicionar(c7);
        C.adicionar(c8);
        C.adicionar(c9);
        A.mostrar();
        B.mostrar();
        C.mostrar();
        System.out.println("moviendo a la cima la cantidad maxima:");
        A.mover();
        B.mover();
        C.mover();
        A.mostrar();
        B.mostrar();
        C.mostrar();
        System.out.println("precio mayor a x (6) de la fila i (2):");
        A.mostrarprecio(6, B, C, 2);
    }
}
