namespace ejer3
{
    public class Estudiante:Persona
    {
        private string matricula;
        public Estudiante(int edad, int ci, string nombre, string matricula):base(edad, ci, nombre)
        {
            this.matricula = matricula;
        }
        new public void Mostrar()
        {
            base.Mostrar();
            Console.Write(" " + matricula);
        }
    }
}