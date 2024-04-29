public class Participantes {
    private int ci, idEsp;
    private String nom, pat, mat, seudonimo, lugar;

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

    public int getIdEsp() {
        return idEsp;
    }

    public void setIdEsp(int idEsp) {
        this.idEsp = idEsp;
    }

    public String getLugar() {
        return lugar;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
    }

    public Participantes(int ci, String nom, String pat, String mat, String seudonimo, int idEsp, String lugar) {
        this.ci = ci;
        this.nom = nom;
        this.pat = pat;
        this.mat = mat;
        this.seudonimo = seudonimo;
        this.idEsp = idEsp;
        this.lugar = lugar;
    }

    public Participantes() {
    }
    
    public void mostar() {
        System.out.print(ci + " " + nom + " " + pat + " " + mat + " " + seudonimo + " " + idEsp + " " + lugar);
    }
}
