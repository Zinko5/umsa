namespace LAB_guia_3;
class Juego {
    private string marca;
    private double precio;
    public Juego(string a, double b) {
        marca = a;
        precio = b;
    }
    public void mostrar() {
        Console.Write(marca + " " + precio + " ");
    }
    public void mostrar(Juego a) {
        Console.Write("El mas caro es: ");
        if (precio > a.precio) {this.mostrar();}
        else {
            if (a.precio > precio) {a.mostrar();}
            else {Console.WriteLine("Ninguno es mas caro");}
        }
        Console.WriteLine();
    }
    public void mostrar(VideoJuego a) {
        Console.Write("El objeto de menor nombre lexicografico es: ");
        if (marca.Length < a.marca.Length) {mostrar();}
        else {
            if (a.marca.Length < marca.Length) {a.mostrar();}
            else {Console.WriteLine("Ninguno es menor lexicograficamente");}
        }
        Console.WriteLine();
    }
}