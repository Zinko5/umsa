public class pilaCajas {
    private int max = 50;
    private Caja v[] = new Caja[max + 1];
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


    void adicionar (Caja elem)
    {
        if (!esllena ())
        {
            tope++;
            v [tope] = elem;
        }
        else
            System.out.println ("pilaCajas llena");
    }


    Caja eliminar ()
    {
        Caja elem = new Caja ();
        if (!esvacia ())
        {
            elem = v [tope];
            tope--;
        }
        else
            System.out.println ("pilaCajas vacia");
        return (elem);
    }


    void mostrar ()
    {
        Caja elem;
        if (esvacia ())
            System.out.println ("pilaCajas vacia");
        else
        {
            System.out.println ("Datos de la pilaCajas:");
            pilaCajas aux = new pilaCajas ();
            while (!esvacia ())
            {
                elem = eliminar ();
                aux.adicionar (elem);
                elem.mostrar();
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
            Caja l = new Caja ();
            l.mostrar ();
            adicionar (l);
        }
    }


    void invertir ()
    {
        pilaCajas a = new pilaCajas ();
        pilaCajas b = new pilaCajas ();
        while (!esvacia ())
            a.adicionar (eliminar ());
        while (!a.esvacia ())
            b.adicionar (a.eliminar ());
        while (!b.esvacia ())
            adicionar (b.eliminar ());
    }


    void vaciar (pilaCajas a)
    {
        while (!a.esvacia ())
            adicionar (a.eliminar ());

    }
    public int maxcant() {
        int m = 0;
        pilaCajas auxPila = new pilaCajas();
        while (!this.esvacia()) {
            Caja cajaAux = this.eliminar();
            if (cajaAux.getCantidad() > m) {
                m = cajaAux.getCantidad();
            }
            auxPila.adicionar(cajaAux);
        }
        vaciar(auxPila);
        return m;
    }
    public void mover() {
        int m = maxcant();
        pilaCajas auxPilaMay = new pilaCajas();
        pilaCajas auxPilaMen = new pilaCajas();
        while (!this.esvacia()) {
            Caja cajaAux = this.eliminar();
            if (cajaAux.getCantidad() == m) {
                auxPilaMay.adicionar(cajaAux);
            } 
            else {
                auxPilaMen.adicionar(cajaAux);
            }
        }
        vaciar(auxPilaMen);
        vaciar(auxPilaMay);
    }
    public void mostrarprecio(int x, pilaCajas a, pilaCajas b, int ie) {
        if (ie > 3 || ie <= 0) {
            System.out.println("Solo hay 3 pilas");
        } 
        if (ie == 1) {
            mostrarprecio(x);
        }
        if (ie == 2) {
            a.mostrarprecio(x);
        }
        if (ie == 3) {
            b.mostrarprecio(x);
        }
    }
    public void mostrarprecio(int x) {
        pilaCajas auxPila = new pilaCajas();
        while (!esvacia()) {
            Caja auxCaja = eliminar();
            if (auxCaja.getPrecioUnitario() > x) {
                auxCaja.mostrar();
            }
            auxPila.adicionar(auxCaja);            
        }
        vaciar(auxPila);
    }
}
