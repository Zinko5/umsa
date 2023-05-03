public class NodoDobleDepartamentos {
   
    private int idDpto;
    private String nomDpto;
    private ListaDobleMunicipios listaDobleMunicipios;

    public int getIdDpto() {
        return idDpto;
    }

    public void setIdDpto(int idDpto) {
        this.idDpto = idDpto;
    }

    public String getNomDpto() {
        return nomDpto;
    }

    public void setNomDpto(String nomDpto) {
        this.nomDpto = nomDpto;
    }

    public ListaDobleMunicipios getListaDobleMunicipios() {
        return listaDobleMunicipios;
    }

    public void setListaDobleMunicipios(ListaDobleMunicipios listaDobleMunicipios) {
        this.listaDobleMunicipios = listaDobleMunicipios;
    }
    
    private NodoDobleDepartamentos ant, sig;

    NodoDobleDepartamentos(){
        ant = sig = null;
    }

    public NodoDobleDepartamentos getAnt() {
        return ant;
    }

    public void setAnt(NodoDobleDepartamentos ant) {
        this.ant = ant;
    }

    public NodoDobleDepartamentos getSig() {
        return sig;
    }

    public void setSig(NodoDobleDepartamentos sig) {
        this.sig = sig;
    }
}
