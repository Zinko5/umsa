namespace ejer1;
class Program
{
    static void Main(string[] args)
    {
        Empleado e1 = new Empleado();
        Empleado e2 = new Empleado(70.9);
        e1.mostrar();
        e2.mostrar();
        e1.massueldo(e2);
        Console.Write("Enter X(area nueva para empleado n°1): ");
        string x = Console.ReadLine();
        e1.cambiararea(x);
        e1.mismaarea(e2);
    }
}
