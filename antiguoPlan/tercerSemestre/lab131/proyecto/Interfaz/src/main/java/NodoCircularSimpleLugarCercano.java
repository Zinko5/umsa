public class NodoCircularSimpleLugarCercano {
    private LugarCercano o;
    private NodoCircularSimpleLugarCercano sig;
    
    NodoCircularSimpleLugarCercano() {
        sig = null;
    }

    public NodoCircularSimpleLugarCercano getSig() {
        return sig;
    }

    public void setSig(NodoCircularSimpleLugarCercano sig) {
        this.sig = sig;
    }

    public LugarCercano getObjeto() {
        return o;
    }

    public void setObjeto(LugarCercano o) {
        this.o = o;
    }
}