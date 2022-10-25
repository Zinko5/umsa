namespace ejer1
{
    public class CPreparatoria:Curso
    {
        private string modulo;
        public string Modulo
        {
            get { return modulo; }
            set { modulo = value; }
        }
        private string especialidad;
        public string Especialidad
        {
            get { return especialidad; }
            set { especialidad = value; }
        }
        public CPreparatoria(int id, int nroEstudiantes, int ciProfesor, string nomDirector, string nroDistrito, string ciudad, string nomProfesor, string modulo, string especialidad) : base(id, nroEstudiantes, ciProfesor, nomDirector, nroDistrito, ciudad, nomProfesor)
        {
            this.modulo = modulo;
            this.especialidad = especialidad;
        }
        new public void mostrar()
        {
            base.mostrar();
            System.Console.WriteLine("Modulo: " +  modulo);
        }
    }
}