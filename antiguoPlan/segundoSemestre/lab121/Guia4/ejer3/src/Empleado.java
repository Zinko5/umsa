import java.util.Scanner;
public class Empleado extends Persona {
    Scanner sc = new Scanner(System.in);
    private String cargo;
    private int nroItem;
    private double sueldo;
    public String getCargo() {
        return cargo;
    }
    public void setCargo(String cargo) {
        this.cargo = cargo;
    }
    public int getNroItem() {
        return nroItem;
    }
    public void setNroItem(int nroItem) {
        this.nroItem = nroItem;
    }
    public double getSueldo() {
        return sueldo;
    }
    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }
    public Empleado() {
    }
    public void Leer() {
        System.out.print("Leyendo empleado: ");
        System.out.print("Leer cargo: ");
        cargo = sc.nextLine();
        System.out.print("Leer numero de item: ");
        nroItem = sc.nextInt();
        System.out.print("Leer sueldo: ");
        sueldo = sc.nextDouble();
    }
    public void Mostrar() {
        System.out.print("Mostrando empleado: ");
        System.out.println(cargo + " " + nroItem + " " + sueldo);
    }
}
