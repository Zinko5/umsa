import java.util.Scanner;
public class Biblioteca {
    Scanner sc = new Scanner(System.in);
    private String nombre;
    private Libro libros[] = new Libro[50];
    private int nroLibros;
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public Libro[] getLibros() {
        return libros;
    }
    public void setLibros(Libro[] libros) {
        this.libros = libros;
    }
    public int getNroLibros() {
        return nroLibros;
    }
    public void setNroLibros(int nroLibros) {
        this.nroLibros = nroLibros;
    }
    public Biblioteca(String nombre, int nroLibros) {
        this.nombre = nombre;
        this.nroLibros = nroLibros;
        for (int i = 0; i < nroLibros; i++) {
            libros[i].Leer();
        }
    }
    public Biblioteca() {
    }
    public void Mostrar() {
        System.out.println("Mostrando bilbioteca: ");
        System.out.println(nombre + " " + nroLibros);
        for (int i = 0; i < nroLibros; i++) {
            libros[i].Mostrar();
        }
    }
    public void Leer() {
        System.out.println("Leer Biblioteca: ");
        System.out.println("Leer nombre: ");
        nombre = sc.nextLine();
        System.out.println("Leer numero de libros: ");
        nroLibros = sc.nextInt();
        for (int i = 0; i < nroLibros; i++) {
            libros[i] = new Libro();
            libros[i].Leer();
        }
    }
    public void Verificar(String x) {
        System.out.println("Verificando: ");
        boolean c = false;
        for (int i = 0; i < nroLibros; i++) {

            if (libros[i].getTitulo().equals(x)) {
                c = true;
            }
        }
        if (c == false) {
            System.out.println("El libro no esta en la biblioteca");
        } else {
            System.out.println("El libro esta en la biblioteca");
        }
    }
    public void Mostrar(Biblioteca b) {
        for (int i = 0; i < nroLibros; i++) {
            for (int j = 0; j < b.nroLibros; j++) {
                if (b.libros[j].getTitulo().equals(libros[i].getTitulo())){
                    libros[i].Mostrar();
                }
            }
        }
    }
}
