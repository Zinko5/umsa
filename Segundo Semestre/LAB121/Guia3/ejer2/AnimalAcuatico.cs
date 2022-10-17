namespace ejer2
{
    public class AnimalAcuatico:Animal
    {
        private string respiracion;
        public AnimalAcuatico(int a, double b, string c, string d):base(a, b, c) {
            respiracion = d;
        }
        new public void mostrar() {
            base.mostrar();
            Console.Write(" " + respiracion);
        }
    }
}