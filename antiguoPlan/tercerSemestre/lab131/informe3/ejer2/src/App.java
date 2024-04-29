public class App {
    public static void main(String[] args) throws Exception {
        ListaDoblePersonas listaDoblePersonas = new ListaDoblePersonas();
        ListaSimpleMaterias listaSimpleMaterias = new ListaSimpleMaterias();
        ListaDobleInscripciones listaDobleInscripciones = new ListaDobleInscripciones();
        listaDoblePersonas.adiFinal(454879, "Juan", 784784567);
        listaDoblePersonas.adiFinal(4586142, "Homero", 65456478);
        listaDoblePersonas.adiFinal(41741561, "Tobias", 7489481);
        listaDoblePersonas.adiFinal(17841487, "Jesus", 635487987);
        listaDoblePersonas.adiFinal(987894156, "Pedro", 774894517);
        listaSimpleMaterias.adifinal("INF-131", "Informatica", "15:00");
        listaSimpleMaterias.adifinal("LAB-131", "Laboratorio de Informatica", "13:00");
        listaSimpleMaterias.adifinal("EST-133", "Estadistica", "17:00");
        listaDobleInscripciones.adiFinal(454879, "EST-133");
        listaDobleInscripciones.adiFinal(4586142, "INF-131");
        listaDobleInscripciones.adiFinal(41741561, "EST-133");
        listaDobleInscripciones.adiFinal(17841487, "INF-131");
        listaDobleInscripciones.adiFinal(987894156, "LAB-131");
        listaDoblePersonas.mostrar();
        System.out.println();
        listaSimpleMaterias.mostrar();
        System.out.println();
        listaDobleInscripciones.mostrar();
        System.out.println();
        mostrar(listaDobleInscripciones, listaDoblePersonas);
    }
    static public void mostrar(ListaDobleInscripciones listaDobleInscripciones, ListaDoblePersonas listaDoblePersonas)
    {
        System.out.println("Las personas que estudian la materia con sigla <INF-131>:");
        NodoDobleInscripciones o = listaDobleInscripciones.getNodo();
        while(o != null)
        {
            if (o.getSigla().equals("INF-131")) {
                
                NodoDoblePersonas a = listaDoblePersonas.getNodo();
                while(a != null)
                {
                    if (a.getCi() == o.getCi()) {
                        System.out.println(a.getCi() + " " + a.getNombre() + " " + a.getNroCelular());
                    }
                    /*cosas del problema */
                    a=a.getSig();
                }

            }
            /*cosas del problema */
            o=o.getSig();
        }
    }
}
