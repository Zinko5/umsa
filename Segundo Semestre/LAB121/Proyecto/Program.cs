namespace Proyecto;
class Program
{
    static void Main(string[] args)
    {
        EspacioMunincipalCultural ChuckiagoMarca = new EspacioMunincipalCultural();
        ChuckiagoMarca.Leer();
        ChuckiagoMarca.Mostrar();
        System.Console.WriteLine("Agregando evento: ");
        Evento FeriadelLibro = new Evento();
        FeriadelLibro.Leer();
        ChuckiagoMarca.Añadir(FeriadelLibro);
        ChuckiagoMarca.Mostrar();
        System.Console.WriteLine("Agregando Obra: ");
        Literatura MundoPerdido = new Literatura();
        MundoPerdido.Leer();
        FeriadelLibro.Añadir(MundoPerdido);
        ChuckiagoMarca.Mostrar();
        FeriadelLibro.Mostrar();
    }
}
