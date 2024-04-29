namespace ejer3
{
    public class Auxiliar:Estudiante
    {
        private double sueldo;
        public Auxiliar(int edad, int ci, string nombre, string matricula, double sueldo):base(edad, ci, nombre, matricula)
        {
            this.sueldo = sueldo;
        }
        new public void Mostrar()
        {
            base.Mostrar();
            Console.Write(" " + sueldo);
        }
        public double getSueldo(){return sueldo;}
    }
}