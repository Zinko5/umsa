public class App {
    public static void main(String[] args) throws Exception {
        ListaSimpleMuebles listaSimpleMuebles1 = new ListaSimpleMuebles();
        ListaSimpleMuebles listaSimpleMuebles2 = new ListaSimpleMuebles();
        ListaSimpleMuebles listaSimpleMuebles3 = new ListaSimpleMuebles();
        ListaSimpleMuebles listaSimpleMuebles4 = new ListaSimpleMuebles();
        ListaCircularSimpleHabitaciones circularSimpleHabitaciones1 = new ListaCircularSimpleHabitaciones();
        ListaCircularSimpleHabitaciones circularSimpleHabitaciones2 = new ListaCircularSimpleHabitaciones();
        ListaDobleBienInmueble listaDobleBienInmueble = new ListaDobleBienInmueble();

        listaSimpleMuebles1.adifinal(2, "nombre mueble 1");
        listaSimpleMuebles1.adifinal(1, "nombre mueble 2");
        listaSimpleMuebles1.adifinal(2, "nombre mueble 3");
        listaSimpleMuebles1.adifinal(3, "nombre mueble 4");

        listaSimpleMuebles2.adifinal(2, "nombre mueble 5");
        listaSimpleMuebles2.adifinal(1, "nombre mueble 6");
        listaSimpleMuebles2.adifinal(2, "nombre mueble 7");

        listaSimpleMuebles3.adifinal(3, "nombre mueble 8");
        listaSimpleMuebles3.adifinal(1, "nombre mueble 9");
        listaSimpleMuebles3.adifinal(2, "nombre mueble 10");

        listaSimpleMuebles4.adifinal(2, "nombre mueble 11");
        listaSimpleMuebles4.adifinal(2, "nombre mueble 12");

        circularSimpleHabitaciones1.adiprimero("Blanco", "Cuarto", 100, listaSimpleMuebles1);
        circularSimpleHabitaciones1.adiprimero("Blanco", "Cocina", 100, listaSimpleMuebles2);
        circularSimpleHabitaciones2.adiprimero("Crema", "Cuarto", 150, listaSimpleMuebles3);
        circularSimpleHabitaciones2.adiprimero("Verde", "Baño", 50, listaSimpleMuebles4);
        
        listaDobleBienInmueble.adiFinal(1, 600, "Calle 10", circularSimpleHabitaciones1);
        listaDobleBienInmueble.adiFinal(2, 750, "Calle 15", circularSimpleHabitaciones2);
        
        listaDobleBienInmueble.mostrar();
    }
}
