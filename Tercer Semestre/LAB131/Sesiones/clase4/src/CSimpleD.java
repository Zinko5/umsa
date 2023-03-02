public class CSimpleD {
    private int max = 20;
    private int ini, fin;
    private Departamento v[] = new Departamento[max + 1];

    public CSimpleD() {
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
    public void adicionar (Departamento elem)
    {
        if (!esllena ())
        {
            fin++;         //v[fin+1]=elem
            v [fin] = elem;  //fin=fin+1
        }
        else
            System.out.println ("Cola Simple llena");
    }
    public Departamento eliminar ()
    {
        Departamento elem = null;
        if (!esvacia ())
        {
            ini++;
            elem = v [ini];
            if (ini == fin)
                ini = fin = 0;
        }
        else
            System.out.println ("Cola Simple vacia");
        return (elem);
    }
    public void mostrar ()
    {
        if (esvacia ())
            System.out.println ("Cola vacia");
        else
        {
            System.out.println ("Departamentos de la Cola:");
            CSimpleD aux = new CSimpleD ();
            while (!esvacia ())
            {
                Departamento elem = eliminar ();
                aux.adicionar (elem);
                System.out.print(" <");
                elem.mostrar();
                System.out.print("> ");
            }
            vaciar(aux);
        }
    }
    public void vaciar (CSimpleD a)
    {
            while (!a.esvacia ())
                adicionar (a.eliminar ());

    }
}
