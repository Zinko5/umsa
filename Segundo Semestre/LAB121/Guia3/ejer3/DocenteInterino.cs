namespace ejer3
{
    public class DocenteInterino:Docente
    {
        private int añoContrato;
        public DocenteInterino(int edad, int ci, string nombre, string materia, double sueldo, int añoContrato):base(edad, ci, nombre, materia, sueldo)
        {
            this.añoContrato = añoContrato;
        }
        new public void Mostrar()
        {
            base.Mostrar();
            Console.Write(" " + añoContrato);
        }
    }
}