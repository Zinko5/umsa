public class App {
    public static void main(String[] args) throws Exception {
        ListaSimpleDepartamentos listaSimpleDepartamentos = new ListaSimpleDepartamentos();
        listaSimpleDepartamentos.adifinal(new Departamento(3, 6841, "Oruro", "Jorge", 345));
        listaSimpleDepartamentos.adifinal(new Departamento(1, 54820, "Santa Cruz", "Pepe", 542));
        listaSimpleDepartamentos.adifinal(new Departamento(2, 5789, "Pando", "Santiago", 710));
        
        mostrar(listaSimpleDepartamentos.getNodo());
        System.out.println();
        mayorPBIque(-2, "Santa Cruz", listaSimpleDepartamentos.getNodo());
    }

    public static void mayorPBIque(double pbi, String x, NodoSimpleDepartamentos nodo) {
        if (pbi == -2) {
            System.out.println("Departamentos com mayor PBI que " + x + ":");
            pbi = PBIde(x, nodo);
        }
        if (pbi == -1) {
            System.out.println("No existe " + x);
        } else {
            if (nodo != null) {
                if (nodo.geDepartamento().getPBI() > pbi) {
                    System.out.println(nodo.geDepartamento().getId() + " " + nodo.geDepartamento().getPoblacion() + " " + nodo.geDepartamento().getNombre() + " " + nodo.geDepartamento().getGobernador() + " " + nodo.geDepartamento().getPBI());
                }
                mayorPBIque(pbi, x, nodo.getSig());
            }
        }
    }

    public static double PBIde(String x, NodoSimpleDepartamentos nodo) {
        if (nodo != null) {
            if (nodo.geDepartamento().getNombre().equals(x)) {
                return nodo.geDepartamento().getPBI();
            }
            return PBIde(x, nodo.getSig());
        }
        else {
            return -1;
        }
    }

    public static void mostrar(NodoSimpleDepartamentos nodo) {
        if (nodo != null) {
            System.out.println(nodo.geDepartamento().getId() + " " + nodo.geDepartamento().getPoblacion() + " " + nodo.geDepartamento().getNombre() + " " + nodo.geDepartamento().getGobernador() + " " + nodo.geDepartamento().getPBI());
            mostrar(nodo.getSig());
        }
    }
}
