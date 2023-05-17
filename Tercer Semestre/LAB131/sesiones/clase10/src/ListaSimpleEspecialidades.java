public class ListaSimpleEspecialidades {
    private NodoSimpleEspecialidades nodo;
    
    ListaSimpleEspecialidades()
    {
        nodo = null;
    }

    public NodoSimpleEspecialidades getNodo() {
        return nodo;
    }

    public void setNodo(NodoSimpleEspecialidades p) {
        this.nodo = p;
    }
    //private int idEsp, nroPremios, montoPremio;
    //private String nomEsp;
    public void adifinal(int idEsp, int nroPremios, int montoPremio, String nomEsp)
    {
        NodoSimpleEspecialidades nue = new NodoSimpleEspecialidades();
        nue.setIdEsp(idEsp);nue.setNroPremios(nroPremios);
        nue.setMontoPremio(montoPremio);
        nue.setNomEsp(nomEsp);
        
        if(getNodo() == null)
            setNodo(nue);
        else{
            NodoSimpleEspecialidades m = getNodo();
            while(m.getSig() != null)//recorre al ultimo nodo
                m = m.getSig();
            m.setSig(nue);
        }
            
    }
    public void mostrar()
    {
        NodoSimpleEspecialidades d = getNodo();
        while(d != null)//recorre hasta el final
        {
            System.out.println(d.getIdEsp() + " " + d.getNroPremios() + " " + d.getMontoPremio() + " " + d.getNomEsp());
            d = d.getSig();
        }
    }
    
    public void mostrar(NodoSimpleEspecialidades nodo)
    {
        if(nodo!=null)
        {
            System.out.println(nodo.getNomEsp() + " " + nodo.getIdEsp() + " " + nodo.getNroPremios() + " " + nodo.getMontoPremio());
            mostrar(nodo.getSig());
        }
    }
}
