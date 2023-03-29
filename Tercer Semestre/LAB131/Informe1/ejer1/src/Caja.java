
public class Caja {
    private String fruta;   
    private int cantidad;
    private int precioUnitario;
    public String getFruta() {
        return fruta;
    }
    public void setFruta(String fruta) {
        this.fruta = fruta;
    }
    public int getCantidad() {
        return cantidad;
    }
    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    public int getPrecioUnitario() {
        return precioUnitario;
    }
    public void setPrecioUnitario(int precioUnitario) {
        this.precioUnitario = precioUnitario;
    }
    public Caja(String fruta, int cantidad, int precioUnitario) {
        this.fruta = fruta;
        this.cantidad = cantidad;
        this.precioUnitario = precioUnitario;
    }
    public Caja() {
        
    }
    public void mostrar() {
        System.out.println(fruta + " " + cantidad + " " + precioUnitario);
    }
}