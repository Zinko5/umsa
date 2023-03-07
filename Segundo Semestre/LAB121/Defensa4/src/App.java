import java.util.Scanner;
public class App {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter k divisiones: ");
		int k = sc.nextInt();
		Estante e1 = new Estante(k);
		Estante e2 = new Estante(3);
		System.out.println("\n---Mostrando estantes instanciados:---\n");
		e1.Mostrar();
		e2.Mostrar();
		prenda p1 = new prenda();
		p1.Leer();
		prenda p2 = new prenda();
		p2.Leer();
		prenda p3 = new prenda();
		p3.Leer();
		prenda p4 = new prenda();
		p4.Leer();
		prenda p5 = new prenda();
		p5.Leer();
		prenda p6 = new prenda();
		p6.Leer();
		e1.Agregar(p1);
		e1.Agregar(p2);
		e1.Agregar(p3);
		e1.Agregar(p4);
		e2.Agregar(p5);
		e2.Agregar(p6);
		System.out.println("\n---Mostrando estantes con prendas agreagadas:---\n");
		e1.Mostrar();
		e2.Mostrar();
		System.out.println("Enter color X: ");
		String X = sc.nextLine();
		X = sc.nextLine();
		System.out.println("\n---Mostrando cuantas prendas del color X en cada estante:---\n");
		e1.Cuantas(X);
		e2.Cuantas(X);
		System.out.println("\n---Moviendo todas las prendas a la primera division:---\n");
		e1.Llevar();
		e2.Llevar();
		e1.Mostrar();
        e2.Mostrar();
        sc.close();
	}
}
