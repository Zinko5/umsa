public class NodoV {
    private String marca, placa, color;
    private int modelo;
    private NodoV sig;

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
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

    public int getModelo() {
        return modelo;
    }

    public void setModelo(int modelo) {
        this.modelo = modelo;
    }

    public NodoV getSig() {
        return sig;
    }

    public void setSig(NodoV sig) {
        this.sig = sig;
    }

    public NodoV() {
        sig = null;
    }

    public NodoV(String marca, String placa, String color, int modelo) {
        this.marca = marca;
        this.placa = placa;
        this.color = color;
        this.modelo = modelo;
        //this.sig = getSig();
    }
    
}
