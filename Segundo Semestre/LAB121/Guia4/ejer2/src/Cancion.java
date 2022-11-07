import java.util.Scanner;
public class Cancion {
    Scanner sc = new Scanner(System.in);
    private String nombre;
    private int duracion;
    private String genero;
    private Artista artista = new Artista();
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public int getDuracion() {
        return duracion;
    }
    public void setDuracion(int duracion) {
        this.duracion = duracion;
    }
    public String getGenero() {
        return genero;
    }
    public void setGenero(String genero) {
        this.genero = genero;
    }
    public Artista getArtista() {
        return artista;
    }
    public void setArtista(Artista artista) {
        this.artista = artista;
    }
    public Cancion() {
    }
    public void Leer() {
        System.out.println("Leyendo cancion: ");
        System.out.println("Leer nombre: ");
        nombre = sc.nextLine();
        System.out.println("Leer genero: ");
        genero = sc.nextLine();
        System.out.println("Leer duracion: ");
        duracion = sc.nextInt();
        artista.Leer();
    }
    public void Mostrar() {
        System.out.println("Mostrando cancion: ");
        System.out.println(nombre + " " + duracion + " " + genero);
        artista.Mostrar();
    }
    public boolean Verificar(String X) {
        if (artista.getNombre().equals(X)) {
            return true;
        } else {
            return false;
        }
    }
}
