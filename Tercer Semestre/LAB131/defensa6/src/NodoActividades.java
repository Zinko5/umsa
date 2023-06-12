import java.util.*;
public class NodoActividades {
    private String fecha, actividad; //Los atributos del objeto, agregar getters y setters

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getActividad() {
        return actividad;
    }

    public void setActividad(String actividad) {
        this.actividad = actividad;
    }

    private NodoActividades izq, der; //necesarios

    NodoActividades()
    {
        izq=der=null;
    }

    public NodoActividades getIzq() {
        return izq;
    }

    public void setIzq(NodoActividades izq) {
        this.izq = izq;
    }

    public NodoActividades getDer() {
        return der;
    }

    public void setDer(NodoActividades der) {
        this.der = der;
    }
    
    public void mostrar() {
        System.out.println("Fecha: " + fecha + " Actividad: " + actividad); //mostrar los atributos
    }
    
    public boolean esHoja() {
        return (izq == null && der == null);
    }
    
    public String getDia() {
        String dia;
        dia = fecha.substring(0, 2);
        return  dia;
    }
    
    public String getMes() {
        String mes;
        mes = fecha.substring(2, 4);
        return mes;
    }
}
