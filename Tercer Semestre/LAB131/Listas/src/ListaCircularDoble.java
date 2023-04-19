public class ListaCircularDoble {
    private NodoCircularDoble p;
    ListaCircularDoble(){
        p = null;
    }

    public NodoCircularDoble getNodo() {
        return p;
    }

    public void setNodo(NodoCircularDoble p) {
        this.p = p;
    }
    void adifinal (objeto o /*si el "objeto" no es un objeto creado, colocar aqui parametros del objeto */){
        NodoCircularDoble nue = new NodoCircularDoble ();
        nue.setObjeto(o); /*si el "objeto" no es un objeto creado, reemplazar aqui colocando los atributos del "objeto" con setters */
        if (getNodo()==null)
        {
            setNodo(nue);
            nue.setSig(nue); //getNodo().setSig(getNodo());
            nue.setAnt(nue);
        }
        else
        {
            NodoCircularDoble r=getNodo().getAnt();
            r.setSig(nue);
            nue.setAnt(r);
            nue.setSig(getNodo());
            getNodo().setAnt(nue);
            
        }
    }
    void mostrar()
    {
        NodoCircularDoble r = getNodo();
	    while (r.getSig() != getNodo()){
            r.getObjeto().mostrar(); /*si el "objeto" no es un objeto creado, reemplazar aqui con mostrando los atributos del "objeto" */
            r = r.getSig();
        }
        r.getObjeto().mostrar(); /*si el "objeto" no es un objeto creado, reemplazar aqui con mostrando los atributos del "objeto" */
    }
}
