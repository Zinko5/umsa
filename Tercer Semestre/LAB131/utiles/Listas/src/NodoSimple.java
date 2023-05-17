public class NodoSimple {
    private objeto o;
    /*si el nodo es de algo, un "objeto" no creado, definir aqui sus atributos, getters y setters */
    private NodoSimple sig;
    
    NodoSimple() {
        sig = null;
    }

    public NodoSimple getSig() {
        return sig;
    }

    public void setSig(NodoSimple sig) {
        this.sig = sig;
    }

    public objeto getObjeto() {
        return o;
    }

    public void setObjeto(objeto o) {
        this.o = o;
    }
}
