public class Laptop implements Comparable<Laptop>{
    private String marca;
    private int capHd;
    private int capRam;
    private int precio;
    public int getCapHd() {
        return capHd;
    }public int getCapRam() {
        return capRam;
    }public String getMarca() {
        return marca;
    }public int getPrecio() {
        return precio;
    }public void setCapHd(int capHd) {
        this.capHd = capHd;
    }public void setCapRam(int capRam) {
        this.capRam = capRam;
    }public void setMarca(String marca) {
        this.marca = marca;
    }public void setPrecio(int precio) {
        this.precio = precio;
    }
    public Laptop(){}
    public Laptop(String marca, int capHd, int capRam, int precio){
        this.marca = marca;
        this.capHd = capHd;
        this.capRam = capRam;
        this.precio = precio;
    }

    public String toString(){
        return "marca = " + marca + ", capHd = " + capHd + ", capRam = " + capRam + ", precio = " + precio + "\n";
    }
    @Override
    public int compareTo(Laptop l){
        return Integer.compare(this.precio, l.precio);
    }
}
