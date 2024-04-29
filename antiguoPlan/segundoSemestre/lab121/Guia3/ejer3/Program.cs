namespace ejer3;
class Program
{
    static void Main(string[] args)
    {
        Director director0 = new Director(42, 879541, "Juan", "Fisica", 2143.8, 4, "2019");
        DocenteEmerito docenteEmerito0 = new DocenteEmerito(51, 478235, "Felipe", "Matematica", 1100.3, 10);
        DocenteEmerito docenteEmerito1 = new DocenteEmerito(38, 4712008, "Diego", "Informatica", 1305.4, 3);
        DocenteInterino docenteInterino0 = new DocenteInterino(31, 579841, "Pablo", "Biologia", 975.4, 2);
        DocenteInterino docenteInterino1 = new DocenteInterino(40, 574982, "Jose", "Matematica", 981.5, 3);
        AuxiliarDocencia auxiliarDocencia0 = new AuxiliarDocencia(23, 457115, "Carlos", "874441", 241.3, "Informatica");
        AuxiliarServicio auxiliarServicio0 = new AuxiliarServicio(24, 501478, "Hugo", "184009", 194.5, "Redacta informes");
        AuxiliarInvestigacion auxiliarInvestigacion0 = new AuxiliarInvestigacion(23, 874426, "Antonio", "975558", 201.6, "Paradigmas de la programacion");
        Estudiante estudiante0 = new Estudiante(19, 471120, "Carla", "105557");
        Estudiante estudiante1 = new Estudiante(21, 406557, "Jorge", "748889");
        Console.WriteLine("a):");
        director0.Mostrar(); Console.WriteLine();
        docenteEmerito0.Mostrar(); Console.WriteLine();
        docenteEmerito1.Mostrar(); Console.WriteLine();
        docenteInterino0.Mostrar(); Console.WriteLine();
        docenteInterino1.Mostrar(); Console.WriteLine();
        auxiliarDocencia0.Mostrar(); Console.WriteLine();
        auxiliarServicio0.Mostrar(); Console.WriteLine();
        estudiante0.Mostrar(); Console.WriteLine();
        estudiante1.Mostrar(); Console.WriteLine("\nb):");
        director0.Mostrar(docenteEmerito0, docenteEmerito1, docenteInterino0, docenteInterino1, auxiliarDocencia0, auxiliarServicio0, auxiliarInvestigacion0); Console.WriteLine("c):");
        director0.MateriaDirector(); Console.WriteLine("d):");
        director0.Mostrar(docenteEmerito0, docenteEmerito1, docenteInterino0, docenteInterino1); Console.WriteLine("\ne):");
        docenteEmerito0.Mostrar(docenteEmerito1); Console.WriteLine();
    }
}
