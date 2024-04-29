public class ListaDobleInscripciones {
    private NodoDobleInscripciones nodo;
    ListaDobleInscripciones()
    {
        nodo = null;
    }

    public NodoDobleInscripciones getNodo() {
        return nodo;
    }

    public void setNodo(NodoDobleInscripciones nodo) {
        this.nodo = nodo;
    }
    public void adiFinal(int c, String s){
        NodoDobleInscripciones nuevo = new NodoDobleInscripciones();
        nuevo.setCi(c);
        nuevo.setSigla(s);
        if(getNodo() == null)
            setNodo(nuevo);
        else {
            NodoDobleInscripciones r = getNodo();
            while(r.getSig()!=null)
                r = r.getSig();
            r.setSig(nuevo);
            nuevo.setAnt(r);
        }
    }
    public void mostrar()
    {
        NodoDobleInscripciones o = getNodo();
        while(o!=null)
        {
            System.out.println(o.getCi() + " " + o.getSigla());
            o=o.getSig();
        }
    }
}
