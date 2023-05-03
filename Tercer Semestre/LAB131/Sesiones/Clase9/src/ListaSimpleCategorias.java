public class ListaSimpleCategorias {
    private NodoSimpleCategorias nodo;
    
    ListaSimpleCategorias()
    {
        nodo = null;
    }

    public NodoSimpleCategorias getNodo() {
        return nodo;
    }

    public void setNodo(NodoSimpleCategorias p) {
        this.nodo = p;
    }
    /*
    private int idCat;
    private String nomCat;
    private ListaSimpleEspecialidades listaSimpleEspecialidades;
    */
    public void adifinal(int idCat, String nomCat, ListaSimpleEspecialidades listaSimpleEspecialidades)
    {
        NodoSimpleCategorias nue = new NodoSimpleCategorias();
        nue.setIdCat(idCat);
        nue.setNomCat(nomCat);
        nue.setListaSimpleEspecialidades(listaSimpleEspecialidades);
        if(getNodo() == null)
            setNodo(nue);
        else{
            NodoSimpleCategorias m = getNodo();
            while(m.getSig() != null)//recorre al ultimo nodo
                m = m.getSig();
            m.setSig(nue);
        }
            
    }
    public void mostrar()
    {
        NodoSimpleCategorias d = getNodo();
        while(d != null)//recorre hasta el final
        {
            System.out.println("[" + d.getIdCat() + " " + d.getNomCat() + "]");
            d.getListaSimpleEspecialidades().mostrar();
            d = d.getSig();
        }
    }
    
}
