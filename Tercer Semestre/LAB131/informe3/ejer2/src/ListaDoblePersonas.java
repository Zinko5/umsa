public class ListaDoblePersonas {
    private NodoDoblePersonas nodo;
    ListaDoblePersonas()
    {
        nodo = null;
    }

    public NodoDoblePersonas getNodo() {
        return nodo;
    }

    public void setNodo(NodoDoblePersonas nodo) {
        this.nodo = nodo;
    }
    public void adiFinal(int c, String n, int nr){
        NodoDoblePersonas nuevo = new NodoDoblePersonas();
        nuevo.setCi(c);
        nuevo.setNombre(n);
        nuevo.setNroCelular(nr);
        
        if(getNodo() == null)
            setNodo(nuevo);
        else {
            NodoDoblePersonas r = getNodo();
            while(r.getSig()!=null)
                r = r.getSig();
            r.setSig(nuevo);
            nuevo.setAnt(r);
        }
    }
    public void mostrar()
    {
        NodoDoblePersonas o = getNodo();
        while(o!=null)
        {
            System.out.println(o.getCi() + " " + o.getNombre() + " " + o.getNroCelular());
            o=o.getSig();
        }
    }
}
