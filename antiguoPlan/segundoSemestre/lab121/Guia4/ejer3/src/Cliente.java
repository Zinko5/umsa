import java.util.Scanner;
public class Cliente extends Persona {
    Scanner sc = new Scanner(System.in);
    private int codCliente;

    public int getCodCliente() {
        return codCliente;
    }

    public void setCodCliente(int codCliente) {
        this.codCliente = codCliente;
    }

    public Cliente() {
    }
    public void Leer() {
        System.out.print("Leyendo cliente: ");
        System.out.print("Leer codigo de cliente: ");
        codCliente = sc.nextInt();
    }
    public void Mostrar() {
        System.out.print("Mostrando cliente: ");
        System.out.println(codCliente);
    }
}
