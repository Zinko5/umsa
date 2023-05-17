public class NodoT {
    private Trufi t;
    private NodoT ant, sig;
    public NodoT() {
        ant = sig = null;
    }

    public Trufi getT() {
        return t;
    }

    public void setT(Trufi t) {
        this.t = t;
    }

    public NodoT getAnt() {
        return ant;
    }

    public void setAnt(NodoT ant) {
        this.ant = ant;
    }

    public NodoT getSig() {
        return sig;
    }

    public void setSig(NodoT sig) {
        this.sig = sig;
    }
    
}
