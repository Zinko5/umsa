namespace Proyecto;
class Program
{
    static void Main(string[] args)
    {
        EspacioMunincipalCultural ChuquiagoMarka = new EspacioMunincipalCultural();
        ChuquiagoMarka.Leer();
        ChuquiagoMarka.Mostrar();
        System.Console.WriteLine("Agregando evento: ");
        Evento FeriadelLibro = new Evento();
        FeriadelLibro.Leer();
        ChuquiagoMarka.Añadir(FeriadelLibro);
        ChuquiagoMarka.Mostrar();
        System.Console.WriteLine("Agregando Obra: ");
        Literatura MundoPerdido = new Literatura();
        MundoPerdido.Leer();
        FeriadelLibro.Añadir(MundoPerdido);
        ChuquiagoMarka.Mostrar();
        System.Console.WriteLine("Agregando Artista: ");
        Artista GabrielGarciaMarquez = new Artista();
        GabrielGarciaMarquez.Leer();
        FeriadelLibro.Añadir(GabrielGarciaMarquez);
        ChuquiagoMarka.Mostrar();
    }
}
