public class objeto {
    private String dato;
    public String getDato() {
        return dato;
    }
    public void setDato(String dato) {
        this.dato = dato;
    }
    
    public objeto(String dato) {
        this.dato = dato;
    }
    public objeto() {
    }
    public void mostrar() {
        System.out.print(dato);
    }
}
