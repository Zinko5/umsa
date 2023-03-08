public class Persona {
    private int ci;
    private String nombre;
    private int edad;
    private String idPelicula;
    public Persona() {
    }
    
    public Persona(int ci, String nombre, int edad, String idPelicula) {
        this.ci = ci;
        this.nombre = nombre;
        this.edad = edad;
        this.idPelicula = idPelicula;
    }

    public void mostrar() {
        System.out.print(ci + " " + nombre + " " + edad + " " + idPelicula);
    }

    public int getCi() {
        return ci;
    }

    public void setCi(int ci) {
        this.ci = ci;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getIdPelicula() {
        return idPelicula;
    }

    public void setIdPelicula(String idPelicula) {
        this.idPelicula = idPelicula;
    }
}