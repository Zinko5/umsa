namespace LAB_guia_3;
class JuegoPC:VideoJuego {
    private int tamañoGB;
    public JuegoPC():base("EA", 61.99) {
        tamañoGB = 15;
    }
    public void aa() {
        
    }
    public void mostrar() {
        base.mostrar();
        Console.WriteLine(tamañoGB);
    }
}