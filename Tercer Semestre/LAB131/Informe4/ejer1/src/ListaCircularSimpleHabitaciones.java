public class ListaCircularSimpleHabitaciones {
    private NodoCircularSimpleHabitaciones nodo;

    ListaCircularSimpleHabitaciones() {
        nodo = null;
    }

    public NodoCircularSimpleHabitaciones getNodo() {
        return nodo;
    }

    public void setP(NodoCircularSimpleHabitaciones nodo) {
        this.nodo = nodo;
    }

    public void adiprimero (String color, String tipo_habitacion, int tamaño, ListaSimpleMuebles listaSimpleMuebles) {
    	NodoCircularSimpleHabitaciones nuevoNodo = new NodoCircularSimpleHabitaciones();
    	nuevoNodo.setTipo_habitacion(tipo_habitacion);
        nuevoNodo.setColor(color);
        nuevoNodo.setTamaño(tamaño);
        nuevoNodo.setListaSimpleMuebles(listaSimpleMuebles);
	    if (getNodo() == null) {
	        setP(nuevoNodo);
	        getNodo().setSig(getNodo());//nue.setSig(nue)
	    }
	    else {
            nuevoNodo.setSig(getNodo());
	        NodoCircularSimpleHabitaciones nodo = getNodo();
	        while (nodo.getSig() != getNodo())
	    	    nodo = nodo.getSig();
	        nodo.setSig(nuevoNodo);
            setP(nuevoNodo);
	    }
    }

    void mostrar() {
        NodoCircularSimpleHabitaciones nodo = getNodo();
	    while (nodo.getSig() != getNodo()) {
            System.out.println("<" + nodo.getTipo_habitacion() + " " + nodo.getColor() + " " + nodo.getTamaño() + ">");
            nodo.getListaSimpleMuebles().mostrar();
            nodo = nodo.getSig();
        }
        System.out.println("<" + nodo.getTipo_habitacion() + " " + nodo.getColor() + " " + nodo.getTamaño() + ">");
        nodo.getListaSimpleMuebles().mostrar();
    }
}
