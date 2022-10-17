namespace ejer2
{
    public class AnimalTerrestre:Animal
    {
        private string sangre; //fria o caliente
        public AnimalTerrestre(int a, double b, string c, string d):base(a, b, c) {
            sangre = d;
        }
        new public void mostrar() {
            base.mostrar();
            Console.Write(" " + sangre);
        }
    }
}