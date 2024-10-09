public class celular {
    private String marca;
    private double precio;
    private String modelo;

    public celular(String marca, double precio, String modelo) {
        this.marca = marca;
        this.precio = precio;
        this.modelo = modelo;
    }

    public String getMarca() {
        return marca;
    }

    public double getPrecio() {
        return precio;
    }

    public String getModelo() {
        return modelo;
    }

    @Override
    public String toString() {
        return "Celular{" +
                "marca='" + marca + '\'' +
                ", precio=" + precio +
                ", modelo='" + modelo + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        celular celular = (celular) obj;
        return Double.compare(celular.precio, precio) == 0 &&
                marca.equals(celular.marca) &&
                modelo.equals(celular.modelo);
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = marca.hashCode();
        temp = Double.doubleToLongBits(precio);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        result = 31 * result + modelo.hashCode();
        return result;
    }
}
