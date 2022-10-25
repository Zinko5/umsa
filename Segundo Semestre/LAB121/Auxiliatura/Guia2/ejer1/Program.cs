namespace ejer1;

class Program
{
    static void Main(string[] args)
    {
        
        CPreparatoria cp = new CPreparatoria(481, 2, 147951, "Emilio", "D13", "Pando", "Jose", "3B", "tecnica");
        CSecundaria cs = new CSecundaria(405, 3, 697741, "Pepe", "D51", "Tarija", "Luix", 'A', "Matematica");
        cp.mostrar(); System.Console.WriteLine();
        cs.mostrar(); System.Console.WriteLine();
        cp.mostrar(cs); System.Console.WriteLine();
        cp.eliminar();
        cs.eliminar();System.Console.WriteLine("Eliminando primos y capicuas:\n");
        cp.mostrar(); System.Console.WriteLine();
        cs.mostrar();
    }
}
