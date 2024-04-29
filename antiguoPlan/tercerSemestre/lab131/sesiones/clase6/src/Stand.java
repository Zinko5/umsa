public class Stand {
    private int nroStand, idCom;
    private String productor;
    private PilaP pp;

    public Stand() {
    }

    public Stand(int nroStand, int idCom, String productor, PilaP pp) {
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
