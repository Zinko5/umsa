public class ListaCircularDoble {
    private NodoCircularDoble nodo;

    ListaCircularDoble() {
        nodo = null;
    }

    public NodoCircularDoble getNodo() {
        return nodo;
    }

    public void setNodo(NodoCircularDoble nodo) {
        this.nodo = nodo;
    }

    void adifinal (objeto o/*si el "objeto" no es un objeto creado, colocar aqui parametros del objeto*/) {
        NodoCircularDoble nuevoNodo = new NodoCircularDoble();
        nuevoNodo.setObjeto(o);//si el "objeto" no es un objeto creado, reemplazar aqui colocando los atributos del "objeto" con setters
        if (getNodo() == null) {
            setNodo(nuevoNodo);
            nuevoNodo.setSig(nuevoNodo);//getNodo().setSig(getNodo());
            nuevoNodo.setAnt(nuevoNodo);
        }
        else {
            NodoCircularDoble nodo = getNodo().getAnt();
            nodo.setSig(nuevoNodo);
            nuevoNodo.setAnt(nodo);
            nuevoNodo.setSig(getNodo());
            getNodo().setAnt(nuevoNodo);
        }
    }

    void mostrar() {
        NodoCircularDoble nodo = getNodo();
	    while (nodo.getSig() != getNodo()) {
            nodo.getObjeto().mostrar();//si el "objeto" no es un objeto creado, reemplazar aqui con mostrando los atributos del "objeto"
            nodo = nodo.getSig();
        }
        nodo.getObjeto().mostrar(); //si el "objeto" no es un objeto creado, reemplazar aqui con mostrando los atributos del "objeto"
    }
}
