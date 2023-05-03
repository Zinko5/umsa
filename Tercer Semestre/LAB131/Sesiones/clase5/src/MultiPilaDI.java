public class MultiPilaDI {
    private int np;  //numero de pilas
    private PilaDI v[]=new PilaDI[100];
    
    MultiPilaDI()
    {
        for(int i=1;i<100;i++) {
            v[i]=new PilaDI();
        }
    }

    public int getNp() {
        return np;
    }

    public void setNp(int np) {
        this.np = np;
    }
    int nroelem(int i)
    {
        return (v[i].nroelem());
    }
    boolean esvacia (int i)
    {
        if (v[i].esvacia ()){
            return true;
        }
        else {
            return false;
        }
    }
    boolean esllena (int i)
    {
        if (v[i].esllena ()){
            return true;
        }
        else {
            return false;
        }
    }
    void adicionar (int i, Def_Inf L)
    {
        if (!v [i].esllena ())
            v [i].adicionar (L);
        else
            System.out.print ("Pila " + i + " esta llena");
    }
    Def_Inf eliminar (int i)
    {
        Def_Inf e = null;
        if (!v [i].esvacia ())
            e = v [i].eliminar ();
        else
            System.out.print ("Pila " + i + " esta vacia");
        return e;
    }
    void mostrar(int i)
    {
        v[i].mostrar();
    }
    void mostrar ()
    {
        for (int i = 1 ; i <= np ; i++)
        {
            System.out.println("\nPila " + i + " ");
            v [i].mostrar ();
        }
    }
    void vaciar(int i, PilaDI a )
    {
        while(!a.esvacia())
                adicionar(i,a.eliminar());
    }
    void vaciar(int i, int j)
    {
        v[i].vaciar(v[j]);
    }
}