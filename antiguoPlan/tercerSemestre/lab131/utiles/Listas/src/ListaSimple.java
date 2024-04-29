public class ListaSimple {
    private NodoSimple nodo;
    
    ListaSimple() {
        nodo = null;
    }

    public NodoSimple getNodo() {
        return nodo;
    }

    public void setNodo(NodoSimple nodo) {
        this.nodo = nodo;
    }

    public void adifinal(objeto o/*si el "objeto" no es un objeto creado, colocar aqui parametros del objeto*/) {
        NodoSimple nuevoNodo = new NodoSimple();
        nuevoNodo.setObjeto(o);//si el "objeto" no es un objeto creado, reemplazar aqui colocando los atributos del "objeto" con setters
        if(getNodo() == null)
            setNodo(nuevoNodo);
        else {
            NodoSimple nodo = getNodo();
            while(nodo.getSig() != null)//recorre al ultimo nodo
                nodo = nodo.getSig();
            nodo.setSig(nuevoNodo);
        }
    }

    public void mostrar() {
        NodoSimple nodo = getNodo();
        while(nodo != null) {
            nodo.getObjeto().mostrar(); /*si el "objeto" no es un objeto creado, reemplazar aqui con mostrando los atributos del "objeto" */
            nodo = nodo.getSig();
        }
    }
}