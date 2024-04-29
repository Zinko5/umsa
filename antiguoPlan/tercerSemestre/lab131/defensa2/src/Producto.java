public class Producto {
    private String nomProd, tipo;
    private int precio, montoVentas;

    public Producto() {
    }

    public Producto(String nomProd, String tipo, int precio, int montoVentas) {
        this.nomProd = nomProd;
        this.tipo = tipo;
        this.precio = precio;
        this.montoVentas = montoVentas;
    }

    public String getNomProd() {
        return nomProd;
    }

    public void setNomProd(String nomProd) {
        this.nomProd = nomProd;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public int getMontoVentas() {
        return montoVentas;
    }

    public void setMontoVentas(int montoVentas) {
        this.montoVentas = montoVentas;
    }
    public void mostrar(){
        System.out.print(nomProd + " " + tipo + " " + precio + " " + montoVentas);
    }
}
