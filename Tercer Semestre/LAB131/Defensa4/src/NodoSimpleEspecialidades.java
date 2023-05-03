public class NodoSimpleEspecialidades {
    private int idEsp, nroPremios, montoPremio;
    private String nomEsp;

    public int getIdEsp() {
        return idEsp;
    }

    public void setIdEsp(int idEsp) {
        this.idEsp = idEsp;
    }

    public int getNroPremios() {
        return nroPremios;
    }

    public void setNroPremios(int nroPremios) {
        this.nroPremios = nroPremios;
    }

    public int getMontoPremio() {
        return montoPremio;
    }

    public void setMontoPremio(int montoPremio) {
        this.montoPremio = montoPremio;
    }

    public String getNomEsp() {
        return nomEsp;
    }

    public void setNomEsp(String nomEsp) {
        this.nomEsp = nomEsp;
    }
    
    
    private NodoSimpleEspecialidades sig;
    
    NodoSimpleEspecialidades(){
        sig = null;
    }

    public NodoSimpleEspecialidades getSig() {
        return sig;
    }
 
    public void setSig(NodoSimpleEspecialidades sig) {
        this.sig = sig;
    }
}
