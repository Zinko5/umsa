public class App {
    public static void main(String[] args) throws Exception {
        ListaSimpleMuebles listaSimpleMuebles1 = new ListaSimpleMuebles();
        ListaSimpleMuebles listaSimpleMuebles2 = new ListaSimpleMuebles();
        ListaSimpleMuebles listaSimpleMuebles3 = new ListaSimpleMuebles();
        ListaSimpleMuebles listaSimpleMuebles4 = new ListaSimpleMuebles();
        ListaCircularSimpleHabitaciones circularSimpleHabitaciones1 = new ListaCircularSimpleHabitaciones();
        ListaCircularSimpleHabitaciones circularSimpleHabitaciones2 = new ListaCircularSimpleHabitaciones();
        ListaDobleBienInmueble listaDobleBienInmueble = new ListaDobleBienInmueble();

        listaSimpleMuebles1.adifinal(2, "nombre mueble 1");
        listaSimpleMuebles1.adifinal(1, "nombre mueble 2");
        listaSimpleMuebles1.adifinal(2, "nombre mueble 3");
        listaSimpleMuebles1.adifinal(3, "nombre mueble 4");

        listaSimpleMuebles2.adifinal(2, "nombre mueble 5");
        listaSimpleMuebles2.adifinal(1, "nombre mueble 6");
        listaSimpleMuebles2.adifinal(2, "nombre mueble 7");

        listaSimpleMuebles3.adifinal(3, "nombre mueble 8");
        listaSimpleMuebles3.adifinal(2, "nombre mueble 9");
        listaSimpleMuebles3.adifinal(2, "nombre mueble 10");

        listaSimpleMuebles4.adifinal(2, "nombre mueble 11");
        listaSimpleMuebles4.adifinal(2, "nombre mueble 12");

        circularSimpleHabitaciones1.adiprimero("Blanco", "Dormitorio", 100, listaSimpleMuebles1);
        circularSimpleHabitaciones1.adiprimero("Blanco", "Cocina", 100, listaSimpleMuebles2);
        circularSimpleHabitaciones2.adiprimero("Crema", "Dormitorio", 150, listaSimpleMuebles3);
        circularSimpleHabitaciones2.adiprimero("Verde", "Baño", 50, listaSimpleMuebles4);
        
        listaDobleBienInmueble.adiFinal(1, 600, "Calle 10", circularSimpleHabitaciones1);
        listaDobleBienInmueble.adiFinal(2, 750, "Calle 15", circularSimpleHabitaciones2);
        
        listaDobleBienInmueble.mostrar();
        System.out.println();
        masMuebles(listaDobleBienInmueble);
        System.out.println("\nEliminando las habitaciones con cantidad de muebles prima, del bien inmueble de mayor tamaño:");
        eliminar(listaDobleBienInmueble);
        listaDobleBienInmueble.mostrar();

    }
    public static void masMuebles(ListaDobleBienInmueble listaDobleBienInmueble) {
        int m = 0;
        NodoDobleBienInmueble nodoDobleBienInmueble = listaDobleBienInmueble.getNodo();
        while (nodoDobleBienInmueble != null) {
            if (cuantosMuebles(nodoDobleBienInmueble) > m) {
                m = cuantosMuebles(nodoDobleBienInmueble);
            }
            nodoDobleBienInmueble = nodoDobleBienInmueble.getSig();
        }
        NodoDobleBienInmueble nodoDobleBienInmueble2 = listaDobleBienInmueble.getNodo();
        while (nodoDobleBienInmueble2 != null) {
            if (cuantosMuebles(nodoDobleBienInmueble2) == m) {
                System.out.println("El bien inmueble con mas muebles en dormitorios es:");
                System.out.println("\n[" + nodoDobleBienInmueble2.getId_casa() + " " + nodoDobleBienInmueble2.getTamaño() + " " + nodoDobleBienInmueble2.getUbicacion() + "]");
                nodoDobleBienInmueble2.getCircularSimpleHabitaciones().mostrar();
            }
            nodoDobleBienInmueble2 = nodoDobleBienInmueble2.getSig();
        }
    }

    public static int cuantosMuebles(NodoDobleBienInmueble nodoDobleBienInmueble) {
        int c = 0;
        NodoCircularSimpleHabitaciones nodoCircularSimpleHabitaciones =  nodoDobleBienInmueble.getCircularSimpleHabitaciones().getNodo();
        while (nodoCircularSimpleHabitaciones.getSig() != nodoDobleBienInmueble.getCircularSimpleHabitaciones().getNodo()) {
            if (nodoCircularSimpleHabitaciones.getTipo_habitacion().equals("Dormitorio")) {
                NodoSimpleMuebles nodoSimpleMuebles = nodoCircularSimpleHabitaciones.getListaSimpleMuebles().getNodo();
                while (nodoSimpleMuebles != null) {
                    c = c + nodoSimpleMuebles.getCantidad();
                    nodoSimpleMuebles = nodoSimpleMuebles.getSig();
                }
            }
            nodoCircularSimpleHabitaciones = nodoCircularSimpleHabitaciones.getSig();
        }
        if (nodoCircularSimpleHabitaciones.getTipo_habitacion().equals("Dormitorio")) {
            NodoSimpleMuebles nodoSimpleMuebles = nodoCircularSimpleHabitaciones.getListaSimpleMuebles().getNodo();
            while (nodoSimpleMuebles != null) {
                c ++;
                nodoSimpleMuebles = nodoSimpleMuebles.getSig();
            }
        }
        return c;
    }

    public static int tamañoMasGrande(ListaDobleBienInmueble listaDobleBienInmueble) {
        int m = 0;
        NodoDobleBienInmueble nodoDobleBienInmueble = listaDobleBienInmueble.getNodo();
        while (nodoDobleBienInmueble != null) {
            if (nodoDobleBienInmueble.getTamaño() > m) {
                m = nodoDobleBienInmueble.getTamaño();
            }
            nodoDobleBienInmueble = nodoDobleBienInmueble.getSig();
        }
        return m;
    }

    public static boolean esLaMasGrande(NodoDobleBienInmueble nodoDobleBienInmueble, ListaDobleBienInmueble listaDobleBienInmueble) {
        boolean c = false;
        int m = tamañoMasGrande(listaDobleBienInmueble);
        if (nodoDobleBienInmueble.getTamaño() == m) {
            c = true;
        }
        return c;
    }

    public static boolean tieneXMuebles(NodoCircularSimpleHabitaciones nodoCircularSimpleHabitaciones) {
        boolean c = false;
        int cc = 0;
        NodoSimpleMuebles nodoSimpleMuebles = nodoCircularSimpleHabitaciones.getListaSimpleMuebles().getNodo();
        while (nodoSimpleMuebles != null) {
            cc  = cc + nodoSimpleMuebles.getCantidad();
            nodoSimpleMuebles = nodoSimpleMuebles.getSig();
        }
        if (esPrimo(cc)) {
            c = true;
        }
        return c;
    }

    public static boolean esPrimo(int n) {
        boolean c = false;
        int cc = 0;
        for (int i = 1; i < n; i++) {
            if (n % i == 0) {
                cc ++;
            }
        }
        if (cc == 1) {
            c = true;
        }
        return c;
    }

    public static void eliminar(ListaDobleBienInmueble listaDobleBienInmueble) {
        NodoDobleBienInmueble nodoDobleBienInmueble = listaDobleBienInmueble.getNodo();
        while (nodoDobleBienInmueble != null) {
            if (esLaMasGrande(nodoDobleBienInmueble, listaDobleBienInmueble)) {
                NodoCircularSimpleHabitaciones nodoCircularSimpleHabitaciones = nodoDobleBienInmueble.getCircularSimpleHabitaciones().getNodo();
                while (nodoCircularSimpleHabitaciones.getSig() != nodoDobleBienInmueble.getCircularSimpleHabitaciones().getNodo()) {
                    if (tieneXMuebles(nodoCircularSimpleHabitaciones.getSig())) {
                        if (nodoCircularSimpleHabitaciones.getSig() == nodoCircularSimpleHabitaciones) {
                            nodoCircularSimpleHabitaciones.setSig(null);
                        } else {
                            nodoCircularSimpleHabitaciones.setSig(nodoCircularSimpleHabitaciones.getSig().getSig());   
                        }
                    }
                    nodoCircularSimpleHabitaciones = nodoCircularSimpleHabitaciones.getSig();
                }
                if (tieneXMuebles(nodoCircularSimpleHabitaciones.getSig())) {
                    nodoCircularSimpleHabitaciones.setSig(nodoCircularSimpleHabitaciones.getSig().getSig());
                }
            }
            nodoDobleBienInmueble = nodoDobleBienInmueble.getSig();
        }
    }
}

/*
    NodoCircularSimpleHabitaciones nodoCircularSimpleHabitaciones =  nodoDobleBienInmueble.getCircularSimpleHabitaciones().getNodo();
 * while (nodoCircularSimpleHabitaciones.getSig() != nodoDobleBienInmueble.getCircularSimpleHabitaciones().getNodo()) {
            if (nodoCircularSimpleHabitaciones.getTipo_habitacion().equals("Dormitorio")) {
                NodoSimpleMuebles nodoSimpleMuebles = nodoCircularSimpleHabitaciones.getListaSimpleMuebles().getNodo();
                while (nodoSimpleMuebles != null) {
                    c ++;
                    nodoSimpleMuebles = nodoSimpleMuebles.getSig();
                }
            }
            nodoCircularSimpleHabitaciones = nodoCircularSimpleHabitaciones.getSig();
        }
 */