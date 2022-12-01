    public class Artista:Persona
    {
        private string Disciplina;
        public string disciplina
        {
            get { return Disciplina; }
            set { Disciplina = value; }
        }
        public void Mostrar()
        {
            base.Mostrar();
            System.Console.WriteLine(Disciplina);
        }
        public void Leer()
        {
            base.Leer();
            System.Console.WriteLine("Leer disciplina: ");
            Disciplina = Console.ReadLine();
        }
    }
