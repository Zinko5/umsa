public class Municipio {
    private int idMun;
    private String nomMun;

    public int getIdMun() {
        return idMun;
    }

    public void setIdMun(int idMun) {
        this.idMun = idMun;
    }

    public String getNomMun() {
        return nomMun;
    }

    public void setNomMun(String nomMun) {
        this.nomMun = nomMun;
    }

    public Municipio(int idMun, String nomMun) {
        this.idMun = idMun;
        this.nomMun = nomMun;
    }

    public Municipio() {
    }
    public void mostrar() {
        System.out.print(idMun + " " + nomMun);
    }
}
