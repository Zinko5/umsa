    public class Danza extends Arte
    {

    public Danza(String Ritmo, int AñodePublicacion, String NombredelaObra, String Popularidad, String Aceptacion) {
        super(AñodePublicacion, NombredelaObra, Popularidad, Aceptacion);
        this.Ritmo = Ritmo;
    }
        private String Ritmo;
        /*public string ritmo
        {
            get { return Ritmo; }
            set { Ritmo = value; }
        }
        public void Leer()
        {
            System.Console.WriteLine("Leer genero: ");
            Ritmo = Console.ReadLine();
        }
        public void Mostrar()
        {
            base.Mostrar();
            System.Console.WriteLine(Ritmo);
        }*/
    }
