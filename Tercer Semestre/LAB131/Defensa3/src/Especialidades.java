public class Especialidades {
    private String idEsp, idCat, nomEsp;

    public Especialidades() {
    }

    public Especialidades(String idEsp, String idCat, String nomEsp) {
        this.idEsp = idEsp;
        this.idCat = idCat;
        this.nomEsp = nomEsp;
    }

    public String getIdEsp() {
        return idEsp;
    }

    public void setIdEsp(String idEsp) {
        this.idEsp = idEsp;
    }

    public String getIdCat() {
        return idCat;
    }

    public void setIdCat(String idCat) {
        this.idCat = idCat;
    }

    public String getNomEsp() {
        return nomEsp;
    }

    public void setNomEsp(String nomEsp) {
        this.nomEsp = nomEsp;
    }
    public void mostrar() {
        System.out.println(idEsp + " " + idCat + " " + nomEsp);
    }
}
