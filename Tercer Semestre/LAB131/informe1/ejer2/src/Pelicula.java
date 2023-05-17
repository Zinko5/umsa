public class Pelicula {
    private String idPelicula;
    private String titulo;
    private String genero;
    private int duracion;
    
    public Pelicula(String idPelicula, String titulo, String genero, int duracion) {
        this.idPelicula = idPelicula;
        this.titulo = titulo;
        this.genero = genero;
        this.duracion = duracion;
    }
    public Pelicula() {
    }
    public void mostrar() {
        System.out.print(idPelicula + " " + titulo + " " + genero + " " + duracion);
    }
    public String getIdPelicula() {
        return idPelicula;
    }
    public void setIdPelicula(String idPelicula) {
        this.idPelicula = idPelicula;
    }
    public String getTitulo() {
        return titulo;
    }
    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }
    public String getGenero() {
        return genero;
    }
    public void setGenero(String genero) {
        this.genero = genero;
    }
    public int getDuracion() {
        return duracion;
    }
    public void setDuracion(int duracion) {
        this.duracion = duracion;
    }
}