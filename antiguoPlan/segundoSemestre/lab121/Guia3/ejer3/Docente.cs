namespace ejer3
{
    public class Docente:Persona
    {
        private string materia;
        private double sueldo;
        public Docente(int edad, int ci, string nombre, string materia, double sueldo):base(edad, ci, nombre)
        {
            this.materia = materia;
            this.sueldo = sueldo;
        }
        new public void Mostrar()
        {
            base.Mostrar();
            Console.Write(" " + materia + " " + sueldo);
        }
        public void Mostrar(Docente docente0, Docente docente1, Docente docente2, Docente docente3, Auxiliar auxiliar0, Auxiliar auxiliar1, Auxiliar auxiliar2)
        {
            double mayoredocente = 0, mayorauxiliar = 0;
            if (sueldo > mayoredocente) {mayoredocente = sueldo;}
            if (docente0.sueldo > mayoredocente) {mayoredocente = docente0.sueldo;}
            if (docente1.sueldo > mayoredocente) {mayoredocente = docente1.sueldo;}
            if (docente2.sueldo > mayoredocente) {mayoredocente = docente2.sueldo;}
            if (docente3.sueldo > mayoredocente) {mayoredocente = docente3.sueldo;}
            if (auxiliar0.getSueldo() > mayorauxiliar) {mayorauxiliar = auxiliar0.getSueldo();}
            if (auxiliar1.getSueldo() > mayorauxiliar) {mayorauxiliar = auxiliar1.getSueldo();}
            if (auxiliar2.getSueldo() > mayorauxiliar) {mayorauxiliar = auxiliar2.getSueldo();}
            if (mayoredocente == sueldo) {Console.WriteLine("El docente " + this.getNombre() + " tiene el mayor sueldo (" + sueldo + ")");}
            if (mayoredocente == docente0.sueldo) {Console.WriteLine("El docente " + docente0.getNombre() + " tiene el mayor sueldo (" + docente0.sueldo + ")");}
            if (mayoredocente == docente1.sueldo) {Console.WriteLine("El docente " + docente1.getNombre() + " tiene el mayor sueldo (" + docente1.sueldo + ")");}
            if (mayoredocente == docente2.sueldo) {Console.WriteLine("El docente " + docente2.getNombre() + " tiene el mayor sueldo (" + docente2.sueldo + ")");}
            if (mayoredocente == docente3.sueldo) {Console.WriteLine("El docente " + docente3.getNombre() + " tiene el mayor sueldo (" + docente3.sueldo + ")");}
            if (mayorauxiliar == auxiliar0.getSueldo()) {Console.WriteLine("El auxiliar " + auxiliar0.getNombre() + " tiene el mayor sueldo (" + auxiliar0.getSueldo() + ")");}
            if (mayorauxiliar == auxiliar1.getSueldo()) {Console.WriteLine("El auxiliar " + auxiliar1.getNombre() + " tiene el mayor sueldo (" + auxiliar1.getSueldo() + ")");}
            if (mayorauxiliar == auxiliar2.getSueldo()) {Console.WriteLine("El auxiliar " + auxiliar2.getNombre() + " tiene el mayor sueldo (" + auxiliar2.getSueldo() + ")");}
        }
        public void MateriaDirector()
        {
            Console.WriteLine("El director da la materia de " + materia);
        }
    }
}