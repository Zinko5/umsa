namespace ejer2
{
    public class Leon:AnimalTerrestre
    {
        private string raza;
        public Leon(int a, double b, string c, string d, string e):base(a, b, c, d) {
            raza = e;
        }
        new public void mostrar() {
            base.mostrar();
            Console.WriteLine(" " + raza);
        }
    }
}