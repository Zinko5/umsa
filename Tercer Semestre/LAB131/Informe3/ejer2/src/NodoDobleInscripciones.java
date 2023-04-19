public class NodoDobleInscripciones {
    private int ci;
    private String sigla;
    
    /*si el nodo es de algo, un "objeto" no creado, definir aqui sus atributos, getters y setters */
    private NodoDobleInscripciones ant, sig;

    NodoDobleInscripciones(){
        ant = sig = null;
    }

    public NodoDobleInscripciones getAnt() {
        return ant;
    }

    public void setAnt(NodoDobleInscripciones ant) {
        this.ant = ant;
    }

    public NodoDobleInscripciones getSig() {
        return sig;
    }

    public void setSig(NodoDobleInscripciones sig) {
        this.sig = sig;
    }

    public int getCi() {
        return ci;
    }

    public void setCi(int ci) {
        this.ci = ci;
    }

    public String getSigla() {
        return sigla;
    }

    public void setSigla(String sigla) {
        this.sigla = sigla;
    }
}