public class Nodo {
    private String dato; //Los atributos del objeto, agregar getters y setters
    private String nombre;

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    private Nodo izq, der; //necesarios

    Nodo()
    {
        izq=der=null;
    }

    public Nodo getIzq() {
        return izq;
    }

    public void setIzq(Nodo izq) {
        this.izq = izq;
    }

    public Nodo getDer() {
        return der;
    }

    public void setDer(Nodo der) {
        this.der = der;
    }
    
    public void mostrar() {
        System.out.println("Dato: " + dato); //mostrar los atributos
    }

    public String getDato() {
        return dato;
    }

    public void setDato(String dato) {
        this.dato = dato;
    }
    
    public boolean esHoja() {
        return (izq == null && der == null);
    }
}
