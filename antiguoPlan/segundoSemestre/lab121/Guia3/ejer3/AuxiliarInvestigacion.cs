namespace ejer3
{
    public class AuxiliarInvestigacion:Auxiliar
    {
        private string proyecto;
        public AuxiliarInvestigacion(int edad, int ci, string nombre, string matricula, double sueldo, string proyecto):base(edad, ci, nombre, matricula, sueldo)
        {
            this.proyecto = proyecto;
        }
        new public void Mostrar()
        {
            base.Mostrar();
            Console.Write(" " + proyecto);
        }
    }
}