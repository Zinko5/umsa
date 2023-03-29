public class Libro {
    private String Titulo, autor;
    private int idLibro, stock;
    public String getTitulo() {
        return Titulo;
    }
    public void setTitulo(String titulo) {
        Titulo = titulo;
    }
    public String getAutor() {
        return autor;
    }
    public void setAutor(String autor) {
        this.autor = autor;
    }
    public int getIdLibro() {
        return idLibro;
    }
    public void setIdLibro(int idLibro) {
        this.idLibro = idLibro;
    }
    public int getStock() {
        return stock;
    }
    public void setStock(int stock) {
        this.stock = stock;
    }
    public Libro() {
    }
    public Libro(String titulo, String autor, int idLibro, int stock) {
        Titulo = titulo;
        this.autor = autor;
        this.idLibro = idLibro;
        this.stock = stock;
    }
    public void mostrar () {
        System.out.print(Titulo + " " + autor + " " + idLibro + " " + stock);
    }
}
