namespace ejer2
{
    public class MCatedra:Materia
    {
        private int nroAulas;
        public int NroAulas { get => nroAulas; set => nroAulas = value; }
        public MCatedra(string sigla, string nombre, string cargaHoraria, string tipo, string carreraPerteneciente, string modalidad, string nomDocente, int idDocente, int nroAulas):base(sigla, nombre, cargaHoraria, tipo, carreraPerteneciente, modalidad, nomDocente, idDocente)
        {
            this.nroAulas = nroAulas;
        }
        public void mostrar()
        {
            base.mostrar();
            System.Console.WriteLine(nroAulas);
        }
    }
}