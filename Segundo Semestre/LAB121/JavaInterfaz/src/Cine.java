    public class Cine extends Arte
    {

    public Cine(String Genero, int AñodePublicacion, String NombredelaObra, String Popularidad, String Aceptacion) {
        super(AñodePublicacion, NombredelaObra, Popularidad, Aceptacion);
        this.Genero = Genero;
    }
        private String Genero;
        /*public string genero
        {
            get { return Genero; }
            set { Genero = value; }
        }
        public void Leer()
        {
            System.Console.WriteLine("Leer genero: ");
            Genero = Console.ReadLine();
        }
        public void Mostrar()
        {
            base.Mostrar();
            System.Console.WriteLine(Genero);
        }*/
    }
