public class NodoEstudiantes {
    private String nombre;
    private NodoEstudiantes izq, der;
    private int nota;

    public int getNota() {
        return nota;
    }

    public void setNota(int nota) {
        this.nota = nota;
    }

    NodoEstudiantes()
    {
        izq=der=null;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public NodoEstudiantes getIzq() {
        return izq;
    }

    public void setIzq(NodoEstudiantes izq) {
        this.izq = izq;
    }

    public NodoEstudiantes getDer() {
        return der;
    }

    public void setDer(NodoEstudiantes der) {
        this.der = der;
    }
    
    public void mostrar() {
        System.out.println("Nombre: " + nombre + ", Nota: " + nota);
    }
    
}
