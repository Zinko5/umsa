public class NodoSimpleMaterias {
    private String sigla, nombreMateria, horario;
    
    /*si el nodo es de algo, un "objeto" no creado, definir aqui sus atributos, getters y setters */
    private NodoSimpleMaterias sig;
    
    NodoSimpleMaterias(){
        sig = null;
    }

    public NodoSimpleMaterias getSig() {
        return sig;
    }

    public void setSig(NodoSimpleMaterias sig) {
        this.sig = sig;
    }

    public String getSigla() {
        return sigla;
    }

    public void setSigla(String sigla) {
        this.sigla = sigla;
    }

    public String getNombreMateria() {
        return nombreMateria;
    }

    public void setNombreMateria(String nombreMateria) {
        this.nombreMateria = nombreMateria;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }
}
