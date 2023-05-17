public class NodoDobleCategorias {
    private String idCat, nomCat;
    private NodoDobleCategorias ant, sig;

    NodoDobleCategorias(){
        ant = sig = null;
    }

    public String getIdCat() {
        return idCat;
    }

    public void setIdCat(String idCat) {
        this.idCat = idCat;
    }

    public String getNomCat() {
        return nomCat;
    }

    public void setNomCat(String nomCat) {
        this.nomCat = nomCat;
    }

    public NodoDobleCategorias getAnt() {
        return ant;
    }

    public void setAnt(NodoDobleCategorias ant) {
        this.ant = ant;
    }

    public NodoDobleCategorias getSig() {
        return sig;
    }

    public void setSig(NodoDobleCategorias sig) {
        this.sig = sig;
    }
}
