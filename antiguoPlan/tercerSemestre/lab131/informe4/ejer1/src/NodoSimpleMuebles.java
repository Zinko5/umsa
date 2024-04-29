public class NodoSimpleMuebles {
    private int cantidad;
    private String nombre;
    private NodoSimpleMuebles sig;
    
    NodoSimpleMuebles(){
        sig = null;
    }

    public NodoSimpleMuebles getSig() {
        return sig;
    }

    public void setSig(NodoSimpleMuebles sig) {
        this.sig = sig;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}