public class PilaPilaDI {
    private int max = 50;
    private PilaDI v[] = new PilaDI[max + 1];
    private int tope;
    public boolean esvacia ()
      {
          if (tope == 0)
              return (true);
          return (false);
      }
      public boolean esllena ()
    {
        if (tope == max)
            return (true);
        return (false);
    }
    public int nroelem ()
    {
        return (tope);
    }
    public void adicionar (PilaDI elem)
    {
        if (!esllena ())
        {
            tope++;
            v [tope] = elem;
        }
        else
            System.out.println ("Pila llena");
    }
    public PilaDI eliminar ()
    {
        PilaDI elem = new PilaDI ();
        if (!esvacia ())
        {
            elem = v [tope];
            tope--;
        }
        else
            System.out.println ("Pila vacia");
        return (elem);
    }
    public void mostrar ()
    {
        PilaDI elem;
        if (esvacia ())
            System.out.println ("Pila vacia");
        else
        {
            System.out.println ("Objetos de la Pila:");
            PilaPilaDI aux = new PilaPilaDI ();
            while (!esvacia ())
            {
                elem = eliminar ();
                aux.adicionar (elem);
                System.out.println("\nLa pila contiene:");
                elem.mostrar();
            }
            while (!aux.esvacia ())
            {
                elem = aux.eliminar ();

                adicionar (elem);
            }
        }
    }
    public void llenar (int n)
    {
        int i;

        for (i = 1 ; i <= n ; i++)
        {
            PilaDI l = new PilaDI ();
            l.mostrar ();
            adicionar (l);
        }
    }
    public void invertir ()
    {
        PilaPilaDI a = new PilaPilaDI ();
        PilaPilaDI b = new PilaPilaDI ();
        while (!esvacia ())
            a.adicionar (eliminar ());
        while (!a.esvacia ())
            b.adicionar (a.eliminar ());
        while (!b.esvacia ())
            adicionar (b.eliminar ());
    }
    public void vaciar (PilaPilaDI a)
    {
        while (!a.esvacia ())
            adicionar (a.eliminar ());

    }
}