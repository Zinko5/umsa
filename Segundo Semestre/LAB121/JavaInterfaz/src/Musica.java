    public class Musica extends Arte
    {
        private String Genero;
        /*public string genero
        {
            get { return Genero; }
            set { Genero = value; }
        }*/
        /*public void Leer()
        {
            System.Console.WriteLine("Leer genero: ");
            Genero = Console.ReadLine();
        }
        public void Mostrar()
        {
            base.Mostrar();
            System.Console.WriteLine(Genero);
        }*/

    public Musica(String gen, int apub, String nomobra, String pop, String acep) {
        super(apub, nomobra, pop, acep);
        this.Genero = gen;
    }
    }
