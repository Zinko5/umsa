public class NodoCircularSimple {
    private objeto o;
    /*si el nodo es de algo, un "objeto" no creado, definir aqui sus atributos, getters y setters*/
    private NodoCircularSimple sig;
    
    NodoCircularSimple(){
        sig = null;
    }

    public NodoCircularSimple getSig() {
        return sig;
    }

    public void setSig(NodoCircularSimple sig) {
        this.sig = sig;
    }

    public objeto getObjeto() {
        return o;
    }

    public void setObjeto(objeto o) {
        this.o = o;
    }
}