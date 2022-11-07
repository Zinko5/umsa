import java.util.Scanner;
public class Persona {
    Scanner sc = new Scanner(System.in);
    private String ci;
    private String nombre;
    private String paterno;
    private String materno;
    private String fechaNacimiento;
    public String getCi() {
        return ci;
    }
    public void setCi(String ci) {
        this.ci = ci;
    }
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getPaterno() {
        return paterno;
    }
    public void setPaterno(String paterno) {
        this.paterno = paterno;
    }
    public String getMaterno() {
        return materno;
    }
    public void setMaterno(String materno) {
        this.materno = materno;
    }
    public String getFechaNacimiento() {
        return fechaNacimiento;
    }
    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }
    public Persona() {
    }
    public void Leer() {
        System.out.println("Leyendo persona: ");
        System.out.println("Leer ci: ");
        ci = sc.nextLine();
        System.out.println("Leer nombre: ");
        nombre = sc.nextLine();
        System.out.println("Leer paterno: ");
        paterno = sc.nextLine();
        System.out.println("Leer materno: ");
        materno = sc.nextLine();
        System.out.println("Leer fecha de naciimiento: ");
        fechaNacimiento = sc.nextLine();
    }
    public void Mostrar() {
        System.out.println("Mostrando persona: ");
        System.out.println(ci + " " + nombre + " " + paterno + " " + materno + " " + fechaNacimiento);
    }
}
