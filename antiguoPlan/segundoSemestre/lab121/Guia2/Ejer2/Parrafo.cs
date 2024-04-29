namespace Ejer2;
class Parrafo {
    private string idioma, colorLetra;
    private int nrolineas;
    private string[] linea = new string[50];
    public Parrafo() {
        idioma = "español";
        colorLetra = "negro";
        nrolineas = 1;
        linea[0] = "Y... fin";
    }
    public Parrafo(string c) {
        idioma = "Ingles";
        colorLetra = c;
        nrolineas = 2;
        linea[0] = "And...";
        linea[1] = "Is the end";
    }
    public void mostrar() {
        Console.WriteLine(idioma + " " + colorLetra + " " + nrolineas);
        for (int i = 0; i < nrolineas; i++) {
            Console.WriteLine(linea[i]);
        }
    }
    public void mostrar(int a, int b) {
        for (int i = a; i <= b; i++) {
            Console.WriteLine(linea[i]);
        }
    }
    public static bool operator !(Parrafo p) {
        if (p.nrolineas == 0) {
            return false;
        }
        else {return true;}
    }
    public static Parrafo operator ++(Parrafo p) {
        int n = 0;
        for (int i = 0; i < p.nrolineas; i++) {
            p.linea[i] = p.linea[i] + " ";
            for (int y = 0; y < p.linea[i].Length; y++) {
                if (p.linea[i].Substring(y, 1) == " ") {
                    n++;
                }
            }
        }
        Console.WriteLine(n);
        return p;
    }
}