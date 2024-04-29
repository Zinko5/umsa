namespace ejer3
{
    public class Director:DocenteEmerito
    {
        private string gestion;
        public Director(int edad, int ci, string nombre, string materia, double sueldo, int añosServicio, string gestion):base(edad, ci, nombre, materia, sueldo, añosServicio)
        {
            this.gestion = gestion;
        }
        new public void Mostrar()
        {
            base.Mostrar();
            Console.Write(" " + gestion);
        }
    }
}