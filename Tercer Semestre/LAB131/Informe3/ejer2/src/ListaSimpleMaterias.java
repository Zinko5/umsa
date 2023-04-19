public class ListaSimpleMaterias {
    private NodoSimpleMaterias nodo;
    
    ListaSimpleMaterias()
    {
        nodo = null;
    }

    public NodoSimpleMaterias getNodo() {
        return nodo;
    }

    public void setNodo(NodoSimpleMaterias p) {
        this.nodo = p;
    }
    public void adifinal(String s, String n, String h)
    {
        NodoSimpleMaterias nue = new NodoSimpleMaterias();
        nue.setSigla(s);
        nue.setNombreMateria(n);
        nue.setHorario(h);
        if(getNodo() == null)
            setNodo(nue);
        else{
            NodoSimpleMaterias m = getNodo();
            while(m.getSig() != null)//recorre al ultimo nodo
                m = m.getSig();
            m.setSig(nue);
        }
            
    }
    public void mostrar()
    {
        NodoSimpleMaterias d = getNodo();
        while(d != null)//recorre hasta el final
        {
            System.out.println(d.getSigla() + " " + d.getNombreMateria() + " " + d.getHorario());
            d = d.getSig();
        }
    }
    
}