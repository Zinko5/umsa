public class ListaDoble {
    private NodoDoble nodo;
    ListaDoble()
    {
        nodo = null;
    }

    public NodoDoble getNodo() {
        return nodo;
    }

    public void setNodo(NodoDoble nodo) {
        this.nodo = nodo;
    }
    public void adiFinal(objeto o /*si el "objeto" no es un objeto creado, colocar aqui parametros del objeto */){
        NodoDoble nuevo = new NodoDoble();
        nuevo.setObjeto(o); /*si el "objeto" no es un objeto creado, reemplazar aqui colocando los atributos del "objeto" con setters */
        
        if(getNodo() == null)
            setNodo(nuevo);
        else {
            NodoDoble r = getNodo();
            while(r.getSig()!=null)
                r = r.getSig();
            r.setSig(nuevo);
            nuevo.setAnt(r);
        }
    }
    public void mostrar()
    {
        NodoDoble o = getNodo();
        while(o!=null)
        {
            o.getObjeto().mostrar(); /*si el "objeto" no es un objeto creado, reemplazar aqui con mostrando los atributos del "objeto" */
            o=o.getSig();
        }
    }
}
