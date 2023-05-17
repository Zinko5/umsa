public class NodoSimpleDepartamentos {
    private Departamento departamento;
    /*si el nodo es de algo, un "Departamento" no creado, definir aqui sus atributos, getters y setters */
    private NodoSimpleDepartamentos sig;
    
    NodoSimpleDepartamentos() {
        sig = null;
    }

    public NodoSimpleDepartamentos getSig() {
        return sig;
    }

    public void setSig(NodoSimpleDepartamentos sig) {
        this.sig = sig;
    }

    public Departamento geDepartamento() {
        return departamento;
    }

    public void setDepartamento(Departamento o) {
        this.departamento = o;
    }
}