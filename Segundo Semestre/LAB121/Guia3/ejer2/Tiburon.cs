namespace ejer2
{
    public class Tiburon:AnimalAcuatico
    {
        private string raza;
        public Tiburon(int a, double b, string c, string d, string e):base(a, b, c, d) {
            raza = e;
        }
        new public void mostrar() {
            base.mostrar();
            Console.WriteLine(" " + raza);
        }
    }
}