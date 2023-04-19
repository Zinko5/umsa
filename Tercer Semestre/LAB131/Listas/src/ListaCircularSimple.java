public class ListaCircularSimple {
    private NodoCircularSimple nodo;
    ListaCircularSimple()
    {
        nodo = null;
    }

    public NodoCircularSimple getNodo() {
        return nodo;
    }

    public void setP(NodoCircularSimple nodo) {
        this.nodo = nodo;
    }
    public void adiprimero (/*si el "objeto" no es un objeto creado, colocar aqui parametros del objeto */ objeto o)
    {
    	NodoCircularSimple nue = new NodoCircularSimple ();
    	nue.setObjeto(o); /*si el "objeto" no es un objeto creado, reemplazar aqui colocando los atributos del "objeto" con setters */
	    if (getNodo()==null)
	    {
	        setP(nue);
	        getNodo().setSig(getNodo());//nue.setSig(nue)
	    }
	    else
	    {
            nue.setSig(getNodo());
	        NodoCircularSimple r = getNodo();
	        while (r.getSig() != getNodo())
	    	    r = r.getSig();
	        r.setSig(nue);
            setP(nue);
	    }
    }
    void mostrar()
    {
        NodoCircularSimple r = getNodo();
	    while (r.getSig() != getNodo()){
            r.getObjeto().mostrar(); /*si el "objeto" no es un objeto creado, reemplazar aqui con mostrando los atributos del "objeto" */
            r = r.getSig();
        }
        r.getObjeto().mostrar(); /*si el "objeto" no es un objeto creado, reemplazar aqui con mostrando los atributos del "objeto" */
    }
}
