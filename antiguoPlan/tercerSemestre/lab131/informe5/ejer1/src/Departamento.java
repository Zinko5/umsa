public class Departamento {
    private int id, poblacion;
    private String nombre, gobernador;
    private double PBI;
    
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public int getPoblacion() {
        return poblacion;
    }
    public void setPoblacion(int poblacion) {
        this.poblacion = poblacion;
    }
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getGobernador() {
        return gobernador;
    }
    public void setGobernador(String gobernador) {
        this.gobernador = gobernador;
    }
    public double getPBI() {
        return PBI;
    }
    public void setPBI(double pBI) {
        PBI = pBI;
    }
    public Departamento(int id, int poblacion, String nombre, String gobernador, double pBI) {
        this.id = id;
        this.poblacion = poblacion;
        this.nombre = nombre;
        this.gobernador = gobernador;
        PBI = pBI;
    }
    public Departamento() {
    }
    
    public void mostrar() {
        System.out.println(id + " " + poblacion + " " + nombre + " " + gobernador + " " + PBI);
    }
}
