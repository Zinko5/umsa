public class ColaCircular {
    private int max = 150;
    private objeto v[] = new objeto[max+1];
    private int ini, fin;
    ColaCircular()
    {
        ini = fin = 0;
    }
    public int nroelem ()
    {
        return ((max + fin - ini) % max);
    }
    public boolean esvacia ()
    {
        if (nroelem () == 0)
            return (true);
        return (false);
    }
    public boolean esllena ()
    {
        if (nroelem () == max - 1)
            return (true);
        return (false);
    }
    public void adicionar (objeto elem)
    {
        if (!esllena ())
        {

            fin = (fin + 1) % max;
            v [fin] = elem;
        }
        else
            System.out.println ("Cola circular llena");
    }
    public objeto eliminar ()
    {
        objeto elem = null;
        if (!esvacia ())
        {
            ini = (ini + 1) % max;
            elem = v [ini];
            if (nroelem () == 0)
                ini = fin = 0;
        }
        else
            System.out.println ("Cola circular vacia");
        return (elem);
    }
    public void mostrar ()
    {
        if (esvacia ())
            System.out.println ("Cola cicular vacia");
        else
        {
            System.out.println ("Objetos de la Cola:");
            ColaCircular aux = new ColaCircular ();
            while (!esvacia ())
            {
                objeto elem = eliminar ();
                aux.adicionar (elem);
                System.out.print(" [");
                elem.mostrar();
                System.out.print("] ");
            }
            System.out.println();
            vaciar(aux);
        }
    }
    public void vaciar (ColaCircular a)
    {
        while (!a.esvacia ())
            adicionar (a.eliminar ());
    }
}