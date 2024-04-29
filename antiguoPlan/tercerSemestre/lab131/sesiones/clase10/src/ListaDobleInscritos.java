public class ListaDobleInscritos {
    private NodoDobleInscritos nodo;
    ListaDobleInscritos()
    {
        nodo = null;
    }

    public NodoDobleInscritos getNodo() {
        return nodo;
    }

    public void setNodo(NodoDobleInscritos nodo) {
        this.nodo = nodo;
    }
    public void adiFinal(int idIns, String nomIns, int idCat, int idEsp, int puntaje){
        NodoDobleInscritos nuevo = new NodoDobleInscritos();
        nuevo.setIdIns(idIns);
        nuevo.setNomIns(nomIns);
        nuevo.setIdCat(idCat);
        nuevo.setIdEsp(idEsp);
        nuevo.setPuntaje(puntaje);
        
        if(getNodo() == null)
            setNodo(nuevo);
        else {
            NodoDobleInscritos r = getNodo();
            while(r.getSig()!=null)
                r = r.getSig();
            r.setSig(nuevo);
            nuevo.setAnt(r);
        }
    }
    public void mostrar()
    {
        NodoDobleInscritos o = getNodo();
        while(o!=null)
        {
            System.out.println(o.getIdIns() + " " + o.getNomIns() + " " + o.getIdCat() + " " + o.getIdEsp() + " " + o.getPuntaje());
            o=o.getSig();
        }
    }
}
