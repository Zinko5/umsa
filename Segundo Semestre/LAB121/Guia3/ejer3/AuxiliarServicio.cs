namespace ejer3
{
    public class AuxiliarServicio:Auxiliar
    {
        private string descripcionTrabajo;
        public AuxiliarServicio(int edad, int ci, string nombre, string matricula, double sueldo, string descripcionTrabajo):base(edad, ci, nombre, matricula, sueldo)
        {
            this.descripcionTrabajo = descripcionTrabajo;
        }
        new public void Mostrar()
        {
            base.Mostrar();
            Console.Write(" " + descripcionTrabajo);
        }
    }
}