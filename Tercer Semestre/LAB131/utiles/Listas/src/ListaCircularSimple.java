public class ListaCircularSimple {
    private NodoCircularSimple nodo;

    ListaCircularSimple() {
        nodo = null;
    }

    public NodoCircularSimple getNodo() {
        return nodo;
    }

    public void setP(NodoCircularSimple nodo) {
        this.nodo = nodo;
    }

    public void adiprimero (objeto o/*si el "objeto" no es un objeto creado, colocar aqui parametros del objeto*/) {
    	NodoCircularSimple nuevoNodo = new NodoCircularSimple();
    	nuevoNodo.setObjeto(o);//si el "objeto" no es un objeto creado, reemplazar aqui colocando los atributos del "objeto" con setters
	    if (getNodo() == null) {
	        setP(nuevoNodo);
	        getNodo().setSig(getNodo());//nue.setSig(nue)
	    }
	    else {
            nuevoNodo.setSig(getNodo());
	        NodoCircularSimple nodo = getNodo();
	        while (nodo.getSig() != getNodo())
	    	    nodo = nodo.getSig();
	        nodo.setSig(nuevoNodo);
            setP(nuevoNodo);
	    }
    }

    void mostrar() {
        NodoCircularSimple nodo = getNodo();
	    while (nodo.getSig() != getNodo()) {
            nodo.getObjeto().mostrar();//si el "objeto" no es un objeto creado, reemplazar aqui con mostrando los atributos del "objeto"
            nodo = nodo.getSig();
        }
        nodo.getObjeto().mostrar();//si el "objeto" no es un objeto creado, reemplazar aqui con mostrando los atributos del "objeto"
    }
}
