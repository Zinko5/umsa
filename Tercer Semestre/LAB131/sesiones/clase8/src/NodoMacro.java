public class NodoMacro {
    private int nro;
    private String nombre;
    private NodoMacro ant,sig;

    public int getNro() {
        return nro;
    }

    public void setNro(int nro) {
        this.nro = nro;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public NodoMacro getAnt() {
        return ant;
    }

    public void setAnt(NodoMacro ant) {
        this.ant = ant;
    }

    public NodoMacro getSig() {
        return sig;
    }

    public void setSig(NodoMacro sig) {
        this.sig = sig;
    }

    public NodoMacro() {
    }
    
    
}
