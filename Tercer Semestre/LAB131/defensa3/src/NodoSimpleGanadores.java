public class NodoSimpleGanadores {
   private int ci;
   private String nom, pat, mat, seudonimo, idEsp, lugar;

    public int getCi() {
        return ci;
    }

    public void setCi(int ci) {
        this.ci = ci;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPat() {
        return pat;
    }

    public void setPat(String pat) {
        this.pat = pat;
    }

    public String getMat() {
        return mat;
    }

    public void setMat(String mat) {
        this.mat = mat;
    }

    public String getSeudonimo() {
        return seudonimo;
    }

    public void setSeudonimo(String seudonimo) {
        this.seudonimo = seudonimo;
    }

    public String getIdEsp() {
        return idEsp;
    }

    public void setIdEsp(String idEsp) {
        this.idEsp = idEsp;
    }

    public String getLugar() {
        return lugar;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
    }
   
    private NodoSimpleGanadores sig;
    
    NodoSimpleGanadores(){
        sig = null;
    }

    public NodoSimpleGanadores getSig() {
        return sig;
    }

    public void setSig(NodoSimpleGanadores sig) {
        this.sig = sig;
    }

}
