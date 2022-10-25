namespace ejer1
{
    public class CSecundaria:Curso
    {
        private char palelo;
        public char Palelo
        {
            get { return palelo; }
            set { palelo = value; }
        }
        private string nomMateria;
        public string NomMateria
        {
            get { return nomMateria; }
            set { nomMateria = value; }
        }
        public CSecundaria(int id, int nroEstudiantes, int ciProfesor, string nomDirector, string nroDistrito, string ciudad, string nomProfesor, char palelo, string nomMateria) : base(id, nroEstudiantes, ciProfesor, nomDirector, nroDistrito, ciudad, nomProfesor)
        {
            this.palelo = palelo;
            this.nomMateria = nomMateria;
        }
        new public void mostrar()
        {
            base.mostrar();
            System.Console.WriteLine("Palelo: " + palelo);
        }
    }
}