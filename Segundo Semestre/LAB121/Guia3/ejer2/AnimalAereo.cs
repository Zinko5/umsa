namespace ejer2
{
    public class AnimalAereo:Animal
    {
        private double alas; //tamaño en cm
        public AnimalAereo(int a, double b, string c, double d):base(a, b, c) {
            alas = d;
        }
        new public void mostrar() {
            base.mostrar();
            Console.Write(" " + alas);
        }
    }
}