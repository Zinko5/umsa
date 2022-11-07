import java.util.Scanner;
public class Estante {
	Scanner sc = new Scanner(System.in);
	private double tamaño
	;
	private String color;
	private int nroDivisiones;
	private Division div[] = new Division[20];
	public double getTamaño() {
		return tamaño
		;
	}
	public void setTamaño(double tamaño) {
		this.tamaño
		 = tamaño
		;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public int getNroDivisiones() {
		return nroDivisiones;
	}
	public void setNroDivisiones(int nroDivisiones) {
		this.nroDivisiones = nroDivisiones;
	}
	public Estante () {}
	public Estante(double tamaño
	, String color, int nroDivisiones) {
		this.tamaño
		 = tamaño
		;
		this.color = color;
		this.nroDivisiones = nroDivisiones;
		for (int i = 0; i < nroDivisiones; i++) {
			div[i] = new Division(0);
		}
	}
	public Estante(int c) {
		nroDivisiones = c;
		System.out.println("Leer tamaño: ");
		tamaño
		 = sc.nextDouble();
		System.out.println("Leer color: ");
		color = sc.nextLine();
		color = sc.nextLine();
		for (int i = 0; i < nroDivisiones; i++) {
			div[i] = new Division(0);
		}
	}
	public void Leer() {
		System.out.println("Leyendo estante:\nLeer tamaño: ");
		tamaño
		 = sc.nextDouble();
		System.out.println("Leer color: ");
		color = sc.nextLine();
		System.out.println("Leer numero de divisiones: ");
		nroDivisiones = sc.nextInt();
		for (int i = 0; i < nroDivisiones; i++) {
			div[i] = new Division();
			div[i].Leer();
		}
	}
	public void Mostrar() {
		System.out.println("Mostrando Estante:\n" + tamaño
		 + " " + color + " " + nroDivisiones);
		for (int i = 0; i < nroDivisiones; i++) {
			div[i].Mostrar();
		}
	}
	public void Agregar(Prenda p) {
		for (int i = 0; i < nroDivisiones; i++) {
			div[i].Agregar(p);
		}
	}
	public void Cuantas(String X) {
		int c = 0;
		for (int i = 0; i < nroDivisiones; i++) {
			c = c + div[i].Cuantas(X);
		}
		System.out.println("El estante tiene " + c + " prendas del color " + X);
	}
	public void Llevar() {
		if (nroDivisiones > 1) {
			for (int i = 1; i < nroDivisiones; i++) {
				div[i].Llevar(div[0]);
				div[i].Vaciar();
			}
		}
	}
}
