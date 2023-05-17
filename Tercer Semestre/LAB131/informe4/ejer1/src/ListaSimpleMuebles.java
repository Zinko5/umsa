public class ListaSimpleMuebles {
    private NodoSimpleMuebles nodo;
    
    ListaSimpleMuebles() {
        nodo = null;
    }

    public NodoSimpleMuebles getNodo() {
        return nodo;
    }

    public void setNodo(NodoSimpleMuebles nodo) {
        this.nodo = nodo;
    }

    public void adifinal(int cantidad, String nombre) {
        NodoSimpleMuebles nuevoNodo = new NodoSimpleMuebles();
        nuevoNodo.setCantidad(cantidad);
        nuevoNodo.setNombre(nombre);
        if(getNodo() == null)
            setNodo(nuevoNodo);
        else {
            NodoSimpleMuebles nodo = getNodo();
            while(nodo.getSig() != null)//recorre al ultimo nodo
                nodo = nodo.getSig();
            nodo.setSig(nuevoNodo);
        }
    }

    public void mostrar() {
        NodoSimpleMuebles nodo = getNodo();
        while(nodo != null) {
            System.out.println(nodo.getCantidad() + " " + nodo.getNombre());
            nodo = nodo.getSig();
        }
    }
}