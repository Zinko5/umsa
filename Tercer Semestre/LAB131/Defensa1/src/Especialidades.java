public class Especialidades {
    private String nomEsp;
    private int idEsp, idCat;

    public int getIdEsp() {
        return idEsp;
    }

    public void setIdEsp(int idEsp) {
        this.idEsp = idEsp;
    }

    public int getIdCat() {
        return idCat;
    }

    public void setIdCat(int idCat) {
        this.idCat = idCat;
    }

    public Especialidades(int idEsp, int idCatm, String nomEsp) {
        this.nomEsp = nomEsp;
        this.idEsp = idEsp;
        this.idCat = idCatm;
    }

    

    public String getNomEsp() {
        return nomEsp;
    }

    public void setNomEsp(String nomEsp) {
        this.nomEsp = nomEsp;
    }

   

    public Especialidades() {
    }
    public void mostrar() {
        System.out.print(idEsp + " " + idCat + " " + nomEsp);
    }
    
}
