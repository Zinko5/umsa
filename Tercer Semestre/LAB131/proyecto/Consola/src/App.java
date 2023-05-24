import java.util.ArrayList;
import java.util.Scanner;

public class App {
    public static void main(String[] args) throws Exception {
        PilaEducacionSuperiorFormacionProfesional pilaEducacionSuperiorFormacionProfesional = new PilaEducacionSuperiorFormacionProfesional();

        ListaCircularSimpleLugarCercano listaCircularSimpleLugarCercanoInstanciada = new ListaCircularSimpleLugarCercano();
        listaCircularSimpleLugarCercanoInstanciada.adiprimero(new LugarCercano("Heladeria Feliz", "Heladeria", "12:00 - 17:30"));

        ListaDobleTransporte listaDobleTransporteInstanciada = new ListaDobleTransporte();
        listaDobleTransporteInstanciada.adiFinal(new Transporte("Minibus", "FPR3164", 4));

        ArrayList<Ruta> arrayListRutasInstanciada = new ArrayList<Ruta>();
        arrayListRutasInstanciada.add(new Ruta("Calle 2", "Calle 31", 40, listaDobleTransporteInstanciada));

        EducacionSuperiorFormacionProfesional educacionSuperiorFormacionProfesionalLeida = new EducacionSuperiorFormacionProfesional();
        
        educacionSuperiorFormacionProfesionalLeida.Leer();
        
        pilaEducacionSuperiorFormacionProfesional.adicionar(educacionSuperiorFormacionProfesionalLeida);
        pilaEducacionSuperiorFormacionProfesional.adicionar(new EducacionSuperiorFormacionProfesional("UMSA", "Universidad", "Prado", listaCircularSimpleLugarCercanoInstanciada, arrayListRutasInstanciada));

        LugarCercano lugarCercanoParaAñadir = new LugarCercano();
        System.out.println();
        lugarCercanoParaAñadir.Leer();
        pilaEducacionSuperiorFormacionProfesional.

        pilaEducacionSuperiorFormacionProfesional.mostrar();
    }

    public static void Mostrar(ArrayList<Ruta> lista) {
        System.out.println("[Rutas]");
        for (int i = 0; i < lista.size(); i++) {
            Ruta objetosacado = lista.get(i);
            objetosacado.Mostrar();
        }
    }

    public static void Leer(ArrayList<Ruta> lista) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("¿Cuantas rutas leer?: ");
        int n = scanner.nextInt();
        scanner.nextLine();
        for (int i = 0; i < n; i++) {
                Ruta ruta = new Ruta();
                ruta.Leer();
                lista.add(ruta);
        }
        scanner.close();
    }

    public static void Leer(ListaCircularSimpleLugarCercano lista) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Cuantos lugares cercanos leer?: ");
        int n = scanner.nextInt();
        scanner.nextLine();
        for (int i = 0; i < n; i++) {
                LugarCercano lugarCercano = new LugarCercano();
                lugarCercano.Leer();
                lista.adiprimero(lugarCercano);
            
        }
        scanner.close();
    }
}
