public class NodoCircularDoble {
    private objeto o;
    /*si el nodo es de algo, un "objeto" no creado, definir aqui sus atributos, getters y setters */
    private NodoCircularDoble ant, sig;
    
    NodoCircularDoble()
    {
        ant = sig = null;
    }

    public NodoCircularDoble getAnt() {
        return ant;
    }

    public void setAnt(NodoCircularDoble ant) {
        this.ant = ant;
    }

    public NodoCircularDoble getSig() {
        return sig;
    }

    public void setSig(NodoCircularDoble sig) {
        this.sig = sig;
    }
    
    public objeto getObjeto() {
        return o;
    }

    public void setObjeto(objeto o) {
        this.o = o;
    }
}
