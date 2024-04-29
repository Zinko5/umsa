import java.util.Scanner;
public class Empresa {
    Scanner sc = new Scanner(System.in);
    private String nombre;
    private int nroClientes;
    private Cliente []cliente = new Cliente[50];
    private int nroEmpleados;
    private Empleado empleado[] = new Empleado[50];
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public int getNnroClientes() {
        return nroClientes;
    }
    public void setNnroClientes(int nnroClientes) {
        this.nroClientes = nnroClientes;
    }
    public Cliente[] getCliente() {
        return cliente;
    }
    public void setCliente(Cliente[] cliente) {
        this.cliente = cliente;
    }
    public int getNroEmpleados() {
        return nroEmpleados;
    }
    public void setNroEmpleados(int nroEmpleados) {
        this.nroEmpleados = nroEmpleados;
    }
    public Empleado[] getEmpleado() {
        return empleado;
    }
    public void setEmpleado(Empleado[] empleado) {
        this.empleado = empleado;
    }
    public Empresa() {
    }
    public void Leer() {
        System.out.print("Leyendo empresa: ");
        System.out.print("Leer nombre: ");
        nombre = sc.nextLine();
        System.out.print("Leer numero de clientes: ");
        nroClientes = sc.nextInt();
        System.out.print("Leer nro de empleados: ");
        nroEmpleados = sc.nextInt();
        for (int i = 0; i < nroClientes; i++) {
            cliente[i] = new Cliente();
            cliente[i].Leer();
        }
        for (int i = 0; i < nroEmpleados; i++) {
            empleado[i] = new Empleado();
            empleado[i].Leer();
        }
    }
    public void Mostrar() {
        System.out.print("Mostrando empresa: ");
        System.out.println(nombre + " " + nroClientes + " " + nroEmpleados);
        for (int i = 0; i < nroClientes; i++) {
            cliente[i].Mostrar();
        }
        for (int i = 0; i < nroEmpleados; i++) {
            empleado[i].Mostrar();
        }
    }
    public void Ordenar() {
        System.out.println("Ordenando empleados por cantidad de sueldo");
        Empleado aux = new Empleado();
        for (int i = 0; i < nroEmpleados; i++) {
            for (int j = 0; j < nroEmpleados - 1; j++) {
                if (empleado[j].getSueldo() > empleado[j + 1].getSueldo()) {
                    aux = empleado[j];
                    empleado[j] = empleado[j + 1];
                    empleado[j + 1] = aux;
                }
            }
        }
    }
}
