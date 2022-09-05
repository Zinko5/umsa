namespace ejer1 {
    class Empleado {
        private string ci, nombre, paterno, materno, area;
        private double sueldo;
        public Empleado() {
            ci = "7482LP";
            nombre = "Luis";
            paterno = "Perez";
            materno = "Arias";
            area = "administracion";
            sueldo = 36.5;
        }
        public Empleado(double n) {
            ci = "4713LP";
            nombre = "Diego";
            paterno = "Perez";
            materno = "Arias";
            area = "recursos humanos";
            sueldo = n;
        }
        public void mostrar() {
            Console.WriteLine(ci + " " + nombre +  " " + paterno + " " + materno + " " + area +  " " + sueldo);
        }
        public void massueldo(Empleado a) {
            if (this.sueldo > a.sueldo) {
                Console.WriteLine(this.nombre + " tiene mas sueldo");
            }
            else {
                Console.WriteLine(a.nombre + " tiene mas sueldo");
            }
        }
        public void cambiararea(string x) {
            area = x;
            Console.WriteLine("area nueva: " + area);
        }
        public void mismaarea(Empleado a) {
            if (this.area == a.area) {
                Console.WriteLine("ambos empleados son del mismo area");
            }
            else {
                Console.WriteLine("ambos empleados no son del mismo area");
            }
        }
    }
}