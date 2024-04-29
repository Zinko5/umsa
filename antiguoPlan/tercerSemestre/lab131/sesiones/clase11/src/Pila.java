public class Pila {
    private int max = 50;
    private NodoEstudiantes v[] = new NodoEstudiantes[max + 1];
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
    public void adicionar (NodoEstudiantes elem)
    {
        if (!esllena ())
        {
            tope++;
            v [tope] = elem;
        }
        else
            System.out.println ("Pila llena");
    }
    public NodoEstudiantes eliminar ()
    {
        NodoEstudiantes elem = new NodoEstudiantes ();
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
        NodoEstudiantes elem;
        if (esvacia ())
            System.out.println ("Pila vacia");
        else
        {
            System.out.println ("Objetos de la Pila:");
            Pila aux = new Pila ();
            while (!esvacia ())
            {
                elem = eliminar ();
                aux.adicionar (elem);
                System.out.print("[");
                elem.mostrar();
                System.out.print("] ");
            }
            System.out.println();
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
            NodoEstudiantes l = new NodoEstudiantes();
            l.mostrar ();
            adicionar (l);
        }
    }
    public void invertir ()
    {
        Pila a = new Pila ();
        Pila b = new Pila ();
        while (!esvacia ())
            a.adicionar (eliminar ());
        while (!a.esvacia ())
            b.adicionar (a.eliminar ());
        while (!b.esvacia ())
            adicionar (b.eliminar ());
    }
    public void vaciar (Pila a)
    {
        while (!a.esvacia ())
            adicionar (a.eliminar ());

    }
}