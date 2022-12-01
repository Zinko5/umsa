    public class Escultura:Arte
    {
        private string Material;
        public string material
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
        }
    }
