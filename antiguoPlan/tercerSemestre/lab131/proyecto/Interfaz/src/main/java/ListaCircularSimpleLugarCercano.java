
public class ListaCircularSimpleLugarCercano {

    private NodoCircularSimpleLugarCercano nodo;

    ListaCircularSimpleLugarCercano() {
        nodo = null;
    }

    public NodoCircularSimpleLugarCercano getNodo() {
        return nodo;
    }

    public void setP(NodoCircularSimpleLugarCercano nodo) {
        this.nodo = nodo;
    }

    public void adiprimero(LugarCercano o/*si el "objeto" no es un objeto creado, colocar aqui parametros del objeto*/) {
        NodoCircularSimpleLugarCercano nuevoNodo = new NodoCircularSimpleLugarCercano();
        nuevoNodo.setObjeto(o);//si el "objeto" no es un objeto creado, reemplazar aqui colocando los atributos del "objeto" con setters
        if (getNodo() == null) {
            setP(nuevoNodo);
            getNodo().setSig(getNodo());//nue.setSig(nue)
        } else {
            nuevoNodo.setSig(getNodo());
            NodoCircularSimpleLugarCercano nodo = getNodo();
            while (nodo.getSig() != getNodo()) {
                nodo = nodo.getSig();
            }
            nodo.setSig(nuevoNodo);
            setP(nuevoNodo);
        }
    }

    void mostrar() {
        System.out.println("[Lugares Cercanos]");
        NodoCircularSimpleLugarCercano nodo = getNodo();
        while (nodo.getSig() != getNodo()) {
            nodo.getObjeto().Mostrar();//si el "objeto" no es un objeto creado, reemplazar aqui con mostrando los atributos del "objeto"
            nodo = nodo.getSig();
        }
        nodo.getObjeto().Mostrar();//si el "objeto" no es un objeto creado, reemplazar aqui con mostrando los atributos del "objeto"
    }
}
