public class NodoDobleInscritos {
    private int idIns, idCat, idEsp, puntaje;
    private String nomIns;

    public int getIdIns() {
        return idIns;
    }

    public void setIdIns(int idIns) {
        this.idIns = idIns;
    }

    public int getIdCat() {
        return idCat;
    }

    public void setIdCat(int idCat) {
        this.idCat = idCat;
    }

    public int getIdEsp() {
        return idEsp;
    }

    public void setIdEsp(int idEsp) {
        this.idEsp = idEsp;
    }

    public int getPuntaje() {
        return puntaje;
    }

    public void setPuntaje(int puntaje) {
        this.puntaje = puntaje;
    }

    public String getNomIns() {
        return nomIns;
    }

    public void setNomIns(String nomIns) {
        this.nomIns = nomIns;
    }
    
    private NodoDobleInscritos ant, sig;

    NodoDobleInscritos(){
        ant = sig = null;
    }

    public NodoDobleInscritos getAnt() {
        return ant;
    }

    public void setAnt(NodoDobleInscritos ant) {
        this.ant = ant;
    }

    public NodoDobleInscritos getSig() {
        return sig;
    }

    public void setSig(NodoDobleInscritos sig) {
        this.sig = sig;
    }
}
