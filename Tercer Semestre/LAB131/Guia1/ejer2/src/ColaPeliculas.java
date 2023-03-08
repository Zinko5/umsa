public class ColaPeliculas {
    private int max = 20;
    private int ini, fin;
    private Pelicula v[] = new Pelicula[max + 1];

    public ColaPeliculas() {
        ini = fin = 0;
    }
    public boolean esvacia ()
    {
        if (ini == 0 && fin == 0)
            return (true);
        return (false);
    }
    public boolean esllena ()
    {
        if (fin == max)
            return (true);
        return (false);
    }
    public int nroelem ()
    {
        return (fin - ini);
    }
    public void adicionar (Pelicula elem)
    {
        if (!esllena ())
        {
            fin++;         //v[fin+1]=elem
            v [fin] = elem;  //fin=fin+1
        }
        else
            System.out.println ("Cola Simple llena");
    }
    public Pelicula eliminar ()
    {
        Pelicula elem = null;
        if (!esvacia ())
        {
            ini++;
            elem = v [ini];
            if (ini == fin)
                ini = fin = 0;
        }
        else
            System.out.println ("Cola simple vacia");
        return (elem);
    }
    public void mostrar ()
    {
        if (esvacia ())
            System.out.println ("Cola simple vacia");
        else
        {
            System.out.println ("objetos de la Cola:");
            ColaPeliculas aux = new ColaPeliculas ();
            while (!esvacia ())
            {
                Pelicula elem = eliminar ();
                aux.adicionar (elem);
                System.out.print(" <");
                elem.mostrar();
                System.out.print("> ");
            }
            vaciar(aux);
        }
    }
    public void vaciar (ColaPeliculas a)
    {
            while (!a.esvacia ())
                adicionar (a.eliminar ());

    }
    public void edadPromedio(String X, ColaPersonas CPer) {
        int c = 0;
        int s = 0;
        ColaPersonas CPerAux = new ColaPersonas();
        while (!CPer.esvacia()) {
            Persona PerAux = CPer.eliminar();
            for (int i = 1; i <= nroelem(); i++) {
                Pelicula PelAux = eliminar();
                if (PelAux.getIdPelicula().equals(PerAux.getIdPelicula()) && PelAux.getTitulo().equals(X) ) {
                    c++;
                    s = s + PerAux.getEdad();
                    CPerAux.adicionar(PerAux);
                    adicionar(PelAux);
                }
            }
        }
        CPer.vaciar(CPerAux);
        System.out.println("\nedad promedio: " + s/c);
    }
}