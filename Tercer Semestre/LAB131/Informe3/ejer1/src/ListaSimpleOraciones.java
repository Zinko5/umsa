public class ListaSimpleOraciones {
    private NodoSimpleOraciones nodo;
    
    ListaSimpleOraciones()
    {
        nodo = null;
    }

    public NodoSimpleOraciones getNodo() {
        return nodo;
    }

    public void setNodo(NodoSimpleOraciones p) {
        this.nodo = p;
    }
    public void adifinal(String ora)
    {
        NodoSimpleOraciones nue = new NodoSimpleOraciones();
        nue.setOracion(ora);
        if(getNodo() == null)
            setNodo(nue);
        else{
            NodoSimpleOraciones m = getNodo();
            while(m.getSig() != null)//recorre al ultimo nodo
                m = m.getSig();
            m.setSig(nue);
        }
            
    }
    public void mostrar()
    {
        NodoSimpleOraciones d = getNodo();
        while(d != null)//recorre hasta el final
        {
            System.out.println(d.getOracion());
            d = d.getSig();
        }
    }
    
}