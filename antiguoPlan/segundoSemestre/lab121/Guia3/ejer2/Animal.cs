namespace ejer2
{
    public class Animal
    {
        private int edad;
        private double peso;
        private string especie;       
        public Animal(int a, double b, string c) {
            edad = a;
            peso = b;
            especie = c;
        }
        public void mostrar() {
            Console.Write(edad + " " + peso + " " + especie);
        }
        public void mostrar(string x) {
            if (especie.Substring(0,1) == x) {
                this.mostrar();
                Console.WriteLine();
            }
        }
        public void mostrar(Animal a, Animal b, Animal c, Animal d, Animal e) {
            int m = 500;
            if (edad < m) {m = edad;}
            if (a.edad < m) {m = a.edad;}
            if (b.edad < m) {m = b.edad;}
            if (c.edad < m) {m = c.edad;}
            if (d.edad < m) {m = d.edad;}
            if (e.edad < m) {m = e.edad;}
            if (edad == m) {mostrar();}
            if (a.edad == m) {a.mostrar();}
            if (b.edad == m) {b.mostrar();}
            if (c.edad == m) {c.mostrar();}
            if (d.edad == m) {d.mostrar();}
            if (e.edad == m) {e.mostrar();}
            Console.WriteLine();
        }
        public void mostrar(AnimalAereo a, Animal b, Animal c, Animal d, Animal e) {
            double m = 0;
            if (peso > m) {m = peso;}
            if (a.peso > m) {m = a.peso;}
            if (b.peso > m) {m = b.peso;}
            if (c.peso > m) {m = c.peso;}
            if (d.peso > m) {m = d.peso;}
            if (e.peso > m) {m = e.peso;}
            if (peso == m) {mostrar();}
            if (a.peso == m) {a.mostrar();}
            if (b.peso == m) {b.mostrar();}
            if (c.peso == m) {c.mostrar();}
            if (d.peso == m) {d.mostrar();}
            if (e.peso == m) {e.mostrar();}
            Console.WriteLine();
        }
    }
}