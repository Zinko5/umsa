public class PilaEducacionSuperiorFormacionProfesional {
    private int max = 50;
    private EducacionSuperiorFormacionProfesional v[] = new EducacionSuperiorFormacionProfesional[max + 1];
    private int tope;

    public int getMax() {
        return max;
    }

    public void setMax(int max) {
        this.max = max;
    }

    public EducacionSuperiorFormacionProfesional[] getV() {
        return v;
    }

    public void setV(EducacionSuperiorFormacionProfesional[] v) {
        this.v = v;
    }

    public int getTope() {
        return tope;
    }

    public void setTope(int tope) {
        this.tope = tope;
    }
    
    public PilaEducacionSuperiorFormacionProfesional() {
        
    }
    
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
    public void adicionar (EducacionSuperiorFormacionProfesional elem)
    {
        if (!esllena ())
        {
            tope++;
            v [tope] = elem;
        }
        else
            System.out.println ("Pila llena");
    }
    public EducacionSuperiorFormacionProfesional eliminar ()
    {
        EducacionSuperiorFormacionProfesional elem = new EducacionSuperiorFormacionProfesional ();
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
        EducacionSuperiorFormacionProfesional elem;
        if (esvacia ())
            System.out.println ("Pila vacia");
        else
        {
            System.out.println ("\nObjetos de la Pila:");
            PilaEducacionSuperiorFormacionProfesional aux = new PilaEducacionSuperiorFormacionProfesional ();
            while (!esvacia ())
            {
                elem = eliminar ();
                aux.adicionar (elem);
                elem.Mostrar();
            }
            System.out.println();
            while (!aux.esvacia ())
            {
                elem = aux.eliminar ();

                adicionar (elem);
            }
            System.out.println("Fin de la Pila\n");
        }
    }
    public void llenar (int n)
    {
        int i;

        for (i = 1 ; i <= n ; i++)
        {
            EducacionSuperiorFormacionProfesional l = new EducacionSuperiorFormacionProfesional ();
            l.Mostrar ();
            adicionar (l);
        }
    }
    public void invertir ()
    {
        PilaEducacionSuperiorFormacionProfesional a = new PilaEducacionSuperiorFormacionProfesional ();
        PilaEducacionSuperiorFormacionProfesional b = new PilaEducacionSuperiorFormacionProfesional ();
        while (!esvacia ())
            a.adicionar (eliminar ());
        while (!a.esvacia ())
            b.adicionar (a.eliminar ());
        while (!b.esvacia ())
            adicionar (b.eliminar ());
    }
    public void vaciar (PilaEducacionSuperiorFormacionProfesional a)
    {
        while (!a.esvacia ())
            adicionar (a.eliminar ());

    }
}