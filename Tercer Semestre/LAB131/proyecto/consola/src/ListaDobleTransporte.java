public class ListaDobleTransporte {
    private NodoDobleTransporte nodo;

    ListaDobleTransporte() {
        nodo = null;
    }

    public NodoDobleTransporte getNodo() {
        return nodo;
    }

    public void setNodo(NodoDobleTransporte nodo) {
        this.nodo = nodo;
    }

    public void adiFinal(Transporte o/*si el "objeto" no es un objeto creado, colocar aqui parametros del objeto*/) {
        NodoDobleTransporte nuevoNodo = new NodoDobleTransporte();
        nuevoNodo.setObjeto(o);//si el "objeto" no es un objeto creado, reemplazar aqui colocando los atributos del "objeto" con setters
        if(getNodo() == null)
            setNodo(nuevoNodo);
        else {
            NodoDobleTransporte nodo = getNodo();
            while(nodo.getSig() != null)
                nodo = nodo.getSig();
            nodo.setSig(nuevoNodo);
            nuevoNodo.setAnt(nodo);
        }
    }

    public void Mostrar() {
        System.out.println("[Transporte]");
        NodoDobleTransporte nodo = getNodo();
        while(nodo != null) {
            nodo.getObjeto().Mostrar();//si el "objeto" no es un objeto creado, reemplazar aqui con mostrando los atributos del "objeto"
            nodo = nodo.getSig();
        }
    }
}