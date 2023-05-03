public class NodoSimpleCategorias {
    private int idCat;
    private String nomCat;
    private ListaSimpleEspecialidades listaSimpleEspecialidades;
    /*si el nodo es de algo, un "objeto" no creado, definir aqui sus atributos, getters y setters */

    public int getIdCat() {
        return idCat;
    }

    public void setIdCat(int idCat) {
        this.idCat = idCat;
    }

    public String getNomCat() {
        return nomCat;
    }

    public void setNomCat(String nomCat) {
        this.nomCat = nomCat;
    }

    public ListaSimpleEspecialidades getListaSimpleEspecialidades() {
        return listaSimpleEspecialidades;
    }

    public void setListaSimpleEspecialidades(ListaSimpleEspecialidades listaSimpleEspecialidades) {
        this.listaSimpleEspecialidades = listaSimpleEspecialidades;
    }
    
    private NodoSimpleCategorias sig;
    
    NodoSimpleCategorias(){
        sig = null;
    }

    public NodoSimpleCategorias getSig() {
        return sig;
    }

    public void setSig(NodoSimpleCategorias sig) {
        this.sig = sig;
    }
}
