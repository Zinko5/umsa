    public class Persona
    {
        private String Nombre;
        /*public string nombre
        {
            get { return Nombre; }
            set { Nombre = value; }
        }*/
        private String Nacionalidad;
        /*public string nacionalidad
        {
            get { return Nacionalidad; }
            set { Nacionalidad = value; }
        }*/
        private int Edad;

    public Persona(String Nombre, String Nacionalidad, int Edad) {
        this.Nombre = Nombre;
        this.Nacionalidad = Nacionalidad;
        this.Edad = Edad;
    }

    public int getEdad() {
        return Edad;
    }

    public String getNacionalidad() {
        return Nacionalidad;
    }

    public String getNombre() {
        return Nombre;
    }
        
        /*public int edad
        {
            get { return Edad; }
            set { Edad = value; }
        }*/
        /*public void Leer()
        {
            System.Console.WriteLine("Leer Nombre");
            Nombre = Console.ReadLine();
            System.Console.WriteLine("Leer año de nacimiento: ");
            AñoNacimiento = int.Parse(Console.ReadLine());
            System.Console.WriteLine("Leer  CI: ");
            Ci = int.Parse(Console.ReadLine());
            System.Console.WriteLine("Leer Nacionalidad: ");
            Nacionalidad = Console.ReadLine();
            System.Console.WriteLine("Leer edad");
            Edad = int.Parse(Console.ReadLine());
        }
        public void Mostrar()
        {
            System.Console.WriteLine(Nombre + " " + AñoNacimiento + " " + Ci + " " + Nacionalidad + " " + Edad);
        }*/

    }
