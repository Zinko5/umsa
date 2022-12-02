    public class Artista extends Persona
    {
        private String Disciplina;
        /*public string disciplina
        {
            get { return Disciplina; }
            set { Disciplina = value; }
        }*/
        /*public void Mostrar()
        {
            base.Mostrar();
            System.Console.WriteLine(Disciplina);
        }
        public void Leer()
        {
            base.Leer();
            System.Console.WriteLine("Leer disciplina: ");
            Disciplina = Console.ReadLine();
        }*/

    public Artista(String Disciplina, String Nom, String Nac, int Ed) {
        super(Nom, Nac, Ed);
        this.Disciplina = Disciplina;
    }

    public String getDisciplina() {
        return Disciplina;
    }
}
