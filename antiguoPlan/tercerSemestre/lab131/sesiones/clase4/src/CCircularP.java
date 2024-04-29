public class CCircularP {
    private int max = 150;
    private Provincia v[] = new Provincia[max+1];
    private int ini, fin;
    CCircularP()
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
    public void adicionar (Provincia elem)
    {
        if (!esllena ())
        {

            fin = (fin + 1) % max;
            v [fin] = elem;
        }
        else
            System.out.println ("Cola circular llena");
    }
    public Provincia eliminar ()
    {
        Provincia elem = null;
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
            System.out.println ("Cola vacia xxx");
        else
        {
            System.out.println ("\nProvincias de la Cola:");
            CCircularP aux = new CCircularP ();
            while (!esvacia ())
            {
                Provincia elem = eliminar ();
                aux.adicionar (elem);
                System.out.print(" [");
                elem.mostrar();
                System.out.print("] ");
            }
            vaciar(aux);
        }
    }
    public void vaciar (CCircularP a)
    {
        while (!a.esvacia ())
            adicionar (a.eliminar ());
    }
}