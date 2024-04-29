import java.util.*;

public class Prenda {
    Scanner sc = new Scanner(System.in);
    private int precio;
    private String nombre, material, talla;

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public String getTalla() {
        return talla;
    }

    public void setTalla(String talla) {
        this.talla = talla;
    }

    public Prenda(int precio, String nombre, String material, String talla) {
        this.precio = precio;
        this.nombre = nombre;
        this.material = material;
        this.talla = talla;
    }
    public Prenda() {
        
    }
    public void mostrardatos() {
        System.out.println(nombre + " " + material + " " + talla + " " + precio);
    }
    public void leerdatos() {
        System.out.print("Enter nombre: ");
        nombre = sc.nextLine();
        System.out.print("Enter material: ");
        material = sc.nextLine();
        System.out.print("Enter talla: ");
        talla = sc.nextLine();
        System.out.print("Enter precio: ");
        precio = sc.nextInt();
    }
}
