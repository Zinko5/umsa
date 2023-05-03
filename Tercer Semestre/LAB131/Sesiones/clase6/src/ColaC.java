public class ColaC {
    private int max = 20;
    private int ini, fin;
    private Comunidad v[] = new Comunidad[max + 1];

    public ColaC() {
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
    public void adicionar (Comunidad elem)
    {
        if (!esllena ())
        {
            fin++;         //v[fin+1]=elem
            v [fin] = elem;  //fin=fin+1
        }
        else
            System.out.println ("Cola Simple llena");
    }
    public Comunidad eliminar ()
    {
        Comunidad elem = null;
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
            System.out.println ("Objetos de la Cola:");
            ColaC aux = new ColaC ();
            while (!esvacia ())
            {
                Comunidad elem = eliminar ();
                aux.adicionar (elem);
                System.out.print("<");
                elem.mostrar();
                System.out.println("> ");
            }
            System.out.println();
            vaciar(aux);
        }
    }
    public void vaciar (ColaC a)
    {
            while (!a.esvacia ())
                adicionar (a.eliminar ());

    }
}
