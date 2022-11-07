import java.util.Scanner;

public class Artista {
    Scanner sc = new Scanner(System.in);
    private String nombre;
    private int edad;
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
    public Artista() {
    }
    public void Leer() {
        System.out.print("Leyendo artista: ");
        System.out.print("Leer nombre: ");
        nombre = sc.nextLine();
        System.out.print("Leer edad: ");
        edad = sc.nextInt();
    }
    public void Mostrar() {
        System.out.print("Mostrando artista: ");
        System.out.println(nombre + " " + edad);
    }
}
