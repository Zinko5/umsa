public class ColaSimpleStands {
    private int max = 20;
    private int ini, fin;
    private Stand v[] = new Stand[max + 1];

    public ColaSimpleStands() {
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
    public void adicionar (Stand elem)
    {
        if (!esllena ())
        {
            fin++;         //v[fin+1]=elem
            v [fin] = elem;  //fin=fin+1
        }
        else
            System.out.println ("Cola Simple llena");
    }
    public Stand eliminar ()
    {
        Stand elem = null;
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
            ColaSimpleStands aux = new ColaSimpleStands ();
            while (!esvacia ())
            {
                Stand elem = eliminar ();
                aux.adicionar (elem);
                System.out.println("---------------");
                elem.mostrar();
                System.out.println("---------------");
            }
            System.out.println();
            vaciar(aux);
        }
    }
    public void vaciar (ColaSimpleStands a)
    {
            while (!a.esvacia ())
                adicionar (a.eliminar ());

    }
}
