public class Trufi {
    private String placa, color, marca;
    private int linea;

    public int getLinea() {
        return linea;
    }

    public void setLinea(int linea) {
        this.linea = linea;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public Trufi() {
    }

    public Trufi(int linea, String placa, String color, String marca) {
        this.linea = linea;
        this.placa = placa;
        this.color = color;
        this.marca = marca;
    }
    
    public void mostar() {
        System.out.println("[" + linea + " " + placa + " " + color + " " + marca  + "]");
    }
}
