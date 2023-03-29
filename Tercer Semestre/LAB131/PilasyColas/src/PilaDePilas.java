public class PilaDePilas {
    private int max = 50;
    private Pila v[] = new Pila[max + 1];
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
    public void adicionar (Pila elem)
    {
        if (!esllena ())
        {
            tope++;
            v [tope] = elem;
        }
        else
            System.out.println ("Pila llena");
    }
    public Pila eliminar ()
    {
        Pila elem = new Pila ();
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
        Pila elem;
        if (esvacia ())
            System.out.println ("Pila vacia");
        else
        {
            System.out.println ("Objetos de la Pila:");
            PilaDePilas
         aux = new PilaDePilas
         ();
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
            Pila l = new Pila ();
            l.mostrar ();
            adicionar (l);
        }
    }
    public void invertir ()
    {
        PilaDePilas
     a = new PilaDePilas
     ();
        PilaDePilas
     b = new PilaDePilas
     ();
        while (!esvacia ())
            a.adicionar (eliminar ());
        while (!a.esvacia ())
            b.adicionar (a.eliminar ());
        while (!b.esvacia ())
            adicionar (b.eliminar ());
    }
    public void vaciar (PilaDePilas
 a)
    {
        while (!a.esvacia ())
            adicionar (a.eliminar ());

    }
}