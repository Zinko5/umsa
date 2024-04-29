import java.util.Scanner;

public class Libro {
    Scanner sc = new Scanner(System.in);
    private String titulo;
    private String autor;
    private String tipo;
    public String getTitulo() {
        return titulo;
    }
    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }
    public String getAutor() {
        return autor;
    }
    public void setAutor(String autor) {
        this.autor = autor;
    }
    public String getTipo() {
        return tipo;
    }
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    
    public Libro() {
    }
    public Libro(String titulo, String autor, String tipo) {
        this.titulo = titulo;
        this.autor = autor;
        this.tipo = tipo;
    }
    public void Mostrar() {
        System.out.print("Mostrando libro: ");
        System.out.println(titulo + " " + autor + " " + tipo);
    }
    public void Leer() {
        System.out.print("Leer libro: ");
        System.out.print("Leer titulo: ");
        titulo = sc.nextLine();
        System.out.print("Leer autor: ");
        autor = sc.nextLine();
        System.out.print("Leer tipo: ");
        tipo = sc.nextLine();
    }
}
