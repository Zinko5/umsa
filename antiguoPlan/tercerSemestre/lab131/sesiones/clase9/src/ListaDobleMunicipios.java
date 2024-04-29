public class ListaDobleMunicipios {
    private NodoDobleMunicipios nodo;
    ListaDobleMunicipios()
    {
        nodo = null;
    }

    public NodoDobleMunicipios getNodo() {
        return nodo;
    }

    public void setNodo(NodoDobleMunicipios nodo) {
        this.nodo = nodo;
    }
    public void adiFinal(int idMun, String nomMun, ListaDobleInscritos listaDobleInscritos){
        NodoDobleMunicipios nuevo = new NodoDobleMunicipios();
        nuevo.setIdMun(idMun);
        nuevo.setNomMun(nomMun);
        nuevo.setListaDobleInscritos(listaDobleInscritos);
        
        if(getNodo() == null)
            setNodo(nuevo);
        else {
            NodoDobleMunicipios r = getNodo();
            while(r.getSig()!=null)
                r = r.getSig();
            r.setSig(nuevo);
            nuevo.setAnt(r);
        }
    }
    public void mostrar()
    {
        NodoDobleMunicipios o = getNodo();
        while(o!=null)
        {
            System.out.println("<" + o.getIdMun() + " " + o.getNomMun() + ">");
            o.getListaDobleInscritos().mostrar();
            o = o.getSig();
        }
    }
}
