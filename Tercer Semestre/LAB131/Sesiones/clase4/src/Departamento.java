public class Departamento {
    private int id;
    private String nombre, capital;

    public Departamento(int id, String nombre, String capital) {
        this.id = id;
        this.nombre = nombre;
        this.capital = capital;
    }
    public Departamento() {}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCapital() {
        return capital;
    }

    public void setCapital(String capital) {
        this.capital = capital;
    }
    public void mostrar() {
        System.out.print(id + ", " + nombre + ", " + capital);
    }
}
