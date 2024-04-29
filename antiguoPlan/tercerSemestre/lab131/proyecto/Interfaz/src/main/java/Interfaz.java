import java.util.ArrayList;

public class Interfaz {
    public static void main(String[] args) throws Exception {
        PilaEducacionSuperiorFormacionProfesional pilaEducacionSuperiorFormacionProfesional = new PilaEducacionSuperiorFormacionProfesional();

        ListaCircularSimpleLugarCercano listaCircularSimpleLugarCercanoInstanciada = new ListaCircularSimpleLugarCercano();
        listaCircularSimpleLugarCercanoInstanciada.adiprimero(new LugarCercano("Heladeria Feliz", "Heladeria", "12:00 - 17:30"));

        ListaDobleTransporte listaDobleTransporteInstanciada = new ListaDobleTransporte();
        listaDobleTransporteInstanciada.adiFinal(new Transporte("Teleferico Rojo", "FPR3164", 4));

        ArrayList<Ruta> arrayListRutasInstanciada = new ArrayList<Ruta>();
        arrayListRutasInstanciada.add(new Ruta("Calle 2", "Calle 31", 40, listaDobleTransporteInstanciada));

        pilaEducacionSuperiorFormacionProfesional.adicionar(new EducacionSuperiorFormacionProfesional("UMSA", "Universidad", "Prado", listaCircularSimpleLugarCercanoInstanciada, arrayListRutasInstanciada));

        //EducacionSuperiorFormacionProfesional educacionSuperiorFormacionProfesionalLeida = new EducacionSuperiorFormacionProfesional();
        
        //educacionSuperiorFormacionProfesionalLeida.Leer();
        
        //pilaEducacionSuperiorFormacionProfesional.adicionar(educacionSuperiorFormacionProfesionalLeida);
        pilaEducacionSuperiorFormacionProfesional.mostrar();

        /* Añadir un Lugar Cercano al primer centro de educacion superior de formacion profesional y un transporte a la primera ruta del primer centro de educacion superior de formacion profesional
        LugarCercano lugarCercanoParaAñadir = new LugarCercano();
        System.out.println();
        lugarCercanoParaAñadir.Leer();

        EducacionSuperiorFormacionProfesional aux = pilaEducacionSuperiorFormacionProfesional.eliminar();
        aux.getListaCircularSimplelugaresCercanos().adiprimero(lugarCercanoParaAñadir);
        pilaEducacionSuperiorFormacionProfesional.adicionar(aux);

        pilaEducacionSuperiorFormacionProfesional.mostrar();

        Transporte transporteParaAñadir = new Transporte();
        System.out.println();
        transporteParaAñadir.Leer();

        aux = pilaEducacionSuperiorFormacionProfesional.eliminar();
        Ruta auxr = aux.getArrayListRutas().remove(0);
        auxr.getListaDobleTransporte().adiFinal(transporteParaAñadir);
        aux.getArrayListRutas().add(auxr);
        pilaEducacionSuperiorFormacionProfesional.adicionar(aux);

        pilaEducacionSuperiorFormacionProfesional.mostrar();*/
    }

    public static void Mostrar(ArrayList<Ruta> lista) {
        System.out.println("[Rutas]");
        for (int i = 0; i < lista.size(); i++) {
            Ruta objetosacado = lista.get(i);
            objetosacado.Mostrar();
        }
    }

    public static void Leer(ArrayList<Ruta> lista) {
        System.out.print("¿Cuantas rutas leer?: ");
        int n = Leer.datoInt();
        for (int i = 0; i < n; i++) {
                Ruta ruta = new Ruta();
                ruta.Leer();
                lista.add(ruta);
        }
    }

    public static void Leer(ListaCircularSimpleLugarCercano lista) {
        System.out.print("Cuantos lugares cercanos leer?: ");
        int n = Leer.datoInt();
        for (int i = 0; i < n; i++) {
                LugarCercano lugarCercano = new LugarCercano();
                lugarCercano.Leer();
                lista.adiprimero(lugarCercano);
            
        }
    }
}
