import java.util.Scanner;
public class PlayList {
    Scanner sc = new Scanner(System.in);
    private String nombre;
    private int nroCanciones;
    private Cancion []canciones = new Cancion[50];
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public int getNroCanciones() {
        return nroCanciones;
    }
    public void setNroCanciones(int nroCanciones) {
        this.nroCanciones = nroCanciones;
    }
    public Cancion[] getCanciones() {
        return canciones;
    }
    public void setCanciones(Cancion[] canciones) {
        this.canciones = canciones;
    }
    public PlayList() {
    }
    public void Leer() {
        System.out.println("Leyendo playlist: ");
        System.out.println("Leer nombre: ");
        nombre = sc.nextLine();
        System.out.println("Leer numero de canciones: ");
        nroCanciones = sc.nextInt();
        for (int i = 0; i < nroCanciones; i++) {
            canciones[i] = new Cancion();
            canciones[i].Leer();
        }
    }
    public void Mostrar() {
        System.out.println("Mostrando playlist: ");
        System.out.println(nombre + " " + nroCanciones);
        for (int i = 0; i < nroCanciones; i++) {
            canciones[i].Mostrar();
        }
    }
    public boolean Verificar(String X) {
        boolean c = false;
        for (int i = 0; i < nroCanciones; i++) {
            if (canciones[i].Verificar(X)) {
               c = true;
            } 
        }
        return c;
    }
    public int Genero(String X) {
        int c = 0;
        for (int i = 0; i < nroCanciones; i++) {
            if (canciones[i].getGenero().equals(X)) {
                c ++;
            }
        }
        return c;
    }
    public void Ordenar() {
        Cancion aux = new Cancion();
        for (int i = 0; i < nroCanciones; i++) {
            for (int j = 0; j < nroCanciones - 1; j++) {
                if (canciones[j].getDuracion() > canciones[j + 1].getDuracion()) {
                    aux = canciones[j];
                    canciones[j] = canciones[j + 1];
                    canciones[j + 1] = aux;
                }
            }
        }
    }
}
