public class ListaDobleCategorias {
    private NodoDobleCategorias nodo;
    ListaDobleCategorias()
    {
        nodo = null;
    }

    public NodoDobleCategorias getNodo() {
        return nodo;
    }

    public void setNodo(NodoDobleCategorias nodo) {
        this.nodo = nodo;
    }
    public void adiFinal(String i, String n){
        NodoDobleCategorias nuevo = new NodoDobleCategorias();
        nuevo.setIdCat(i);
        nuevo.setNomCat(n);
        
        if(getNodo() == null)
            setNodo(nuevo);
        else {
            NodoDobleCategorias r = getNodo();
            while(r.getSig()!=null)
                r = r.getSig();
            r.setSig(nuevo);
            nuevo.setAnt(r);
        }
    }
    public void mostrar()
    {
        NodoDobleCategorias o = getNodo();
        while(o!=null)
        {
            System.out.println(o.getIdCat() + " " + o.getNomCat());
            o=o.getSig();
        }
    }
}
