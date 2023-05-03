public class MultiColaStands {private int n;
    private ColaSimpleStands v[]=new ColaSimpleStands[100];
    
    MultiColaStands()
    {
        for(int i=1;i<100;i++)
            v[i]=new ColaSimpleStands();
    }

    public int getN() {
        return n;
    }

    public void setN(int n) {
        this.n = n;
    }
    
    boolean esvacia (int i)
    {
        if (v [i].esvacia ())
            return true;
        return false;
    }


    boolean esllena (int i)
    {
        if (v [i].esllena ())
            return true;
        return false;
    }


    void adicionar (int i, Stand elem)
    {
        if (!v [i].esllena ())
            v [i].adicionar (elem);
        else
            System.out.print ("Cola " + i + " esta llena");
    }


    Stand eliminar (int i)
    {
        Stand e = null;
        if (!v [i].esvacia ())
            e = v[i].eliminar();
        else
            System.out.print ("Cola " + i + " esta vacia");
        return e;
    }

    void mostrar(int i)
    {
        v[i].mostrar();
    }

    void mostrar ()
    {
        int i;
        for (i = 1 ; i <= getN() ; i++)
        {
            System.out.println ("\nCola Simple " + i + " ");
            v [i].mostrar ();
        }
    }

    int nroElem (int i)
    {
        return (v [i].nroelem ());
    }
    void vaciar(int i, ColaSimpleStands Z)
    {
        v[i].vaciar(Z);
    }
    void vaciar(int i, int j)
    {
        v[i].vaciar(v[j]);
    }
}
