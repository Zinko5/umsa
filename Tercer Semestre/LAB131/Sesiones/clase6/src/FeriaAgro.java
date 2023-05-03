public class FeriaAgro {
    private String fecha, lugar, version;

    public FeriaAgro(String fecha, String lugar, String version) {
        this.fecha = fecha;
        this.lugar = lugar;
        this.version = version;
    }

    public FeriaAgro() {
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getLugar() {
        return lugar;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }
    public void mostrar() {
        System.out.print(fecha + " " + lugar + " " + version);
    }
}
