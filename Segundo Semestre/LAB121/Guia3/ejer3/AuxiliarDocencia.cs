namespace ejer3
{
    public class AuxiliarDocencia:Auxiliar
    {
        private string materia;
        public AuxiliarDocencia(int edad, int ci, string nombre, string matricula, double sueldo, string materia):base(edad, ci, nombre, matricula, sueldo)
        {
            this.materia = materia;
        }
        new public void Mostrar()
        {
            base.Mostrar();
            Console.Write(" " + materia);
        }
    }
}