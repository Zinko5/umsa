namespace ejer2
{
    public class Materia
    {
        private string sigla;
        private string nombre;
        private string cargaHoraria;
        private string tipo;
        private string carreraPerteneciente;
        private string modalidad;
        private string nomDocente; 
        private int idDocente;
        public string Sigla { get => sigla; set => sigla = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string CargaHoraria { get => cargaHoraria; set => cargaHoraria = value; }
        public string Tipo { get => tipo; set => tipo = value; }
        public string CarreraPerteneciente { get => carreraPerteneciente; set => carreraPerteneciente = value; }
        public string Modalidad { get => modalidad; set => modalidad = value; }
        public string NomDocente { get => nomDocente; set => nomDocente = value; }
        public int IdDocente { get => idDocente; set => idDocente = value; }
        public Materia(string sigla, string nombre, string cargaHoraria, string tipo, string carreraPerteneciente, string modalidad, string nomDocente, int idDocente)
        {
            this.sigla = sigla;
            this.nombre = nombre;
            this.cargaHoraria = cargaHoraria;
            this.tipo = tipo;
            this.carreraPerteneciente = carreraPerteneciente;
            this.modalidad = modalidad;
            this.nomDocente = nomDocente;
            this.idDocente = idDocente;
        }
        
        public void mostrar()
        {
            System.Console.WriteLine(sigla + " " + nombre + " " + cargaHoraria + " " + tipo + " " + carreraPerteneciente + " " + modalidad + " " + nomDocente + " " + idDocente);
        }
    }
}