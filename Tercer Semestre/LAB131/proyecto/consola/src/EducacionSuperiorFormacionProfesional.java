import java.util.ArrayList;
import java.util.Scanner;

public class EducacionSuperiorFormacionProfesional {
    private String nombre;
    private String tipo;
    private String ubicacion;
    private ListaCircularSimpleLugarCercano ListaCircularSimplelugaresCercanos = new ListaCircularSimpleLugarCercano();
    private ArrayList<Ruta> ArrayListRutas = new ArrayList<Ruta>();

    public EducacionSuperiorFormacionProfesional() {
    }

    public EducacionSuperiorFormacionProfesional(String nombre, String tipo, String ubicacion, ListaCircularSimpleLugarCercano lugaresCercanos, ArrayList<Ruta> ruta) {
        this.nombre = nombre;
        this.tipo = tipo;
        this.ubicacion = ubicacion;
        this.ListaCircularSimplelugaresCercanos = lugaresCercanos;
        this.ArrayListRutas = ruta;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    public ListaCircularSimpleLugarCercano getListaCircularSimplelugaresCercanos() {
        return ListaCircularSimplelugaresCercanos;
    }

    public void setListaCircularSimplelugaresCercanos(ListaCircularSimpleLugarCercano lugaresCercanos) {
        this.ListaCircularSimplelugaresCercanos = lugaresCercanos;
    }

    public ArrayList<Ruta> getArrayListRutas() {
        return ArrayListRutas;
    }

    public void setArrayListRutas(ArrayList<Ruta> ruta) {
        this.ArrayListRutas = ruta;
    }

    public void Leer() {
        System.out.println("\n<Lectura de Lugar de Educacion Superior y Formacion Profesional>");
        Scanner scanner = new Scanner(System.in);
        System.out.print("Ingrese el nombre: ");
        nombre = scanner.nextLine();
        System.out.print("Ingrese el tipo: ");
        tipo = scanner.nextLine();
        System.out.print("Ingrese la ubicación: ");
        ubicacion = scanner.nextLine();
        Leer(ListaCircularSimplelugaresCercanos);
        Leer(ArrayListRutas);
        //scanner.close();
    }

    public void Mostrar() {
        System.out.println("\n<[Lugar de Educacion Superior y Formacion Profesional]>\nNombre: " + nombre + ", Tipo: " + tipo + ", Ubicación: " + ubicacion);
        ListaCircularSimplelugaresCercanos.mostrar();
        Mostrar(ArrayListRutas);
    }

    public  void Mostrar(ArrayList<Ruta> rrylist) {
        System.out.println("[Rutas]");
        for (int i = 0; i < rrylist.size(); i++) {
            Ruta objetosacado = rrylist.get(i);
            objetosacado.Mostrar();
        }
    }

    public  void Leer(ArrayList<Ruta> lista) {
        int n;
        Scanner scanner = new Scanner(System.in);
        System.out.print("¿Cuantas rutas leer?: ");
        n = scanner.nextInt();
        scanner.nextLine();
        for (int i = 0; i < n; i++) {
                Ruta ruta = new Ruta();
                ruta.Leer();
                lista.add(ruta);
        }
        //scanner.close();
    }

    public void Leer(ListaCircularSimpleLugarCercano lista) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Cuantos lugares cercanos leer?: ");
        int n = scanner.nextInt();
        scanner.nextLine();
        for (int i = 0; i < n; i++) {
                LugarCercano lugarCercano = new LugarCercano();
                lugarCercano.Leer();
                lista.adiprimero(lugarCercano);
            
        }
        //scanner.close();
    }
}
