public class PilaVe {
    private int max = 50;
    private Venta v[] = new Venta[max + 1];
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


    void adicionar (Venta elem)
    {
        if (!esllena ())
        {
            tope++;
            v [tope] = elem;
        }
        else
            System.out.println ("Pila llena");
    }


    Venta eliminar ()
    {
        Venta elem = new Venta ();
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
        Venta elem;
        if (esvacia ())
            System.out.println ("Pila vacia");
        else
        {
            System.out.println ("Datos de la Pila:");
            PilaVe aux = new PilaVe ();
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


    /*void llenar (int n)
    {
        int i;

        for (i = 1 ; i <= n ; i++)
        {
            Venta l = new Venta ();
            l.leerdatos ();
            adicionar (l);
        }
    }*/


    void invertir ()
    {
        PilaVe a = new PilaVe ();
        PilaVe b = new PilaVe ();
        while (!esvacia ())
            a.adicionar (eliminar ());
        while (!a.esvacia ())
            b.adicionar (a.eliminar ());
        while (!b.esvacia ())
            adicionar (b.eliminar ());
    }


    void vaciar (PilaVe a)
    {
        while (!a.esvacia ())
            adicionar (a.eliminar ());

    }
}
