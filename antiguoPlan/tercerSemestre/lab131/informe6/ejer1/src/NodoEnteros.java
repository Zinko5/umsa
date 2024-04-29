public class NodoEnteros {
    private String dato; //Los atributos del objeto, agregar getters y setters
    private int entero;

    public int getEntero() {
        return entero;
    }

    public void setEntero(int entero) {
        this.entero = entero;
    }

    private NodoEnteros izq, der; //necesarios

    NodoEnteros()
    {
        izq=der=null;
    }

    public NodoEnteros getIzq() {
        return izq;
    }

    public void setIzq(NodoEnteros izq) {
        this.izq = izq;
    }

    public NodoEnteros getDer() {
        return der;
    }

    public void setDer(NodoEnteros der) {
        this.der = der;
    }
    
    public void mostrar() {
        System.out.println("Entero: " + entero); //mostrar los atributos
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
