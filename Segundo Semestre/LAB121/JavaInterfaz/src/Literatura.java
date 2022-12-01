    public class Literatura:Arte
    {
        private string Genero;
        public string genero
        {
            get { return Genero; }
            set { Genero = value; }
        }
        public void Leer()
        {
            base.Leer();
            System.Console.WriteLine("Leer genero: ");
            Genero = Console.ReadLine();
        }
        public void Mostrar()
        {
            base.Mostrar();
            System.Console.WriteLine(Genero);
        }
    }
