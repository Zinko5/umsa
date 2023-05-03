public class Comunidad {
    private int idCom, idMun;
    private String nomCom;

    public int getIdCom() {
        return idCom;
    }

    public void setIdCom(int idCom) {
        this.idCom = idCom;
    }

    public int getIdMun() {
        return idMun;
    }

    public void setIdMun(int idMun) {
        this.idMun = idMun;
    }

    public String getNomCom() {
        return nomCom;
    }

    public void setNomCom(String nomCom) {
        this.nomCom = nomCom;
    }

    public Comunidad() {
    }

    public Comunidad(int idCom, int idMun, String nomCom) {
        this.idCom = idCom;
        this.idMun = idMun;
        this.nomCom = nomCom;
    }
    public void mostrar(){
        System.out.print(idCom + " " + idMun + " " + nomCom);
    }
}