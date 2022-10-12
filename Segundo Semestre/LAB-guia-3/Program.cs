namespace LAB_guia_3;
class Program
{
    static void Main(string[] args)
    {
        JuegoPC FIFA = new JuegoPC();
        FIFA.mostrar();
        Ajedrez ajedrez = new Ajedrez();
        ajedrez.mostrar();
        FIFA.mostrar(ajedrez);
        ajedrez.mostrar(FIFA);
    }
}
