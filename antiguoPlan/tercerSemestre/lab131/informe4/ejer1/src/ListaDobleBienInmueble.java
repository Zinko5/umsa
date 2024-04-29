public class ListaDobleBienInmueble {
    private NodoDobleBienInmueble nodo;

    ListaDobleBienInmueble() {
        nodo = null;
    }

    public NodoDobleBienInmueble getNodo() {
        return nodo;
    }

    public void setNodo(NodoDobleBienInmueble nodo) {
        this.nodo = nodo;
    }

    public void adiFinal(int id_casa, int tamaño, String ubicacion, ListaCircularSimpleHabitaciones listaCircularSimpleHabitaciones) {
        NodoDobleBienInmueble nuevoNodo = new NodoDobleBienInmueble();
        nuevoNodo.setId_casa(id_casa);
        nuevoNodo.setTamaño(tamaño);
        nuevoNodo.setUbicacion(ubicacion);
        nuevoNodo.setCircularSimpleHabitaciones(listaCircularSimpleHabitaciones);
        if(getNodo() == null)
            setNodo(nuevoNodo);
        else {
            NodoDobleBienInmueble nodo = getNodo();
            while(nodo.getSig() != null)
                nodo = nodo.getSig();
            nodo.setSig(nuevoNodo);
            nuevoNodo.setAnt(nodo);
        }
    }

    public void mostrar() {
        NodoDobleBienInmueble nodo = getNodo();
        while(nodo != null) {
            System.out.println("\n[" + nodo.getId_casa() + " " + nodo.getTamaño() + " " + nodo.getUbicacion() + "]");
            nodo.getCircularSimpleHabitaciones().mostrar();
            nodo = nodo.getSig();
        }
    }
}
