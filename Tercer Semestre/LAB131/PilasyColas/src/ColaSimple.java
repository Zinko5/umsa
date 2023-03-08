public class ColaSimple {
    private int max = 20;
    private int ini, fin;
    private objeto v[] = new objeto[max + 1];

    public ColaSimple() {
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
    public void adicionar (objeto elem)
    {
        if (!esllena ())
        {
            fin++;         //v[fin+1]=elem
            v [fin] = elem;  //fin=fin+1
        }
        else
            System.out.println ("Cola Simple llena");
    }
    public objeto eliminar ()
    {
        objeto elem = null;
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
            ColaSimple aux = new ColaSimple ();
            while (!esvacia ())
            {
                objeto elem = eliminar ();
                aux.adicionar (elem);
                System.out.print(" <");
                elem.mostrar();
                System.out.print("> ");
            }
            vaciar(aux);
        }
    }
    public void vaciar (ColaSimple a)
    {
            while (!a.esvacia ())
                adicionar (a.eliminar ());

    }
}
