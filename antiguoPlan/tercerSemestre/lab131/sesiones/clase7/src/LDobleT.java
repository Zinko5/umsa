public class LDobleT {
    private NodoT p;

    public LDobleT() {
        p = null;
    }

    public NodoT getP() {
        return p;
    }

    public void setP(NodoT p) {
        this.p = p;
    }
    public void adifinal(Trufi x) {
        NodoT nodo= new NodoT();
        nodo.setT(x);
        if (p == null) { 
            setP(nodo);
        }
        else {
            NodoT r = p;
            while (r.getSig() != null) {                
                r = r.getSig();
            }
            r.setSig(nodo);
            nodo.setAnt(r);
        }
    }
    public void mostrar() {
        NodoT r = getP();
        while (r != null) {            
            r.getT().mostar();
            r = r.getSig();
        }
    }
}
