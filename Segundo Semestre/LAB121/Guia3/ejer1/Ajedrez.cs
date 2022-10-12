namespace ejer1;
class Ajedrez:JuegoMesa {
    private int nroPiezas;
    public Ajedrez():base("Hasbro", 12.99) {
        nroPiezas = 18;
    }
    public void mostrar() {
        base.mostrar();
        Console.WriteLine(nroPiezas);
    }
}