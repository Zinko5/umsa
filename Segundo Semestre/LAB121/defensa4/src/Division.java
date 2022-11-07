import java.util.Scanner;
public class Division {
	Scanner sc = new Scanner(System.in);
	private String codigoDiv;
	private int cantidadPrendas;
	private Prenda pre[] = new Prenda[100];
	public String getCodigoDiv() {
		return codigoDiv;
	}
	public void setCodigoDiv(String codigoDiv) {
		this.codigoDiv = codigoDiv;
	}
	public int getCantidadPrendas() {
		return cantidadPrendas;
	}
	public void setCantidadPrendas(int cantidadPrendas) {
		this.cantidadPrendas = cantidadPrendas;
	}
	public Division() {}
	public Division(String codigoDiv, int cantidadPrendas) {
		this.codigoDiv = codigoDiv;
		this.cantidadPrendas = cantidadPrendas;
	}
	public Division(int c) {
		System.out.println("Leer codigo de division: ");
		codigoDiv = sc.nextLine();
		cantidadPrendas = c;
	}
	public void Leer() {
		System.out.println("Leyendo division:\nLeer codigo de division: ");
		codigoDiv = sc.nextLine();
		cantidadPrendas = sc.nextInt();
		for (int i = 0; i < cantidadPrendas; i++) {
			pre[i] = new Prenda();
			pre[i].Leer();
		}
	}
	public void Mostrar() {
		System.out.println("Mostrando division:\n" + codigoDiv + " " + cantidadPrendas);
		for (int i = 0; i < cantidadPrendas; i++) {
			pre[i].Mostrar();
		}
	}
	public void Agregar(Prenda p) {
		pre[cantidadPrendas] = p;
		cantidadPrendas ++;
	}
	public int Cuantas(String X) {
		int c = 0;
		for (int i = 0; i < cantidadPrendas; i++) {
			if (pre[i].getColor().equals(X)) {
				c++;
			}
		}
		return c;
	}
	public void Llevar(Division d) {
		for (int i = 0; i < cantidadPrendas; i++) {
			d.pre[d.cantidadPrendas + i] = pre[i];
		}
        d.cantidadPrendas = d.cantidadPrendas + cantidadPrendas;
	}
	public void Vaciar() {
        for (int i = 0; i < cantidadPrendas; i++) {
            pre[i] = null;
        }
		cantidadPrendas = 0;
	}
}
