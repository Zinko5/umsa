public class PilaMunicipìos {
    private int max = 50;
    private Municipio v[] = new Municipio[max + 1];
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
    public void adicionar (Municipio elem)
    {
        if (!esllena ())
        {
            tope++;
            v [tope] = elem;
        }
        else
            System.out.println ("Pila llena");
    }
    public Municipio eliminar ()
    {
        Municipio elem = new Municipio ();
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
        Municipio elem;
        if (esvacia ())
            System.out.println ("Pila vacia");
        else
        {
            System.out.println ("Objetos de la Pila:");
            PilaMunicipìos aux = new PilaMunicipìos ();
            while (!esvacia ())
            {
                elem = eliminar ();
                aux.adicionar (elem);
                System.out.print("[");
                elem.mostrar();
                System.out.println("] ");
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
            Municipio l = new Municipio ();
            l.mostrar ();
            adicionar (l);
        }
    }
    public void invertir ()
    {
        PilaMunicipìos a = new PilaMunicipìos ();
        PilaMunicipìos b = new PilaMunicipìos ();
        while (!esvacia ())
            a.adicionar (eliminar ());
        while (!a.esvacia ())
            b.adicionar (a.eliminar ());
        while (!b.esvacia ())
            adicionar (b.eliminar ());
    }
    public void vaciar (PilaMunicipìos a)
    {
        while (!a.esvacia ())
            adicionar (a.eliminar ());

    }
}
