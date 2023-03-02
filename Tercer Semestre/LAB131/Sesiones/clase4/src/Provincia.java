public class Provincia {
    private int id, nroHab, superficie;
    private String nombre;

    public Provincia() {
    }

    public Provincia(int id, int nroHab, int superficie, String nombre) {
        this.id = id;
        this.nroHab = nroHab;
        this.superficie = superficie;
        this.nombre = nombre;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getNroHab() {
        return nroHab;
    }

    public void setNroHab(int nroHab) {
        this.nroHab = nroHab;
    }

    public int getSuperficie() {
        return superficie;
    }

    public void setSuperficie(int superficie) {
        this.superficie = superficie;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public void mostrar() {
        System.out.print(nombre + ", " + id + ", " + nroHab + ", " + superficie);
    }
}
