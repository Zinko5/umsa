public class ListaDoble {
    private NodoDoble nodo;

    ListaDoble() {
        nodo = null;
    }

    public NodoDoble getNodo() {
        return nodo;
    }

    public void setNodo(NodoDoble nodo) {
        this.nodo = nodo;
    }

    public void adiFinal(objeto o/*si el "objeto" no es un objeto creado, colocar aqui parametros del objeto*/) {
        NodoDoble nuevoNodo = new NodoDoble();
        nuevoNodo.setObjeto(o);//si el "objeto" no es un objeto creado, reemplazar aqui colocando los atributos del "objeto" con setters
        if(getNodo() == null)
            setNodo(nuevoNodo);
        else {
            NodoDoble nodo = getNodo();
            while(nodo.getSig() != null)
                nodo = nodo.getSig();
            nodo.setSig(nuevoNodo);
            nuevoNodo.setAnt(nodo);
        }
    }

    public void mostrar() {
        NodoDoble nodo = getNodo();
        while(nodo != null) {
            nodo.getObjeto().mostrar();//si el "objeto" no es un objeto creado, reemplazar aqui con mostrando los atributos del "objeto"
            nodo = nodo.getSig();
        }
    }
}
