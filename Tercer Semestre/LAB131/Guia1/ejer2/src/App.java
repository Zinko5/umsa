public class App {
    public static void main(String[] args) throws Exception {
        ColaPersonas CPersonas = new ColaPersonas();
        ColaPeliculas CPeliculas = new ColaPeliculas();
        Persona per1 = new Persona(4587, "Juan", 45, "425");
        Persona per2 = new Persona(4881, "Pablo", 25, "455");
        Persona per3 = new Persona(2585, "Camilo", 15, "425");
        Persona per4 = new Persona(8855, "Carlos", 22, "125");
        Pelicula pel1 = new Pelicula("425", "El Mundo", "Documental", 45);
        Pelicula pel2 = new Pelicula("455", "El Rondo", "Ciencia Ficcion", 85);
        Pelicula pel3 = new Pelicula("125", "El Vaso", "Misterio", 78);
        CPeliculas.adicionar(pel1);
        CPeliculas.adicionar(pel2);
        CPeliculas.adicionar(pel3);
        CPersonas.adicionar(per1);
        CPersonas.adicionar(per2);
        CPersonas.adicionar(per3);
        CPersonas.adicionar(per4);
        CPeliculas.mostrar();
        CPersonas.mostrar();
        CPeliculas.edadPromedio("El Mundo", CPersonas);
        CPeliculas.cuantasTitulo("El Vaso", CPersonas);
        //CPeliculas.mayor(CPersonas);
    }
}
