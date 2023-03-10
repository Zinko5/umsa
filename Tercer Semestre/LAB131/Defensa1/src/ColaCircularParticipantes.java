public class ColaCircularParticipantes {
    private int max = 150;
    private Participantes v[] = new Participantes[max+1];
    private int ini, fin;
    ColaCircularParticipantes()
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
    public void adicionar (Participantes elem)
    {
        if (!esllena ())
        {

            fin = (fin + 1) % max;
            v [fin] = elem;
        }
        else
            System.out.println ("Cola circular llena");
    }
    public Participantes eliminar ()
    {
        Participantes elem = null;
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
            ColaCircularParticipantes aux = new ColaCircularParticipantes ();
            while (!esvacia ())
            {
                Participantes elem = eliminar ();
                aux.adicionar (elem);
                System.out.print("[");
                elem.mostar();
                System.out.println("] ");
            }
            System.out.println();
            vaciar(aux);
        }
    }
    public void vaciar (ColaCircularParticipantes a)
    {
        while (!a.esvacia ())
            adicionar (a.eliminar ());
    }
}
