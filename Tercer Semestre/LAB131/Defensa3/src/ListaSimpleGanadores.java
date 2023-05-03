public class ListaSimpleGanadores {
    private NodoSimpleGanadores nodo;
    
    ListaSimpleGanadores()
    {
        nodo = null;
    }

    public NodoSimpleGanadores getNodo() {
        return nodo;
    }

    public void setNodo(NodoSimpleGanadores p) {
        this.nodo = p;
    }
    public void adifinal(int c, String n, String p, String m, String s, String id, String l)
    {
        NodoSimpleGanadores nue = new NodoSimpleGanadores();
        nue.setCi(c);
        nue.setNom(n);
        nue.setPat(p);
        nue.setMat(m);
        nue.setSeudonimo(s);
        nue.setIdEsp(id);
        nue.setLugar(l);
        if(getNodo() == null)
            setNodo(nue);
        else{
            NodoSimpleGanadores mm = getNodo();
            while(mm.getSig() != null)//recorre al ultimo nodo
                mm = mm.getSig();
            mm.setSig(nue);
        }
            
    }
    public void mostrar()
    {
        NodoSimpleGanadores d = getNodo();
        while(d != null)//recorre hasta el final
        {
            System.out.println(d.getCi() + " " + d.getNom() + " " + d.getPat() + " " + d.getMat() + " " + d.getSeudonimo() + " " + d.getIdEsp() + " " + d.getLugar());
            d = d.getSig();
        }
    }
    
}

