public class LSimpleV {
    private NodoV p;

    public LSimpleV() {
        p = null;
    }

    public NodoV getP() {
        return p;
    }

    public void setP(NodoV p) {
        this.p = p;
    }
    public void adiprinc(String a, String b, String c , int d) {
       NodoV nodo = new NodoV();
       nodo.setMarca(a);
       nodo.setPlaca(b);
       nodo.setColor(c);
       nodo.setModelo(d);
       nodo.setSig(getP());
       setP(nodo);
    }
    public void mostrar() {
        NodoV r = getP();
        while (r != null) {              
            System.out.println("[" + r.getMarca() + " " + r.getColor() + " " + r.getPlaca() + " " + r.getModelo() + "]");
            r = r.getSig();
        }
    }
}
