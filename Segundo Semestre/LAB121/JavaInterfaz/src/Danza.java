    public class Danza:Arte
    {
        private string Ritmo;
        public string ritmo
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
        }
    }
