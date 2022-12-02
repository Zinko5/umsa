    public class Escultura extends Arte
    {

    public Escultura(String Material, int AñodePublicacion, String NombredelaObra, String Popularidad, String Aceptacion) {
        super(AñodePublicacion, NombredelaObra, Popularidad, Aceptacion);
        this.Material = Material;
    }
        private String Material;
        /*public string material
        {
            get { return Material; }
            set { Material = value; }
        }
        public void Leer()
        {
            System.Console.WriteLine("Leer genero: ");
            Material = Console.ReadLine();
        }
        public void Mostrar()
        {
            base.Mostrar();
            System.Console.WriteLine(Material);
        }*/
    }
