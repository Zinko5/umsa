public class NodoDobleTransporte {
    private Transporte o;
    private NodoDobleTransporte ant, sig;

    NodoDobleTransporte() {
        ant = sig = null;
    }

    public Transporte getObjeto() {
        return o;
    }

    public void setObjeto(Transporte o) {
        this.o = o;
    }

    public NodoDobleTransporte getAnt() {
        return ant;
    }

    public void setAnt(NodoDobleTransporte ant) {
        this.ant = ant;
    }

    public NodoDobleTransporte getSig() {
        return sig;
    }

    public void setSig(NodoDobleTransporte sig) {
        this.sig = sig;
    }
}