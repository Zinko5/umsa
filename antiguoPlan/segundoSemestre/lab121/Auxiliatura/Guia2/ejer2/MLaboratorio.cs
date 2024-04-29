namespace ejer2
{
    public class MLaboratorio:Materia
    {
        private int nroLabo;
        private int cantidadCompu;
        private string Requerimientos;
        public string Requerimientos1 { get => Requerimientos; set => Requerimientos = value; }
        public int CantidadCompu { get => cantidadCompu; set => cantidadCompu = value; }
        public int NroLabo { get => nroLabo; set => nroLabo = value; }
        public MLaboratorio(string sigla, string nombre, string cargaHoraria, string tipo, string carreraPerteneciente, string modalidad, string nomDocente, int idDocente, string requerimientos, int cantidadCompu, int nroLabo):base(sigla, nombre, cargaHoraria, tipo, carreraPerteneciente, modalidad, nomDocente, idDocente)
        {
            Requerimientos = requerimientos;
            this.cantidadCompu = cantidadCompu;
            this.nroLabo = nroLabo;
        }

        new public void mostrar()
        {
            base.mostrar();
            System.Console.WriteLine(nroLabo + " " + cantidadCompu + " " + Requerimientos);
        }
    }
}