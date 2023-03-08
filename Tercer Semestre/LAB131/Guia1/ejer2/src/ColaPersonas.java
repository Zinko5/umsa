public class ColaPersonas {
    private int max = 20;
    private int ini, fin;
    private Persona v[] = new Persona[max + 1];

    public ColaPersonas() {
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
    public void adicionar (Persona elem)
    {
        if (!esllena ())
        {
            fin++;         //v[fin+1]=elem
            v [fin] = elem;  //fin=fin+1
        }
        else
            System.out.println ("Cola Simple llena");
    }
    public Persona eliminar ()
    {
        Persona elem = null;
        if (!esvacia ())
        {
            ini++;
            elem = v [ini];
            if (ini == fin)
                ini = fin = 0;
        }
        else
            System.out.println ("Cola simple vacia");
        return (elem);
    }
    public void mostrar ()
    {
        if (esvacia ())
            System.out.println ("Cola simple vacia");
        else
        {
            System.out.println ("objetos de la Cola:");
            ColaPersonas aux = new ColaPersonas ();
            while (!esvacia ())
            {
                Persona elem = eliminar ();
                aux.adicionar (elem);
                System.out.print(" <");
                elem.mostrar();
                System.out.print("> ");
            }
            vaciar(aux);
        }
    }
    public void vaciar (ColaPersonas a)
    {
            while (!a.esvacia ())
                adicionar (a.eliminar ());

    }
}