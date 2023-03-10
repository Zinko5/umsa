public class Categoria {
    private String nomCat;
    private int idCat;

    public int getIdCat() {
        return idCat;
    }

    public void setIdCat(int idCat) {
        this.idCat = idCat;
    }

    public String getNomCat() {
        return nomCat;
    }

    public void setNomCat(String nomCat) {
        this.nomCat = nomCat;
    }

    public Categoria(int idCat, String nomCat) {
        this.idCat = idCat;
        this.nomCat = nomCat;
    }
    public void mostrar() {
        System.out.print(idCat + " " + nomCat);
    }

    public Categoria() {
    }
}
