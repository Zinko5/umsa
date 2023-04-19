public class NodoDoble {
    private objeto o;
    /*si el nodo es de algo, un "objeto" no creado, definir aqui sus atributos, getters y setters */
    private NodoDoble ant, sig;

    NodoDoble(){
        ant = sig = null;
    }

    public objeto getObjeto() {
        return o;
    }

    public void setObjeto(objeto o) {
        this.o = o;
    }

    public NodoDoble getAnt() {
        return ant;
    }

    public void setAnt(NodoDoble ant) {
        this.ant = ant;
    }

    public NodoDoble getSig() {
        return sig;
    }

    public void setSig(NodoDoble sig) {
        this.sig = sig;
    }
}