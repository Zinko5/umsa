public class NodoDoblePersonas {
    private int ci, nroCelular;
    private String nombre;
    /*si el nodo es de algo, un "objeto" no creado, definir aqui sus atributos, getters y setters */
    private NodoDoblePersonas ant, sig;
    
    NodoDoblePersonas(){
        ant = sig = null;
    }


    public NodoDoblePersonas getAnt() {
        return ant;
    }

    public void setAnt(NodoDoblePersonas ant) {
        this.ant = ant;
    }

    public NodoDoblePersonas getSig() {
        return sig;
    }

    public void setSig(NodoDoblePersonas sig) {
        this.sig = sig;
    }

    public int getCi() {
        return ci;
    }

    public void setCi(int ci) {
        this.ci = ci;
    }

    public int getNroCelular() {
        return nroCelular;
    }

    public void setNroCelular(int nroCelular) {
        this.nroCelular = nroCelular;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}