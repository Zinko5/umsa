public class LDobleMacro {
    private NodoMacro p;
    LDobleMacro(){
        p=null;
    }

    public NodoMacro getP() {
        return p;
    }

    public void setP(NodoMacro p) {
        this.p = p;
    }
    void adifinal (String a, int b)
    {
        NodoMacro nue = new NodoMacro ();
        nue.setNombre(a);
        nue.setNro(b);
        
        if (getP()==null)
        {
            setP(nue);
            nue.setSig(nue); //getP().setSig(getP());
            nue.setAnt(nue);
        }
        else
        {
            NodoMacro r=getP().getAnt();
            r.setSig(nue);
            nue.setAnt(r);
            nue.setSig(getP());
            getP().setAnt(nue);
            
        }
    }
    void mostrar()
    {
        NodoMacro r = getP();
        while (r.getSig() != getP()){
            System.out.println(r.getNombre() + " " + r.getNro());
            r = r.getSig();
        }
        System.out.println(r.getNombre() + " " + r.getNro());
    }
    
}
