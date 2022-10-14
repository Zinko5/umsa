namespace ejer2
{
    public class Aguila:AnimalAereo
    {
        private string raza;
        public Aguila(int a, double b, string c, double d, string e):base(a, b, c, d) {
            raza = e;
        }
        public void mostrar() {
            base.mostrar();
            Console.WriteLine(" " + raza);
        }
    }
}