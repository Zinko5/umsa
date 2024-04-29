namespace ejer2;
class Program
{
    static void Main(string[] args)
    {
        Leon leon1 = new Leon(9, 186.4, "leon", "caliente", "asiatico");
        Leon leon2 = new Leon(7, 205.8, "leon", "caliente", "africano");
        Aguila aguila1 = new Aguila(19, 3.8, "aguila", 1.9, "real");
        Aguila aguila2 = new Aguila(21, 5.2, "aguila", 2.1, "calva");
        Tiburon tiburon1 = new Tiburon(54, 611.53, "tiburon", "branquias", "blanco");
        Tiburon tiburon2 = new Tiburon(17, 89.14, "tiburon", "branquias", "martillo");
        leon1.mostrar();
        leon2.mostrar();
        tiburon1.mostrar();
        tiburon2.mostrar();
        aguila1.mostrar();
        aguila2.mostrar();
        Console.WriteLine();
        leon1.mostrar("l");
        leon2.mostrar("l");
        tiburon1.mostrar("l");
        tiburon2.mostrar("l");
        aguila1.mostrar("l");
        aguila2.mostrar("l");
        Console.WriteLine();
        leon1.mostrar(leon2, aguila1, aguila2, tiburon1, tiburon2);
        Console.WriteLine();
        leon1.mostrar(aguila1, aguila2, tiburon1, tiburon2, leon1);
    }
}
