
public class Ruta {
    private String origen;
    private String destino;
    private int tiempoEstimado;
    private ListaDobleTransporte listaDobleTransporte = new ListaDobleTransporte();

    public Ruta() {
    }

    public Ruta(String origen, String destino, int tiempoEstimado, ListaDobleTransporte listaDobleTransporte) {
        this.origen = origen;
        this.destino = destino;
        this.tiempoEstimado = tiempoEstimado;
        this.listaDobleTransporte = listaDobleTransporte;
    }

    public String getOrigen() {
        return origen;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public int getTiempoEstimado() {
        return tiempoEstimado;
    }

    public void setTiempoEstimado(int tiempoEstimado) {
        this.tiempoEstimado = tiempoEstimado;
    }

    public ListaDobleTransporte getListaDobleTransporte() {
        return listaDobleTransporte;
    }

    public void setlistaDobleTransporte(ListaDobleTransporte listaDobleTransporte) {
        this.listaDobleTransporte = listaDobleTransporte;
    }

    public void Leer() {
        System.out.println("<Lectura de Ruta>");
        System.out.print("Ingrese el origen: ");
        origen = Leer.dato();
        System.out.print("Ingrese el destino: ");
        destino = Leer.dato();
        System.out.print("Ingrese el tiempo estimado: ");
        tiempoEstimado = Leer.datoInt();
        System.out.print("¿Cuantos transportes leer para la ruta?: ");
        int n = Leer.datoInt();
        for (int i = 0; i < n; i++) {
            Transporte transporte = new Transporte();
            transporte.Leer();
            listaDobleTransporte.adiFinal(transporte);
        }
        //scanner.close();
    }

    public void Mostrar() {
        System.out.println("Origen: " + origen + ", Destino: " + destino + ", Tiempo Estimado: " + tiempoEstimado);
        listaDobleTransporte.Mostrar();
    }
}
