public class Zona {
    private String nombre, macro;
    private int nroHab;

    public Zona() {
    }

    public Zona(String nombre, String macro, int nroHab) {
        this.nombre = nombre;
        this.macro = macro;
        this.nroHab = nroHab;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getMacro() {
        return macro;
    }

    public void setMacro(String macro) {
        this.macro = macro;
    }

    public int getNroHab() {
        return nroHab;
    }

    public void setNroHab(int nroHab) {
        this.nroHab = nroHab;
    }
    public void mostrar() {
        System.out.println("[" + nombre + " " + macro + " " + nroHab + "]");
    }
}
