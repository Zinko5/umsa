import java.util.Scanner;
public class Prenda {
	Scanner sc = new Scanner(System.in);
	private String nombre;
	private String color;
	private String talla;
	private double precio;
	private int stock;
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getTalla() {
		return talla;
	}
	public void setTalla(String talla) {
		this.talla = talla;
	}
	public double getPrecio() {
		return precio;
	}
	public void setPrecio(double precio) {
		this.precio = precio;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public Prenda() {}
	public void Leer() {
		System.out.println("\nLeyendo prenda: ");
		System.out.println("Leer nombre: ");
		nombre = sc.nextLine();
		System.out.println("Leer color: ");
		color = sc.nextLine();
		System.out.println("Leer talla: ");
		talla = sc.nextLine();
		System.out.println("Leer precio: ");
		precio = sc.nextDouble();
		System.out.println("Leer stock: ");
		stock = sc.nextInt();
	}
	public void Mostrar() {
		System.out.println("Mostrando prenda: \n" + nombre + " " + color + " " + talla + " " + precio + " " + stock);
	}
}
