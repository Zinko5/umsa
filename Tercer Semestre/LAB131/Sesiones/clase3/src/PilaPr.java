public class PilaPr {
    private int max = 50;
    private Prenda v[] = new Prenda[max + 1];
    private int tope;
  boolean esvacia ()
    {
        if (tope == 0)
            return (true);
        return (false);
    }


    boolean esllena ()
    {
        if (tope == max)
            return (true);
        return (false);
    }


    int nroelem ()
    {
        return (tope);
    }


    void adicionar (Prenda elem)
    {
        if (!esllena ())
        {
            tope++;
            v [tope] = elem;
        }
        else
            System.out.println ("Pila llena");
    }


    Prenda eliminar ()
    {
        Prenda elem = new Prenda ();
        if (!esvacia ())
        {
            elem = v [tope];
            tope--;
        }
        else
            System.out.println ("Pila vacia");
        return (elem);
    }


    void mostrar ()
    {
        Prenda elem;
        if (esvacia ())
            System.out.println ("Pila vacia");
        else
        {
            System.out.println ("Datos de la Pila:");
            PilaPr aux = new PilaPr ();
            while (!esvacia ())
            {
                elem = eliminar ();
                aux.adicionar (elem);
                elem.mostrardatos();
            }
            while (!aux.esvacia ())
            {
                elem = aux.eliminar ();

                adicionar (elem);
            }
        }
    }


    void llenar (int n)
    {
        int i;

        for (i = 1 ; i <= n ; i++)
        {
            Prenda l = new Prenda ();
            l.leerdatos ();
            adicionar (l);
        }
    }


    void invertir ()
    {
        PilaPr a = new PilaPr ();
        PilaPr b = new PilaPr ();
        while (!esvacia ())
            a.adicionar (eliminar ());
        while (!a.esvacia ())
            b.adicionar (a.eliminar ());
        while (!b.esvacia ())
            adicionar (b.eliminar ());
    }


    void vaciar (PilaPr a)
    {
        while (!a.esvacia ())
            adicionar (a.eliminar ());

    }
}