public class ListaDobleDepartamentos {
    private NodoDobleDepartamentos nodo;
    ListaDobleDepartamentos()
    {
        nodo = null;
    }

    public NodoDobleDepartamentos getNodo() {
        return nodo;
    }

    public void setNodo(NodoDobleDepartamentos nodo) {
        this.nodo = nodo;
    }
    public void adiFinal(int idDpto, String nomDpto, ListaDobleMunicipios listaDobleMunicipios){
        NodoDobleDepartamentos nuevo = new NodoDobleDepartamentos();
        nuevo.setIdDpto(idDpto);
        nuevo.setNomDpto(nomDpto);
        nuevo.setListaDobleMunicipios(listaDobleMunicipios);
        
        if(getNodo() == null)
            setNodo(nuevo);
        else {
            NodoDobleDepartamentos r = getNodo();
            while(r.getSig()!=null)
                r = r.getSig();
            r.setSig(nuevo);
            nuevo.setAnt(r);
        }
    }
    public void mostrar()
    {
        NodoDobleDepartamentos o = getNodo();
        while(o!=null)
        {
            System.out.println("[" + o.getIdDpto() + " " + o.getNomDpto() + "]");
            o.getListaDobleMunicipios().mostrar();
            o=o.getSig();
        }
    }
}
