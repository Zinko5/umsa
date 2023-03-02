public class Venta {
    //nombrepila, cantidad, fecha
    private String nombre, fecha;
    private int cantidad;

    public Venta(String nombre, String fecha, int cantidad) {
        this.nombre = nombre;
        this.fecha = fecha;
        this.cantidad = cantidad;
    }
    public Venta() {
        
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombrepila(String nombrepila) {
        this.nombre = nombrepila;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    public void mostrardatos() {
        System.out.println(nombre + " " + fecha + " " + cantidad);
    }
    
}
