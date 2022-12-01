
    public class Arte
    {
        private int AñodePublicacion;
        public int añodePublicacion
        {
            get { return AñodePublicacion; }
            set { AñodePublicacion = value; }
        }
        private String NombredelaObra;
        public String nombredelaObra
        {
            get { return NombredelaObra; }
            set { NombredelaObra = value; }
        }
        public void Leer()
        {
            System.out.println("Leer el año de publicacion de la obra: ");
            añodePublicacion = int.Parse(Console.ReadLine());
            System.out.println("Leer el nombre de la obra: ");
            NombredelaObra = Console.ReadLine();
        }
        public void Mostrar()
        {
            System.out.println(AñodePublicacion + " " + NombredelaObra);
        }
    }
