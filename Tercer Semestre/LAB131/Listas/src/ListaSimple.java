public class ListaSimple {
    private NodoSimple nodo;
    
    ListaSimple()
    {
        nodo = null;
    }

    public NodoSimple getNodo() {
        return nodo;
    }

    public void setNodo(NodoSimple p) {
        this.nodo = p;
    }
    public void adifinal(/*si el "objeto" no es un objeto creado, colocar aqui parametros del objeto */ objeto o)
    {
        NodoSimple nue = new NodoSimple();
        nue.setObjeto(o); /*si el "objeto" no es un objeto creado, reemplazar aqui colocando los atributos del "objeto" con setters */
        if(getNodo() == null)
            setNodo(nue);
        else{
            NodoSimple m = getNodo();
            while(m.getSig() != null)//recorre al ultimo nodo
                m = m.getSig();
            m.setSig(nue);
        }
            
    }
    public void mostrar()
    {
        NodoSimple d = getNodo();
        while(d != null)//recorre hasta el final
        {
            d.getObjeto().mostrar(); /*si el "objeto" no es un objeto creado, reemplazar aqui con mostrando los atributos del "objeto" */
            d = d.getSig();
        }
    }
    
}