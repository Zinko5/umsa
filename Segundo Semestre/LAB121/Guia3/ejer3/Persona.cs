namespace ejer3
{
    public class Persona
    {
        private int edad, ci;
        private string nombre;
        public Persona(int edad, int ci, string nombre)
        {
            this.edad = edad;
            this.ci = ci;
            this.nombre = nombre;
        }
        public void Mostrar()
        {
            Console.Write(edad + " " + ci + " " + nombre);
        }
        public string getNombre() {return nombre;}
        public void Mostrar(Docente docente0, Docente docente1, Docente docente2, Docente docente3)
        {
            int menoredad = 150;
            if (edad < menoredad) {menoredad = edad;}
            if (docente0.edad < menoredad) {menoredad = docente0.edad;}
            if (docente1.edad < menoredad) {menoredad = docente1.edad;}
            if (docente2.edad < menoredad) {menoredad = docente2.edad;}
            if (docente3.edad < menoredad) {menoredad = docente3.edad;}
            if (menoredad == edad) {Console.Write("El docente con menor edad (" + edad + ") es "); Mostrar();}
            if (menoredad == docente0.edad) {Console.Write("El docente con menor edad (" + docente0.edad + ") es "); docente0.Mostrar();}
            if (menoredad == docente1.edad) {Console.Write("El docente con menor edad (" + docente1.edad + ") es "); docente1.Mostrar();}
            if (menoredad == docente2.edad) {Console.Write("El docente con menor edad (" + docente2.edad + ") es "); docente2.Mostrar();}
            if (menoredad == docente3.edad) {Console.Write("El docente con menor edad (" + docente3.edad + ") es "); docente3.Mostrar();}
        }
        public void Mostrar(Docente docente1)
        {
            int ultimodigito = ci % 10;
            int ultimodigito0 = docente1.ci % 10;
            if(ultimodigito % 2 == 0) {Console.Write("Carnet par: "); Mostrar();}
            if(ultimodigito0 % 2 == 0) {Console.Write("Carnet par: "); docente1.Mostrar();}
        }
    }
}