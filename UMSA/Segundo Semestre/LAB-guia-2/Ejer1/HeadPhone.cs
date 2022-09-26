namespace Ejer1;
class HeadPhone {
    private double precio;
    private string marca, color;
    public HeadPhone() {
        precio = 50.99;
        marca = "Sony";
        color = "negro";
    } 
    public HeadPhone(double p, string m, string c) {
        precio = p;
        marca = m;
        color = c;
    }
    static public HeadPhone operator ++(HeadPhone h) {
        h.precio = double.Parse(Console.ReadLine());
        h.marca = Console.ReadLine();
        h.color = Console.ReadLine();
        return h;
    }
    static public HeadPhone operator --(HeadPhone h) {
        Console.WriteLine (h.precio + " " + h.marca + " " + h.color);
        return h;
    }
    static public HeadPhone operator +(HeadPhone h, double y) {
        h.precio = h.precio + y;
        return h;
    }
}