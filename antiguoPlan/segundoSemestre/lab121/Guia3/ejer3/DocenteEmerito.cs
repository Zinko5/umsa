namespace ejer3
{
    public class DocenteEmerito:Docente
    {
        private int añosServicio;
        public DocenteEmerito(int edad, int ci, string nombre, string materia, double sueldo, int añosServicio):base(edad, ci, nombre, materia, sueldo)
        {
            this.añosServicio = añosServicio;
        }
        new public void Mostrar()
        {
            base.Mostrar();
            Console.Write(" " + añosServicio);
        }
    }
}