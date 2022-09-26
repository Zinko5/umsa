namespace Ejer2;
class Program
{
    static void Main(string[] args)
    {
        Parrafo p = new Parrafo();
        Parrafo p1 = new Parrafo("Azul");
        int a, b;
        p.mostrar();
        p1.mostrar();
        Console.Write("Enter a: ");
        a = int.Parse(Console.ReadLine());
        Console.Write("Enter b: ");
        b = int.Parse(Console.ReadLine()); 
        p1.mostrar(a,b);
        Console.WriteLine(!p);
        p++;
        p1++;
    }
}