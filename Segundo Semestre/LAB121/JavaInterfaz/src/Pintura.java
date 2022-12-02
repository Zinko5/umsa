    public class Pintura extends Arte
    {

    public Pintura(String Tecnica, int AñodePublicacion, String NombredelaObra, String Popularidad, String Aceptacion) {
        super(AñodePublicacion, NombredelaObra, Popularidad, Aceptacion);
        this.Tecnica = Tecnica;
    }
        private String Tecnica;/*
        public string tecnica
        {
            get { return Tecnica; }
            set { Tecnica = value; }
        }
        public void Leer()
        {
            System.Console.WriteLine("Leer genero: ");
            Tecnica = Console.ReadLine();
        }
        public void Mostrar()
        {
            base.Mostrar();
            System.Console.WriteLine(Tecnica);
        }*/
    }
