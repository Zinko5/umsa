public class ListaSimpleDepartamentos {
    private NodoSimpleDepartamentos nodo;
    
    ListaSimpleDepartamentos() {
        nodo = null;
    }

    public NodoSimpleDepartamentos getNodo() {
        return nodo;
    }

    public void setNodo(NodoSimpleDepartamentos nodo) {
        this.nodo = nodo;
    }

    public void adifinal(Departamento departamento/*si el "objeto" no es un objeto creado, colocar aqui parametros del objeto*/) {
        NodoSimpleDepartamentos nuevoNodo = new NodoSimpleDepartamentos();
        nuevoNodo.setDepartamento(departamento);//si el "objeto" no es un objeto creado, reemplazar aqui colocando los atributos del "objeto" con setters
        if(getNodo() == null)
            setNodo(nuevoNodo);
        else {
            NodoSimpleDepartamentos nodo = getNodo();
            while(nodo.getSig() != null)//recorre al ultimo nodo
                nodo = nodo.getSig();
            nodo.setSig(nuevoNodo);
        }
    }

    public void mostrar() {
        NodoSimpleDepartamentos nodo = getNodo();
        while(nodo != null) {
            nodo.geDepartamento().mostrar(); /*si el "objeto" no es un objeto creado, reemplazar aqui con mostrando los atributos del "objeto" */
            nodo = nodo.getSig();
        }
    }
}