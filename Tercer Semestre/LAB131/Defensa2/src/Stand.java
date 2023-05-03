public class Stand {
    private int nroStand, idCom;
    private String productor;
    private PilaProductos pp;

    public int getNroStand() {
        return nroStand;
    }

    public void setNroStand(int nroStand) {
        this.nroStand = nroStand;
    }

    public int getIdCom() {
        return idCom;
    }

    public void setIdCom(int idCom) {
        this.idCom = idCom;
    }

    public String getProductor() {
        return productor;
    }

    public void setProductor(String productor) {
        this.productor = productor;
    }

    public PilaProductos getPp() {
        return pp;
    }

    public void setPp(PilaProductos pp) {
        this.pp = pp;
    }

    
    public Stand() {
    }

    public Stand(int nroStand, int idCom, String productor, PilaProductos pp) {
        this.nroStand = nroStand;
        this.idCom = idCom;
        this.productor = productor;
        this.pp = pp;
    }
    
    
    public void mostrar(){
        System.out.println(nroStand + " " + productor + " " + idCom);
        pp.mostrar();
    }
}
