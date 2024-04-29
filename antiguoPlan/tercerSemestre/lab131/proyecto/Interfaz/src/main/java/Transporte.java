public class Transporte {
    private String tipoTransporte;
    private String placa;
    private double costo;

    public Transporte() {
    }

    public Transporte(String tipoTransporte, String placa, double costo) {
        this.tipoTransporte = tipoTransporte;
        this.placa = placa;
        this.costo = costo;
    }

    public String getTipoVehiculo() {
        return tipoTransporte;
    }

    public void setTipoVehiculo(String tipoTransporte) {
        this.tipoTransporte = tipoTransporte;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public void Leer() {
        System.out.println("<Lectura de Transporte>");
        System.out.print("Ingrese el tipo de transporte: ");
        tipoTransporte = Leer.dato();
        System.out.print("Ingrese la placa: ");
        placa = Leer.dato();
        System.out.print("Ingrese el costo: ");
        costo = Leer.datoDouble();
        //scanner.close();
    }

    public void Mostrar() {
        System.out.println("Tipo transporte: " + tipoTransporte + ", Placa: " + placa + ", Costo: " + costo);
    }
}
