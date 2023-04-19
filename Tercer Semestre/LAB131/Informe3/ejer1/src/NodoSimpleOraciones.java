public class NodoSimpleOraciones {
    /*si el nodo es de algo, un "objeto" no creado, definir aqui sus atributos, getters y setters */
    private NodoSimpleOraciones sig;
    private String oracion;
    
    public String getOracion() {
        return oracion;
    }

    public void setOracion(String oracion) {
        this.oracion = oracion;
    }

    NodoSimpleOraciones(){
        sig = null;
    }

    public NodoSimpleOraciones getSig() {
        return sig;
    }

    public void setSig(NodoSimpleOraciones sig) {
        this.sig = sig;
    }
}
