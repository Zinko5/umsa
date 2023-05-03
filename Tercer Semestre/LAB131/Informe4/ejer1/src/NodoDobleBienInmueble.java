public class NodoDobleBienInmueble {
    private String ubicacion;
    private int  id_casa, tamaño;
    private ListaCircularSimpleHabitaciones circularSimpleHabitaciones;
    private NodoDobleBienInmueble ant, sig;

    NodoDobleBienInmueble() {
        ant = sig = null;
    }

    public NodoDobleBienInmueble getAnt() {
        return ant;
    }

    public void setAnt(NodoDobleBienInmueble ant) {
        this.ant = ant;
    }

    public NodoDobleBienInmueble getSig() {
        return sig;
    }

    public void setSig(NodoDobleBienInmueble sig) {
        this.sig = sig;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    public ListaCircularSimpleHabitaciones getCircularSimpleHabitaciones() {
        return circularSimpleHabitaciones;
    }

    public void setCircularSimpleHabitaciones(ListaCircularSimpleHabitaciones circularSimpleHabitaciones) {
        this.circularSimpleHabitaciones = circularSimpleHabitaciones;
    }

    public int getId_casa() {
        return id_casa;
    }

    public void setId_casa(int id_casa) {
        this.id_casa = id_casa;
    }

    public int getTamaño() {
        return tamaño;
    }

    public void setTamaño(int tamaño) {
        this.tamaño = tamaño;
    }
}