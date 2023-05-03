public class NodoCircularSimpleHabitaciones {
    private String tipo_habitacion, color;
    private int tamaño;
    private ListaSimpleMuebles listaSimpleMuebles;
    private NodoCircularSimpleHabitaciones sig;
    
    NodoCircularSimpleHabitaciones() {
        sig = null;
    }

    public NodoCircularSimpleHabitaciones getSig() {
        return sig;
    }

    public void setSig(NodoCircularSimpleHabitaciones sig) {
        this.sig = sig;
    }

    public String getTipo_habitacion() {
        return tipo_habitacion;
    }

    public void setTipo_habitacion(String tipo_habitacion) {
        this.tipo_habitacion = tipo_habitacion;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getTamaño() {
        return tamaño;
    }

    public void setTamaño(int tamaño) {
        this.tamaño = tamaño;
    }

    public ListaSimpleMuebles getListaSimpleMuebles() {
        return listaSimpleMuebles;
    }

    public void setListaSimpleMuebles(ListaSimpleMuebles listaSimpleMuebles) {
        this.listaSimpleMuebles = listaSimpleMuebles;
    }
    
}